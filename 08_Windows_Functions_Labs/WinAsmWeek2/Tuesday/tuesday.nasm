;Name: Zackery Vering
;Date: 19 Oct 2018
;Project: Tuesday lab


bits 32

global _copy_string, _get_cpu_string@4, _set_flags

section .text


_copy_string:
;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;	This method takes 3 params:
;
;	Param 1: An empty buffer
;
;	Param 2: A NULL-terminated string
;
;	Given these two inputs, 
;	1.) Find the length of the string provided in
;	param 2
;	2.) Copy the string from param 2, to the empty buffer
;	provided in param 1.
;
;	void __cdecl copy_string(char* dest, char* src);
;
; BEGIN STUDENT CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;
xor eax, eax
mov edi, [esp + 4]             
mov ecx, [esp + 8]             
start_loop:                      
    xor edx, edx               
    mov dl, byte [ecx+eax]     
    inc eax                    
    cmp dl, 0x00                  
    jne start_loop              
    mov ecx, eax               
    add ecx, 1                 

copy_String:                    
    mov esi, [esp + 8]         
    rep movsb                  
    mov eax, edi               
    
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;
; END STUDENT CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;

_get_cpu_string@4:
;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;	This function takes 1 param:
;
;	Param 1: A zero'd character buffer, containing
;	13 elements.
;
;	The following steps must be performed:
;	1.) Call CPUID and get the vendor string
;	2.) Copy from ASCII bytes returned into the buffer
;	provided.
;	
;	void __stdcall get_cpu_string(char* buf);
;
;
; BEGIN STUDENT CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;
xor eax, eax      ;zero eax
mov edi, [esp + 4]
CPUID             ;call cpuid, values stored in ebx, edx, & ecx
mov eax, ebx      ;move ebx to eax
stosd             ;store eax into edi (edi is where buffer is located due to first arg)
mov eax, edx      ;move edx to eax
stosd             ;store eax into edi (edi is where buffer is located due to first arg)
mov eax, ecx      ;move ecx to eax
stosd             ;store eax into edi (edi is where buffer is located due to first arg)
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;
; END STUDENT CODE
;;;;;;;;;;;;;;;;;;;;;;;;;;


