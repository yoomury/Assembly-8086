assume cs:code, ds:data
data segment
a dw 1111111001111000b
b dw 0111110000000000b
c db ?
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	mov c,0
	mov ax,a
	shr ax,5
	and ax,0000000000111111b
	or c,al
	mov ax,b
	shl ax,6
	and ax,0000011000000b
	or c,al
	mov ax,4C00h
	int 21h
code ends
end start
	