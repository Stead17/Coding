#include <iostream>
#include <stdlib.h>
#include <unistd.h> 
#include <time.h>

using namespace std;

void input(int [], int);
void sorting (int [], int);
void output(int[], int);


int main() 
{
	setlocale(0,"");
	
	const int size = 8;
    int arr[size] = {0};
	
	input(arr, size);
	for (int i = 0; i < size; ++i)
	{
		cout << arr[i] << ",";
	}
	cout << endl;
	sorting(arr,size);
	output(arr, size);
    return 0; 
}


void input( int massive[], int size)
{
	srand(time(NULL));
	for (int i = 0; i < size; ++i)
		massive[i] = rand()%50;
}
 

 void sorting (int massive[], int size)
{
	int tmp;
	int i,j;
	
	for (int i = 1; i < size; ++i)
	{
		tmp = massive[i];
		j = i;
			while ( (j>0) and ( tmp <= massive[j-1]) )
			{
				massive[j] = massive [j-1];
				j = j-1;
			}
		massive[j] = tmp;	
	}
}

void output (int massive[], int size)
{	
	printf("Massive A ={");
		for (int i = 0; i < size-1; ++i)
			printf("%d, ", massive[i]);
		printf("%d }\n", massive[size - 1]);

}