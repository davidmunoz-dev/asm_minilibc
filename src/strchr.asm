	BITS	64
	SECTION	.text
	GLOBAL	strchr

strchr:
	mov rax, rdi		; assigne la string à rax
	dec rax			; rax -= 1
	mov rdx, 0		; asigne le 2em argument (l'index) à 0
	mov cl, sil		; 

strchr_while:	
	inc rax			; rax++

	mov ch, [rax]		; copie [rax] dans ch

	cmp ch, cl		; compare ch et cl
	jz strchr_ret		; si ch = 1 renvoi strchr_ret
	cmp ch, 0		; compare ch à 0
	jnz strchr_while	; si ch = 0 renvoi strchr while

	mov rax, 0		;si on arrive ici, on remplace le rax actuel par NULL
	ret
strchr_ret:
	ret
	
	ret
