	BITS 64
	global memset 		; void *memset(void *s, int c, size_t n)

	section .text

memset:
	push rbp		;
	mov rbp, rsp		; PROLOGUE
	xor rcx, rcx		; clean rcx, par défaut XOR rcx,rcx -> 0
	mov rax, rdi		; Move 1er param dans rax
memset_loop:
	cmp rdx, rcx		; si rdx (3eme param) vaut 0 (XOR préalable sur rcx)
	jz end			; alors JumpZero.
	mov [rax], sil		; mémoire contenue dans rax <- sil (2nd param)
	inc rcx			; rcx++
	inc rax			; rax++
	jmp memset_loop		; retour au label
end:
	mov rax, rdi		; 1er param -> accumulateur
	mov rsp, rbp		;
	pop rbp			; EPILOGUE
	ret
