	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
$comm	macro	name,dist,size,count
	comm	dist name:BYTE:count*size
	endm
	else
$comm	macro	name,dist,size,count
	comm	dist name[size]:BYTE:count
	endm
	endif
	?debug	V 300h
	?debug	S "pcb.cpp"
	?debug	C E97865084D077063622E637070
	?debug	C E93C79034D0A2E2E5C685C7063622E68
	?debug	C E9817B9D441A633A5C626333315C696E636C7564655C494F535452+
	?debug	C 45414D2E48
	?debug	C E9817B9D4417633A5C626333315C696E636C7564655C5F64656673+
	?debug	C 2E68
	?debug	C E9817B9D4415633A5C626333315C696E636C7564655C6D656D2E68
	?debug	C E9817B9D4417633A5C626333315C696E636C7564655C5F6E756C6C+
	?debug	C 2E68
	?debug	C E99364084D0B2E2E5C685C6C6F636B2E68
PCB_TEXT	segment byte public 'CODE'
PCB_TEXT	ends
	assume	cs:PCB_TEXT,ds:PCB_DATA
PCB_DATA	segment word public 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
g	label	word
	db	0
	db	0
	?debug	C E9817B9D4415633A5C626333315C696E636C7564655C646F732E68
	?debug	C E9DB767A4012696E636C7564655C5343484544554C452E68
	?debug	C E9300AFA4C0C2E2E5C685C71756575652E68
	?debug	C E93C79034D0A2E2E5C685C7063622E68
	?debug	C E9817B9D441A633A5C626333315C696E636C7564655C494F535452+
	?debug	C 45414D2E48
	?debug	C E9E28B024D0D2E2E5C685C7468726561642E68
	?debug	C E9817B9D441A633A5C626333315C696E636C7564655C494F535452+
	?debug	C 45414D2E48
	?debug	C E962B6FD4C0E2E2E5C685C77616974696E672E68
	?debug	C E99364084D0B2E2E5C685C6C6F636B2E68
	?debug	C E91C5D084D0D2E2E5C685C6B65726E656C2E68
	?debug	C E9BB94FD4C0F2E2E5C685C736C6565704C73742E68
	?debug	C E96958084D0B2E2E5C685C69646C652E68
	?debug	C E9E28B024D0D2E2E5C685C7468726561642E68
	?debug	C E9817B9D441A633A5C626333315C696E636C7564655C494F535452+
	?debug	C 45414D2E48
	?debug	C E97B60084D0E2E2E5C685C4C5072696E74662E68
	?debug	C E9817B9D4417633A5C626333315C696E636C7564655C737464696F+
	?debug	C 2E68
	?debug	C E9817B9D4418633A5C626333315C696E636C7564655C5F6E66696C+
	?debug	C 652E68
	?debug	C E9817B9D441A633A5C626333315C696E636C7564655C494F535452+
	?debug	C 45414D2E48
	?debug	C E99364084D0B2E2E5C685C6C6F636B2E68
PCB_DATA	ends
PCB5_DATA	segment para public 'FAR_DATA'
@PCB@0NEXT_ID	label	word
	db	0
	db	0
PCB5_DATA	ends
PCB_TEXT	segment byte public 'CODE'
	?debug	C E801077063622E6370707865084D
   ;	
   ;	PCB::PCB(Thread* myThread, unsigned long stackSize, int timeSlice)
   ;	
	?debug	L 22
	assume	cs:PCB_TEXT
@PCB@0$bctr$qn6Threaduli	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F818405043424030246263747224716E36546872+
	?debug	C 656164756C69
	?debug	C E318000400161900
	?debug	C E31A000400161B00
	?debug	C E60974696D65536C696365040A12000009737461+
	?debug	C 636B53697A650C0A0E0000086D79546872656164+
	?debug	C 1A0A0A000004746869731802060000
	?debug	B
   ;	
   ;	{
   ;	
	?debug	L 23
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @1@86
	mov	ax,38
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	jne	@@0
	jmp	@1@226
@@0:
@1@86:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],seg @@PCB@0
	mov	word ptr es:[bx],offset @@PCB@0
   ;	
   ;		lock
   ;	
	?debug	L 24
	pushf	
 	cli	
   ;	
   ;		this->myThread = myThread;
   ;	
	?debug	L 25
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	mov	dx,word ptr [bp+10]
	mov	word ptr es:[bx+6],ax
	mov	word ptr es:[bx+4],dx
   ;	
   ;		myTime = timeSlice;
   ;	
	?debug	L 26
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+18]
	mov	word ptr es:[bx+30],ax
   ;	
   ;		waitingList = new Waiting();
   ;	
	?debug	L 27
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	call	far ptr @Waiting@0$bctr$qv
	pop	cx
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],dx
	mov	word ptr es:[bx+20],ax
   ;	
   ;		wraperOffset = FP_OFF(myThread);
   ;	
	?debug	L 28
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+10]
	mov	word ptr es:[bx+14],ax
   ;	
   ;		wraperSegment = FP_SEG(myThread);
   ;	
	?debug	L 29
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	mov	word ptr es:[bx+16],ax
   ;	
   ;		createStack(stackSize);
   ;	
	?debug	L 30
	push	word ptr [bp+14]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @PCB@0createStack$qui
	add	sp,6
   ;	
   ;		state = NEW;
   ;	
	?debug	L 31
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+36],0
   ;	
   ;		ID = ++NEXT_ID;
   ;	
	?debug	L 32
	mov	ax,seg @PCB@0NEXT_ID
	mov	es,ax
	inc	word ptr es:@PCB@0NEXT_ID
	les	bx,dword ptr [bp+6]
	mov	ax,seg @PCB@0NEXT_ID
	push	es
	mov	es,ax
	mov	ax,word ptr es:@PCB@0NEXT_ID
	pop	es
	mov	word ptr es:[bx+24],ax
   ;	
   ;		unlock
   ;	
	?debug	L 33
	popf	
@1@226:
   ;	
   ;	}
   ;	
	?debug	L 34
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @1@254
@1@254:
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000086D79546872656164+
	?debug	C 1A0A0A000009737461636B53697A650C0A0E0000+
	?debug	C 0974696D65536C696365040A120000
	?debug	E
	?debug	E
@PCB@0$bctr$qn6Threaduli	endp
   ;	
   ;	void PCB::setState(State s)
   ;	
	?debug	L 36
	assume	cs:PCB_TEXT
@PCB@0setState$q5State	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F816405043424030736574537461746524713553+
	?debug	C 74617465
	?debug	C E31C055374617465020022000080FF7F01
	?debug	C E601731C0A0A000004746869731802060000
	?debug	B
   ;	
   ;	{
   ;		lock
   ;	
	?debug	L 38
	pushf	
 	cli	
   ;	
   ;		state = s;
   ;	
	?debug	L 39
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+10]
	mov	word ptr es:[bx+36],ax
   ;	
   ;		unlock
   ;	
	?debug	L 40
	popf	
   ;	
   ;	}
   ;	
	?debug	L 41
	pop	ds
	pop	bp
	ret	
	?debug	C E60474686973180206000001731C0A0A0000
	?debug	E
	?debug	E
@PCB@0setState$q5State	endp
   ;	
   ;	State PCB::getState()
   ;	
	?debug	L 43
	assume	cs:PCB_TEXT
@PCB@0getState$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F8114050434240306765745374617465247176
	?debug	C E604746869731802060000
	?debug	B
   ;	
   ;	{
   ;		return state;
   ;	
	?debug	L 45
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+36]
	jmp	short @3@58
@3@58:
   ;	
   ;	}
   ;	
	?debug	L 46
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000
	?debug	E
	?debug	E
@PCB@0getState$qv	endp
   ;	
   ;	int PCB::getTime()
   ;	
	?debug	L 50
	assume	cs:PCB_TEXT
@PCB@0getTime$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81040504342403067657454696D65247176
	?debug	C E604746869731802060000
	?debug	B
   ;	
   ;	{
   ;		return myTime;
   ;	
	?debug	L 52
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+30]
	jmp	short @4@58
@4@58:
   ;	
   ;	}
   ;	
	?debug	L 53
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000
	?debug	E
	?debug	E
@PCB@0getTime$qv	endp
   ;	
   ;	void PCB::start()
   ;	
	?debug	L 55
	assume	cs:PCB_TEXT
@PCB@0start$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F80E4050434240307374617274247176
	?debug	C E604746869731802060000
	?debug	B
   ;	
   ;	{
   ;		lock
   ;	
	?debug	L 57
	pushf	
 	cli	
   ;	
   ;		if(this->getState() == NEW)
   ;	
	?debug	L 58
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @PCB@0getState$qv
	pop	cx
	pop	cx
	or	ax,ax
	jne	short @5@142
   ;	
   ;		{
   ;			setState(ACTIVE);
   ;	
	?debug	L 60
	mov	ax,1
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @PCB@0setState$q5State
	add	sp,6
   ;	
   ;			Scheduler::put(this);
   ;	
	?debug	L 61
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @Scheduler@0put$qn3PCB
	pop	cx
	pop	cx
@5@142:
   ;	
   ;		}
   ;		unlock
   ;	
	?debug	L 63
	popf	
   ;	
   ;	}
   ;	
	?debug	L 64
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000
	?debug	E
	?debug	E
@PCB@0start$qv	endp
   ;	
   ;	void PCB::waitToComplete()
   ;	
	?debug	L 66
	assume	cs:PCB_TEXT
@PCB@0waitToComplete$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81740504342403077616974546F436F6D706C65+
	?debug	C 7465247176
	?debug	C E604746869731802060000
	?debug	B
   ;	
   ;	{
   ;		lock
   ;	
	?debug	L 68
	pushf	
 	cli	
   ;	
   ;		if(KERNEL::running != this && state != COMPLETED && KERNEL::running != KERNEL::idle->getPCB())
   ;	
	?debug	L 69
	mov	ax,seg @KERNEL@0running
	mov	es,ax
	mov	ax,word ptr es:@KERNEL@0running+2
	mov	dx,word ptr es:@KERNEL@0running
	cmp	ax,word ptr [bp+8]
	jne	short @6@142
	cmp	dx,word ptr [bp+6]
	je	short @6@310
@6@142:
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+36],4
	je	short @6@310
	mov	ax,seg @KERNEL@0idle
	mov	es,ax
	push	word ptr es:@KERNEL@0idle+2
	push	word ptr es:@KERNEL@0idle
	call	far ptr @Idle@0getPCB$qv
	pop	cx
	pop	cx
	mov	bx,seg @KERNEL@0running
	mov	es,bx
	cmp	dx,word ptr es:@KERNEL@0running+2
	jne	short @6@226
	cmp	ax,word ptr es:@KERNEL@0running
	je	short @6@310
@6@226:
   ;	
   ;		{
   ;			waitingList->push(KERNEL::running);
   ;	
	?debug	L 71
	mov	ax,seg @KERNEL@0running
	mov	es,ax
	push	word ptr es:@KERNEL@0running+2
	push	word ptr es:@KERNEL@0running
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+22]
	push	word ptr es:[bx+20]
	call	far ptr @Waiting@0push$qn3PCB
	add	sp,8
   ;	
   ;			KERNEL::running->state = BLOCKED;
   ;	
	?debug	L 72
	mov	ax,seg @KERNEL@0running
	mov	es,ax
	les	bx,dword ptr es:@KERNEL@0running
	mov	word ptr es:[bx+36],3
   ;	
   ;			unlock
   ;	
	?debug	L 73
	popf	
   ;	
   ;			dispatch();
   ;	
	?debug	L 74
	call	far ptr @dispatch$qv
@6@310:
   ;	
   ;		}
   ;		//unlock
   ;	}
   ;	
	?debug	L 77
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000
	?debug	E
	?debug	E
@PCB@0waitToComplete$qv	endp
   ;	
   ;	void PCB::sleep(unsigned int timeToSleep)
   ;	
	?debug	L 79
	assume	cs:PCB_TEXT
@PCB@0sleep$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F80F405043424030736C65657024717569
	?debug	C E60B74696D65546F536C6565700A0A060000
	?debug	B
   ;	
   ;	{
   ;		lock
   ;	
	?debug	L 81
	pushf	
 	cli	
   ;	
   ;		KERNEL::running->timeToSleep = timeToSleep;
   ;	
	?debug	L 82
	mov	ax,seg @KERNEL@0running
	mov	es,ax
	les	bx,dword ptr es:@KERNEL@0running
	mov	ax,word ptr [bp+6]
	mov	word ptr es:[bx+18],ax
   ;	
   ;		KERNEL::running->state = BLOCKED;
   ;	
	?debug	L 83
	mov	ax,seg @KERNEL@0running
	mov	es,ax
	les	bx,dword ptr es:@KERNEL@0running
	mov	word ptr es:[bx+36],3
   ;	
   ;		KERNEL::sleeping->push(KERNEL::running);
   ;	
	?debug	L 84
	mov	ax,seg @KERNEL@0running
	mov	es,ax
	push	word ptr es:@KERNEL@0running+2
	push	word ptr es:@KERNEL@0running
	mov	ax,seg @KERNEL@0sleeping
	mov	es,ax
	push	word ptr es:@KERNEL@0sleeping+2
	push	word ptr es:@KERNEL@0sleeping
	call	far ptr @SleepingList@0push$qn3PCB
	add	sp,8
   ;	
   ;		unlock
   ;	
	?debug	L 85
	popf	
   ;	
   ;		dispatch();
   ;	
	?debug	L 86
	call	far ptr @dispatch$qv
   ;	
   ;		//unlock
   ;	}
   ;	
	?debug	L 88
	pop	ds
	pop	bp
	ret	
	?debug	C E60B74696D65546F536C6565700A0A060000
	?debug	E
	?debug	E
@PCB@0sleep$qui	endp
   ;	
   ;	void PCB::run_wrapper()
   ;	
	?debug	L 90
	assume	cs:PCB_TEXT
@PCB@0run_wrapper$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F81440504342403072756E5F7772617070657224+
	?debug	C 7176
	?debug	B
   ;	
   ;	{
   ;		KERNEL::running->run();
   ;	
	?debug	L 92
	mov	ax,seg @KERNEL@0running
	mov	es,ax
	push	word ptr es:@KERNEL@0running+2
	push	word ptr es:@KERNEL@0running
	call	far ptr @PCB@0run$qv
	pop	cx
	pop	cx
   ;	
   ;	}
   ;	
	?debug	L 93
	pop	ds
	pop	bp
	ret	
	?debug	E
	?debug	E
@PCB@0run_wrapper$qv	endp
   ;	
   ;	void PCB::run()
   ;	
	?debug	L 95
	assume	cs:PCB_TEXT
@PCB@0run$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F80C40504342403072756E247176
	?debug	C E604746869731802060000
	?debug	B
   ;	
   ;	{
   ;		setState(RUNNING);
   ;	
	?debug	L 97
	mov	ax,2
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @PCB@0setState$q5State
	add	sp,6
   ;	
   ;		myThread->run();
   ;	
	?debug	L 98
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+4]
	les	bx,dword ptr es:[bx]
	call	dword ptr es:[bx+4]
	pop	cx
	pop	cx
   ;	
   ;		lock
   ;	
	?debug	L 99
	pushf	
 	cli	
   ;	
   ;		setState(COMPLETED);
   ;	
	?debug	L 100
	mov	ax,4
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @PCB@0setState$q5State
	add	sp,6
   ;	
   ;		//waitingList->free();
   ;		unlock
   ;	
	?debug	L 102
	popf	
   ;	
   ;		dispatch();
   ;	
	?debug	L 103
	call	far ptr @dispatch$qv
   ;	
   ;		//g++;
   ;		//unlock
   ;	}
   ;	
	?debug	L 106
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000
	?debug	E
	?debug	E
@PCB@0run$qv	endp
   ;	
   ;	void PCB::createStack(unsigned int stackSize)
   ;	
	?debug	L 109
	assume	cs:PCB_TEXT
@PCB@0createStack$qui	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F815405043424030637265617465537461636B24+
	?debug	C 717569
	?debug	C E609737461636B53697A650A0A0A000004746869+
	?debug	C 731802060000
	mov	si,word ptr [bp+10]
	?debug	B
   ;	
   ;	{
   ;		lock
   ;	
	?debug	L 111
	pushf	
 	cli	
   ;	
   ;		if(stackSize < 4096)
   ;	
	?debug	L 112
	cmp	si,4096
	jae	short @10@142
   ;	
   ;			stackSize = 4096;
   ;	
	?debug	L 113
	mov	si,4096
@10@142:
   ;	
   ;		stack = new unsigned int(stackSize);
   ;	
	?debug	L 114
	mov	ax,2
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx],si
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+28],ax
	mov	word ptr es:[bx+26],dx
   ;	
   ;		stack[stackSize - 1] = FP_SEG(this);
   ;	
	?debug	L 115
	mov	ax,si
	dec	ax
	shl	ax,1
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+26]
	add	bx,ax
	mov	ax,word ptr [bp+8]
	mov	word ptr es:[bx],ax
   ;	
   ;		stack[stackSize - 2] = FP_OFF(this);
   ;	
	?debug	L 116
	mov	ax,si
	sub	ax,2
	shl	ax,1
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+26]
	add	bx,ax
	mov	ax,word ptr [bp+6]
	mov	word ptr es:[bx],ax
   ;	
   ;		stack[stackSize - 5] = 0x200;
   ;	
	?debug	L 117
	mov	ax,si
	sub	ax,5
	shl	ax,1
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+26]
	add	bx,ax
	mov	word ptr es:[bx],512
   ;	
   ;		stack[stackSize - 6] = FP_SEG(run_wrapper);
   ;	
	?debug	L 118
	mov	ax,si
	sub	ax,6
	shl	ax,1
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+26]
	add	bx,ax
	mov	word ptr es:[bx],seg @PCB@0run_wrapper$qv
   ;	
   ;		stack[stackSize - 7] = FP_OFF(run_wrapper);
   ;	
	?debug	L 119
	mov	ax,si
	sub	ax,7
	shl	ax,1
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+26]
	add	bx,ax
	mov	word ptr es:[bx],offset @PCB@0run_wrapper$qv
   ;	
   ;		stack[stackSize - 16] = 0;
   ;	
	?debug	L 120
	mov	ax,si
	sub	ax,16
	shl	ax,1
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+26]
	add	bx,ax
	mov	word ptr es:[bx],0
   ;	
   ;		stackSegment = FP_SEG(stack + stackSize - 16);
   ;	
	?debug	L 121
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+28]
	mov	dx,word ptr es:[bx+26]
	mov	bx,si
	shl	bx,1
	add	dx,bx
	add	dx,-32
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],ax
   ;	
   ;		stackOffset  = FP_OFF(stack + stackSize - 16);
   ;	
	?debug	L 122
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	mov	dx,si
	shl	dx,1
	add	ax,dx
	add	ax,-32
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+10],ax
   ;	
   ;		basePointer  = FP_OFF(stack + stackSize - 16);
   ;	
	?debug	L 123
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	mov	dx,si
	shl	dx,1
	add	ax,dx
	add	ax,-32
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+12],ax
   ;	
   ;		unlock
   ;	
	?debug	L 124
	popf	
   ;	
   ;	}
   ;	
	?debug	L 125
	pop	ds
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E31E000400160A00
	?debug	C E60474686973180206000009737461636B53697A+
	?debug	C 650A0C0600
	?debug	E
	?debug	E
@PCB@0createStack$qui	endp
   ;	
   ;	PCB::~PCB()
   ;	
	?debug	L 129
	assume	cs:PCB_TEXT
@PCB@0$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F80E4050434240302462647472247176
	?debug	C E60664656C657465040A0A000004746869731802+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
   ;	
   ;	{
   ;	
	?debug	L 130
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @11@142
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],seg @@PCB@0
	mov	word ptr es:[bx],offset @@PCB@0
   ;	
   ;		delete stack;
   ;	
	?debug	L 131
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+28]
	push	word ptr es:[bx+26]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
   ;	
   ;		delete waitingList;
   ;	
	?debug	L 132
	mov	ax,3
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+22]
	push	word ptr es:[bx+20]
	call	far ptr @@Waiting@0$bdtr$qv
	add	sp,6
	test	si,1
	je	short @11@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@11@142:
   ;	
   ;	}
   ;	
	?debug	L 133
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E6047468697318020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@PCB@0$bdtr$qv	endp
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@Waiting@0$bdtr$qv	segment	virtual
	?debug	C E8020E2E2E5C685C77616974696E672E6862B6FD+
	?debug	C 4C
	?debug	L 22
	assume	cs:@Waiting@0$bdtr$qv
@@Waiting@0$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,PCB_DATA
	mov	ds,ax
	?debug	C F8124057616974696E6740302462647472247176
	?debug	C E31F000400162000
	?debug	C E60664656C657465040A0A000004746869731F02+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
	?debug	L 23
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @12@114
	test	si,1
	je	short @12@114
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@12@114:
	?debug	L 25
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E604746869731F020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@@Waiting@0$bdtr$qv	endp
@Waiting@0$bdtr$qv	ends
PCB_TEXT	ends
PCB_TEXT	segment byte public 'CODE'
@PCB@0	segment	virtual
@@PCB@0	label	byte
	dd	@PCB@0$bdtr$qv
	?debug	C E9
	?debug	C FA00000000
@PCB@0	ends
PCB_TEXT	ends
PCB_DATA	segment word public 'FAR_DATA'
s@	label	byte
PCB_DATA	ends
PCB_TEXT	segment byte public 'CODE'
PCB_TEXT	ends
	?debug	C E3190350434226002E01
	?debug	C ED00010000060E00
	?debug	C E3210000002D1804011900184050434240302462+
	?debug	C 63747224716E36546872656164756C69
	?debug	C E3230000002D01040119000E4050434240302462+
	?debug	C 647472247176
	?debug	C E3250000002D0104011900164050434240307365+
	?debug	C 7453746174652471355374617465
	?debug	C E3270000002D1C04011900114050434240306765+
	?debug	C 745374617465247176
	?debug	C E3290000002D0404011900104050434240306765+
	?debug	C 7454696D65247176
	?debug	C E32B0000002D01040119000E4050434240307374+
	?debug	C 617274247176
	?debug	C E32D0000002D0104011900174050434240307761+
	?debug	C 6974546F436F6D706C657465247176
	?debug	C E32F0000002D01040119000F405043424030736C+
	?debug	C 65657024717569
	?debug	C E3310000002D01040119000C4050434240307275+
	?debug	C 6E247176
	?debug	C E3330000002D0104011900144050434240307275+
	?debug	C 6E5F77726170706572247176
	?debug	C E3350000002D0104011900154050434240306372+
	?debug	C 65617465537461636B24717569
	?debug	C E3200757616974696E6704002E03
	?debug	C ED00030000220E00
	?debug	C E3370000002D1F04012000124057616974696E67+
	?debug	C 40302462637472247176
	?debug	C E3390000002D0104012000154057616974696E67+
	?debug	C 40307075736824716E33504342
	?debug	C E33B0000002D0104012000114057616974696E67+
	?debug	C 403066726565247176
	?debug	C E33D0000002D0104032000124057616974696E67+
	?debug	C 40302462647472247176
	?debug	C E33F0E4057616974696E674030456C656D08002E+
	?debug	C 04
	?debug	C ED00040000290F00
	?debug	C E340000400163F00
	?debug	C E3410000002D4004093F00
	?debug	C E3430000002D4004093F00
	?debug	C E31B0654687265616408002E02
	?debug	C ED000200002E0E00
	?debug	C E3450000002D0104011B00114054687265616440+
	?debug	C 307374617274247176
	?debug	C E3470000002D0104011B001A4054687265616440+
	?debug	C 3077616974546F436F6D706C657465247176
	?debug	C E3490000002D0104011B00114054687265616440+
	?debug	C 302462647472247176
	?debug	C E34B0000002D0104011B00124054687265616440+
	?debug	C 30736C65657024717569
	?debug	C E34D0000002D1A04011B00144054687265616440+
	?debug	C 3024626374722471756C7569
	?debug	C E34F0000002D0104091B02
	extrn	@Idle@0getPCB$qv:far
	extrn	@SleepingList@0push$qn3PCB:far
	extrn	@KERNEL@0idle:dword
	extrn	@KERNEL@0sleeping:dword
	extrn	@KERNEL@0running:dword
	extrn	@Waiting@0push$qn3PCB:far
	extrn	@Waiting@0$bctr$qv:far
	extrn	@dispatch$qv:far
	extrn	@Scheduler@0put$qn3PCB:far
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
_g	equ	g
	public	@PCB@0createStack$qui
	public	@PCB@0NEXT_ID
	public	@PCB@0run_wrapper$qv
	public	@PCB@0run$qv
	public	@PCB@0sleep$qui
	public	@PCB@0waitToComplete$qv
	public	@PCB@0start$qv
	public	@PCB@0getTime$qv
	public	@PCB@0getState$qv
	public	@PCB@0setState$q5State
	public	@PCB@0$bdtr$qv
	public	@PCB@0$bctr$qn6Threaduli
	extrn	@$bdele$qnv:far
	extrn	@$bnew$qui:far
_s@	equ	s@
	?debug	C EA050D
	?debug	C E3510C536C656570696E674C69737408002E05
	?debug	C ED00050000370E00
	?debug	C E3520000002D01040151001A40536C656570696E+
	?debug	C 674C69737440306465637265617365247176
	?debug	C E3540000002D01040151001A40536C656570696E+
	?debug	C 674C69737440307075736824716E33504342
	?debug	C E356000400165100
	?debug	C E3570000002D56040151001740536C656570696E+
	?debug	C 674C69737440302462637472247176
	?debug	C E3590000002D01040151001740536C656570696E+
	?debug	C 674C69737440302462647472247176
	?debug	C E35B1340536C656570696E674C6973744030456C+
	?debug	C 656D08002E06
	?debug	C ED000600003F0F00
	?debug	C E35C000400165B00
	?debug	C E35D0000002D5C04095B00
	?debug	C E35F0000002D5C04095B00
	?debug	C E36100000023010400
	?debug	C EB0C4064697370617463682471766100
	?debug	C E3620449646C6508002E07
	?debug	C ED00070000440E010200
	?debug	C E363000400166200
	?debug	C E3640000002D63040162000F4049646C65403024+
	?debug	C 62637472247176
	?debug	C E3660000002D01040162020D4049646C65403072+
	?debug	C 756E247176
	?debug	C E3680000002D01040162000F4049646C65403073+
	?debug	C 74617274247176
	?debug	C E36A0000002D1804016200104049646C65403067+
	?debug	C 6574504342247176
	?debug	C E36C095363686564756C657201002E08
	?debug	C ED00080000490E00
	?debug	C E36D0000002D0104016C0016405363686564756C+
	?debug	C 6572403070757424716E33504342
	?debug	C E36F0000002D1804016C0012405363686564756C+
	?debug	C 65724030676574247176
	?debug	C E37100000023010400
	?debug	C E37200000023010400
	?debug	C E37300000023020400
	?debug	C E37400000023040400
	?debug	C E3750666696E645F742B001E4C
	?debug	C E3760015001A02
	?debug	C E377000D001A02
	?debug	C E378056666626C6B2B001E53
	?debug	C E3790015001A02
	?debug	C E37A000D001A02
	?debug	C E37B075245475041434B14001E5A
	?debug	C E37C05535245475308001E65
	?debug	C E37D045245475310001F6A
	?debug	C E37E08574F52445245475310001E6D
	?debug	C E37F08425954455245475308001E76
	?debug	C E3808009646F73646174655F7405001E7F
	?debug	C E38081046461746504001E8084
	?debug	C E3808209646F7374696D655F7404001E8088
	?debug	C E380830474696D6504001E808D
	?debug	C E380840664657668647212001E8092
	?debug	C E380850008001A02
	?debug	C E3808607666174696E666F06001E8098
	?debug	C E380870A6469736B667265655F7408001E809D
	?debug	C E3808805646672656508001E80A2
	?debug	C E3808908444F534552524F5205001E80A7
	?debug	C E3808A07434F554E54525922001E80AC
	?debug	C E3808B0005001A02
	?debug	C E3808C0002001A02
	?debug	C E3808D0002001A02
	?debug	C E3808E0002001A02
	?debug	C E3808F0002001A02
	?debug	C E380900002001A02
	?debug	C E38091000A001A02
	?debug	C E3809204786663622C001E80B9
	?debug	C E380930005001A02
	?debug	C E380940366636225001E80BE
	?debug	C E380950008001A02
	?debug	C E380960003001A02
	?debug	C E38097000A001A02
	?debug	C E38098064B45524E454C01002E09
	?debug	C ED0009000080C90E00
	?debug	C E38099000400160100
	?debug	C E3809A14404B45524E454C403053746174696342+
	?debug	C 6C6F636B01002E0A
	?debug	C ED000A000080CF0F00
	?debug	C E3809B00040016809A00
	?debug	C E3809C0000002D809B0401809A001D404B45524E+
	?debug	C 454C40537461746963426C6F636B403024626374+
	?debug	C 72247176
	?debug	C E3809E0571756575650C002E0B
	?debug	C ED000B000080D10E00
	?debug	C E3809F00040016809E00
	?debug	C E380A00000002D809F0401809E00104071756575+
	?debug	C 6540302462637472247176
	?debug	C E380A20000002D010401809E0013407175657565+
	?debug	C 40307075736824716E33504342
	?debug	C E380A40000002D180401809E000E407175657565+
	?debug	C 4030706F70247176
	?debug	C E380A60000002D040401809E0010407175657565+
	?debug	C 403073697A6524787176
	?debug	C E380A80000002D010401809E0010407175657565+
	?debug	C 40302462647472247176
	?debug	C E380AA0C4071756575654030456C656D08002E0C
	?debug	C ED000C000080DB0F00
	?debug	C E380AB0004001680AA00
	?debug	C E380AC0000002D80AB040980AA00
	?debug	C E380AE0000002D80AB040980AA00
	?debug	C E380B303696F732A002E10
	?debug	C ED0010000080E00E00
	?debug	C E380B408696F5F7374617465020022000080FF7F+
	?debug	C 811E
	?debug	C E380B6096F70656E5F6D6F6465020022000080FF+
	?debug	C 7F8123
	?debug	C E380B8087365656B5F646972020022000080FF7F+
	?debug	C 812B
	?debug	C E380BA0004001680B300
	?debug	C E380BB0000002D80BA040180B3001840696F7340+
	?debug	C 30246263747224716E3973747265616D627566
	?debug	C E380BD0000002D01040180B3000E40696F734030+
	?debug	C 2462647472247176
	?debug	C E380BF0000002D06040980B300
	?debug	C E380C10000002D06040180B3000E40696F734030+
	?debug	C 666C61677324716C
	?debug	C E380C30000002D06040180B3000E40696F734030+
	?debug	C 7365746624716C6C
	?debug	C E380C50000002D06040180B3000D40696F734030+
	?debug	C 7365746624716C
	?debug	C E380C70000002D06040180B3000F40696F734030+
	?debug	C 756E7365746624716C
	?debug	C E380C90000002D04040980B300
	?debug	C E380CB0000002D04040980B300
	?debug	C E380CD0000002D02040980B300
	?debug	C E380CF0000002D02040980B300
	?debug	C E380D10000002D04040980B300
	?debug	C E380D30000002D04040980B300
	?debug	C E380D6076F73747265616D30002E11
	?debug	C ED00110200812E0E011080
	?debug	C E380D70000002D80D5040180D6001C406F737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566
	?debug	C E380D90000002D01040180D60012406F73747265+
	?debug	C 616D40302462647472247176
	?debug	C E380DB0000002D80D5040180D60012406F737472+
	?debug	C 65616D40302462637472247169
	?debug	C E380DD0000002D80D5040180D60015406F737472+
	?debug	C 65616D403024626374722471696E7A63
	?debug	C E380DF0000002D04040980D600
	?debug	C E380E10000002D01040980D600
	?debug	C E380E30004003580D600
	?debug	C E380E40000002D80E3040180D60012406F737472+
	?debug	C 65616D4030666C757368247176
	?debug	C E380E60000002D80E3040180D60012406F737472+
	?debug	C 65616D40307365656B7024716C
	?debug	C E380E80000002D80E3040180D6001B406F737472+
	?debug	C 65616D40307365656B7024716C387365656B5F64+
	?debug	C 6972
	?debug	C E380EA0000002D06040180D60012406F73747265+
	?debug	C 616D403074656C6C70247176
	?debug	C E380EC0000002D80E3040980D600
	?debug	C E380EE0000002D80E3040180D60016406F737472+
	?debug	C 65616D4030777269746524716E787A6369
	?debug	C E380F00000002D80E3040980D600
	?debug	C E380F20000002D80E3040580D60013406F737472+
	?debug	C 65616D403024626C736824717A63
	?debug	C E380F40000002D80E3040D80D600
	?debug	C E380F60000002D80E3040D80D600
	?debug	C E380F80000002D80E3040D80D600
	?debug	C E380FA0000002D80E3040D80D600
	?debug	C E380FC0000002D80E3040D80D600
	?debug	C E380FE0000002D80E3040580D60012406F737472+
	?debug	C 65616D403024626C736824716C
	?debug	C E381000000002D80E3040580D60013406F737472+
	?debug	C 65616D403024626C73682471756C
	?debug	C E381020000002D80E3040D80D600
	?debug	C E381040000002D80E3040D80D600
	?debug	C E381060000002D80E3040580D60012406F737472+
	?debug	C 65616D403024626C7368247167
	?debug	C E381080000002D80E3040D80D600
	?debug	C E3810A0000002D80E3040D80D600
	?debug	C E3810C0000002D80E3040580D60013406F737472+
	?debug	C 65616D403024626C736824716E76
	?debug	C E3810E0000002D80E3040580D6001C406F737472+
	?debug	C 65616D403024626C736824716E3973747265616D+
	?debug	C 627566
	?debug	C E381100000002D80E3040D80D600
	?debug	C E381120000002D80E3040580D6001E406F737472+
	?debug	C 65616D403024626C736824716E716D33696F7324+
	?debug	C 6D33696F73
	?debug	C E381140000002D04040180D60014406F73747265+
	?debug	C 616D4030646F5F6F706678247176
	?debug	C E381160000002D01040180D60014406F73747265+
	?debug	C 616D4030646F5F6F736678247176
	?debug	C E381180000002D80D5040180D60012406F737472+
	?debug	C 65616D40302462637472247176
	?debug	C E3811A0000002D01040180D60018406F73747265+
	?debug	C 616D40306F757473747224716E787A637431
	?debug	C E380D50004001680D600
	?debug	C E3811C0000002D80D5040180B3001440696F7340+
	?debug	C 3074696524716E376F73747265616D
	?debug	C E3811E0000002D80D5040980B300
	?debug	C E381200000002D04040980B300
	?debug	C E381220000002D04040980B300
	?debug	C E381240000002D04040980B300
	?debug	C E381260000002D04040980B300
	?debug	C E381280000002D04040980B300
	?debug	C E3812A0000002D01040180B3000E40696F734030+
	?debug	C 636C656172247169
	?debug	C E3812C000400160100
	?debug	C E3812D0000002D812C040980B300
	?debug	C E3812F0000002D04040D80B300
	?debug	C E381320973747265616D62756628002E12
	?debug	C ED0012000081510E00
	?debug	C E381330000002D81310401813200144073747265+
	?debug	C 616D62756640302462637472247176
	?debug	C E381350000002D81310401813200174073747265+
	?debug	C 616D6275664030246263747224716E7A6369
	?debug	C E381370000002D01040181320014407374726561+
	?debug	C 6D62756640302462647472247176
	?debug	C E381390000002D81310401813202184073747265+
	?debug	C 616D627566403073657462756624716E7A6369
	?debug	C E3813B0000002D81310409813200
	?debug	C E3813D0000002D81310401813200194073747265+
	?debug	C 616D627566403073657462756624716E7A636969
	?debug	C E3813F0000002D040409813200
	?debug	C E381410000002D040409813200
	?debug	C E381430000002D040409813200
	?debug	C E381450000002D010409813200
	?debug	C E381470000002D04040181320017407374726561+
	?debug	C 6D6275664030736765746E24716E7A6369
	?debug	C E381490000002D0404018132041A407374726561+
	?debug	C 6D6275664030646F5F736765746E24716E7A6369
	?debug	C E3814B0000002D04040181320618407374726561+
	?debug	C 6D6275664030756E646572666C6F77247176
	?debug	C E3814D0000002D040409813200
	?debug	C E3814F0000002D04040181320818407374726561+
	?debug	C 6D6275664030706261636B6661696C247169
	?debug	C E381510000002D040409813200
	?debug	C E381530000002D040409813200
	?debug	C E381550000002D04040181320018407374726561+
	?debug	C 6D6275664030737075746E24716E787A6369
	?debug	C E381570000002D04040181320A1B407374726561+
	?debug	C 6D6275664030646F5F737075746E24716E787A63+
	?debug	C 69
	?debug	C E381590000002D04040181320C17407374726561+
	?debug	C 6D62756640306F766572666C6F77247169
	?debug	C E3815B0000002D040409813200
	?debug	C E3815D0000002D06040181320E20407374726561+
	?debug	C 6D62756640307365656B6F666624716C38736565+
	?debug	C 6B5F64697269
	?debug	C E3815F0000002D06040181321017407374726561+
	?debug	C 6D62756640307365656B706F7324716C69
	?debug	C E381610000002D04040181321213407374726561+
	?debug	C 6D627566403073796E63247176
	?debug	C E381630000002D01040181320012407374726561+
	?debug	C 6D6275664030646270247176
	?debug	C E38165000400160200
	?debug	C E381660000002D81650409813200
	?debug	C E381680000002D81650409813200
	?debug	C E3816A0000002D040409813200
	?debug	C E3816C0000002D81650409813200
	?debug	C E3816E0000002D81650409813200
	?debug	C E381700000002D81650409813200
	?debug	C E381720000002D81650409813200
	?debug	C E381740000002D81650409813200
	?debug	C E381760000002D81650409813200
	?debug	C E381780000002D01040181320017407374726561+
	?debug	C 6D62756640307365747024716E7A637431
	?debug	C E3817A0000002D01040181320019407374726561+
	?debug	C 6D62756640307365746724716E7A6374317431
	?debug	C E3817C0000002D010409813200
	?debug	C E3817E0000002D010409813200
	?debug	C E381800000002D01040181320018407374726561+
	?debug	C 6D62756640307365746224716E7A63743169
	?debug	C E381820000002D010409813200
	?debug	C E381840000002D040409813200
	?debug	C E381860000002D040409813200
	?debug	C E381880000002D04040181321419407374726561+
	?debug	C 6D6275664030646F616C6C6F63617465247176
	?debug	C E3818A0000002D04040181320018407374726561+
	?debug	C 6D6275664030646F5F736E65787463247176
	?debug	C E3818C0000002D813104018132001E4073747265+
	?debug	C 616D6275664030246263747224716D3973747265+
	?debug	C 616D627566
	?debug	C E3818E0000002D0104058132001E407374726561+
	?debug	C 6D6275664030246261736724716D397374726561+
	?debug	C 6D627566
	?debug	C E3813100040016813200
	?debug	C E381900000002D8131040980B300
	?debug	C E381920000002D06040180B3001140696F734030+
	?debug	C 626974616C6C6F63247176
	?debug	C E381940000002D04040180B3000F40696F734030+
	?debug	C 78616C6C6F63247176
	?debug	C E38196000400350600
	?debug	C E381970000002D8196040180B3000E40696F7340+
	?debug	C 3069776F7264247169
	?debug	C E3819900040035812C00
	?debug	C E3819A0000002D8199040180B3000E40696F7340+
	?debug	C 3070776F7264247169
	?debug	C E3819C0000002D01040180B3001840696F734030+
	?debug	C 73796E635F776974685F737464696F247176
	?debug	C E3819E0000002D04040180B3000D40696F734030+
	?debug	C 736B6970247169
	?debug	C E381A00000002D80BA040180B3000E40696F7340+
	?debug	C 302462637472247176
	?debug	C E381A20000002D01040180B3001740696F734030+
	?debug	C 696E697424716E3973747265616D627566
	?debug	C E381A40000002D01040180B3001140696F734030+
	?debug	C 7365747374617465247169
	?debug	C E381A700000023010400
	?debug	C E381A60004001681A700
	?debug	C E381A8000400160100
	?debug	C E381A90000002D01040180B3001140696F734030+
	?debug	C 7573657273697A65247169
	?debug	C E381AB0000002D80BA040180B3001240696F7340+
	?debug	C 30246263747224716D33696F73
	?debug	C E381AD0000002D01040580B3001240696F734030+
	?debug	C 246261736724716D33696F73
	?debug	C E380B2076973747265616D32002E0F
	?debug	C ED000F0200818B0E011080
	?debug	C E381AF0004001680B200
	?debug	C E381B00000002D81AF040180B2001C4069737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566
	?debug	C E381B20000002D01040180B20012406973747265+
	?debug	C 616D40302462647472247176
	?debug	C E381B40000002D81AF040180B200264069737472+
	?debug	C 65616D4030246263747224716E3973747265616D+
	?debug	C 627566696E376F73747265616D
	?debug	C E381B60000002D81AF040180B200164069737472+
	?debug	C 65616D403024626374722471696E7A6369
	?debug	C E381B80000002D81AF040180B2001C4069737472+
	?debug	C 65616D40302462637472247169696E376F737472+
	?debug	C 65616D
	?debug	C E381BA0000002D04040180B20011406973747265+
	?debug	C 616D403069706678247169
	?debug	C E381BC0000002D04040980B200
	?debug	C E381BE0000002D04040980B200
	?debug	C E381C00000002D01040980B200
	?debug	C E381C20004003580B200
	?debug	C E381C30000002D81C2040180B200124069737472+
	?debug	C 65616D40307365656B6724716C
	?debug	C E381C50000002D81C2040180B2001B4069737472+
	?debug	C 65616D40307365656B6724716C387365656B5F64+
	?debug	C 6972
	?debug	C E381C70000002D06040180B20012406973747265+
	?debug	C 616D403074656C6C67247176
	?debug	C E381C90000002D04040980B200
	?debug	C E381CB0000002D81C2040180B200154069737472+
	?debug	C 65616D403067657424716E7A63697A63
	?debug	C E381CD0000002D81C2040980B200
	?debug	C E381CF0000002D81C2040180B200144069737472+
	?debug	C 65616D40307265616424716E7A6369
	?debug	C E381D10000002D81C2040980B200
	?debug	C E381D30000002D81C2040180B200194069737472+
	?debug	C 65616D40306765746C696E6524716E7A63697A63
	?debug	C E381D50000002D81C2040980B200
	?debug	C E381D70000002D81C2040180B2001C4069737472+
	?debug	C 65616D403067657424716D3973747265616D6275+
	?debug	C 667A63
	?debug	C E381D90000002D81C2040180B200124069737472+
	?debug	C 65616D403067657424716D7563
	?debug	C E381DB0000002D81C2040180B200124069737472+
	?debug	C 65616D403067657424716D7A63
	?debug	C E381DD0000002D04040180B20010406973747265+
	?debug	C 616D4030676574247176
	?debug	C E381DF0000002D04040980B200
	?debug	C E381E10000002D04040980B200
	?debug	C E381E30000002D81C2040180B200154069737472+
	?debug	C 65616D40307075746261636B24717A63
	?debug	C E381E50000002D81C2040180B200144069737472+
	?debug	C 65616D403069676E6F726524716969
	?debug	C E381E70000002D81C2040D80B200
	?debug	C E381E90000002D81C2040580B2001E4069737472+
	?debug	C 65616D4030246272736824716E716D33696F7324+
	?debug	C 6D33696F73
	?debug	C E381EB0000002D81C2040580B200144069737472+
	?debug	C 65616D4030246272736824716E7A63
	?debug	C E381ED0000002D81C2040D80B200
	?debug	C E381EF0000002D81C2040580B200144069737472+
	?debug	C 65616D4030246272736824716D7563
	?debug	C E381F10000002D81C2040580B200144069737472+
	?debug	C 65616D4030246272736824716D7A63
	?debug	C E381F30000002D81C2040580B200134069737472+
	?debug	C 65616D4030246272736824716D73
	?debug	C E381F50000002D81C2040580B200134069737472+
	?debug	C 65616D4030246272736824716D69
	?debug	C E381F70000002D81C2040580B200134069737472+
	?debug	C 65616D4030246272736824716D6C
	?debug	C E381F90000002D81C2040580B200144069737472+
	?debug	C 65616D4030246272736824716D7573
	?debug	C E381FB0000002D81C2040580B200144069737472+
	?debug	C 65616D4030246272736824716D7569
	?debug	C E381FD0000002D81C2040580B200144069737472+
	?debug	C 65616D4030246272736824716D756C
	?debug	C E381FF0000002D81C2040580B200134069737472+
	?debug	C 65616D4030246272736824716D66
	?debug	C E382010000002D81C2040580B200134069737472+
	?debug	C 65616D4030246272736824716D64
	?debug	C E382030000002D81C2040580B200134069737472+
	?debug	C 65616D4030246272736824716D67
	?debug	C E382050000002D81C2040580B2001C4069737472+
	?debug	C 65616D4030246272736824716E3973747265616D+
	?debug	C 627566
	?debug	C E382070000002D81AF040180B200124069737472+
	?debug	C 65616D40302462637472247176
	?debug	C E382090000002D01040180B20015406973747265+
	?debug	C 616D40306561747768697465247176
	?debug	C E3820B0000002D02040180B20013406973747265+
	?debug	C 616D4030646F5F676574247176
	?debug	C E380B108696F73747265616D38002E0E
	?debug	C ED000E020081BC0E020F001100
	?debug	C E3820D0004001680B100
	?debug	C E3820E0000002D820D040180B1001D40696F7374+
	?debug	C 7265616D4030246263747224716E397374726561+
	?debug	C 6D627566
	?debug	C E382100000002D01040180B1001340696F737472+
	?debug	C 65616D40302462647472247176
	?debug	C E382120000002D820D040180B1001340696F7374+
	?debug	C 7265616D40302462637472247176
	?debug	C E380B013696F73747265616D5F77697468617373+
	?debug	C 69676E38002E0D
	?debug	C ED000D020081C00E010E00
	?debug	C E382140004001680B000
	?debug	C E382150000002D8214040180B0001E40696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246263+
	?debug	C 7472247176
	?debug	C E382170000002D01040180B0001E40696F737472+
	?debug	C 65616D5F7769746861737369676E403024626474+
	?debug	C 72247176
	?debug	C E382190004003580B000
	?debug	C E3821A0000002D8219040580B0002240696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246261+
	?debug	C 736724716D33696F73
	?debug	C E3821C0000002D8219040580B0002840696F7374+
	?debug	C 7265616D5F7769746861737369676E4030246261+
	?debug	C 736724716E3973747265616D627566
	?debug	C E3821E126F73747265616D5F7769746861737369+
	?debug	C 676E30002E13
	?debug	C ED0013020081C50E011100
	?debug	C E3821F00040016821E00
	?debug	C E382200000002D821F0401821E001D406F737472+
	?debug	C 65616D5F7769746861737369676E403024626374+
	?debug	C 72247176
	?debug	C E382220000002D010401821E001D406F73747265+
	?debug	C 616D5F7769746861737369676E40302462647472+
	?debug	C 247176
	?debug	C E3822400040035821E00
	?debug	C E382250000002D82240405821E0025406F737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716D376F73747265616D
	?debug	C E382270000002D82240405821E0027406F737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716E3973747265616D627566
	?debug	C E38229126973747265616D5F7769746861737369+
	?debug	C 676E32002E14
	?debug	C ED0014020081CA0E010F00
	?debug	C E3822A00040016822900
	?debug	C E3822B0000002D822A04018229001D4069737472+
	?debug	C 65616D5F7769746861737369676E403024626374+
	?debug	C 72247176
	?debug	C E3822D0000002D0104018229001D406973747265+
	?debug	C 616D5F7769746861737369676E40302462647472+
	?debug	C 247176
	?debug	C E3822F00040035822900
	?debug	C E382300000002D822F0405822900254069737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716D376973747265616D
	?debug	C E382320000002D822F0405822900274069737472+
	?debug	C 65616D5F7769746861737369676E403024626173+
	?debug	C 6724716E3973747265616D627566
	?debug	C E3823400000023010400
	?debug	C EB0B40246264656C6524716E76823400
	?debug	C E3823500000023812C0400
	?debug	C EB0A4024626E657724717569823500
	?debug	C E6016704000002000000
	?debug	C EC1440504342403072756E5F7772617070657224+
	?debug	C 7176331800
	?debug	C E60666706F735F74060600024944040600045469+
	?debug	C 6D650A060009537461636B53697A650C06001452+
	?debug	C 696F73747265616D5F7769746861737369676E82+
	?debug	C 1906001450696F73747265616D5F776974686173+
	?debug	C 7369676E8214060013526F73747265616D5F7769+
	?debug	C 746861737369676E8224060013506F7374726561+
	?debug	C 6D5F7769746861737369676E821F060013526973+
	?debug	C 747265616D5F7769746861737369676E822F0600+
	?debug	C 13506973747265616D5F7769746861737369676E+
	?debug	C 822A06000950696F73747265616D820D06000852+
	?debug	C 6F73747265616D80E3060008506F73747265616D+
	?debug	C 80D5060008526973747265616D81C20600085069+
	?debug	C 73747265616D81AF06000A5073747265616D6275+
	?debug	C 66813106000450696F7380BA0600097374726561+
	?debug	C 6D6F66660606000973747265616D706F73060600+
	?debug	C 0673697A655F740A060009707472646966665F74+
	?debug	C 0606000A6D61696E5468726561640107000C536C+
	?debug	C 656570696E674C6973745107000554696D657201+
	?debug	C 07000449646C65620700095363686564756C6572+
	?debug	C 6C07000666696E645F74750700056666626C6B78+
	?debug	C 0700075245475041434B7B07000553524547537C+
	?debug	C 070004524547537D07000842595445524547537F+
	?debug	C 070008574F5244524547537E070009646F736461+
	?debug	C 74655F748080070004646174658081070009646F+
	?debug	C 7374696D655F74808207000474696D6580830700+
	?debug	C 066465766864728084070007666174696E666F80+
	?debug	C 8607000A6469736B667265655F74808707000564+
	?debug	C 667265658088070008444F534552524F52808907+
	?debug	C 0007434F554E545259808A070004786663628092+
	?debug	C 0700036663628094070003504342190700064B45+
	?debug	C 524E454C809807000757616974696E6720070005+
	?debug	C 7175657565809E0700065468726561641B07000E+
	?debug	C 696F735F757365725F756E696F6E01070013696F+
	?debug	C 73747265616D5F7769746861737369676E80B007+
	?debug	C 00126F73747265616D5F7769746861737369676E+
	?debug	C 821E0700126973747265616D5F77697468617373+
	?debug	C 69676E8229070008696F73747265616D80B10700+
	?debug	C 076F73747265616D80D60700076973747265616D+
	?debug	C 80B207000973747265616D627566813207000369+
	?debug	C 6F7380B30700
	?debug	F pokeb 113 24 0
	?debug	F poke 114 24 0
	?debug	F peekb 115 24 0
	?debug	F peek 116 24 0
	?debug	C E400094050434240304E45570000000C40504342+
	?debug	C 40304143544956450100000D4050434240305255+
	?debug	C 4E4E494E470200000D405043424030424C4F434B+
	?debug	C 45440300800F405043424030434F4D504C455445+
	?debug	C 440400
	?debug	C E24A18405043424030246263747224716E365468+
	?debug	C 72656164756C69214D0E40504342403024626474+
	?debug	C 7224717623400400000000086D79546872656164+
	?debug	C 1A700553746174651C4816405043424030736574+
	?debug	C 5374617465247135537461746525481140504342+
	?debug	C 4030676574537461746524717627481040504342+
	?debug	C 403067657454696D6524717629480E4050434240+
	?debug	C 3073746172742471762B48174050434240307761+
	?debug	C 6974546F436F6D706C6574652471762D000C7374+
	?debug	C 61636B5365676D656E740A000B737461636B4F66+
	?debug	C 667365740A000B62617365506F696E7465720A00+
	?debug	C 0C7772617065724F66667365740A000D77726170+
	?debug	C 65725365676D656E740A000B74696D65546F536C+
	?debug	C 6565700A000B77616974696E674C6973741F480F+
	?debug	C 405043424030736C656570247175692F480C4050+
	?debug	C 4342403072756E24717631481440504342403072+
	?debug	C 756E5F7772617070657224717633000249440460+
	?debug	C 0D4050434240304E4558545F4944040005737461+
	?debug	C 636B1E00066D7954696D65040009737461636B53+
	?debug	C 697A650C000573746174651C4815405043424030+
	?debug	C 637265617465537461636B2471756935C0260000+
	?debug	C 00
	?debug	C E24A124057616974696E67403024626374722471+
	?debug	C 763748154057616974696E674030707573682471+
	?debug	C 6E335043423948114057616974696E6740306672+
	?debug	C 65652471763B49124057616974696E6740302462+
	?debug	C 6474722471763D7004456C656D3F000468656164+
	?debug	C 40C004000000
	?debug	C E200037063621800046E657874404A1B40576169+
	?debug	C 74696E6740456C656D4030246263747224716E33+
	?debug	C 504342414A174057616974696E6740456C656D40+
	?debug	C 30246263747224717643C008000000
	?debug	C E248114054687265616440307374617274247176+
	?debug	C 45481A40546872656164403077616974546F436F+
	?debug	C 6D706C657465247176474D114054687265616440+
	?debug	C 3024626474722471764948124054687265616440+
	?debug	C 30736C656570247175694B4A1440546872656164+
	?debug	C 403024626374722471756C75694D4C0F40546872+
	?debug	C 656164403072756E2471764F400400000000056D+
	?debug	C 7950434218C008000000
	?debug	C E2481A40536C656570696E674C69737440306465+
	?debug	C 63726561736524717652481A40536C656570696E+
	?debug	C 674C69737440307075736824716E33504342544A+
	?debug	C 1740536C656570696E674C697374403024626374+
	?debug	C 72247176574D1740536C656570696E674C697374+
	?debug	C 40302462647472247176597004456C656D5B4004+
	?debug	C 0000000004686561645CC008000000
	?debug	C E200037063621800046E6578745C4A2040536C65+
	?debug	C 6570696E674C69737440456C656D403024626374+
	?debug	C 7224716E335043425D4A1C40536C656570696E67+
	?debug	C 4C69737440456C656D403024626374722471765F+
	?debug	C C008000000
	?debug	C E24A0F4049646C6540302462637472247176644C+
	?debug	C 0D4049646C65403072756E24717666480F404964+
	?debug	C 6C65403073746172742471766848104049646C65+
	?debug	C 40306765745043422471766AC008000000
	?debug	C E24816405363686564756C657240307075742471+
	?debug	C 6E335043426D4812405363686564756C65724030+
	?debug	C 6765742471766FC001000000
	?debug	C E200087265736572766564760006617474726962+
	?debug	C 02000777725F74696D650A000777725F64617465+
	?debug	C 0A000473697A650600046E616D6577C02B000000
	?debug	C E2000B66665F726573657276656479000966665F+
	?debug	C 61747472696202000866665F6674696D650A0008+
	?debug	C 66665F66646174650A000866665F6673697A6506+
	?debug	C 000766665F6E616D657AC02B000000
	?debug	C E20004725F61780A0004725F62780A0004725F63+
	?debug	C 780A0004725F64780A0004725F62700A0004725F+
	?debug	C 73690A0004725F64690A0004725F64730A000472+
	?debug	C 5F65730A0007725F666C6167730AC014000000
	?debug	C E2000265730A000263730A000273730A00026473+
	?debug	C 0AC008000000
	?debug	C E20001787E0001687FC010000000
	?debug	C E2000261780A000262780A000263780A00026478+
	?debug	C 0A000273690A000264690A000563666C61670A00+
	?debug	C 05666C6167730AC010000000
	?debug	C E20002616C0800026168080002626C0800026268+
	?debug	C 080002636C0800026368080002646C0800026468+
	?debug	C 08C008000000
	?debug	C E200036461790800056D6F6E7468080004796561+
	?debug	C 720A00096461796F667765656B08C005000000
	?debug	C E2000764615F7965617204000664615F64617902+
	?debug	C 000664615F6D6F6E02C004000000
	?debug	C E20004686F75720800066D696E75746508000673+
	?debug	C 65636F6E64080007687365636F6E6408C0040000+
	?debug	C 00
	?debug	C E2000674695F6D696E08000774695F686F757208+
	?debug	C 000774695F68756E6408000674695F73656308C0+
	?debug	C 04000000
	?debug	C E2000764685F6E65787406000764685F61747472+
	?debug	C 04000864685F73747261740A000864685F696E74+
	?debug	C 65720A000764685F6E616D658085C012000000
	?debug	C E2000866695F73636C757302000866695F666174+
	?debug	C 696402000866695F6E636C75730A000866695F62+
	?debug	C 7973656304C006000000
	?debug	C E2000E746F74616C5F636C7573746572730A000E+
	?debug	C 617661696C5F636C7573746572730A0013736563+
	?debug	C 746F72735F7065725F636C75737465720A001062+
	?debug	C 797465735F7065725F736563746F720AC0080000+
	?debug	C 00
	?debug	C E2000864665F617661696C0A000864665F746F74+
	?debug	C 616C0A000764665F627365630A000864665F7363+
	?debug	C 6C75730AC008000000
	?debug	C E2000B64655F6578746572726F7204000864655F+
	?debug	C 636C61737302000964655F616374696F6E020008+
	?debug	C 64655F6C6F63757302C005000000
	?debug	C E20007636F5F64617465040007636F5F63757272+
	?debug	C 808B0008636F5F7468736570808C0008636F5F64+
	?debug	C 65736570808D0008636F5F6474736570808E0008+
	?debug	C 636F5F746D736570808F000C636F5F6375727273+
	?debug	C 74796C65020009636F5F64696769747302000763+
	?debug	C 6F5F74696D65020007636F5F6361736506000863+
	?debug	C 6F5F646173657080900007636F5F66696C6C8091+
	?debug	C C022000000
	?debug	C E20009786663625F666C6167020009786663625F+
	?debug	C 7265737680930009786663625F61747472020008+
	?debug	C 786663625F6663628094C02C000000
	?debug	C E200096663625F64726976650200086663625F6E+
	?debug	C 616D65809500076663625F6578748096000A6663+
	?debug	C 625F637572626C6B04000B6663625F7265637369+
	?debug	C 7A6504000B6663625F66696C73697A6506000866+
	?debug	C 63625F646174650400086663625F726573768097+
	?debug	C 000A6663625F63757272656302000A6663625F72+
	?debug	C 616E646F6D06C025000000
	?debug	C E26010404B45524E454C403072756E6E696E6718+
	?debug	C 6011404B45524E454C4030736C656570696E6756+
	?debug	C 600D404B45524E454C403069646C6563600E404B+
	?debug	C 45524E454C403074696D65728099700B53746174+
	?debug	C 6963426C6F636B809AC001000000
	?debug	C E24A1D404B45524E454C40537461746963426C6F+
	?debug	C 636B40302462637472247176809CC001000000
	?debug	C E24A104071756575654030246263747224717680+
	?debug	C A0481340717565756540307075736824716E3350+
	?debug	C 434280A2480E4071756575654030706F70247176+
	?debug	C 80A44810407175657565403073697A6524787176+
	?debug	C 80A64D1040717565756540302462647472247176+
	?debug	C 80A87004456C656D80AA40040000000004686561+
	?debug	C 6480AB00046C61737480ABC00C000000
	?debug	C E200037063621800046E65787480AB4A19407175+
	?debug	C 65756540456C656D4030246263747224716E3350+
	?debug	C 434280AC4A1540717565756540456C656D403024+
	?debug	C 6263747224717680AEC008000000
	?debug	C E27008696F5F737461746580B470096F70656E5F+
	?debug	C 6D6F646580B670087365656B5F64697280B8600F+
	?debug	C 40696F734030626173656669656C640660114069+
	?debug	C 6F73403061646A7573746669656C640660104069+
	?debug	C 6F734030666C6F61746669656C64064A1840696F+
	?debug	C 734030246263747224716E3973747265616D6275+
	?debug	C 6680BB4D0E40696F734030246264747224717680+
	?debug	C BD480E40696F734030666C61677324717680BF48+
	?debug	C 0E40696F734030666C61677324716C80C1480E40+
	?debug	C 696F7340307365746624716C6C80C3480D40696F+
	?debug	C 7340307365746624716C80C5480F40696F734030+
	?debug	C 756E7365746624716C80C7480E40696F73403077+
	?debug	C 6964746824717680C9480E40696F734030776964+
	?debug	C 746824716980CB480D40696F73403066696C6C24+
	?debug	C 717680CD480E40696F73403066696C6C24717A63+
	?debug	C 80CF481240696F734030707265636973696F6E24+
	?debug	C 716980D1481240696F734030707265636973696F+
	?debug	C 6E24717680D3481440696F73403074696524716E+
	?debug	C 376F73747265616D811C480C40696F7340307469+
	?debug	C 65247176811E481040696F734030726473746174+
	?debug	C 652471768120480C40696F734030656F66247176+
	?debug	C 8122480D40696F7340306661696C247176812448+
	?debug	C 0C40696F7340306261642471768126480D40696F+
	?debug	C 734030676F6F642471768128480E40696F734030+
	?debug	C 636C656172247169812A4B0D40696F734030246F+
	?debug	C 6E76247176812D480E40696F73403024626E6F74+
	?debug	C 247176812F480E40696F73403072646275662471+
	?debug	C 768190481140696F734030626974616C6C6F6324+
	?debug	C 71768192480F40696F73403078616C6C6F632471+
	?debug	C 768194480E40696F73403069776F726424716981+
	?debug	C 97480E40696F73403070776F7264247169819A48+
	?debug	C 1840696F73403073796E635F776974685F737464+
	?debug	C 696F247176819C480D40696F734030736B697024+
	?debug	C 7169819E40040000000002627081310005785F74+
	?debug	C 696580D500057374617465040008697370656369+
	?debug	C 616C0400086F7370656369616C040007785F666C+
	?debug	C 61677306000B785F707265636973696F6E040007+
	?debug	C 785F7769647468040006785F66696C6C04000C69+
	?debug	C 7366785F7370656369616C04000C6F7366785F73+
	?debug	C 70656369616C04000664656C62756604000E6173+
	?debug	C 7369676E5F70726976617465044A0E40696F7340+
	?debug	C 30246263747224717681A0481740696F73403069+
	?debug	C 6E697424716E3973747265616D62756681A24811+
	?debug	C 40696F734030736574737461746524716981A460+
	?debug	C 1040696F734030737464696F666C75736881A660+
	?debug	C 0D40696F7340306E65787462697406600F40696F+
	?debug	C 73403075736572636F756E740400097573657277+
	?debug	C 6F72647381A800066E776F72647304481140696F+
	?debug	C 7340307573657273697A6524716981A94A124069+
	?debug	C 6F734030246263747224716D33696F7381AB4812+
	?debug	C 40696F734030246261736724716D33696F7381AD+
	?debug	C C02A000000
	?debug	C E4000D40696F734030676F6F646269740000000C+
	?debug	C 40696F734030656F666269740100000D40696F73+
	?debug	C 40306661696C6269740200000C40696F73403062+
	?debug	C 61646269740400800E40696F7340306861726466+
	?debug	C 61696C8000
	?debug	C E4000840696F734030696E0100000940696F7340+
	?debug	C 306F75740200000940696F734030617465040000+
	?debug	C 0940696F7340306170700800000B40696F734030+
	?debug	C 7472756E631000000E40696F7340306E6F637265+
	?debug	C 6174652000000F40696F7340306E6F7265706C61+
	?debug	C 63654000800C40696F73403062696E6172798000
	?debug	C E4000940696F7340306265670000000940696F73+
	?debug	C 40306375720100800940696F734030656E640200
	?debug	C E24A1C406F73747265616D403024626374722471+
	?debug	C 6E3973747265616D62756680D74D12406F737472+
	?debug	C 65616D4030246264747224717680D94A12406F73+
	?debug	C 747265616D4030246263747224716980DB4A1540+
	?debug	C 6F73747265616D403024626374722471696E7A63+
	?debug	C 80DD4811406F73747265616D40306F7066782471+
	?debug	C 7680DF4811406F73747265616D40306F73667824+
	?debug	C 717680E14812406F73747265616D4030666C7573+
	?debug	C 6824717680E44812406F73747265616D40307365+
	?debug	C 656B7024716C80E6481B406F73747265616D4030+
	?debug	C 7365656B7024716C387365656B5F64697280E848+
	?debug	C 12406F73747265616D403074656C6C7024717680+
	?debug	C EA4811406F73747265616D403070757424717A63+
	?debug	C 80EC4816406F73747265616D4030777269746524+
	?debug	C 716E787A636980EE4816406F73747265616D4030+
	?debug	C 777269746524716E7875636980F04813406F7374+
	?debug	C 7265616D403024626C736824717A6380F2481340+
	?debug	C 6F73747265616D403024626C73682471756380F4+
	?debug	C 4812406F73747265616D403024626C7368247173+
	?debug	C 80F64813406F73747265616D403024626C736824+
	?debug	C 71757380F84812406F73747265616D403024626C+
	?debug	C 736824716980FA4813406F73747265616D403024+
	?debug	C 626C73682471756980FC4812406F73747265616D+
	?debug	C 403024626C736824716C80FE4813406F73747265+
	?debug	C 616D403024626C73682471756C81004812406F73+
	?debug	C 747265616D403024626C73682471668102481240+
	?debug	C 6F73747265616D403024626C7368247164810448+
	?debug	C 12406F73747265616D403024626C736824716781+
	?debug	C 064815406F73747265616D403024626C73682471+
	?debug	C 6E787A6381084815406F73747265616D40302462+
	?debug	C 6C736824716E787563810A4813406F7374726561+
	?debug	C 6D403024626C736824716E76810C481C406F7374+
	?debug	C 7265616D403024626C736824716E397374726561+
	?debug	C 6D627566810E4826406F73747265616D40302462+
	?debug	C 6C736824716E716D376F73747265616D246D376F+
	?debug	C 73747265616D8110481E406F73747265616D4030+
	?debug	C 24626C736824716E716D33696F73246D33696F73+
	?debug	C 81124814406F73747265616D4030646F5F6F7066+
	?debug	C 7824717681144814406F73747265616D4030646F+
	?debug	C 5F6F73667824717681164A12406F73747265616D+
	?debug	C 4030246263747224717681184818406F73747265+
	?debug	C 616D40306F757473747224716E787A637431811A+
	?debug	C C030000000
	?debug	C E24A144073747265616D62756640302462637472+
	?debug	C 24717681334A174073747265616D627566403024+
	?debug	C 6263747224716E7A636981354D14407374726561+
	?debug	C 6D6275664030246264747224717681374C184073+
	?debug	C 747265616D627566403073657462756624716E7A+
	?debug	C 6369813948184073747265616D62756640307365+
	?debug	C 7462756624716E756369813B4819407374726561+
	?debug	C 6D627566403073657462756624716E7A63696981+
	?debug	C 3D48144073747265616D62756640307367657463+
	?debug	C 247176813F48154073747265616D627566403073+
	?debug	C 6E65787463247176814148154073747265616D62+
	?debug	C 756640307362756D706324717681434815407374+
	?debug	C 7265616D627566403073746F7373632471768145+
	?debug	C 48174073747265616D6275664030736765746E24+
	?debug	C 716E7A636981474C1A4073747265616D62756640+
	?debug	C 30646F5F736765746E24716E7A636981494C1840+
	?debug	C 73747265616D6275664030756E646572666C6F77+
	?debug	C 247176814B48194073747265616D627566403073+
	?debug	C 7075746261636B6324717A63814D4C1840737472+
	?debug	C 65616D6275664030706261636B6661696C247169+
	?debug	C 814F48174073747265616D6275664030696E5F61+
	?debug	C 7661696C247176815148144073747265616D6275+
	?debug	C 6640307370757463247169815348184073747265+
	?debug	C 616D6275664030737075746E24716E787A636981+
	?debug	C 554C1B4073747265616D6275664030646F5F7370+
	?debug	C 75746E24716E787A636981574C17407374726561+
	?debug	C 6D62756640306F766572666C6F77247169815948+
	?debug	C 1A4073747265616D62756640306F75745F776169+
	?debug	C 74696E67247176815B4C204073747265616D6275+
	?debug	C 6640307365656B6F666624716C387365656B5F64+
	?debug	C 697269815D4C174073747265616D627566403073+
	?debug	C 65656B706F7324716C69815F4C13407374726561+
	?debug	C 6D627566403073796E6324717681614812407374+
	?debug	C 7265616D62756640306462702471768163481340+
	?debug	C 73747265616D6275664030626173652471768166+
	?debug	C 48134073747265616D6275664030656275662471+
	?debug	C 76816848134073747265616D6275664030626C65+
	?debug	C 6E247176816A48144073747265616D6275664030+
	?debug	C 7062617365247176816C48134073747265616D62+
	?debug	C 7566403070707472247176816E48144073747265+
	?debug	C 616D627566403065707074722471768170481440+
	?debug	C 73747265616D6275664030656261636B24717681+
	?debug	C 7248134073747265616D62756640306770747224+
	?debug	C 7176817448144073747265616D62756640306567+
	?debug	C 707472247176817648174073747265616D627566+
	?debug	C 40307365747024716E7A63743181784819407374+
	?debug	C 7265616D62756640307365746724716E7A637431+
	?debug	C 7431817A48144073747265616D62756640307062+
	?debug	C 756D70247169817C48144073747265616D627566+
	?debug	C 40306762756D70247169817E4818407374726561+
	?debug	C 6D62756640307365746224716E7A637431698180+
	?debug	C 48194073747265616D6275664030756E62756666+
	?debug	C 65726564247169818248194073747265616D6275+
	?debug	C 664030756E627566666572656424717681844817+
	?debug	C 4073747265616D6275664030616C6C6F63617465+
	?debug	C 24717681864C194073747265616D627566403064+
	?debug	C 6F616C6C6F636174652471768188400400000000+
	?debug	C 06616C6C6F635F040006756E6275665F04000562+
	?debug	C 6173655F81650005656275665F81650006706261+
	?debug	C 73655F81650005707074725F8165000665707074+
	?debug	C 725F81650006656261636B5F8165000567707472+
	?debug	C 5F8165000665677074725F816548184073747265+
	?debug	C 616D6275664030646F5F736E6578746324717681+
	?debug	C 8A4A1E4073747265616D62756640302462637472+
	?debug	C 24716D3973747265616D627566818C481E407374+
	?debug	C 7265616D6275664030246261736724716D397374+
	?debug	C 7265616D627566818EC028000000
	?debug	C E24A1C406973747265616D403024626374722471+
	?debug	C 6E3973747265616D62756681B04D124069737472+
	?debug	C 65616D4030246264747224717681B24A26406973+
	?debug	C 747265616D4030246263747224716E3973747265+
	?debug	C 616D627566696E376F73747265616D81B44A1640+
	?debug	C 6973747265616D403024626374722471696E7A63+
	?debug	C 6981B64A1C406973747265616D40302462637472+
	?debug	C 247169696E376F73747265616D81B84811406973+
	?debug	C 747265616D40306970667824716981BA48124069+
	?debug	C 73747265616D4030697066783024717681BC4812+
	?debug	C 406973747265616D4030697066783124717681BE+
	?debug	C 4811406973747265616D40306973667824717681+
	?debug	C C04812406973747265616D40307365656B672471+
	?debug	C 6C81C3481B406973747265616D40307365656B67+
	?debug	C 24716C387365656B5F64697281C5481240697374+
	?debug	C 7265616D403074656C6C6724717681C748114069+
	?debug	C 73747265616D403073796E6324717681C9481540+
	?debug	C 6973747265616D403067657424716E7A63697A63+
	?debug	C 81CB4815406973747265616D403067657424716E+
	?debug	C 7563697A6381CD4814406973747265616D403072+
	?debug	C 65616424716E7A636981CF481440697374726561+
	?debug	C 6D40307265616424716E75636981D14819406973+
	?debug	C 747265616D40306765746C696E6524716E7A6369+
	?debug	C 7A6381D34819406973747265616D40306765746C+
	?debug	C 696E6524716E7563697A6381D5481C4069737472+
	?debug	C 65616D403067657424716D3973747265616D6275+
	?debug	C 667A6381D74812406973747265616D4030676574+
	?debug	C 24716D756381D94812406973747265616D403067+
	?debug	C 657424716D7A6381DB4810406973747265616D40+
	?debug	C 3067657424717681DD4811406973747265616D40+
	?debug	C 307065656B24717681DF4813406973747265616D+
	?debug	C 403067636F756E7424717681E148154069737472+
	?debug	C 65616D40307075746261636B24717A6381E34814+
	?debug	C 406973747265616D403069676E6F726524716969+
	?debug	C 81E54826406973747265616D4030246272736824+
	?debug	C 716E716D376973747265616D246D376973747265+
	?debug	C 616D81E7481E406973747265616D403024627273+
	?debug	C 6824716E716D33696F73246D33696F7381E94814+
	?debug	C 406973747265616D4030246272736824716E7A63+
	?debug	C 81EB4814406973747265616D4030246272736824+
	?debug	C 716E756381ED4814406973747265616D40302462+
	?debug	C 72736824716D756381EF4814406973747265616D+
	?debug	C 4030246272736824716D7A6381F1481340697374+
	?debug	C 7265616D4030246272736824716D7381F3481340+
	?debug	C 6973747265616D4030246272736824716D6981F5+
	?debug	C 4813406973747265616D4030246272736824716D+
	?debug	C 6C81F74814406973747265616D40302462727368+
	?debug	C 24716D757381F94814406973747265616D403024+
	?debug	C 6272736824716D756981FB481440697374726561+
	?debug	C 6D4030246272736824716D756C81FD4813406973+
	?debug	C 747265616D4030246272736824716D6681FF4813+
	?debug	C 406973747265616D4030246272736824716D6482+
	?debug	C 014813406973747265616D403024627273682471+
	?debug	C 6D678203481C406973747265616D403024627273+
	?debug	C 6824716E3973747265616D62756682054A124069+
	?debug	C 73747265616D4030246263747224717682074815+
	?debug	C 406973747265616D403065617477686974652471+
	?debug	C 7682094006000000000767636F756E745F044813+
	?debug	C 406973747265616D4030646F5F67657424717682+
	?debug	C 0BC032000000
	?debug	C E24A1D40696F73747265616D4030246263747224+
	?debug	C 716E3973747265616D627566820E4D1340696F73+
	?debug	C 747265616D4030246264747224717682104A1340+
	?debug	C 696F73747265616D403024626374722471768212+
	?debug	C C038000000
	?debug	C E24A1E40696F73747265616D5F77697468617373+
	?debug	C 69676E4030246263747224717682154D1E40696F+
	?debug	C 73747265616D5F7769746861737369676E403024+
	?debug	C 626474722471768217482240696F73747265616D+
	?debug	C 5F7769746861737369676E403024626173672471+
	?debug	C 6D33696F73821A482840696F73747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D627566821CC038000000
	?debug	C E24A1D406F73747265616D5F7769746861737369+
	?debug	C 676E4030246263747224717682204D1D406F7374+
	?debug	C 7265616D5F7769746861737369676E4030246264+
	?debug	C 747224717682224825406F73747265616D5F7769+
	?debug	C 746861737369676E4030246261736724716D376F+
	?debug	C 73747265616D82254827406F73747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D6275668227C030000000
	?debug	C E24A1D406973747265616D5F7769746861737369+
	?debug	C 676E40302462637472247176822B4D1D40697374+
	?debug	C 7265616D5F7769746861737369676E4030246264+
	?debug	C 7472247176822D4825406973747265616D5F7769+
	?debug	C 746861737369676E4030246261736724716D3769+
	?debug	C 73747265616D82304827406973747265616D5F77+
	?debug	C 69746861737369676E4030246261736724716E39+
	?debug	C 73747265616D6275668232C032000000
	end
