/* include exp2 */
/* my own header. */

#include	<sys/types.h>	/* basic system data types */
#include	<sys/socket.h>	/* basic socket definitions */

#include	<netinet/in.h>	/* sockaddr_in{} and other Internet defns */
#include	<arpa/inet.h>	/* inet(3) functions */
#include	<stdio.h>
#include	<stdlib.h>
#include	<string.h>
#include	<unistd.h>  	/* fork() and other unix lib */
#include 	<signal.h>	/* Signal () */
#include 	<sys/wait.h> 
#include	<pthread.h>	/* basic POSIX thread lib */

#define	BACKLOG 5       /* 2nd argument to listen() */
#define	MAXSZ 1024	/* max text line length */
#define	PORT 9877	/* Process and Thread based TCP Server/client */

void process_data (int sockfd); /* define for both process and thread based TCP client side  */
void process_cli(int confd, struct sockaddr_in client); /* define for both on  TCP Server side  */
void sig_child (int signo); /* define only for process based TCP server  */
void *start_routine(void *arg);	/* define only for Thread based TCP server  */  
   


