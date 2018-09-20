/*
 * event.h
 */


#ifndef _event_h_
#define _event_h_

#include "IVTEntry.h"
#include "thread.h"

typedef unsigned char IVTNo;
class KernelEv;
class Event {
public:
	Event (IVTNo ivtNo);
	~Event ();
	void wait ();
protected: 

	friend class KernelEv;
	void signal(); // can call KernelEv
private:
	KernelEv* myImpl;
};

#define PREPAREENTRY(entry_number, call_old) \
void interrupt interrupt_##entry_number(...); \
IVTentry entry_##entry_number(entry_number, interrupt_##entry_number); \
void interrupt interrupt_##entry_number(...) { \
entry_##entry_number.signal(); \
	if (call_old) entry_##entry_number.callOld(); \
	dispatch(); \
}




#endif