segment .data
result: db "Result is: %d",0x0a,0
len: equ $-result
segment .text
	global main
	extern printf
main:
	push rbp
	mov rbp, rsp
	mov r8d, 3
	mov r9d, 5
	mov edi, 15
	xor eax, eax
.loop:  sub eax, edi
	add eax, r8d
	add eax, r9d
	add edi, 15
	add r8d, 3
	add r9d, 5
	cmp edi, 1000
	jl .loop
.loop1:	add eax, r8d
	add eax, r9d
	add r8d, 3	
	add r9d, 5
	cmp r9d, 1000
	jl .loop1
.loop2: add eax, r8d
	add r8d, 3
	cmp r8d, 1000
	jl .loop2
	mov esi, eax ; param2
	xor eax, eax ; 0 float
	lea rdi, [result] ; param 1
	call printf
	pop rbp
	ret
