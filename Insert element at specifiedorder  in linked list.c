#include <stdio.h>
#include <stdlib.h>
 
struct node{
    int val;
    struct node *next;
};
 
struct node * find_node(struct node *head, int val)
{
    struct node *tmp = head;
 
    while(tmp)
    {
        if (tmp->val == val) return tmp; /*Found*/
 
        tmp = tmp->next;
    }
 
    return NULL; /*Not found*/
}
 
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
 
void insert_after(struct node *pos, int value)
{
    struct node * new_node = NULL;
 
    if (pos == NULL) return;
 
    new_node = (struct node *)malloc(sizeof(struct node));
 
    if (new_node == NULL)
    {printf("Failed to insert element. Out of memory");
    }
 
    new_node->val = value;
    new_node->next = pos->next;
    pos->next = new_node;
}
 
void main()
{
    int count = 0, i, val, pos;
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
 
    printf("Enter a value to insert in the list: ");
    scanf("%d", &val);
 
    printf("Insert after: ");
    scanf("%d", &pos);
 
    insert_after(find_node(head, pos), val);
 
    printf("List after insertion: ");
    print_list(head);
}
