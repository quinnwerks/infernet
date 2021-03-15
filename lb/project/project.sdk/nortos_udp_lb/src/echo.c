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

#include "echo.h"


uint8_t const FPGA_NUMS[FPGA_COUNT] = FPGA_NUMS_INIT;
uint8_t fpgaFreeNums[FPGA_COUNT] = {[0 ... FPGA_COUNT-1] = FPGA_NUM_SENTINEL};
uint8_t fpgaBusyNums[FPGA_COUNT] = {[0 ... FPGA_COUNT-1] = FPGA_NUM_SENTINEL};

//u8_t iaScansDone = 0;
//struct udp_pcb * iaScanPcbs[FPGA_COUNT] = {[0 ... FPGA_COUNT-1] = NULL};
struct udp_pcb* iaScanPcb;
uint8_t const iaScanPayload[IA_TX_LOAD_LEN] = {0};


int transfer_data() {
	return 0;
}

void print_app_header()
{
#if (LWIP_IPV6==0)
	xil_printf("\n\r\n\r-----lwIP TCP echo server ------\n\r");
#else
	xil_printf("\n\r\n\r-----lwIPv6 TCP echo server ------\n\r");
#endif
	xil_printf("TCP packets sent to port 6001 will be echoed back\n\r");
}

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

	xil_printf(format_string, buf);
	free(buf);
}

struct pbuf* lb_state_machine(struct pbuf* p_in){
	size_t idx;
	struct pbuf* p_out;
	ip4_addr_t addr;
	if((idx = pbuf_strstr(p_in, CLIENT_REQ_STR)) != 0xFFFF){
		if(fpga_list_len(fpgaFreeNums)){
			u8_t n = fpga_list_pop(fpgaFreeNums);
			fpga_list_add(fpgaBusyNums, n);
			xil_printf("\nleased out accelerator on board %d\n", n);
			fpgaNumToIP(&addr, n);
			char* ipBuf = ip4addr_ntoa(&addr);
			p_out = pbuf_alloc(PBUF_TRANSPORT, strlen(ipBuf), PBUF_RAM);
			strcpy(p_out->payload, ipBuf);
		}else{
			p_out = pbuf_alloc(PBUF_TRANSPORT, sizeof(LB_UNAVAILABLE_STR), PBUF_RAM);
			strncpy(p_out->payload, LB_UNAVAILABLE_STR, sizeof(LB_UNAVAILABLE_STR));
		}
	}else if((idx = pbuf_strstr(p_in, CLIENT_DONE_STR)) != 0xFFFF){
		idx = pbuf_strstr(p_in, "1.1.");
		if(idx == 0xFFFF){
			p_out = pbuf_alloc(PBUF_TRANSPORT, sizeof(LB_MALFORMED_STR), PBUF_RAM);
			strncpy(p_out->payload, LB_MALFORMED_STR, sizeof(LB_MALFORMED_STR));
		}else{
			if(ip4addr_aton((char*)(p_in->payload)+idx, &addr)){
				u8_t num = fpgaIpToNum(&addr);
				if(fpga_list_remove(fpgaBusyNums, num) == -1){
					p_out = pbuf_alloc(PBUF_TRANSPORT, sizeof(LB_NOT_EXIST_STR), PBUF_RAM);
					strncpy(p_out->payload, LB_NOT_EXIST_STR, sizeof(LB_NOT_EXIST_STR));
				}else{
					fpga_list_add(fpgaFreeNums, num);
					xil_printf("\ntook back accelerator on board %d\n", num);
					p_out = pbuf_alloc(PBUF_TRANSPORT, sizeof(LB_RETURNED_STR), PBUF_RAM);
					strncpy(p_out->payload, LB_RETURNED_STR, sizeof(LB_RETURNED_STR));
				}
			}else{
				p_out = pbuf_alloc(PBUF_TRANSPORT, sizeof(LB_MALFORMED_STR), PBUF_RAM);
				strncpy(p_out->payload, LB_MALFORMED_STR, sizeof(LB_MALFORMED_STR));
			}
		}
	}else{
	}
	return p_out;
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

	// do LB logic
	print_payload(p->payload, p->len, "Received: %s\n");
	struct pbuf* p_out = lb_state_machine(p);
	print_payload(p_out->payload, p_out->len, "Sending: %s\n");

	/* send back the response */
	/* in this case, we assume that the payload is < TCP_SND_BUF */
	if (tcp_sndbuf(tpcb) > p_out->len) {
		err = tcp_write(tpcb, p_out->payload, p_out->len, 1);
	} else
		xil_printf("no space in tcp_sndbuf\n\r");

	/* free the pbufs */
	pbuf_free(p);
	pbuf_free(p_out);

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


void fpgaNumToIP(ip_addr_t* ipaddr, uint8_t num){
	IP4_ADDR(ipaddr, 1, 1, num, 2);
}


u8_t fpgaIpToNum(const ip_addr_t* ipaddr){
	ip_addr_t mask;
	IP4_ADDR(&mask, 0, 0, 255, 0);
	ip_addr_t div;
	IP4_ADDR(&div, 0, 0, 1, 0);
	return (ipaddr->addr & mask.addr) >> (ffs(div.addr)-1);
}

u8_t fpgaNumToMacByte(u8_t num){
	u8_t tens = num/10;
	num = num%10;
	return tens*0x10 + num;
}

int fpga_list_add(uint8_t* list, uint8_t num){
	for(size_t i = 0; i < FPGA_COUNT; i++){
		if(list[i] == FPGA_NUM_SENTINEL){
			list[i] = num;
			return 1;
		}
	}
	return -1;
}

int fpga_list_pop(uint8_t* list){
	int lastIndex = -1;
	for(int i = 0; i < FPGA_COUNT; i++){
		if(list[i] == FPGA_NUM_SENTINEL) break;
		lastIndex = i;
	}
	if(lastIndex == -1) return -1;
	int ret = list[lastIndex];
	list[lastIndex] = FPGA_NUM_SENTINEL;
	return ret;
}

int fpga_list_remove(uint8_t* list, uint8_t num){
	int numIndex = -1;
	for(int i = 0; i < FPGA_COUNT; i++){
		if(list[i] == num){
			numIndex = i;
			break;
		}
	}
	if(numIndex == -1) return -1;
	for(; numIndex < FPGA_COUNT-1; numIndex++){
		list[numIndex] = list[numIndex+1];
	}
	list[numIndex] = FPGA_NUM_SENTINEL;
	return 1;
}

int fpga_list_len(uint8_t* list){
	int len = 0;
	for(int i = 0; i < FPGA_COUNT; i++){
		if(list[i] != FPGA_NUM_SENTINEL) len++;
		else break;
	}
	return len;
}

void jank_checksum_calc(u8_t* ipBuf){
	u32_t sum = 0;
	for(int i=0; i<10; i+=2) sum += ipBuf[i]<<8 | ipBuf[i+1];
	for(int i=12; i<20; i+=2) sum += ipBuf[i]<<8 | ipBuf[i+1];
	sum = (sum>>16) + (sum & 0xffff);
	sum = (sum>>16) + (sum & 0xffff);
	sum = ~(sum&0xffff);
	ipBuf[10] = sum >> 8;
	ipBuf[11] = sum & 0xff;
}

u8_t ip_out_buf[IP_PBUF_LEN] = {
		// IP HEADER START //
		0x45, 0x00, 0x03, 0x2c, // ipv4, 5 words, ..., len=812
		0x00, 0x00, 0x00, 0x00, // id=0, flags=0, frag_offset=0
		0x80, 0x11, 0x00, 0x00, // TTL=128, proto=UDP, checksum=whatevs
		0x01, 0x01, 0x02, 0x02, // source IP
		0x01, 0x01, 0x01, 0x02, // dest IP
		// UDP HEADER START //
		0x0f, 0xa0, 0x02, 0x9a, // sport=4000, dport=666
		0x03, 0x18, 0x00, 0x00, // len=792, checksum=whatevs
		// RAW DATA START //
		[28 ... IP_PBUF_LEN-1] = 0x00 // rest is just zeros
};

void scan_for_IA_cb(void *arg, struct udp_pcb *pcb, struct pbuf *p, const ip_addr_t *addr, u16_t port){
	// get sender fpga number
	u8_t num = fpgaIpToNum(addr);

	// check if payload is right
	if(p->len != IA_RX_LOAD_LEN) return;

	// add i to free set
	fpga_list_add(fpgaFreeNums, num);

	// clean up
	pbuf_free(p);
}

void scan_for_IAs(){
	// make new udp rx pcb
	__attribute__ ((unused)) err_t err;
	struct udp_pcb* pcb = udp_new();
	iaScanPcb = pcb;

	// construct raw eth tx pbuf
	struct pbuf* p_tx;

	// construct source eth mac addr
	struct eth_addr smac;
	smac.addr[0] = 0x00; smac.addr[1] = 0x0a; smac.addr[2] = 0x35; smac.addr[3] = 0x00; smac.addr[4] = 0x00;
	smac.addr[5] = fpgaNumToMacByte(THIS_BOARD_NUM);

	// attach udp recv callback
	err = udp_bind(pcb, IP_ANY_TYPE, CLIENT_UDP_PORT);
	udp_recv(pcb, scan_for_IA_cb, NULL);

	// send udp packet to each ip
	struct eth_addr dmac;
	dmac.addr[0] = 0x00; dmac.addr[1] = 0x0a; dmac.addr[2] = 0x35; dmac.addr[3] = 0x00; dmac.addr[4] = 0x00;
//	dmac.addr[0] = 0x8c; dmac.addr[1] = 0xae; dmac.addr[2] = 0x4c; dmac.addr[3] = 0xdb; dmac.addr[4] = 0x7a; dmac.addr[5] = 0xd9;
	for(u8_t i=0; i<FPGA_COUNT; i++){
		xemacif_input(lb_netif);
		// set up pbuf
		p_tx = pbuf_alloc(PBUF_LINK, IP_PBUF_LEN, PBUF_RAM);
		xemacif_input(lb_netif);
		memcpy(p_tx->payload, ip_out_buf, IP_PBUF_LEN);
		xemacif_input(lb_netif);
		// set ip addr
		((u8_t*)(p_tx->payload))[IP_PBUF_DEST_NUM_OFFSET] = FPGA_NUMS[i];
		xemacif_input(lb_netif);
		// set mac addr
		dmac.addr[5] = fpgaNumToMacByte(FPGA_NUMS[i]);
		xemacif_input(lb_netif);
		// calc ip chksum
		jank_checksum_calc((u8_t*)(p_tx->payload));
		xemacif_input(lb_netif);
		// send raw eth inference packet
		err = ethernet_output(lb_netif, p_tx, &smac, &dmac, ETHTYPE_IP);
		xemacif_input(lb_netif);
		while(err != ERR_OK){
			err = ethernet_output(lb_netif, p_tx, &smac, &dmac, ETHTYPE_IP);
			xemacif_input(lb_netif);
		}
		xil_printf("\nsent %d, err %d\n", FPGA_NUMS[i], err);
		xemacif_input(lb_netif);
		pbuf_free(p_tx);
	}

	// clean up

}

void IA_scan_stop(){
	udp_remove(iaScanPcb);
}

int start_application(){
	struct tcp_pcb *pcb;
	err_t err;

	/* create new TCP PCB structure */
	pcb = tcp_new_ip_type(IPADDR_TYPE_ANY);
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind to specified @port */
	err = tcp_bind(pcb, IP_ANY_TYPE, LB_TCP_PORT);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", LB_TCP_PORT, err);
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

	xil_printf("Load Balancer started @ port %d\n\r", LB_TCP_PORT);

	return 0;
}

//void scan_for_IAs_arr(){
//	// attach udp listener
//	err_t err;
//	ip_addr_t iaIpAddr;
//	for(u8_t i=0; i<FPGA_COUNT; i++){
//		// make new pcb
//		struct udp_pcb* pcb = udp_new();
//		iaScanPcbs[i] = pcb;
//		err = udp_bind(pcb, IP_ANY_TYPE, LB_UDP_PORT);
//		// set up recv callback
//		udp_recv(pcb, scan_for_IA_cb, (void*)(u32_t)i);
//		// send CLIENT_DONE_STR packet
//		fpgaNumToIP(&iaIpAddr, i);
//		err = udp_connect(pcb, &iaIpAddr, IA_UDP_PORT);
//		// check if LB_NOT_EXIST_STR in response
//		// add i to free set
//	}
//}

//void scan_for_IAs(){
//	// make new udp pcb
//	err_t err;
//	struct udp_pcb* pcb = udp_new();
//	iaScanPcb = pcb;
//
//	// construct scan tx pbuf
//	struct pbuf* pbuf = pbuf_alloc(PBUF_TRANSPORT, IA_TX_LOAD_LEN, PBUF_ROM);
//	pbuf->payload = iaScanPayload;
//
//	// attach udp recv callback
//	err = udp_bind(pcb, IP_ANY_TYPE, LB_UDP_PORT);
//	udp_recv(pcb, scan_for_IA_cb, NULL);
//
//	// send udp packet to each ip
//	ip_addr_t iaIpAddr;
//	for(u8_t i=0; i<FPGA_COUNT; i++){
//		// set ip addr
//		fpgaNumToIP(&iaIpAddr, i);
//		err = udp_connect(pcb, &iaIpAddr, IA_UDP_PORT);
//		// send inference packet
//		err = udp_send(pcb, pbuf);
//		udp_disconnect(pcb);
//	}
//
//	// clean up
//	pbuf_free(pbuf);
//}
