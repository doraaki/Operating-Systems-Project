/*
 * kernel.h
 *
 *  Created on: July 29, 2018
 *      Author: Nikola
 */


#ifndef _kernel_h_
#define _kernel_h_

class PCB;
class SleepingList;
class Idle;
class Timer;
class IVTtable;
class mainThread;
class KERNEL
{
public:
		static PCB* running;
		static SleepingList* sleeping;
		static Idle* idle;
		static IVTtable* ivtTable;
		static PCB* idlePCB;
		//static Timer* t;
		static mainThread* mainThr;
		static unsigned int mainSp;
		static unsigned int mainSs;
		static unsigned int mainBp;
		//static Timer* timer;
		struct StaticBlock
		{
			StaticBlock();
		};
		//static StaticBlock* init;
};



#endif _kernel_h_