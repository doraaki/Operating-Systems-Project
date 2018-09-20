/*
 * sleepLst.h
 *
 *  Created on: July 29, 2018
 *      Author: Nikola
 */


#ifndef _sleeplst_h_
#define _sleeplst_h_


class SleepingList
{
public:
	void decrease();
	void push(PCB*);
	SleepingList();
	virtual ~SleepingList();
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
		Elem(){}
	};
	Elem* head;
};


#endif