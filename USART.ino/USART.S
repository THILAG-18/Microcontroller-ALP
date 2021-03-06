#define __SFR_OFFSET 0
#include "avr/io.h"

.global start
.global work

start:

LDI R16,0X00
STS UBRR0H,R16
LDI R16,0X67
STS UBRR0L,R16
LDI R16,0X00
STS UCSR0A,R16
LDI R16,0X18
STS UCSR0B,R16
LDI R16,0X86
STS UCSR0C,R16
RET

work:

LDS R16,UCSR0A
ANDI R16,0X80
BREQ work
ORI R16,0X80
STS UCSR0A,R16
LDS R16,UDR0
INC R16
STS UDR0,R16
L1:LDS R16,UCSR0A
ANDI R16,0X40
BREQ L1
ORI R16,0X40
STS UCSR0A,R16
RET
