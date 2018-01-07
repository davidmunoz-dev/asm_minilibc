	BITS 64
	global strlen

	section .text

strlen:
	mov rax, -1	; RAX: Registre général;MOV: rax <- -1; 
	dec rdi		; DEC: rdi -= 1
			; RDI:registre general adresse source pour deplacement ou comparaison
strlen_while:
	inc rax			; rax++
	inc rdi			; rdi++
	mov cl,byte[rdi]	; cl recupère le byte de rdi
	cmp cl, 0		; compare cl, si 0 strlen_while sinon ret
	jnz strlen_while	; répète la même opération jusqua = 0
	ret
