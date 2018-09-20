/*
 * Lock.h
 *
 *  Created on: July 18, 2018
 *      Author: Nikola
 */

#ifndef _lock_h_
#define _lock_h_
static int zamena = 0;
#include "thread.h"

#define lock { asm{ pushf; cli;} }
#define unlock { asm{ popf;} }
static int g = 0;






#endif /* LOCK_H_ */