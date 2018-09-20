/*
 * event.cpp
 */
#include "Lock.h"
#include "KernelEv.h"
#include "event.h"
#include "timer.h"
#include "thread.h"
#include <dos.h>

Event::Event(IVTNo ivtNo)
{
	lock
	myImpl = new KernelEv(ivtNo);
	unlock
}

void Event::wait()
{
	lock
	myImpl->wait();
	unlock
}

void Event::signal()
{
	lock
	myImpl->signal();
	unlock
}

Event::~Event()
{
	lock
	delete(myImpl);
	unlock
}



