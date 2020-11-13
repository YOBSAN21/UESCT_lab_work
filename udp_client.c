#include <stdio.h>
#include <stdlib.h>

#include <sys/types.h>
#include <sys/socket.h>

#include<netinet/in.h>

#define MAX_LINE 1024
#define PORT 9222
int main () { // Client Side
	int sockfd;
	struct sockaddr_in server_addr;
	
	sockfd = socket(AF_INET, SOCK_DGRAM, 0);

	bzero( &server_addr, sizeof(server_addr) );
	server_addr.sin_family = AF_INET;
	server_addr.sin_port = htons(PORT);
	server_addr.sin_addr.s_addr = htonl(INADDR_ANY);

	int n,len;
	char send_msg[MAX_LINE] ="Hello there ! ";
	char recv_msg[MAX_LINE];
  	
	len =sizeof(server_addr);

	sendto( sockfd, send_msg, sizeof(send_msg), 0,  (struct sockaddr *) &server_addr , len );

	n = recvfrom( sockfd, recv_msg, MAX_LINE, 0, NULL , NULL);
 	
	recv_msg[n]='\0';
	
	printf("Server Echo: %s \n", recv_msg );

}	




