/*
 * IVTEntry.cpp
 */

#include "IVTEntry.h"
#include "Lock.h"
#include "KernelEv.h"
#include "kernel.h"
#include "IVTTable.h"
#include <dos.h>




IVTentry::IVTentry(int id, void interrupt (*newInt)(...))
{
	lock
	this->id = id;
	KERNEL::ivtTable->operator[](id) = this;
	old = getvect(id);
	setvect(id, newInt);
	unlock
}



void IVTentry::signal()
{
	lock
	event->KernelEv::signal();
	unlock
}

void IVTentry::setEvent(KernelEv* event)
{
	this->event = event;
}

void IVTentry::callOld()
{
	if(old != 0)
		(*old)();
}

IVTentry::~IVTentry()
{
	lock
	//KERNEL::ivtTable->operator[](id) = 0;
	setvect(id, old);
	unlock
}
