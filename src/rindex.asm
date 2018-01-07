	BITS	64
	SECTION	.text
	GLOBAL	strchr

	; char *rindex(const char *s, int c);
	; inverse de strchr
	
rindex:
        mov rax, 0	; rax = 0
	dec rdi		; rdi -= 1
	mov r8, 0	; r8 = 0
	mov cl, sil	; cl = sil

rindex_loop:
	inc rdi			;rdi++;
	mov ch, [rdi]		;ch = [rdi]
	cmp ch, cl		; si ch = cl
	jnz rindex_ret		; return rindex_ret
        mov rax, rdi		; rax = rdi

rindex_ret:
	cmp ch, 0		;si ch == 0
        jnz rindex_loop		;loop
	ret			; ret
