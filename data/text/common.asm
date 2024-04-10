INCLUDE "constants.asm"


SECTION "Text 1", ROMX

if DEF(_FRENCH)
INCLUDE "data/text/common_1_french.asm"
else
INCLUDE "data/text/common_1.asm"
endc


SECTION "Text 2", ROMX

if DEF(_FRENCH)
INCLUDE "data/text/common_2_french.asm"
else
INCLUDE "data/text/common_2.asm"
endc


SECTION "Text 3", ROMX

INCLUDE "data/text/common_3.asm"

SECTION "Text 4", ROMX

INCLUDE "data/text/common_4.asm"
