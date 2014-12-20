assume ds: data, cs: code
data segment
	sir dd 12345678h,1A2B3C4Dh
	len equ $-sir
	d db len dup (?)
	zece db 10
data ends
code segment
start:
	mov ax, data
	mov ds, ax
	lea si,sir
	mov ax,data
	mov es,ax
	lea di,d
	mov cx,len
	cld
	repeta:
		lodsw
		mov al,ah
		mov ah,0
		div zece
		cmp ah,0
		jnz nonmultiplu
		jz multiplu
		nonmultiplu:
			loop repeta
		multiplu:
			stosb
			loop repeta
		mov ax,4C00h
		int 21h
code ends
end start
		
		