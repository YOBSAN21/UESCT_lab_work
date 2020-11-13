#include "exp2.h"


int main () { // Client Side
	int sockfd;
	struct sockaddr_in server_addr;

	sockfd = socket(AF_INET, SOCK_STREAM, 0);

	bzero( &server_addr, sizeof(server_addr) );
	server_addr.sin_family = AF_INET;
	server_addr.sin_port = htons(PORT);
	server_addr.sin_addr.s_addr = htonl(INADDR_ANY);

	// connect the socket/

	int connection_Status = connect(sockfd,(struct sockaddr * ) &server_addr, sizeof(server_addr));
	if(connection_Status == -1 )
	{
		printf(" Connecting to server failed!\n " );
	        exit(0);
	}

	

  	process_data(sockfd);

	
	close(sockfd);

}


void process_data (int sockfd) {
	int n;
	char msg1[MAXSZ],msg2[MAXSZ], c_name[MAXSZ];
	printf("\nInput c_name:");
	fgets(c_name,MAXSZ,stdin);
	send(sockfd,c_name,strlen(c_name)+1,0);
	 while(1)
	 {
 		 printf("\nInput message (# to exit):");
 		 fgets(msg1,MAXSZ,stdin);
 		 if(msg1[0]=='#')
 		  	break;
		  n=strlen(msg1)+1;
		  send(sockfd,msg1,n,0);
 		  n=recv(sockfd,msg2,MAXSZ,0);
 		 printf("Server Echo: %s \n", msg2 );
	 }
}
	




