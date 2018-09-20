/*
 * pcb.h
 *
 *  Created on: July 18, 2018
 *      Author: Nikola
 */

#include<IOSTREAM.H>

#ifndef _pcb_h_
#define _pcb_h_
class Thread;
class queue;
class Waiting;
class KERNEL;
class PCB
{
	public:
		PCB(Thread* myThread, unsigned long stackSize, int timeSlice);
		virtual ~PCB();
		Thread* myThread;
		enum State{NEW, ACTIVE, RUNNING, BLOCKED, COMPLETED};
		void setState(State s);
		State getState();
		int getTime();
		void start();
		void waitToComplete();
		volatile unsigned int stackSegment;
		volatile unsigned int stackOffset;
		volatile unsigned int basePointer;
		volatile unsigned int wraperOffset;
		volatile unsigned int wraperSegment;
		volatile unsigned int timeToSleep;
		Waiting* waitingList;
		static void sleep(unsigned int timeToSleep);
		void run();
		static void run_wrapper();
	protected:
		friend class Thread;
		friend class mainThread;
	private:
		unsigned int ID;
		static unsigned int NEXT_ID;
		unsigned int *stack;
		int myTime;
		unsigned long stackSize;
		State state;
		void createStack(unsigned int stackSize);
		

};

#endif