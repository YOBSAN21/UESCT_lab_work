#include <stdio.h>
#include <stdlib.h>
#include <memory.h>
#include <pthread.h>
#include <errno.h>
#include <math.h>

pthread_mutex_t chopstick[6] ;
void *eat_think(void *arg)
{
	char phi = *(char *)arg;
	int left,right;
	switch (phi){
		case 'A':
			left = 5;
			right = 1;
			break;
		case 'B':
			left = 1;
			right = 2;
			break;
		case 'C':
			left = 2;
			right = 3;
			break;
		case 'D':
			left = 3;
			right = 4;
			break;
		case 'E':
			left = 4;
			right = 5;
			break;
	}

	int i;
	for(i=0; i<=30;i++){
		usleep(3);
		pthread_mutex_lock(&chopstick[left]);
		printf("Philosopher %c fetches chopstick %d\n", phi, left);
		if (pthread_mutex_trylock(&chopstick[right]) == EBUSY){
			pthread_mutex_unlock(&chopstick[left]);
			continue;
		}


		printf("Philosopher %c fetches chopstick %d\n", phi, right);
		printf("Philosopher %c is eating.\n",phi);
		usleep(3);
		pthread_mutex_unlock(&chopstick[left]);
		printf("Philosopher %c release chopstick %d\n", phi, left);
		pthread_mutex_unlock(&chopstick[right]);
		printf("Philosopher %c release chopstick %d\n", phi, right);

	}
}
int main(){
	pthread_t A,B,C,D,E;

	int i;
	for (i = 0; i < 5; i++)
		pthread_mutex_init(&chopstick[i],NULL);
		for(int j = 'A'; j<='E'; j++){
	pthread_create(&j,NULL, eat_think, j);}
	//pthread_create(&B,NULL, eat_think, "B");
	//pthread_create(&C,NULL, eat_think, "C");
	//pthread_create(&D,NULL, eat_think, "D");
	//pthread_create(&E,NULL, eat_think, "E");

	for(int k = 0;k<5;k++){
	pthread_join(k,NULL);
	}
	return 0;
}
