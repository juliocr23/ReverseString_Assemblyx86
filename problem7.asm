COMMENT*
          Julio Rosario 3/20/17
		Write a program with a loop and indirect addressing that copies a string from source to target,
		reversing the character order in the process. Use the following variables:
		source BYTE "This is the source string",0
		target BYTE SIZEOF source DUP('#')
*COMMENT

INCLUDE Irvine32.inc

.DATA

source BYTE "This is the source string",0
target BYTE SIZEOF source DUP('#')

.CODE
main PROC

	MOV ESI,SIZEOF source -TYPE source				;Index register at last position
	MOV ECX,SIZEOF source                             ;loop counter
	MOV EBX,0                                         ;Index register at first position

	L1:
		MOV AL,source[ESI]                           ;Get a charactarer from source
		MOV target[EBX],AL                          ; Store it in the target
	     DEC ESI
	     INC EBX
	LOOP L1


	MOV ESI,0				                       ;Index register
	MOV ECX,SIZEOF source                           ;loop counter

	print:
		MOV AL,target[ESI]
		call writechar
		call crlf
		inc ESI
	LOOP print 

exit
main ENDP
end main

