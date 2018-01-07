	BITS	64
	SECTION .text
	GLOBAL	strncmp

strncmp:
	cmp byte[rdi], 0 ; compare arg1 à NULL
	jz strncmp_end	; si == 1; return end

	cmp byte[rsi], 0 ; compare arg2 à NULL
	jz strncmp_end	; si == 1; return end

	mov cl, byte[rdi]
	cmp cl, byte[rsi] ; compare byte[av1] et byte[av2]
	jnz strncmp_end	   ; si == 0 return end

	dec rdx
	jz strncmp_end
	
	inc rdi		; rdi++
	inc rsi		; rsi++
	jmp strncmp	; loop
strncmp_end:
	movzx ecx, byte[rsi] ; extension avec des 0 dans ecx
	movzx eax, byte[rdi] ; extension avec des 0 dans eax
	sub eax, ecx  ; eax = eax - ecx
	ret
