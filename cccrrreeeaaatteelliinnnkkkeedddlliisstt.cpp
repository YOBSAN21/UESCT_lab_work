#include<stdio.h>
#include<stdlib.h>
struct node{
	int data;
	struct node*next;
};
struct node*startList;
void createLinkedList();
void displayLinkedList();

int main(){
	startList=NULL;
	createLinkedList();
	displayLinkedList();
	return 0;
}
void createLinkedList();



