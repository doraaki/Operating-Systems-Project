/*
 * LPrintf.h
 *
 *  Created on: July 24, 2018
 *      Author: Nikola
 */





#ifndef _lprintf_h_
#define _lprintf_h_

#include <stdio.h>
#include <IOSTREAM.H>
#include "lock.h"


void LockPrintf(char* str);
void LockPrintf(unsigned int num);

#endif