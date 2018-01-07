	BITS 64
	global memcpy

	section .text
	;;void *memcpy(void *dest, const void *src, size_t n);
	;;                      1                2         3
memcpy:
	push rbp		;
	mov rbp, rsp		; PROLOGUE
	push rbx
	push rcx
	;; Init des paramètres
	mov rax, [rbp + 8]	; 1 -> Arithmetic accumulator
	mov rbx, [rbp + 12]	; 2 -> Store index
	mov rcx, [rbp + 16]	; 3 -> Count
memcpy_loop:
	cmp rcx, 0		; While 3 != 0
	je memcpy_return	; if Zero flag then go to memcpy_label and exit loop

	mov dl, [rbx]		; Basic data swap, first the src to dl (little DX register)
	mov [rax], dl		; Then rax's bytes are replaced by previous dl content

	;; Arithmetic 
	dec rcx			; rcx--
	inc rax			; rax++
	inc rbx			; rbx++
	jmp memcpy_loop		; back to label
memcpy_return:
	mov rax, [rbp + 8]	; Copy rax into 1 (dest).
	pop rcx			; delete used data
	pop rbx			; //
	leave
	ret
