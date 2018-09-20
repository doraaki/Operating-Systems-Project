/*
 * idle.cpp
 *
 *  Created on: July 30, 2018
 *      Author: Nikola
 */

#include "idle.h"
#include "kernel.h"
#include "pcb.h"
#include "timer.h"
#include "pcb.h"
#include "thread.h"
#include "lock.h"
#include <STDIO.H>
#include "LPrintf.h"


Idle::Idle(): Thread(10, 1) {}

void Idle::run()
{
	int i = 0;
	int j = 0;
	while(1)
	{
		j++;
		if(j == 32000)
		{
			i++;
			if(i == 32000)
			{
				//LockPrintf(8);
				i = 0;
			}
			j = 0;
		}
	}
}


PCB* Idle::getPCB()
{
	return KERNEL::idlePCB;
}