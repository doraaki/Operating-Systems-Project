/*
 * pcb.cpp
 *
 *  Created on: July 24, 2018
 *      Author: Nikola
 */

#include "pcb.h"
#include "lock.h"
#include <dos.h>
#include "SCHEDULE.h"
#include "queue.h"
#include "thread.h"
#include "waiting.h"
#include "kernel.h"
#include "sleepLst.h"
#include "idle.h"
#include "LPrintf.h"

//unsigned int PCB::NEXT_ID = 0;

PCB::PCB(Thread* myThread, unsigned long stackSize, int timeSlice)
{
	lock
	this->myThread = myThread;
	myTime = timeSlice;
	waitingList = new Waiting();
	wraperOffset = FP_OFF(myThread);
	wraperSegment = FP_SEG(myThread);
	
	state = NEW;
	ID = ++NEXT_ID;
	
	createStack(stackSize);
	if(ID == 1)
	{
		KERNEL::idlePCB = this;
	}
	unlock
}

void PCB::setState(State s)
{
	lock
	state = s;
	unlock
}

PCB::State PCB::getState()
{
	return state;
}

int PCB::getTime()
{
	return myTime;
}

void PCB::start()
{
	lock
	if(this->getState() == NEW)
	{
		setState(ACTIVE);
		Scheduler::put(this);
	}
	unlock
}

void PCB::waitToComplete()
{
	lock
	if(KERNEL::running != this && state != COMPLETED && KERNEL::running != KERNEL::idle->getPCB())
	{
		waitingList->push(KERNEL::running);
		KERNEL::running->state = BLOCKED;
		unlock
		dispatch();
	}
	else
	{
		unlock
	}
	//unlock
	//unlock
}

void PCB::sleep(unsigned int timeToSleep)
{
	lock
	
	KERNEL::sleeping->push(KERNEL::running);
	KERNEL::running->timeToSleep = timeToSleep;
	KERNEL::running->state = BLOCKED;
	unlock
	dispatch();
	//unlock
}

void PCB::run_wrapper()
{
	KERNEL::running->run();
}

void PCB::run()
{
	setState(RUNNING);
	myThread->run();
	//LockPrintf(8);
	lock
	setState(COMPLETED);
	//LockPrintf(9);
	waitingList->free();
	unlock
	dispatch();
	//LockPrintf(9);
	//g++;
	//unlock
}


void PCB::createStack(unsigned int stackSize)
{
	lock
	if(stackSize > 4096)
		stackSize = 4096;
	if(stackSize < 64)
		stackSize = 64;
	//if(ID == 2)
	//stackSize = 32000;
	
	stack = new unsigned int[stackSize];
	
	stack[stackSize - 5] = 0x200;
	stack[stackSize - 6] = FP_SEG(run_wrapper);
	stack[stackSize - 7] = FP_OFF(run_wrapper);
	stack[stackSize - 16] = 0;

	stackSegment = FP_SEG(stack + stackSize - 16);
	stackOffset  = FP_OFF(stack + stackSize - 16);
	basePointer  = FP_OFF(stack + stackSize - 16);
	unlock
}



PCB::~PCB()
{
	delete stack;
	delete waitingList;
}