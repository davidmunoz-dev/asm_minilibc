	BITS	64
	SECTION .text
	GLOBAL	strcasecmp

	; int strcasecmp(const char *s1, const char *s2);

strcasecmp:			;si majuscule on met modifie CL par minuscule
	mov cl, byte[rdi]
	mov dl, byte[rsi]

	cmp cl, 65		;si cl < 'A'
	jl strcasecmp_mincl	; go to strcasecmp_mincl
	cmp cl, 90		;si cl > 'Z'
	jg strcasecmp_mincl	; go to strcasecmp_mincl
        add cl, 32		; sinon cl+=32 (minuscule)
	
strcasecmp_mincl:
	cmp dl, 65		; si dl < 'A'
	jl strcasecmp_mindl	; go to strcasecmp_mindl
	cmp dl, 90		; si dl > 'Z'
	jg strcasecmp_mindl	; go to strcasecmp_mindl
	add dl, 32		; sinon dl+=32

strcasecmp_mindl:		; strcmp classique
	cmp byte[rdi], 0 	; compare arg1 à NULL
	jz strcasecmp_end	; si == 1; return end
	cmp byte[rsi], 0 	; compare arg2 à NULL
	jz strcasecmp_end	; si == 1; return end

	cmp cl, dl
	jnz strcasecmp_end	   ; si == 0 return end

	inc rdi		; rdi++
	inc rsi		; rsi++
	jmp strcasecmp	; loop
strcasecmp_end:
	movzx eax, cl ; extension avec des 0 dans eax
	movzx ecx, dl ; extension avec des 0 dans eax
	sub eax, ecx  ; eax = eax - ecx
	ret
