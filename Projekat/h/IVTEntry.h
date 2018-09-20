/*
 * IVTentry.h
 */

#ifndef IVTENTRY_H_
#define IVTENTRY_H_



class KernelEv;
class IVTentry {
public:
	IVTentry(int id, void interrupt (*newRoutine)(...));
	virtual ~IVTentry();
	void signal();
	void setEvent(KernelEv* event);
	void callOld();
private:
	int id;
	void interrupt (*old)(...);
	KernelEv *event;
};

#endif /* IVTENTRY_H_ */