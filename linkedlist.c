#include <stdio.h>
#include <stdlib.h>
typedef struct linked_list{
   int number;
   struct linked_list*next;
    };
    typedef struct linked_list node;
    node*head = NULL,*last = NULL;
    void create_linked_list();
    void print_linked_list();


int main()
{
    printf("create linked list\n");
    create_linked_list();
    print_linked_list();

    return 0;
}
void create_linked_list()
{
    int val;
    printf("enter number.(Enter -1 to end)");
    while(1){
        scanf("%d",&val);
        if(val==-1)
            break;
    }

}
void print_linked_list(){
printf("\nyour fully linked list is \n");
node*mylist;
mylist = head;
while(mylist!=NULL)
{

    printf("%d",mylist->next);
    mylist=mylist->next;
}
puts("");

}
