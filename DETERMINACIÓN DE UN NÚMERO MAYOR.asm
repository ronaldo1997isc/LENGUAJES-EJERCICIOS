;HENRY RONALDO UICAB RODRIGUEZ
;ITSVA 6-A INGENIERIA EN SISTEMAS COMPUTACIONALES
;LENGUAJES Y AUTOMATAS II

.model small

.stack 64; segmentos de memoria para manejar la informacion, el tamanio de estos segmentos es de 64kb
.data
 Digito1 db 100 dup('$')
Digito2 db 100 dup('$')
Digito3 db 100 dup('$') 
 msj1 db 0ah,0dh, 'Ingrese DOS digitos del 0 al 9 POR FAVOR :$'
 

Mayor db 0ah,0dh, 'El NUMERO Mayor Es:$' 


salto db 13,10,'',13,10,'$'



.code
  mov si,0
mov ax,@data
mov ds,ax
mov ah,09h
mov dx,offset msj1 ;Imprimimos el msj1
int 21h   



call saltodelinea;llamamos el metodo saltodelinea.
mov Digito1,al ;lo guardado en AL a digito1

call saltodelinea

call pedircaracter 

mov Digito2,al

call saltodelinea

call pedircaracter

mov Digito3,al

call saltodelinea    


mov ah,digito1
mov al,digito2
cmp ah,al 
ja compara-1-3 
jmp compara-2-3
compara-1-3:
mov al,digito3 
cmp ah,al 
ja mayor1  

compara-2-3:
mov ah,digito2
mov al,digito3
cmp ah,al 
ja mayor2 
jmp mayor3 
 

mayor1:

call MensajeMayor ;llama al metodo que dice: El digito mayor es:

mov dx, offset Digito1 ;Imprir El Digito 1 es mayor
mov ah, 9
int 21h
jmp exit

mayor2:
call MensajeMayor

mov dx, offset Digito2 ;Salto de linea
mov ah, 9
int 21h
jmp exit

mayor3:
call MensajeMayor

mov dx, offset Digito3 ;Salto de linea
mov ah, 9
int 21h
jmp exit










MensajeMayor:
mov dx, offset Mayor ;El digito Mayor es:
mov ah,09h
int 21h 


ret
pedircaracter:
mov ah,01h; pedimos primer digito
int 21h
ret

saltodelinea:
mov dx, offset salto ;Salto de linea
mov ah, 9
int 21h
ret

exit:
mov ax, 4ch;utilizamos el servicio 4c de la interrupcion 21h
int 21h ;para terminar   el programa
ends






