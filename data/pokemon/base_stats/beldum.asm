	db 0 ; species ID placeholder

	db  40,  55,  80,  30,  35,  60
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, PSYCHIC ; type
	db 15 ; catch rate
	db 103 ; base exp
	db STEEL_DAGGER, METAL_COAT ; items
	db GENDER_UNKNOWN ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/beldum/front.dimensions"
	db CLEAR_BODY, CLEAR_BODY, ANALYTIC ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm IRON_HEAD
	; end
