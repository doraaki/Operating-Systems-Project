/*
 * thread.cpp
 *
 *  Created on: July 24, 2018
 *      Author: Nikola
 */

#include "thread.h"
#include "mainThr.h"
#include "lock.h"
#include "pcb.h"
#include "LPrintf.h"
#include "timer.h"
#include <STDLIB.H>
#include <STDIO.H>

Thread::Thread(StackSize stackSize, Time timeSlice)
{
	lock
	myPCB = new PCB(this,stackSize, timeSlice);
	unlock
}

void Thread::start()
{
	myPCB->start();
}

void Thread::waitToComplete()
{
	myPCB->waitToComplete();	
}

void dispatch()
{
	//LockPrintf(8);
	lock
	Timer::expl = 1;
	//unlock
	//LockPrintf(8);
	//LockPrintf(9);
	unlock
	Timer::timer();
	//cout << 5;
	lock
	Timer::expl = 0;
	unlock
}

void Thread::sleep(Time timeToSleep)
{
	PCB::sleep(timeToSleep);
}

Thread::~Thread()
{
	waitToComplete();
	delete myPCB;
}

