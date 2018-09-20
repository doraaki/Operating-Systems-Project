/*
 * timer.cpp
 *
 *  Created on: July 24, 2018
 *      Author: Nikola
 */

#include "timer.h"
#include "intLock.h"
#include <dos.h>
#include "lock.h"
#include "thread.h"
#include "kernel.h"
#include "sleepLst.h"
#include "SCHEDULE.H"
#include <STDIO.H>
#include <STDLIB.H>
#include <IOSTREAM.H>
#include "idle.h"
#include "pcb.h"
#include "mainThr.h"
#include "LPrintf.h"
#define TIMER_ENTRY 8

int Timer::expl = 0;
int Timer::timeUntilThreadStop = 1;
int Timer::ticking = 1;
int Timer::timeRanOut = 0;
int Timer::changeContext = 0;
void interrupt (*Timer::old)(...) = 0;
Timer::Timer()
{
	//LockPrintf("timer");
	lock
	//timeUntilThreadStop = 1;
	//ticking = 1;
	//expl = 0;
	old = getvect(TIMER_ENTRY);
	setvect(TIMER_ENTRY, timer);
	//setvect(60, old);
	//timer();
	unlock

}

void Timer::~Timer()
{
	lock
	setvect(TIMER_ENTRY, old);
	unlock
}


void interrupt Timer::timer(...)
{
	//lock
	//if(expl == 0)
	
	//LockPrintf("timer");
	//if(zamena == 1)
	//	return;
	static unsigned int tmpStackOffset, tmpStackSegment, basePointer;
	static PCB *newPCB;
	//if(KERNEL::running == NULL)
	//	KERNEL::running = KERNEL::idle->getPCB();
	if(expl == 0)
	{
		tick();
		//printf("bb");
		KERNEL::sleeping->decrease();
		if(*old != 0)
		(*old)(...);
		if(timeUntilThreadStop > 0)
			timeUntilThreadStop--;
		timeRanOut = (timeUntilThreadStop == 0 && ticking == 1) ? 1 : 0;
		//printf("aa");
	}

	changeContext = (expl || timeRanOut) ? 1 : 0;

	if(changeContext)
	{
		//printf("tes");
		if(KERNEL::running != 0)
		if(KERNEL::running->getState() == PCB::RUNNING && KERNEL::running != KERNEL::idle->getPCB())
		{
			//printf("rr");
			Scheduler::put(KERNEL::running);
			KERNEL::running->setState(PCB::ACTIVE);
		}
		//LockPrintf(5);
		newPCB = Scheduler::get();
		//LockPrintf(7);
		if(newPCB == 0)
		{
			newPCB = KERNEL::idle->getPCB();
			//LockPrintf("FFF");
		}
		timeUntilThreadStop = newPCB->getTime();

		ticking = (timeUntilThreadStop == 0 ? 0 : 1);

		newPCB->setState(PCB::RUNNING);



		// Sacuvaj stari kontekst

		asm{
			mov tmpStackSegment, ss;
			mov tmpStackOffset, sp;
			mov basePointer, bp;
		}
		if(KERNEL::mainSp != 0)	// Ako je prvi put cuvamo kontekst main-a
		{
			KERNEL::running->stackOffset = tmpStackOffset;
			KERNEL::running->stackSegment = tmpStackSegment;
			KERNEL::running->basePointer = basePointer;
		}
		else
		{
			KERNEL::mainSp = tmpStackOffset;
			KERNEL::mainSs = tmpStackSegment;
			KERNEL::mainBp = basePointer;
			
			/*
			intLock
			cout << "main sacuvan";
			intUnlock
			*/
		}
		

		KERNEL::running = newPCB;


		// Postavi novi kontekst

		if(mainThread::finished == 0)
		{
			tmpStackOffset = KERNEL::running->stackOffset;
			tmpStackSegment = KERNEL::running->stackSegment;
			basePointer = KERNEL::running->basePointer;
		}
		else
		{
			tmpStackOffset  = KERNEL::mainSp;
			tmpStackSegment = KERNEL::mainSs;
			basePointer     = KERNEL::mainBp;
			

			/*
			intLock
			cout << "main vracen";
			intUnlock
			*/
		}

		asm{
			mov ss, tmpStackSegment;
			mov sp, tmpStackOffset;
			mov bp, basePointer; 
		}


		expl = 0;

		/*
		if(mainThread::finished == 1)
		{
			LockPrintf(999);
			asm{
				add sp, 0x32
				add bp, 0x32
			}
			setvect(TIMER_ENTRY,old);
			exit(0);
		}
		*/
	}
}
