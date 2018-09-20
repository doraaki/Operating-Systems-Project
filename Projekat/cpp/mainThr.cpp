/*
 * mainThr.cpp
 *
 *  Created on: August 5, 2018
 *      Author: Nikola
 */

#include "Lock.h"
#include "mainThr.h"
#include "kernel.h"
#include "Thread.h"
#include "pcb.h"
#include "USER.CPP"

int mainThread::returnVal = 0;
unsigned int mainThread::finished  = 0;



mainThread::mainThread(int argc, char* argv[])
{
	this->argc = argc;
	this->argv = argv;
	//finished = 0;
}

void mainThread::run()
{
	returnVal = userMain(argc,argv);
	lock
	finished = 1;
	//delete KERNEL::t;
	//exit(0);
	unlock
}

int mainThread::returnValue()
{
	return returnVal;
}


mainThread::~mainThread()
{
	waitToComplete();
}
