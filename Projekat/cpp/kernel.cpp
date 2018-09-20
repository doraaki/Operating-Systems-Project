/*
 * kernel.cpp
 *
 *  Created on: August 2, 2018
 *      Author: Nikola
 */

#include "kernel.h"
#include "idle.h"
#include "sleepLst.h"
#include "timer.h"
#include "Lock.h"
#include "IVTtable.h"
#include "pcb.h"

KERNEL::StaticBlock::StaticBlock()
{	

}
unsigned int  PCB::NEXT_ID = 0;
PCB* KERNEL::idlePCB = NULL;
IVTtable* KERNEL::ivtTable = new IVTtable();
Idle* KERNEL::idle = new Idle();
PCB* KERNEL::running = 0;//KERNEL::idle->getPCB();
SleepingList* KERNEL::sleeping = new SleepingList();
unsigned int KERNEL::mainSs = 0;
unsigned int KERNEL::mainSp = 0;
unsigned int KERNEL::mainBp = 0;
//Timer* KERNEL::t = NULL;
mainThread* KERNEL::mainThr = 0; 
//Timer* KERNEL::timer = new Timer();
KERNEL::StaticBlock init;	

