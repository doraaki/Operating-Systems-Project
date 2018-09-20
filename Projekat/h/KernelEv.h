/*
 * KernelEv.h
 */

#ifndef KERNELEV_H_
#define KERNELEV_H_

#define IvtNo unsigned char;

class PCB;
class IVTEntry;
class KernelEv 
{
public:
	KernelEv(unsigned char ivtNo);
	
	void wait();
	void signal();
	unsigned int ID;
	static int NEXT_ID;
	virtual ~KernelEv();
private:
	void block();
	void deblock();
	int value;
	PCB *holder;
	
};

#endif