/*
 * IVTTable.cpp

 */

#include "IVTTable.h"
#include "IVTEntry.h"
#include<IOSTREAM.H>
#include "Lock.h"

IVTtable::IVTtable() 
{
	lock
	for (int i = 0; i < NumOfEntries; i++)
	{
		table[i] = 0;
	}
	unlock
}


IVTtable::~IVTtable() {
	delete table;
}
