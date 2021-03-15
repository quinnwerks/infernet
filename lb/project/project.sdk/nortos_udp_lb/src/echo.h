/*
 * echo.h
 *
 *  Created on: Mar 13, 2021
 *      Author: jamesliu
 */

#include <stdio.h>
#include <string.h>

#include "netif/xadapter.h"
#include "lwip/err.h"
#include "lwip/tcp.h"
#include "lwip/udp.h"
#include "lwip/prot/ethernet.h"
#include "netif/ethernet.h"
#include "lwip/inet_chksum.h"
#if defined (__arm__) || defined (__aarch64__)
#include "xil_printf.h"
#endif

#ifndef SRC_ECHO_H_
#define SRC_ECHO_H_

#ifndef THIS_BOARD_NUM
#define THIS_BOARD_NUM 2
#endif

#define CLIENT_UDP_PORT 4000
#define IA_UDP_PORT 666
#define LB_UDP_PORT 6666
#define LB_TCP_PORT 8080

#define CLIENT_REQ_STR "i can has cheezburger"
#define CLIENT_DONE_STR "put it back"
#define LB_UNAVAILABLE_STR "gone reduced to atoms"
#define LB_NOT_EXIST_STR "the salami lid wont fit"
#define LB_RETURNED_STR "thanks for the fish"
#define LB_MALFORMED_STR "it hurts when IP"

struct netif *lb_netif;

#define FPGA_COUNT 12
uint8_t const FPGA_NUMS[FPGA_COUNT];
#define FPGA_NUMS_INIT {1,2,3,4,5,6,7,8,9,10,11,12}
#define FPGA_NUM_SENTINEL 0
uint8_t fpgaFreeNums[FPGA_COUNT];
uint8_t fpgaBusyNums[FPGA_COUNT];


#define IA_TIMEOUT 1 // x250ms
//u8_t iaScansDone;
//struct udp_pcb * iaScanPcbs[FPGA_COUNT];
struct udp_pcb* iaScanPcb;
#define IA_TX_LOAD_LEN 28*28
#define IA_RX_LOAD_LEN 18
#define IP_PBUF_LEN 812
#define IP_PBUF_SOURCE_NUM_OFFSET 14
#define IP_PBUF_DEST_NUM_OFFSET 18
u8_t ip_out_buf[IP_PBUF_LEN];

int start_application();
void scan_for_IAs();
void IA_scan_stop();
u8_t fpgaNumToMacByte(u8_t num);
u8_t fpgaIpToNum(const ip_addr_t* ipaddr);
int fpga_list_len(uint8_t* list);
int fpga_list_add(uint8_t* list, uint8_t num);
int fpga_list_pop(uint8_t* list);
int fpga_list_remove(uint8_t* list, uint8_t num);
void fpgaNumToIP(ip_addr_t* ipaddr, uint8_t num);

#endif /* SRC_ECHO_H_ */
