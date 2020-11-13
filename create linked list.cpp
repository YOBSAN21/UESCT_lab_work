#include<stdio.h>
#include<stdlib.h>
typedef struct node{
	int data;
	struct node*next;
}node;
node*createlinked_list(int n);
void displaylist(node*head);
int main(){
	int n = 0;
	node*head = NULL;
	head=createlinked_list(n);
	displaylist(head);
printf("\n how many nodes");
}
node*createlinkedlist(int n){
	int i = 0;
	node*head = NULL;
	node*temp = NULL;
	node*p = NULL;
   for(i=0;i<n;i++){
	//temp = (node*)malloc(sizeof(node);
	printf("\n enter the data for the node number:",i+1);
	scanf("%d",&(temp->data));
	temp->next = NULL;
	if(head==NULL){
		head = temp;
	}
	else{
		p=head;
		while(p->next!=NULL)
		p=p->next;
		p->next=temp;
	}
	return head;
}}
void displaylist(node*head){
	node*p=head;
	while(p->next!=NULL)
	printf("\t%d->",p->data);
	p=p->next;
}
