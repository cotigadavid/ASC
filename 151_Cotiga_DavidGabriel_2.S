.data 
	sumMat: .space 1700
	matrix: .space 1700
	columnIndex: .space 4
	lineIndex: .space 4
	m: .space 4
	n: .space 4
	p: .space 4
	k: .space 4

	copyM: .space 4
    	copyN: .space 4

	left: .space 4
	right: .space 4
	index: .space 4

	currInd: .space 4
	currSum: .space 4

	filenameIn: .asciz "in.txt"
	filenameOut: .asciz "out.txt"

	formatRead: .asciz "r"
	formatWrite: .asciz "w"

	formatScanf: .asciz "%d"
	formatPrintf: .asciz "%d "
	formatPrintfNewline: .asciz "%c"
	newLine: .asciz "\n"
.text

.global main

main:
	push stdin
	push $formatRead
	push $filenameIn
	call freopen
	pop %ebx
	pop %ebx
	pop %ebx

	push stdout
	push $formatWrite
	push $filenameOut
	call freopen
	pop %ebx
	pop %ebx
	pop %ebx

	pushl $m
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	pushl $n
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	pushl $p
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

        movl m, %eax
        movl %eax, copyM
        
        movl n, %eax
        movl %eax, copyN

	incl n
	incl m

        incl n
	incl m

	movl $0, index
et_for:
	movl index, %ecx
	cmp %ecx, p
	je et_cont_citire

	pushl $left
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	pushl $right
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	incl left
	incl right

	movl left, %eax
	movl $0, %edx
	mull n
	addl right, %eax

	lea matrix, %edi
	movl $1, (%edi, %eax ,4)

        #movl $7, %eax
        #movl $1, (%edi, %eax, 4)

	incl index
	jmp et_for

et_cont_citire:

	pushl $k
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	movl $0, index
et_for_proc:
	movl index, %ecx
	cmp %ecx, k
	je et_afis_mat

	movl $1, lineIndex
	for_lines_proc:
		movl lineIndex, %ecx
		cmp %ecx, copyM
		jl et_second_for            

		movl $1, columnIndex
		for_columns_proc:
			movl columnIndex, %ecx
			cmp %ecx, copyN
			jl cont_proc

			movl lineIndex, %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax

			movl %eax, currInd

	
			lea sumMat, %edi
			movl (%edi, %eax ,4), %ebx
			#movl %ebx, currSum
			movl $0, currSum

	
			movl lineIndex, %eax
			decl %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax
			decl %eax

			lea matrix, %edi
			movl (%edi, %eax ,4), %ebx
			addl %ebx, currSum

	
			movl lineIndex, %eax
			decl %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax

			
			movl (%edi, %eax ,4), %ebx
			addl %ebx, currSum

	
			movl lineIndex, %eax
			decl %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax
			incl %eax

			
			movl (%edi, %eax ,4), %ebx
			addl %ebx, currSum

	
			movl lineIndex, %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax
			decl %eax

			
			movl (%edi, %eax ,4), %ebx
			addl %ebx, currSum

	
			movl lineIndex, %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax
			incl %eax

			
			movl (%edi, %eax ,4), %ebx
			addl %ebx, currSum
	
			movl lineIndex, %eax
			incl %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax
			decl %eax

			
			movl (%edi, %eax ,4), %ebx
			addl %ebx, currSum

	
			movl lineIndex, %eax
			incl %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax

			
			movl (%edi, %eax ,4), %ebx
			addl %ebx, currSum

	
			movl lineIndex, %eax
			incl %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax
			incl %eax

			
			movl (%edi, %eax ,4), %ebx
			addl %ebx, currSum

			movl lineIndex, %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax

			lea sumMat, %edi
			movl currSum, %ebx
			movl %ebx, (%edi, %eax ,4)

	
			incl columnIndex
			jmp for_columns_proc


	cont_proc:

		incl lineIndex
		jmp for_lines_proc


et_second_for:

	movl $1, lineIndex
	for_lines_check:
		movl lineIndex, %ecx
		cmp %ecx, copyM
		jl cont_for_mare

		movl $1, columnIndex
		for_columns_check:
			movl columnIndex, %ecx
			cmp %ecx, copyN
			jl cont_check
			
			movl lineIndex, %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax

			lea sumMat, %edi
			movl (%edi, %eax ,4), %ebx

			cmp $2, %ebx
			jl die

			cmp $3, %ebx
			jg die

			jmp else

			die:
				lea matrix, %edi
				movl $0, (%edi, %eax, 4)

			else:

			cmp $3, %ebx
			je live

			jmp else2

			live:
				lea matrix, %edi
				movl $1, (%edi, %eax, 4)

			else2:


			incl columnIndex
			jmp for_columns_check

		cont_check:
			incl lineIndex
			jmp for_lines_check

cont_for_mare:
	incl index
	jmp et_for_proc


et_afis_mat:
	movl $1, lineIndex
	for_lines:
		movl lineIndex, %ecx
		#decl %ecx
		cmp %ecx, copyM
		jl et_exit

		movl $1, columnIndex
		for_columns:
			movl columnIndex, %ecx
			#decl %ecx
			cmp %ecx, copyN
			jl cont

			movl lineIndex, %eax
			movl $0, %edx
			mull n
			addl columnIndex, %eax

			lea matrix, %edi
			movl (%edi, %eax, 4), %ebx

			pushl %ebx
			pushl $formatPrintf
			call printf
			popl %ebx
			popl %ebx

			pushl $0
			call fflush
			popl %ebx

			incl columnIndex
			jmp for_columns

	cont:

		pushl newLine
		pushl $formatPrintfNewline
		call printf
		popl %ebx
		popl %ebx

		incl lineIndex
		jmp for_lines


et_exit:
	movl $1, %eax
	movl $0, %ebx
	int $0x80	

