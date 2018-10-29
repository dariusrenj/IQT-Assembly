;Name: Zackery Vering
;Project: Lab 9
;Date: 18 Oct 2018


bits 64

global first_func, second_func, third_func

extern printf
mystr  db "Success!", 0xa, 0x00

first_func:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  The function printf has been
;  externed in (above). Call it,
;  passing mystr (also defined
;  above), as its only argument.
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    xor rax, rax   ;zeroize rax
    mov rdi, mystr ;copy mystr to rdi
    call printf    ;call printf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret

extern strlen

second_func:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Your function will be called
;  with two arguments: a function
;  pointer (the first parameter),
;  and a string (the second). The
;  function pointer takes two
;  arguments: a string, and a length.
;  You will need to call strlen
;  (above), passing in the string,
;  and pass the results to the
;  function pointer (along with the
;  string). Return the string you get
;  back from the function. 
;
;  This lab requires a lot of instructions
;
;  It may be wise to seperate the instructions
;  into logical sections. 
;
;  -Very first thing you need to do is figure out calling convention
;  -You will first need to ensure you preserve values
;  -Then you will need to get the string length of the string provided via argument
;  -After which, you need to pass the string and string length to the 
;   function pointer and then call the function pointer.
;  
;  HINTS: 
;  - Preserve values, you will def need to preserve function pointer for call
;  - Some arguments will need to be preserved/reassigned to different registers
;    in order to be passed/called later. 
;
; 
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  xor rax, rax ;zeroize rax
  push rdi     ;push rdi to preserve data
  mov rdi, rsi ;move data from rsi to rdi
  call strlen  ;call strlen
  mov rsi, rax ;move strlen from rax to rsi
  pop rcx      ;pop preserved data from stack to rcx
  call rcx     ;call rcx
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret

third_func:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Calculate the Nth fibonacci
;  number (where N is the value
;  passed to your method as the
;  only parameter).
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  mov rcx, rdi  ;move rdi to rcx for a counter
  xor rax, rax  ;zeroize rax
  mov rax, 0    ;set rax to zero
  xor rsi, rsi  ;zeroize rsi
  mov rsi, 1    ;set rsi to one
  .fib_loop:
    mov rdi, rax  ;copy rax to rdi
    add rdi, rsi  ;add rsi to rdi
    mov rax, rsi  ;copy rsi to rax
    mov rsi, rdi  ;copy rdi to rsi
    loop .fib_loop  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret


