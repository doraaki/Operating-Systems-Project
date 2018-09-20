/*
 * sleepLst.cpp
 *
 *  Created on: July 29, 2018
 *      Author: Nikola
 */

#include "lock.h"
#include "pcb.h"
#include "sleepLst.h"
#include "SCHEDULE.H"

SleepingList::SleepingList()
{
	lock
	head = 0;
	unlock
}

SleepingList::~SleepingList()
{
	
}


void SleepingList::decrease()
{
	lock
	if(head == 0)
	{
		unlock
		return;
	}
	Elem* tmp = head;
	Elem* prev = 0;
	while(tmp != 0)
	{
		tmp->pcb->timeToSleep--;
		if(tmp->pcb->timeToSleep == 0)
		{
			Scheduler::put(tmp->pcb);
			if(prev)
			{
				prev->next = tmp->next;
			}
			else
			{
				head = tmp->next;
			}
			tmp = tmp->next;
		}
		else
		{
			prev = tmp;
			tmp  = tmp->next;
		}
	}
	unlock
}

void SleepingList::push(PCB* pcb)
{
	lock
	Elem* newElem = new Elem(pcb);
	newElem->next = head;
	head = newElem;
	unlock
}

