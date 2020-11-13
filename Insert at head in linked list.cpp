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
 
int main()
{
    int count = 0, i, val;
    struct node * head = NULL;
 
    printf("Enter number of elements: ");
    scanf("%d", &count);
 
    for (i = 0; i < count; i++)
    {
        printf("Enter %dth element: ", i);
        scanf("%d", &val);
        insert_front(&head, val);
    }
 
    printf("Initial List: ");
    print_list(head);
 
    printf("Enter a value to enter at the front of the list: ");
    scanf("%d", &val);
    insert_front(&head, val);
     printf("List after insertion: ");
    print_list(head);
}
