#include<stdio.h>
#include<stdlib.h>

typedef struct node{
int data;
struct node*next;
  }node_type,*Pnode;
  void delete_or_insert(Pnode temp);
  int main(){
  Pnode head;
  Pnode tail;
  int n;
  printf("enter the data (input ends with 0)");
  scanf("%d",&n);
  head=(Pnode)malloc(sizeof(node_type));
  tail=head;
  while(n!=0){
    Pnode p;
    p=(Pnode)malloc(sizeof(node_type));
    p->data=n;
    p->next=NULL;
    tail->next=p;
    tail=p;
    scanf("%d",&n);
      }
delete_or_insert(head);
  return 0;
}
void delete_or_insert(Pnode temp){
int i;
Pnode n = temp;
Pnode m;
Pnode insert;
printf("\n Enter an integer :\n");
scanf("%d",&i);
while(n->next){
    if(n->next->next==i)
        break;
    n=n->next;
}
if(n->next!=NULL){
    m=n->next;
    n->next=m->next;
    free(m);
    printf("\n after deletion :\n");
    temp=temp->next;
    while(temp){
        printf("%d",temp->data);
        temp=temp->next;
    }
}
else{
    insert=(Pnode)malloc(sizeof(node_type));
    insert->data=i;
    insert->next=NULL;
    n->next=insert;
    printf("\n after insertion :\n");
    temp=temp->next;
    while(temp){
        printf("%d",temp->data);
        temp=temp->next;
    }
}
}
