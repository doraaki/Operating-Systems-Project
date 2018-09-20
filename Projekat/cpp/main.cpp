

#include "thread.h"
#include <STDIO.H>
#include <STDLIB.H>
#include "kernel.h"
#include "Lprintf.h"
#include "Lock.h"
#include "idle.h"
#include "sleepLst.h"
#include "Timer.h"
#include "mainThr.h"
#include "timer.h"
#include "intLock.h"


int main(int argc, char* argv[])
{
	lock
	KERNEL::mainThr = new mainThread(argc, argv);
	//KERNEL::idle->start();
	Timer* t = new Timer();
	KERNEL::mainThr->start();
	intLock
	cout << "smoki";
	intUnlock
	unlock
	dispatch();
	//exit(0);
	delete t;
	lock
	intLock
	cout << "smokismoki";
	intUnlock
	//Timer* t = new Timer();
	//while(g<3);
	//while(KERNEL::mainThr->finished == 0)
	//	dispatch();
	unlock
	LockPrintf(KERNEL::mainThr->returnValue());
	return KERNEL::mainThr->returnValue();
}
