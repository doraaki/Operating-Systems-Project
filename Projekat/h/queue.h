/*
 * queue.h
 *
 *  Created on: July 18, 2018
 *      Author: Nikola
 */

#include "pcb.h"

#ifndef _queue_h_
#define _queue_h_
class queue 
{
public:
	queue();
	void push(PCB* pcb);
	PCB* pop();
	int size() const;
	virtual ~queue();
private:
	struct Elem
	{
		PCB* pcb;
		Elem* next;
		Elem(PCB* pcbb)
		{
			pcb = pcbb;
			next = 0;
		}
		Elem()
		{

		}
	};
	Elem* head;
	Elem* last;
};
#endif