/*
 * KernelSe.h
 *
 *  Created on: July 18, 2018
 *      Author: Nikola
 */


#ifndef _kernelse_h_
#define _kernelse_h_
class queue;
 
class KernelSem
{
private:
	queue *semaphoreQueue;
	void block();
	void deblock();
	int val;
public:
	int wait(int toBlock);
	void signal();
	int value() const;
	KernelSem(int init);
	virtual ~KernelSem();
};
#endif
