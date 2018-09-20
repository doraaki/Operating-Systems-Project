/*
 * semaphor.cpp
 *
 *  Created on: July 18, 2018
 *      Author: Nikola
 */
#include "semaphor.h"
#include "KernelSe.h"
#include "lock.h"


Semaphore::Semaphore(int init)
{
	lock
	myImpl = new KernelSem(init);
	unlock
}
int Semaphore::wait(int toBlock)
{
	return myImpl->wait(toBlock);
}

void Semaphore::signal()
{
	myImpl->signal();
}

int Semaphore::val() const
{
	return myImpl->value();
}

Semaphore::~Semaphore()
{
	delete myImpl;
}
