#define __SFR_OFFSET 0
#include "avr/io.h"

.global start
.global work

start:
SBI DDRB,1
CBI DDRD,2
SBI PORTD,2
SBI DDRB,5
CBI PORTB,5
LDI R16,0X81
STS TCCR1A,R16
LDI R16,0X01
STS TCCR1B,R16
LDI R16,0X00
STS OCR1AH,R16
LDI R17,0X10
LDI R18,0XFF
RET

work:
SBIS PIND,2
STS OCR1AL,R18
SBIC PIND,2
STS OCR1AL,R17

SBIS PINB,1
CBI PORTB,5
SBIC PINB,1
SBI PORTB,5
RET
