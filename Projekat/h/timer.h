/*
 * timer.h
 *
 *  Created on: July 24, 2018
 *      Author: Nikola
 */


#ifndef _timer_h_
#define _timer_h_

extern void tick();


class KERNEL;
class Timer
{
public:
	Timer();
	virtual ~Timer();
	static void interrupt timer(...);
	static int expl;
private:
	static void interrupt (*old)(...);
	static int ticking;
	static int timeUntilThreadStop;
	static int timeRanOut;
	static int changeContext;
};



#endif


