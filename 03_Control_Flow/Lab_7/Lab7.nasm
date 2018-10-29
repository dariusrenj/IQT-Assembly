; Name: Zackery Vering
; Project: Lab 7
; Date: 16 Oct 2018

bits 64

global first_func, second_func, third_func

first_func:
    push rbp
    mov rbp, rsp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Two values have been provided,
;  with the first stored in RDI,
;  and the second in RSI. If the 
;  first is greater than the second,
;  set RAX equal to 1, if the second
;  is greater than the first, set
;  RAX equal to -1. If they are
;  both equal, set RAX to 0.
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cmp rdi, rsi  ;compare rdi and rsi
jl .lessThen  ;if rdi is less than rsi jump to .lessThen
je .equal     ;if rdi is equal to rsi jump to .equal
mov rax, 1    ;set rax to 1 as default for greater than
jmp .end      ;jump to end

.lessThen:
  mov rax, -1 ;set rax to -1
  jmp .end    ;jump to end

.equal:
  mov rax, 0 ;set rax to 0

.end:
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
;  a pointer to the start of an
;  array of numbers in RDI, and
;  the number of elements in the
;  array in RSI. Loop through the
;  array, adding all the numbers
;  together, and store the result
;  in RAX.
;
;  HINT:
;  NASM increments arrays by bytes, not bits
;  - ints are generally 4 bytes in size
;
;  Two ways to increment pointer:
;  1: Add 4 to pointer directly
;  2: Use incrementer and work within reference directly ex. 
;     add reg, [regb + regc*4]
;  Feel free to look this up more!
;  
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor rax, rax   ;zero out rax
xor rcx, rcx   ;zero out rcx

.loop:
  add ax, [rdi+4*rcx] ;add (r)ax and the number rdi is pointing to
  cmp rcx, rsi        ;compare rcx and rsi to see if the loop has itterated enough
  je .end             ;if rcx and rsi are equal, jump to end
  add rcx, 1          ;if rcx and rsi are not equal, increment rcx by 1
  jmp .loop           ;continue loop

.end:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    pop rbp
    ret

third_func:
    push rbp
    mov rbp, rsp
    xor rax, rax
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Find the length of the
;  provided, NULL-terminated 
;  string (a pointer to the 
;  beginning of which is 
;  currently stored in RDI),
;  and store the result in RAX.
;
;  BEGIN student code
;
;  HINT: 
;  Just like with second_func, except now we are dealing with chars
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor rax, rax   ;zero out rax
mov rcx, 0x00

.loop:
  cmp [rdi+rax], rcx ;compare the character at the current location to rcx to check for null-terminator
  je .end             ;if the character is a null-terminator, jump to end
  add rax, 1          ;if character is not null-terminator, increment rax by 1
  jmp .loop           ;continue loop

.end:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    pop rbp
    ret


