/*
 * Copyright (C) 2009 - 2018 Xilinx, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "lwip/err.h"
#include "lwip/tcp.h"
#if defined (__arm__) || defined (__aarch64__)
#include "xil_printf.h"
#endif

#include "arch/cc.h"
#include "platform.h"
#include "platform_config.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "xintc.h"
#include "xil_exception.h"
#include "netif/xadapter.h"

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
#include "semphr.h"

#include "echo.h"

//extern volatile int TcpFastTmrFlag;
//extern volatile int TcpSlowTmrFlag;

extern struct netif *lb_netif;

SemaphoreHandle_t printf_mtx;
SemaphoreHandle_t lwip_tx_mtx;

int transfer_data() {
	return 0;
}

//void print_app_header()
//{
//#if (LWIP_IPV6==0)
//	xil_printf_safe("\n\r\n\r-----lwIP TCP echo server ------\n\r");
//#else
//	xil_printf_safe("\n\r\n\r-----lwIPv6 TCP echo server ------\n\r");
//#endif
//	xil_printf_safe("TCP packets sent to port 6001 will be echoed back\n\r");
//}

void payload_to_uppercase(char* payload, int len) {
	for (int i = 0; i < len; i++) {
		if (payload[i] >= 'a' && payload[i] <= 'z') {
			payload[i] = payload[i] - ('a' - 'A');
		} else if (payload[i] >= 'A' && payload[i] <= 'Z') {
			payload[i] = payload[i] + ('a' - 'A');
		}
	}
}

void print_payload(char* payload, int len, char* format_string) {
	char* buf = (char*)malloc(len * sizeof(char) + 1);
	buf[len] = '\x00';
	for(int i = 0; i < len; i++) {
		buf[i] = payload[i];
	}

	xil_printf_safe(format_string, buf);
	free(buf);
}

err_t recv_callback(void *arg, struct tcp_pcb *tpcb,
                               struct pbuf *p, err_t err)
{
	/* do not read the packet if we are not in ESTABLISHED state */
	if (!p) {
		tcp_close(tpcb);
		tcp_recv(tpcb, NULL);
		return ERR_OK;
	}

	/* indicate that the packet has been received */
	tcp_recved(tpcb, p->len);

	// Modify payload and print  to stdout
	print_payload(p->payload, p->len, "Received: %s\n");
	payload_to_uppercase(p->payload, p->len);
	print_payload(p->payload, p->len, "Sending: %s\n");

	/* echo back the payload */
	/* in this case, we assume that the payload is < TCP_SND_BUF */
	if (tcp_sndbuf(tpcb) > p->len) {
		err = tcp_write(tpcb, p->payload, p->len, 1);
	} else
		xil_printf("no space in tcp_sndbuf\n\r");

	/* free the received pbuf */
	pbuf_free(p);

	return ERR_OK;
}

err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
	static int connection = 1;

	/* set the receive callback for this connection */
	tcp_recv(newpcb, recv_callback);

	/* just use an integer number indicating the connection id as the
	   callback argument */
	tcp_arg(newpcb, (void*)(UINTPTR)connection);

	/* increment for subsequent accepted connections */
	connection++;

	return ERR_OK;
}


int start_application()
{
	struct tcp_pcb *pcb;
	err_t err;
	unsigned port = 7;

	/* create new TCP PCB structure */
	pcb = tcp_new_ip_type(IPADDR_TYPE_ANY);
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind to specified @port */
	err = tcp_bind(pcb, IP_ANY_TYPE, port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}

	/* we do not need any arguments to callback functions */
	tcp_arg(pcb, NULL);

	/* listen for connections */
	pcb = tcp_listen(pcb);
	if (!pcb) {
		xil_printf("Out of memory while tcp_listen\n\r");
		return -3;
	}

	/* specify callback to use for incoming connections */
	tcp_accept(pcb, accept_callback);

	xil_printf("TCP echo server started @ port %d\n\r", port);

	return 0;
}

///// RTOS VERSIONS BELOW THIS POINT /////

typedef struct{
	void* arg;
	struct tcp_pcb* tpcb;
	struct pbuf* p;
	err_t err;
} Tcp_rx_args_t;

void tcp_rx_resp_task(void* pv){
	Tcp_rx_args_t* args = pv;
	void* arg = args->arg;
	struct tcp_pcb* tpcb = args->tpcb;
	struct pbuf* p = args->p;
	err_t err = args->err;
	vPortFree(args);

	/* do not read the packet if we are not in ESTABLISHED state */
	if (!p) {
		tcp_close(tpcb);
		tcp_recv(tpcb, NULL);
		return ERR_OK;
	}

	// Modify payload and print  to stdout
	print_payload(p->payload, p->len, "Received: %s\n");
	payload_to_uppercase(p->payload, p->len);
	print_payload(p->payload, p->len, "Sending: %s\n");

	/* echo back the payload */
	/* in this case, we assume that the payload is < TCP_SND_BUF */
	xSemaphoreTake(lwip_tx_mtx, portMAX_DELAY);
	if (tcp_sndbuf(tpcb) > p->len) {
		err = tcp_write(tpcb, p->payload, p->len, 1);
	} else
		xil_printf_safe("no space in tcp_sndbuf\n\r");

	/* indicate that the packet has been received */
	tcp_recved(tpcb, p->len);

	/* free the received pbuf */
	pbuf_free(p);
	xSemaphoreGive(lwip_tx_mtx);

	vTaskDelete(NULL);
}

err_t tcp_rx_cb(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err){
	//spin off a task to process
	Tcp_rx_args_t* args = pvPortMalloc(sizeof(Tcp_rx_args_t));
	args->arg = arg;
	args->tpcb = tpcb;
	args->p = p;
	args->err = err;
	xTaskCreate(tcp_rx_resp_task, "rx_resp", configMINIMAL_STACK_SIZE, args, tskIDLE_PRIORITY + 1, NULL);
	/* do not read the packet if we are not in ESTABLISHED state */
//	if (!p) {
//		tcp_close(tpcb);
//		tcp_recv(tpcb, NULL);
//		return ERR_OK;
//	}
//
//	/* indicate that the packet has been received */
//	tcp_recved(tpcb, p->len);
//
//	// Modify payload and print  to stdout
//	print_payload(p->payload, p->len, "Received: %s\n");
//	payload_to_uppercase(p->payload, p->len);
//	print_payload(p->payload, p->len, "Sending: %s\n");
//
//	/* echo back the payload */
//	/* in this case, we assume that the payload is < TCP_SND_BUF */
//	if (tcp_sndbuf(tpcb) > p->len) {
//		err = tcp_write(tpcb, p->payload, p->len, 1);
//	} else
//		xil_printf_safe("no space in tcp_sndbuf\n\r");
//
//	/* free the received pbuf */
//	pbuf_free(p);

	return ERR_OK;
}

err_t tcp_accept_cb(void *arg, struct tcp_pcb *newpcb, err_t err)
{
	static int connection = 1;

	/* set the receive callback for this connection */
	tcp_recv(newpcb, tcp_rx_cb);

	/* just use an integer number indicating the connection id as the
	   callback argument */
	tcp_arg(newpcb, (void*)(UINTPTR)connection);

	/* increment for subsequent accepted connections */
	connection++;

	return ERR_OK;
}


void TCP_rx_task(void* pv){
	struct tcp_pcb *pcb;
	err_t err;
	unsigned port = 7;

	/* create new TCP PCB structure */
	pcb = tcp_new_ip_type(IPADDR_TYPE_ANY);
	if (!pcb) {
		xil_printf_safe("Error creating PCB. Out of Memory\n\r");
//		return -1;
		vTaskDelete(NULL);
	}

	/* bind to specified @port */
	err = tcp_bind(pcb, IP_ANY_TYPE, port);
	if (err != ERR_OK) {
		xil_printf_safe("Unable to bind to port %d: err = %d\n\r", port, err);
//		return -2;
		vTaskDelete(NULL);
	}

	/* we do not need any arguments to callback functions */
	tcp_arg(pcb, NULL);

	/* listen for connections */
	pcb = tcp_listen(pcb);
	if (!pcb) {
		xil_printf_safe("Out of memory while tcp_listen\n\r");
//		return -3;
		vTaskDelete(NULL);
	}

	/* specify callback to use for incoming connections */
	tcp_accept(pcb, tcp_accept_cb);

	xil_printf_safe("TCP echo server started @ port %d\n\r", port);

	/* ethernet input pumping loop */
	for(;;){
		vTaskDelay(pdMS_TO_TICKS(1));
		xemacif_input(lb_netif);
	}
}

void TCP_tmr(void* pv){
	static int DetectEthLinkStatus = 0;
		/* we need to call tcp_fasttmr & tcp_slowtmr at intervals specified by lwIP.
		 * It is not important that the timing is absoluetly accurate.
		 */
		static int odd = 1;
	#if LWIP_DHCP==1
	    static int dhcp_timer = 0;
	#endif
		DetectEthLinkStatus++;
//		 TcpFastTmrFlag = 1;
		tcp_fasttmr();

		odd = !odd;
		if (odd) {

	#if LWIP_DHCP==1
			dhcp_timer++;
			dhcp_timoutcntr--;
	#endif
//			TcpSlowTmrFlag = 1;
			tcp_fasttmr();
	#if LWIP_DHCP==1
			dhcp_fine_tmr();
			if (dhcp_timer >= 120) {
				dhcp_coarse_tmr();
				dhcp_timer = 0;
			}
	#endif
		}

		/* For detecting Ethernet phy link status periodically */
		if (DetectEthLinkStatus == ETH_LINK_DETECT_INTERVAL) {
			eth_link_detect(lb_netif);
			DetectEthLinkStatus = 0;
		}
}
