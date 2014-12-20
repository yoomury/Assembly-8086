; 13.Sa se citeasca de la tastatura un nume de fisier si un nume de director.
; Sa se afiseze un mesaj corespunzator daca fisierul exista sau nu in
; directorul dat.

assume cs:code,ds:data

data segment
   mesajfis db 'Dati numele fisierului:',13,10,'$'
   mesajdir db 'Dati numele directorului:',13,10,'$'
   eroare1 db 'Fisierul nu a fost gasit',13,10,'$'
   eroare2 db 'Directorul nu a fost gasit',13,10,'$'
   eroare3 db 'Fisierul a fost gasit',13,10,'$'  
   lgfismax db 30
   lgfis db ?
   fis db 30 dup(?),'$'
   lgdirmax db 50
   lgdir db ?
   dir db 50 dup(?),'$'
   a dw ?  
data ends
code segment
  start:
    mov ax,data
    mov ds,ax 
   
    mov ah,09h
    mov dx,offset mesajdir
    int 21h
    mov ah,0ah
    mov dx,offset lgdirmax
    int 21h
    mov al,lgdir
    mov ah,0
    mov si,ax
    mov dir[si],0         ;am format nume dir in ascii
   
    mov ah,09h
    mov dx,offset mesajfis
    int 21h
    mov ah,0ah
    mov dx,offset lgfismax
    int 21h
    mov al,lgfis
    mov ah,0
    mov si,ax
    mov fis[si],0         ;am format nume fis in ascii

    mov ah,3bh            ;ma pozitionez in directorul respectiv             
    mov dx,offset dir
    int 21h
    jc errdir
     
   
    mov ah,4eh            ;verific daca am fisierul in director
    mov cx,27h
    mov dx,offset fis
    int 21h
    jc errfis
    mov ah,09h
    mov dx,offset eroare3
    int 21h
    jmp sf 

    errfis:
       mov ah,09h
       mov dx,offset eroare1
       int 21h
       jmp sf
    
    errdir:
       mov ah,09h
       mov dx,offset eroare2
       int 21h         
 

   sf:
      mov ax,4C00h
      int 21h
code ends
  end start



