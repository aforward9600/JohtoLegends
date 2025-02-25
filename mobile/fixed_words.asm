; These functions seem to be related to the selection of preset phrases
; for use in mobile communications.  Annoyingly, they separate the
; Battle Tower function above from the data it references.

Function11c1ab:
	ret

String_11c3bc:
	db "ーーーーー@"

INCLUDE "data/pokemon/ezchat_order.asm"

GFX_11d67e:
INCBIN "gfx/pokedex/select_start.2bpp"

LZ_11d6de:
INCBIN "gfx/pokedex/slowpoke.2bpp.lz"
