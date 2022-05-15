#define __SFR_OFFSET 0
#include "avr/io.h"
.global start 
.global work

start:
SBI DDRB,5 // LED as output
CBI DDRB,0 // PB0 as input
CBI DDRB,1 // PB1 as input
SBI DDRB,2//PB2,3 as output
SBI DDRB,3
SBI PORTB,0 //PB0,1 pull up
SBI PORTB,1

work:
CBI PORTB,2 // PB2 as low 
SBI PORTB,3 //PB3 as high
IN R16,PINB //Pin B in R16
ANDI R16,0X0F //seperating first nibble
CPI R16,0X0A // comparng for whether key 1 is pressed
BRNE L1 // Not equal to L1
SBI PORTB,5 // Turn ON LED
RJMP L4

L1:
CPI R16,0X09 // check for key 4

BRNE L2
SBI PORTB,5
RJMP L4

L2:CBI PORTB,3
SBI PORTB,2
IN R16,PINB
ANDI R16,0X0F
CPI R16,0X06
BRNE L3
CBI PORTB,5
RJMP L4

L3:CPI R16,0X05
BRNE L5
CBI PORTB,5
RJMP L4

L5:CPI R16,0X0F
BRNE L4
CBI PORTB,5

L4:RET
