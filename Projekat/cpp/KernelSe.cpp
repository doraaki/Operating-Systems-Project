/*
 * KernelSe.cpp
 *
 *  Created on: July 18, 2018
 *      Author: Nikola
 */

#include "KernelSe.h"
#include "queue.h"
#include "Lock.h"
#include "pcb.h"
#include "kernel.h"
#include "thread.h"
#include "SCHEDULE.H"

KernelSem::KernelSem(int init)
{
	lock
	val = init;
	semaphoreQueue = new queue();
	unlock
}



int KernelSem::wait(int toBlock)
{
	lock
	if(toBlock != 0)
	{
		if(--val < 0) 
		{
			unlock
			block();
			
			return 1;
		}
		else
		{
			unlock
			return 0;
		}
	}
	else
	{
		if(val <= 0) 
		{
			unlock 
			return -1;
		}
		else
		{
			--val;
			unlock
			return 0;
		}
	}
}

int KernelSem::value() const
{
	return val;
}

void KernelSem::signal()
{
	lock
	if(val++ < 0)
		deblock();
	unlock
}

void KernelSem::block()
{
	lock
	KERNEL::running->setState(PCB::BLOCKED);
	semaphoreQueue->push(KERNEL::running);
	unlock
	dispatch();
	
}

void KernelSem::deblock()
{
	lock
	PCB* deblockedThread = semaphoreQueue->pop();
	deblockedThread->setState(PCB::ACTIVE);
	Scheduler::put(deblockedThread);
	unlock	
}

KernelSem::~KernelSem()
{
	delete semaphoreQueue;
}