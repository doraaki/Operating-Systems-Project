/*
 * idle.h
 *
 *  Created on: July 30, 2018
 *      Author: Nikola
 */

#ifndef _idle_h_
#define _idle_h_

#include "thread.h"

class Thread;
class PCB;
class mainThread;
class Idle: public Thread {
public:
	Idle();
	virtual void run();
	PCB* getPCB();
};

#endif