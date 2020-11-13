#include <stdio.h>
#include <stdlib.h>

struct node{
    int val;
    struct node *next;
};
 
void print_list(struct node *head)
{
    printf("H->");
 
    while(head)
    {
        printf("%d->", head->val);
        head = head->next;
    }
    printf("|||\n");
}
 
void insert_front(struct node **head, int value)
{
    struct node * new_node = NULL;
 
    new_node = (struct node *)malloc(sizeof(struct node));
 
    if (new_node == NULL)
    {
        printf("Failed to insert element. Out of memory");
        }
 
    new_node->val = value;
    new_node->next = *head;
 
    *head = new_node;
}
 
void create_loop(struct node *head)
{
    struct node *tmp = head;
 
    while(tmp->next) tmp = tmp->next;
 
    tmp->next = head->next;
}
 
void print_loop(struct node *head)
{
    int n = 25;
    printf("H->");
 
    while(n--)
    {
        printf("%d->", head->val);
        head = head->next;
    }
 
    printf("|||\n");
}
 void detect_loop(struct node *head)
{
    struct node *slow = head;
    struct node *fast = head;
 
    while(slow && fast->next && fast->next->next)
    {
        if ((slow == fast->next) || (slow == fast->next->next ))
        {
            printf("Linked list has a loop.\n");
            return;
        }
 
        slow = slow->next;
        fast = fast->next->next;
    }
 
    printf("Linked list does not have any loop.\n");
}
 
void remove_loop(struct node *head, struct node *loop_node)
{
    struct node *near = head;
    struct node *far = head;
    struct node *ptr = loop_node;
    struct node *prev = NULL;
 
    while(ptr->next != loop_node)
    {
        ptr = ptr->next;
        far = far->next;
    }
 
    prev = far;
    far = far->next;
 
    while(near != far)
    {
        prev = far;
        far = far->next;
        near = near->next;
    }
 
    prev->next = NULL;
}
 
void detect_and_remove_loop(struct node *head)
{
    struct node *slow = head;
    struct node *fast = head;
 
    while(slow && fast->next && fast->next->next)
    {
        if ((slow == fast->next) || (slow == fast->next->next ))
        {
            printf("Linked list has a loop.\n");
            remove_loop(head, slow);
            return;
        
	}}}
 
