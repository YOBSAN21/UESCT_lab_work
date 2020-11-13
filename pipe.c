#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
int main( )
{ 
	pid_t pid1,pid2;
	int pipe_fd[2];
	char w_buffer[100],r_buffer[100];	 
	int	len1,len2;
	/*Create a pipe*/
	if(pipe(pipe_fd)<0)
	{
		printf("pipe create error\n");
		return -1;
	}
	/*Create child processes*/
	if((pid1=fork( ))==0)	// sub-process 1 execution sequence
	  {
		close(pipe_fd[0]); // The child process closes the read segment of the pipe first
		sprintf(w_buffer,"child 1 process is sending message!"); 
		len1 = strlen(w_buffer);
		write(pipe_fd[1],w_buffer,50);     /*Write string lengthen to len byte in the pipe*/
		exit(0);
	   }
	 else if(pid1>0) // parent process execution sequence
	  {
		waitpid(pid1,NULL,0);	// Synchronize 1-iso sub-process 1 to write first	
		if((pid2=fork( ))==0)	//sub-process 2 execution sequence
		{ 
			close(pipe_fd[0]);	// The child process closes the read segment of the pipe first
			sprintf(w_buffer,"child 2 process is sending message!");
			len2 = strlen(w_buffer);
			write(pipe_fd[1],w_buffer,50);
			exit(0);
		 }
		 else if(pid2>0) // parent process execution sequence
		 {  			
			waitpid(pid2,NULL,0);	// synchronization 2--equal subprocess 2 finished writing
			close(pipe_fd[1]); // The parent process closes the pipe's writes first
                /*Reads a string of fixed-length bytes from a pipe*/
			if(read(pipe_fd[0],r_buffer,50)>0)   
				printf("%s\n",r_buffer);
			if(read(pipe_fd[0],r_buffer,50)>0)
				printf("%s\n",r_buffer);
			exit(0);
		}
	  }
	  return 0;
}
//waitpid function, waitpid for the child process to run before the parent process can run.
// Because the fork function allows the child process to copy the entire address space of the parent process, the child process has a piped read and write ends.
// So it's best to turn off the unused end in the process.
// As requested, "the parent process receives messages from the child process P1 before receiving messages from the child process P2."
// There are two synchronization problems, one between the child process and the parent process (first son write after parent read), the child process 1 and the child process 2 (first write, then 2 write)

