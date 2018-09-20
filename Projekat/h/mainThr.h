/*
 * mainThr.h
 *
 *  Created on: August 5, 2018
 *      Author: Nikola
 */

#ifndef _mainthr_h_
#define _mainthr_h_


#include "thread.h"

class mainThread: public Thread
{
public:
	mainThread(int argc, char* argv[]);
	virtual ~mainThread();
	virtual void run();
	static int returnValue();

	static unsigned int finished;
private:
	static int argc;
	static char **argv;
	static int returnVal;
};




#endif