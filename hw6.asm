assume cs:code,ds:data
data segment
	s1 db '1', '3', '6', '2', '3', '7'
	s2 db '6', '3', '8', '1', '2', '8'
	l equ ($-s1)/2
	d db l dup(?)
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	mov cx,l
	mov si,0
	jcxz sfarsit
	Repeta:
	mov al,s1[si]
	mov ah,s2[si]
	cmp al,ah
	jb min
	jae sfarsit1
	min:
		mov d[si],ah
		jmp sfarsit2
	sfarsit1:
	mov d[si],al
	sfarsit2:
	inc si
	loop Repeta
	sfarsit:
mov ax,4C00h
int 21h
code ends
end start
	
	