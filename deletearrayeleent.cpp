#include<stdio.h>
#include<stdlib.h>
void delete();
int num[6],size,location,item;
int main(){
	int i = 0;
	printf("\n enter the size of the array:");
	scanf("%d",&size);
	printf("\nenter elements of the array:")
 for(i = 0;i<size;i++) 
  scanf("%d",num[i]);
  printf("\n enter the location where you want to delete");
  scanf("%d",&location);
  delete();
  printf("\n\n After deletion:");
  for(i=0;i<size;i++)
  printf("\n%d",num[i]);
  return 0;
}
void delete(){
	int i;
	item = num[location-1];
	for(i=loaction-1;i<size;i++)
	num[i]=num[i+1];
	size--;
	printf("\n item deleted: %d",item);
	
}
