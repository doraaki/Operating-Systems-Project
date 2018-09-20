/*
 * KernelEv.cpp
 */


#include "Lock.h"
#include "KernelEv.h"
#include "pcb.h"
#include "IVTentry.h"
#include "thread.h"
#include "SCHEDULE.H"
#include "kernel.h"
#include "IVTTable.h"

int KernelEv::NEXT_ID = 0;
KernelEv::KernelEv(unsigned char ivtNo)
{
	lock
	value = 2;
	ID = ++NEXT_ID;
	holder = KERNEL::running;
	KERNEL::ivtTable->operator[](ivtNo)->setEvent(this);
	unlock
}

void KernelEv::wait()
{
	lock
	if(KERNEL::running == holder && value-- == 0)
	{
		unlock
		block();
	}
	else
	{
		unlock
	}
}

void KernelEv::signal()
{
	lock
	if(value++ < 0)
	{
		unlock
		deblock();
	}
	else
	{
		unlock
	}
}

void KernelEv::block()
{
	lock
	holder->setState(PCB::BLOCKED);
	unlock
	dispatch();
}

void KernelEv::deblock()
{
	lock
	holder->setState(PCB::ACTIVE);
	Scheduler::put(holder);
	unlock
}

KernelEv::~KernelEv()
{

}
