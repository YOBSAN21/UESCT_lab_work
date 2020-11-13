#include "exp2.h"


typedef struct  {
	int connfd;
	struct sockaddr_in client;
}ARG;
int main()
{
 int sockfd;//to create socket
 int newsockfd;//to accept connection
 pthread_t tid;
 ARG *arg;

 struct sockaddr_in serverAddress;//server receive on this address
 struct sockaddr_in clientAddress;//server sends to client on this address
 int clientAddressLength;
 
 //create socket
 sockfd=socket(AF_INET,SOCK_STREAM,0);
 //initialize the socket addresses
 memset(&serverAddress,0,sizeof(serverAddress));
 serverAddress.sin_family=AF_INET;
 serverAddress.sin_addr.s_addr=htonl(INADDR_ANY);
 serverAddress.sin_port=htons(PORT);

 //bind the socket with the server address and port
 bind(sockfd,(struct sockaddr *)&serverAddress, sizeof(serverAddress));

 //listen for connection from client
 listen(sockfd,BACKLOG);
 printf("\n*****Echo Server is Ready*****\n");
 
 while(1)
 {
  //parent process waiting to accept a new connection
   
  clientAddressLength=sizeof(clientAddress);
  newsockfd=accept(sockfd,(struct sockaddr*)&clientAddress,&clientAddressLength);
  arg =(ARG*)malloc(sizeof(ARG));
  arg->connfd = newsockfd;
  memcpy((void *)&arg->client, &clientAddress,clientAddressLength);
  printf("You got connection from :  %s\n",inet_ntoa(clientAddress.sin_addr));
  if (pthread_create(&tid, NULL, start_routine, (void *)arg) ){
      			perror("Thread creation failed");
  			exit(1);
  }
  //child process is created for serving each new clients
  
 }//close  while

  close(sockfd);	
 return 0;
} //end of main func

void process_cli(int confd,struct sockaddr_in client)
{
 int n,m;
 char msg[MAXSZ],c_name[MAXSZ];


		 //rceive from client
m=recv(confd,c_name,MAXSZ,0);
c_name[m]='\0';
printf("Client name is %s\n",c_name);
   while(1)
   {
    
    n=recv(confd,msg,MAXSZ,0);
    if(n==0)
    {
     printf("Disconnected from %s\n", c_name);
     close(confd);
     break;
    }
    msg[n]='\0';
    send(confd,msg,n,0);

    printf("Received client message: %s :- %s\n", msg, c_name);
   }//close  while
}
void *start_routine(void *arg) {
	ARG *info;
	info = (ARG *)arg;
	pthread_detach(pthread_self());
	process_cli(info->connfd, info->client);
	free(arg);
	pthread_exit(NULL);

}


































