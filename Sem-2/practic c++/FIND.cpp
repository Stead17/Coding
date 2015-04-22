#include <iostream>
#include <stdlib.h>
#include <unistd.h> 
#include <time.h>

using namespace std;

void

int main(void)
{	
	const int n = 20;
	setlocale(0,"");
	int maassive[n];
	srand(time(NULL));

	printf("Maassive A = { ");
	for (int i = 0; i < n-1; ++i)
	{
		maassive[i] = rand()%40;
		cout << maassive[i] << ", ";
	}
	printf("%d }\n",maassive[n-1] );
	
	for (int i = 1; i < n+1; ++i)
	{
		int tmp = maassive[i];
		int prex = i-1;
		while ( (prex >= 0) and (maassive[prex] > tmp) )
		{
			maassive[prex+1] = maassive[prex];
			maassive[prex] = tmp;
			prex = prex - 1;
		}
	}


	cout << "Maassive A = {";
	for (int i = 0; i < n-1; ++i)
	{
		cout << maassive[i] << ", ";
	}
		printf("%d }\n", maassive[n-1]);

	cout << endl;

	int x,L,R,i;
	cout << "Enter X = ";
	cin >> x;
	L = 1;
	R = 20;
	while  (L <= R)
	{
		i = (L + R) / 2;
		if (maassive[i] == x )
		{
			break;
		}
		else if (maassive[i] < x )
		{
			L = L + 1;
		}
		else
		{
			R = R - 1;
		}
	}
	if (L<=R)
	{
		cout << "Element found on position " << i << endl;
	}
	else 
		cout << "Element not found" << endl;
	return 0;
}