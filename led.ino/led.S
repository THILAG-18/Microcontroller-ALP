#define __SFR_OFFSET 0

#include "avr/io.h"

.global start
.global work

start:
SBI DDRB,5
CBI DDRB,0
SBI PORTB,0
RET

work:
SBIS PINB,0
SBI PORTB,5
SBIC PINB,0
CBI PORTB,5
RET
