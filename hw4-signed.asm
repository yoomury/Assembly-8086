ASSUME cs: code, ds:data
data SEGMENT 
   a dw 10
   b db  5
   c dw  7
   d db  3
   e dd  50
   f dw 100
   x dd ?
data ENDS
code SEGMENT
start:
   mov ax,data
   mov ds,ax
   mov al,b
   cbw
   add ax,a
   mul f
   mov bx,ax
   mov cx,dx
   mov al,d
   cbw
   add c,ax
   mov al,3
   cbw
   cwd
   div c
   add ax, word ptr e
   adc dx, word ptr e+2
   sub bx,ax
   sbb cx,dx
   mov word ptr x+2,cx
   mov word ptr x,bx
   mov ax,4C00h
   int 21h
code ENDS
END start
