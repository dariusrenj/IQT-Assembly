;Name: Zackery Vering
;Project: Lab 8
;Date: 16 Oct 2018

bits 64

global first_func, second_func, third_func

first_func:
    push rbp
    mov rbp, rsp


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Two values have been provided,
;  a value (consisting of a single
;  byte), which is stored in RSI,
;  a buffer to initialize, a
;  pointer to which is in RDI,
;  and a number of bytes to set,
;  which is stored in RCX.
;
;  Implement a function that will
;  set the buffer pointed to by RDI
;  to the value stored in RSI.
;
;
;  RSI = value consisting of single byte
;  RDI = pointer to buffer (needs initialized)
;  RDX = number of bytes 
;  
;
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   mov rax, rsi ;set rax to rsi
   mov rcx, rdx ;set rcx to number of bytes which rdx provides
   rep stosb    ;initialize and store value from rax to rdi
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    pop rbp
    ret

second_func:
    push rbp
    mov rbp, rsp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   You have been provided with
;  pointers to two buffers, one
;  being the "source" (in RSI),
;  and the other, in RDI, being
;  the destination. 
;
;  Copy the values
;  from source to destination.
;  The size of both buffers is
;  stored in RDX.
;
;  RDX = size of both buffers
;  RSI = pointer to source buffer
;  RDI = pointer to destination buffer
;
; 
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov rcx, rdx ;set rcx to the size of the buffers
rep movsb    ;move from rsi to rdi for rcx times
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    pop rbp
    ret



third_func:
    push rbp
    mov rbp, rsp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Find the length of the
;  provided, NULL-terminated 
;  string (a pointer to the 
;  beginning of which is 
;  currently stored in RDI),
;  and store the result in RAX,
;  using only string instructions.
;
;  RDI = pointer to string (NULL TERMINATED)
;  RAX = store result here
;
;  HINT: 
;  This one may be a bit more challanging. You will
;  have to think outside the box. If using string instructions...
;  it should take you at least 5-6 lines minimum.
;  - Don't forget to set RCX!
;  
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  xor rax, rax ;zeroize rax
  xor rcx, rcx ;zeroize rcx
  xor rdx, rdx ;zeroize rdx
  mov rcx, 100 ;set rcx to 100
  mov rdx, rcx ;copy rcx to rdx
  repne scasb  ;scan the string until it finds a null-terminator
  sub rdx, rcx ;subtract rcx from rdx
  sub rdx, 1   ;subtract 1 to account for null-terminator in the count
  mov rax, rdx ;set rax to rdx
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    pop rbp
    ret


