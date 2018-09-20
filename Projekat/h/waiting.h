/*
 * Waiting.h
 *
 *  Created on: July 27, 2018
 *      Author: Nikola
 */


#include "lock.h"

#ifndef _waiting_h_
#define _waiting_h_

class PCB;
class Scheduler;
class Waiting
{
public:
	Waiting();
	void push(PCB* pcb);
	void free();
	~Waiting()
	{

	}
private:
	struct Elem
	{
		PCB* pcb;
		Elem* next;
		Elem(PCB* pcb)
		{

			this->pcb = pcb;
			next = 0;
		}
		Elem()
		{

		}
	};
	Elem* head;
};

#endif