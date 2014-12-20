assume CS:code, DS:data
data segment
	m	DB	65
	h	DW	265
	yy	DW	235
	d	DB	-3
data ends
code segment
start:
	mov AX,data
	mov DS,AX
	mov BX,yy
	add BX,h
	add BX,h
	mov CX,yy
	mov DL,m
	add DL,d
	cbw
	add CX,DX
	sub BX,CX
	mov AX,4C00h
	int 21h
code ends
end start
