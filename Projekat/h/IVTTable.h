/*
 * IVTtable.h
 */

#ifndef _H_IVTTABLE_H_
#define _H_IVTTABLE_H_
#define NumOfEntries 256

class IVTentry;

class IVTtable 
{
private:
	IVTentry* table[NumOfEntries];
public:
	IVTtable();
	IVTentry *&operator[](int index)
	{ 
		return table[index]; 
	}
	virtual ~IVTtable();
};

#endif