#include <stdio.h>
#include <stdlib.h>

#include <sys/types.h>
#include <sys/socket.h>

#include <netinet/in.h>

#define PORT 9222
#define MAX_LINE 1024

int main () {
	int sockfd;  
	struct sockaddr_in server_addr , client_addr;

	sockfd = socket(AF_INET, SOCK_DGRAM ,0);

	bzero( &server_addr, sizeof(server_addr) );
	server_addr.sin_family = AF_INET ;
	server_addr.sin_port = htons(PORT);
	server_addr.sin_addr.s_addr = htonl(INADDR_ANY);

	printf("Binding ... \n");

	int bind_check = bind(sockfd ,(struct sockaddr *) &server_addr ,sizeof(server_addr) );
	
        if (bind_check <0 )
	{
		perror("Bind Error\n");
		exit(-1);
	}
	
	printf("Echo Server is Ready ! \n");

	int len , n ;
	char msg [MAX_LINE];

	for ( ; ; )
	{
	    len = sizeof(client_addr);
        
	    n = recvfrom(sockfd, msg, MAX_LINE, 0, (struct sockaddr *) &client_addr, &len );
	    
	    printf("Client Message: %s",msg);

	    sendto(sockfd, msg, n, 0, (struct sockaddr *) &client_addr, len);
	}
}
		
	
	

	

