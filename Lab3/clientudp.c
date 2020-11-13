#include <arpa/inet.h> 
#include <netinet/in.h> 
#include <stdio.h> 
#include <stdlib.h> 
#include <strings.h> 
#include <sys/socket.h> 
#include <sys/types.h> 
#define PORT 5000 
#define MAXLINE 1024 
int main() 
{ 
    int sockfd; 
    char buffer[MAXLINE]; 
   // char* message = "Hello Server"; 
    struct sockaddr_in servaddr; 
  
    int n, len; 
    // Creating socket file descriptor 
    if ((sockfd = socket(AF_INET, SOCK_DGRAM, 0)) < 0) { 
        printf("socket creation failed"); 
        exit(0); 
    } 
  
    memset(&servaddr, 0, sizeof(servaddr)); 
  
    // Filling server information 
    servaddr.sin_family = AF_INET; 
    servaddr.sin_port = htons(PORT); 
    servaddr.sin_addr.s_addr = inet_addr("127.0.0.1"); 
  while(1){
    
    int i=0;
    printf("To server: ");
    while ((buffer[i++] = getchar()) != '\n');
    if (strncmp("exit", buffer, 4) == 0) { 
           printf("TCP Client Exit...\n"); 
           break;
      }
    sendto(sockfd, (const char*)buffer, strlen(buffer), 
           0, (const struct sockaddr*)&servaddr, 
           sizeof(servaddr)); 
  
    // receive server's response 
    printf("From server: "); 
    n = recvfrom(sockfd, (char*)buffer, MAXLINE, 
                 0, (struct sockaddr*)&servaddr, 
                 &len); 
    puts(buffer); 
}
    close(sockfd); 
    return 0; 
} 
