/*
 * waiting.cpp
 *
 *  Created on: July 27, 2018
 *      Author: Nikola
 */

#include "pcb.h"
#include "lock.h"
#include "SCHEDULE.H"
#include "waiting.h"
#include <IOSTREAM.H>
#include "thread.h"

Waiting::Waiting()
{
	lock
	head = 0;
	unlock
}
void Waiting::push(PCB* pcb)
{
	lock
	Elem* tmp = new Elem(pcb);
	tmp->next = head;
	head = tmp;
	unlock
}
void Waiting::free()
{
	lock
	while(head)
	{
		head->pcb->PCB::setState(PCB::ACTIVE);
		Scheduler::put(head->pcb);
		head = head->next;
	}
	//dispatch();
	unlock
}


