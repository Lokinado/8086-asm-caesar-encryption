org 100h
start:
	call ent	
loop:
	call cls
	call printui
	call pushup
	call option
	call doopt
	
	jmp loop
	
end:
	mov	ax, 4C00h
	int	21h

ent:
	pusha
	pushf

			mov ah,2
			mov dl, 10
			int 21h
			mov dl, 13
			int 21h
	
	popf
	popa
ret
	
option:
	pusha
	pushf
		mov ah,1
		int 21h
		sub al, 48
		mov [opt], al
		
		mov ah,2
		mov dl, 10
		int 21h
	popf
	popa
ret
	
doopt:
	pusha
	pushf
		xor dx,dx
		mov dl, [opt]
		
		cmp dx, 1
		je intext
		
		cmp dx, 2
		je inoffset

		cmp dx, 3
		je encrypt
		
		cmp dx, 4
		je end
doend:
	popf
	popa
ret
	
inoffset:
	mov ah, 10
	mov dx, rawoff
	int 21h
	
	mov ah,2
	mov dl, 10
	int 21h
	
	mov si, rawoff
	add si, 2
	
	xor cx,cx
	mov cl, [rawoff+1]
	xor dx,dx
	xor bx,bx
	xor ax,ax
	forloop:
		mov dl, [si]
		sub dl, 48
		
		mov bx, 10
		add ax,dx
		xor dx,dx

		cmp cl, 1
		je skip
		mul bx
skip:			
		inc si
		loop forloop
		
	mov [offset], ax
	jmp doend

printui:
	pusha
	pushf
		
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx
		
		mov ah,2
		mov dl, 201
		int 21h
		
		mov cx, 55
		push cx
		call longbar
		pop cx
		
		mov ah,2
		mov dl, 186
		int 21h
		
		mov ah, 9
		mov dx, title
		int 21h
		
		mov ah,2
		mov dl, 10
		int 21h		
		
		mov ah,2
		mov dl, 204
		int 21h
		
		mov cx, 38
		push cx
		call longbar
		pop cx
		
		mov ah,2
		mov dl, 186
		int 21h
		
		mov ah, 9
		mov dx, textval
		int 21h
		
		mov ah, 9
		mov dx, rawin+2
		int 21h
		
		mov ah, 2
		mov dl, 10
		int 21h
		
		mov ah,2
		mov dl, 186
		int 21h
		
		mov ah, 9
		mov dx, textoff
		int 21h
		
		mov dx, [offset]
		push dx
		call printn
		pop dx
		
		mov ah, 2
		mov dl, 10
		int 21h	
		
		mov ah,2
		mov dl, 186
		int 21h
		
		mov ah, 9
		mov dx, textdat
		int 21h
		
		mov ah, [isencr]
		cmp ah, 0
		je skipthat
		
		mov ah, 9
		mov dx, data+2
		int 21h		
		
skipthat:		
		mov ah, 2
		mov dl, 10
		int 21h	
		
		mov ah,2
		mov dl, 204
		int 21h
		
		mov cx, 25
		push cx
		call longbar
		pop cx
		
		mov ah,2
		mov dl, 186
		int 21h

		mov ah, 9
		mov dx, insI
		int 21h
		
		mov ah,2 
		mov dl, 10
		int 21h
		
		mov ah,2
		mov dl, 186
		int 21h

		mov ah, 9
		mov dx, insII
		int 21h
		
		mov ah,2 
		mov dl, 10
		int 21h
		
		mov ah,2
		mov dl, 186
		int 21h

		mov ah, 9
		mov dx, insIII
		int 21h
		
		mov ah,2 
		mov dl, 10
		int 21h
		
		mov ah,2
		mov dl, 186
		int 21h

		mov ah, 9
		mov dx, insIV
		int 21h
		
		mov ah,2 
		mov dl, 10
		int 21h
		
		mov ah,2
		mov dl, 186
		int 21h

		mov ah, 9
		mov dx, insV
		int 21h
		
		mov ah,2 
		mov dl, 10
		int 21h
		
		mov ah,2
		mov dl, 200
		int 21h
		
		mov cx, 18
		push cx
		call longbar
		pop cx
	popf
	popa
ret

cls:
	pusha
		xor cx,cx
		xor ah,ah
		mov cx, 25		
cloop:
		mov ah,2
		mov dl, 10
		int 21h
		loop cloop
	popa
ret

pushup:
	pusha
		xor cx,cx
		xor ah,ah
		mov cx, 11		
ploop:
		mov ah,2
		mov dl, 10
		int 21h
		loop ploop
	popa
ret

longbar:
	pusha
	pushf
		mov bp, sp
		mov ax, [bp+20]
		
		mov cx, ax		
lbloop:
		mov ah,2
		mov dl, 205
		int 21h
		
		loop lbloop
		
		mov ah,2
		mov dl, 10
		int 21h
	popf
	popa
ret

printn:
	pusha
	pushf
	
		mov bp, sp
		mov ax, [bp+20]
		mov bx, 10
		
		mov bp, 0
whilein:
		xor dx,dx
		div bx
		add dx, 48
		
		push dx
		inc bp
		mov bx, 10
		
		cmp ax, 0
		jne whilein
		
		
		mov cx, bp
whileout:
		mov ah, 2
		pop dx
		int 21h
		
		loop whileout
	popf
	popa 
ret

intext:	
	mov ah, 10
	mov dx, rawin
	int 21h
	
	mov al, 0
	mov [isencr], al
	
	mov cx, 23
	mov si,rawin
	mov di,data
	cld
	rep movsb
	
	mov ah,2
	mov dl, 10
	int 21h
	
	jmp doend


encrypt:
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
	call preproc	
	call process
	mov al, 1
	mov [isencr], al
jmp doend

preproc:
	pusha
	pushf
		
		mov si, data
		add si, 2
		
		mov cl, [data+1]	
		forthree:
			push si
			call tolower
			pop si
			
			inc si
			
			loop forthree
	popf
	popa
ret

process:
	pusha
	pushf
	
		mov si, data
		add si, 2
		
		mov cl, [data+1]	
		looptwo:
			push si
			call cezar
			pop si
			
			inc si
			
			loop looptwo		
	
	popf
	popa
ret

cezar:
	pusha
	pushf
		
		mov bp, sp
		mov si, [bp+20]
		
		xor ax, ax
		xor dx, dx
		mov dl, [si]
		mov al, dl
		
		cmp al, 32
		je cend
		
		sub ax , 97 ; (Liczba oryginalna - 97 + przesunięcie) % 26 + 97	
		add ax , [offset]
		
		xor dx , dx
		mov bx , 26
		div bx
		
		xor ax , ax
		mov al , dl
		add al , 97
		mov [si], al
cend: 
	popf
	popa
ret

tolower:
	pusha
	pushf
	
		xor dx,dx
		mov bp, sp
		mov si, [bp+20]
		
		mov dl, [si]
		
		cmp dl, 97
		jae oversma
		
		cmp dl, 65
		jae overbga
		
		jmp space
overbga:
		cmp dl, 90
		jbe bigg
		ja space
		
oversma:
		cmp dl, 122
		jbe smal
		ja space

bigg:
		add dl, 32
		mov [si], dl
		jmp tlend
smal:
		jmp tlend
	
space:
		mov dl, 32
		mov [si], dl
		jmp tlend

tlend:
	popf
	popa
ret

rawin 	db 25
		db 0
		times 25 db "$"

data 	db 25
		db 0
		times 25 db "$"

rawoff 	db 5
		db 0
		times 5 db "$"
		
isencr	db 0
		
offset 	dw 0

opt		db 0

textval db "Text to encrypt: $"

textoff db "Current offset: $"

textdat db "Encryption result: $"

title   db "  Welcome to 8086 ASM caesar encryption program!  $"

insI	db "Instruction of operations: $"

insII	db "1. Input text to encrypt $"

insIII	db "2. Set offset $"

insIV	db "3. Encrypt $"

insV    db "4. Exit $"