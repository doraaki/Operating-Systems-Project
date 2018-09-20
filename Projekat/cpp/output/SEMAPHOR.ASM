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
	?debug	S "semaphor.cpp"
	?debug	C E98CB8FD4C0C73656D6170686F722E637070
	?debug	C E97ABBF24C0F2E2E5C685C73656D6170686F722E68
	?debug	C E9B26AFE4C0F2E2E5C685C4B65726E656C53652E68
	?debug	C E9B26AFE4C0F2E2E5C685C4B65726E656C53652E68
	?debug	C E99364084D0B2E2E5C685C6C6F636B2E68
SEMAPHOR_TEXT	segment byte public 'CODE'
SEMAPHOR_TEXT	ends
	assume	cs:SEMAPHOR_TEXT,ds:SEMAPHOR_DATA
SEMAPHOR_DATA	segment word public 'FAR_DATA'
d@	label	byte
d@w	label	word
b@	label	byte
b@w	label	word
g	label	word
	db	0
	db	0
SEMAPHOR_DATA	ends
SEMAPHOR_TEXT	segment byte public 'CODE'
	?debug	C E8010C73656D6170686F722E6370708CB8FD4C
   ;	
   ;	Semaphore::Semaphore(int init)
   ;	
	?debug	L 12
	assume	cs:SEMAPHOR_TEXT
@Semaphore@0$bctr$qi	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,SEMAPHOR_DATA
	mov	ds,ax
	?debug	C F8144053656D6170686F72654030246263747224+
	?debug	C 7169
	?debug	C E318000400161900
	?debug	C E604696E6974040A0A0000047468697318020600+
	?debug	C 00
	?debug	B
   ;	
   ;	{
   ;	
	?debug	L 13
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @1@86
	mov	ax,8
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @1@226
@1@86:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],seg @@Semaphore@0
	mov	word ptr es:[bx],offset @@Semaphore@0
   ;	
   ;		lock
   ;	
	?debug	L 14
	pushf	
 	cli	
   ;	
   ;		myImpl = new KernelSem(init);
   ;	
	?debug	L 15
	push	word ptr [bp+10]
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	call	far ptr @KernelSem@0$bctr$qi
	add	sp,6
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],dx
	mov	word ptr es:[bx+4],ax
   ;	
   ;		unlock
   ;	
	?debug	L 16
	popf	
@1@226:
   ;	
   ;	}
   ;	
	?debug	L 17
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @1@254
@1@254:
	pop	ds
	pop	bp
	ret	
	?debug	C E60474686973180206000004696E6974040A0A00+
	?debug	C 00
	?debug	E
	?debug	E
@Semaphore@0$bctr$qi	endp
   ;	
   ;	int Semaphore::wait(int toBlock)
   ;	
	?debug	L 18
	assume	cs:SEMAPHOR_TEXT
@Semaphore@0wait$qi	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,SEMAPHOR_DATA
	mov	ds,ax
	?debug	C F8134053656D6170686F72654030776169742471+
	?debug	C 69
	?debug	C E607746F426C6F636B040A0A0000047468697318+
	?debug	C 02060000
	?debug	B
   ;	
   ;	{
   ;		return myImpl->wait(toBlock);
   ;	
	?debug	L 20
	push	word ptr [bp+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @KernelSem@0wait$qi
	add	sp,6
	jmp	short @2@58
@2@58:
   ;	
   ;	}
   ;	
	?debug	L 21
	pop	ds
	pop	bp
	ret	
	?debug	C E60474686973180206000007746F426C6F636B04+
	?debug	C 0A0A0000
	?debug	E
	?debug	E
@Semaphore@0wait$qi	endp
   ;	
   ;	void Semaphore::signal()
   ;	
	?debug	L 23
	assume	cs:SEMAPHOR_TEXT
@Semaphore@0signal$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,SEMAPHOR_DATA
	mov	ds,ax
	?debug	C F8154053656D6170686F726540307369676E616C+
	?debug	C 247176
	?debug	C E604746869731802060000
	?debug	B
   ;	
   ;	{
   ;		myImpl->signal();
   ;	
	?debug	L 25
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @KernelSem@0signal$qv
	pop	cx
	pop	cx
   ;	
   ;	}
   ;	
	?debug	L 26
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731802060000
	?debug	E
	?debug	E
@Semaphore@0signal$qv	endp
   ;	
   ;	int Semaphore::value() const
   ;	
	?debug	L 28
	assume	cs:SEMAPHOR_TEXT
@Semaphore@0value$xqv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	ds
	mov	ax,SEMAPHOR_DATA
	mov	ds,ax
	?debug	C F8154053656D6170686F7265403076616C756524+
	?debug	C 787176
	?debug	C E31A000400161900
	?debug	C E604746869731A02060000
	?debug	B
   ;	
   ;	{
   ;		return myImpl->value();
   ;	
	?debug	L 30
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @KernelSem@0value$xqv
	pop	cx
	pop	cx
	jmp	short @4@58
@4@58:
   ;	
   ;	}
   ;	
	?debug	L 31
	pop	ds
	pop	bp
	ret	
	?debug	C E604746869731A02060000
	?debug	E
	?debug	E
@Semaphore@0value$xqv	endp
   ;	
   ;	Semaphore::~Semaphore()
   ;	
	?debug	L 33
	assume	cs:SEMAPHOR_TEXT
@Semaphore@0$bdtr$qv	proc	far
	?debug	B
	push	bp
	mov	bp,sp
	push	si
	push	ds
	mov	ax,SEMAPHOR_DATA
	mov	ds,ax
	?debug	C F8144053656D6170686F72654030246264747224+
	?debug	C 7176
	?debug	C E60664656C657465040A0A000004746869731802+
	?debug	C 060000
	mov	si,word ptr [bp+10]
	?debug	B
   ;	
   ;	{
   ;	
	?debug	L 34
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	je	short @5@170
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],seg @@Semaphore@0
	mov	word ptr es:[bx],offset @@Semaphore@0
   ;	
   ;		delete myImpl;
   ;	
	?debug	L 35
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	or	ax,word ptr es:[bx+6]
	je	short @5@114
	mov	ax,3
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+4]
	les	bx,dword ptr es:[bx]
	call	dword ptr es:[bx]
	add	sp,6
	jmp	short @5@114
@5@114:
	test	si,1
	je	short @5@170
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	pop	cx
	pop	cx
@5@170:
   ;	
   ;	}
   ;	
	?debug	L 36
	pop	ds
	pop	si
	pop	bp
	ret	
	?debug	C E6047468697318020600000664656C657465040C+
	?debug	C 0600
	?debug	E
	?debug	E
@Semaphore@0$bdtr$qv	endp
SEMAPHOR_TEXT	ends
SEMAPHOR_TEXT	segment byte public 'CODE'
@Semaphore@0	segment	virtual
@@Semaphore@0	label	byte
	dd	@Semaphore@0$bdtr$qv
	dd	@Semaphore@0wait$qi
	dd	@Semaphore@0signal$qv
	?debug	C E9
	?debug	C FA00000000
@Semaphore@0	ends
SEMAPHOR_TEXT	ends
SEMAPHOR_DATA	segment word public 'FAR_DATA'
s@	label	byte
SEMAPHOR_DATA	ends
SEMAPHOR_TEXT	segment byte public 'CODE'
SEMAPHOR_TEXT	ends
	?debug	C E3190953656D6170686F726508002E01
	?debug	C ED00010000010E00
	?debug	C E31B0000002D1804011900144053656D6170686F+
	?debug	C 726540302462637472247169
	?debug	C E31D0000002D0104011900144053656D6170686F+
	?debug	C 726540302462647472247176
	?debug	C E31F0000002D0404011902134053656D6170686F+
	?debug	C 7265403077616974247169
	?debug	C E3210000002D0104011904154053656D6170686F+
	?debug	C 726540307369676E616C247176
	?debug	C E3230000002D0404011900154053656D6170686F+
	?debug	C 7265403076616C756524787176
	?debug	C E326094B65726E656C53656D0A002E02
	?debug	C ED00020000090E00
	?debug	C E327000400160100
	?debug	C E3280000002D010401260014404B65726E656C53+
	?debug	C 656D4030626C6F636B247176
	?debug	C E32A0000002D010401260016404B65726E656C53+
	?debug	C 656D40306465626C6F636B247176
	?debug	C E32C0000002D040401260013404B65726E656C53+
	?debug	C 656D403077616974247169
	?debug	C E32E0000002D010401260015404B65726E656C53+
	?debug	C 656D40307369676E616C247176
	?debug	C E3300000002D040401260015404B65726E656C53+
	?debug	C 656D403076616C756524787176
	?debug	C E3320000002D250401260014404B65726E656C53+
	?debug	C 656D40302462637472247169
	?debug	C E3340000002D010401260014404B65726E656C53+
	?debug	C 656D40302462647472247176
	?debug	C E325000400162600
_g	equ	g
	public	@Semaphore@0value$xqv
	public	@Semaphore@0signal$qv
	public	@Semaphore@0wait$qi
	public	@Semaphore@0$bdtr$qv
	public	@Semaphore@0$bctr$qi
	extrn	@KernelSem@0$bctr$qi:far
	extrn	@KernelSem@0value$xqv:far
	extrn	@KernelSem@0signal$qv:far
	extrn	@KernelSem@0wait$qi:far
	extrn	@$bdele$qnv:far
	extrn	@$bnew$qui:far
_s@	equ	s@
	?debug	C EA050D
	?debug	C E33600000023010400
	?debug	C EB0B40246264656C6524716E763600
	?debug	C E338000400160100
	?debug	C E33700000023380400
	?debug	C EB0A4024626E6577247175693700
	?debug	C E60167040000020000000953656D6170686F7265+
	?debug	C 190700094B65726E656C53656D26070005717565+
	?debug	C 7565010700
	?debug	C E24A144053656D6170686F726540302462637472+
	?debug	C 2471691B4D144053656D6170686F726540302462+
	?debug	C 6474722471761D4C134053656D6170686F726540+
	?debug	C 30776169742471691F4C154053656D6170686F72+
	?debug	C 6540307369676E616C2471762148154053656D61+
	?debug	C 70686F7265403076616C75652478717623400400+
	?debug	C 000000066D79496D706C25C008000000
	?debug	C E24004000000000E73656D6170686F7265517565+
	?debug	C 7565274814404B65726E656C53656D4030626C6F+
	?debug	C 636B247176284816404B65726E656C53656D4030+
	?debug	C 6465626C6F636B2471762A000376616C04481340+
	?debug	C 4B65726E656C53656D4030776169742471692C48+
	?debug	C 15404B65726E656C53656D40307369676E616C24+
	?debug	C 71762E4815404B65726E656C53656D403076616C+
	?debug	C 756524787176304A14404B65726E656C53656D40+
	?debug	C 302462637472247169324D14404B65726E656C53+
	?debug	C 656D4030246264747224717634C00A000000
	end
