/*
 * LPrintf.cpp
 *
 *  Created on: July 24, 2018
 *      Author: Nikola
 */


#include "LPrintf.h"
#include <STDIO.H>
#include "timer.h"
#include "Lock.h"
#include "IOSTREAM.H"
#include "intLock.h"
void LockPrintf(char* str)
{
	intLock
	cout << str;
	intUnlock
}

void LockPrintf(unsigned int num)
{
	intLock
	cout << num;
	intUnlock
	//printf("1");
}


/*
int main()
{
	LPrintf("AAAA");
	LPrintf(5);
	printf("aa");
	int a;
	scanf("%d",&a);
	return 0;
}
*/
