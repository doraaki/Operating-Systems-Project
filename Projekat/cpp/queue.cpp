/*
 * queue.cpp
 *
 *  Created on: July 18, 2018
 *      Author: Nikola
 */


#include "queue.h"
#include "Lock.h"

#include<IOSTREAM.H>


queue::queue()
{
	head = last = 0;
}

void queue::push(PCB* pcb)
{
	lock
	
	if(head == 0)
	{
		head = last = new Elem(pcb);
	}
	else
	{
		last -> next = new Elem(pcb);
		last = last -> next;
	}
	
	unlock
	return;
}

PCB* queue::pop()
{
	lock
	if(head == 0)
	{
		unlock
		return 0;
	}
	PCB* tmp = head -> pcb;
	head = head -> next;
	if(head == 0)
		last = 0;
	unlock
	return tmp;
}

queue::~queue()
{
	lock
	Elem* tmp;
	while(head)
	{
		tmp = head;
		head = head -> next;
		delete tmp;
		
	}
	unlock
}