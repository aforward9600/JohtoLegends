GenerateShinySwarm:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp DARK_CAVE
	jr z, .dunsparce
	cp ROUTE_39
	jr z, .yanma
	cp WILD_AREA_OUTSIDE
	jr z, .wildarea
	cp ICE_PATH
	jr z, .sneasel
	cp BURNED_TOWER
	jp z, .misdreavus
	cp NATIONAL_PARK
	jp z, .pinsir
	cp ROUTE_38
	jp z, .scyther
	cp MT_MORTAR
	jp z, .aron
	cp ROUTE_43
	jp z, .ralts
	cp LAKE_OF_RAGE
	jp z, .croagunk
	jp .skipshineswarm

.dunsparce
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(DUNSPARCE)
	if HIGH(DUNSPARCE) == 0
		or h
	else
		jr nz, .skipshineswarm
		if HIGH(DUNSPARCE)
			dec h
		else
			ld a, h
			cp HIGH(DUNSPARCE)
		endc
	endc
	jp nz, .skipshineswarm
	jp .rollshiny

.yanma
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(YANMA)
	if HIGH(YANMA) == 0
		or h
	else
		jr nz, .skipshineswarm
		if HIGH(YANMA) == 1
			dec h
		else
			ld a, h
			cp HIGH(YANMA)
		endc
	endc
	jp nz, .skipshineswarm
	jp .rollshiny

.wildarea
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(QWILFISH)
	if HIGH(QWILFISH) == 0
		or h
	else
		jr nz, .skipshineswarm
		if HIGH(QWILFISH) == 1
			dec h
		else
			ld a, h
			cp HIGH(QWILFISH)
		endc
	endc
	jr nz, .eevee
	jp .rollshiny

.eevee
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(EEVEE)
	if HIGH(EEVEE) == 0
		or h
	else
		jr nz, .skipshineswarm
		if HIGH(EEVEE) == 1
			dec h
		else
			ld a, h
			cp HIGH(EEVEE)
		endc
	endc
	jr nz, .kangaskhan
	jp .rollshiny

.kangaskhan
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(KANGASKHAN)
	if HIGH(KANGASKHAN) == 0
		or h
	else
		jr nz, .skipshineswarm
		if HIGH(KANGASKHAN) == 1
			dec h
		else
			ld a, h
			cp HIGH(KANGASKHAN)
		endc
	endc
	jr nz, .gible
	jr .rollshiny

.gible
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(GIBLE)
	if HIGH(GIBLE) == 0
		or h
	else
		jp nz, .skipshineswarm
		if HIGH(GIBLE) == 1
			dec h
		else
			ld a, h
			cp HIGH(GIBLE)
		endc
	endc
	jp nz, .skipshineswarm
	jr .rollshiny

.sneasel
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(SNEASEL)
	if HIGH(SNEASEL) == 0
		or h
	else
		jr nz, .skipshineswarm
		if HIGH(SNEASEL) == 1
			dec h
		else
			ld a, h
			cp HIGH(SNEASEL)
		endc
	endc
	jr nz, .skipshineswarm
	jr .rollshiny

.misdreavus
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(MISDREAVUS)
	if HIGH(MISDREAVUS) == 0
		or h
	else
		jr nz, .skipshineswarm
		if HIGH(MISDREAVUS)
			dec h
		else
			ld a, h
			cp HIGH(MISDREAVUS)
		endc
	endc
	jr nz, .skipshineswarm
	jr .rollshiny

.pinsir
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(PINSIR)
	if HIGH(PINSIR) == 0
		or h
	else
		jr nz, .skipshineswarm
		if HIGH(PINSIR)
			dec h
		else
			ld a, h
			cp HIGH(PINSIR)
		endc
	endc
	jr nz, .skipshineswarm
	jr .rollshiny

.scyther
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(SCYTHER)
	if HIGH(SCYTHER) == 0
		or h
	else
		jr nz, .skipshineswarm
		if HIGH(SCYTHER)
			dec h
		else
			ld a, h
			cp HIGH(SCYTHER)
		endc
	endc
	jr nz, .skipshineswarm
	jr .rollshiny

.aron
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(ARON)
	if HIGH(ARON) == 0
		or h
	else
		jr nz, .skipshineswarm
		if HIGH(ARON)
			dec h
		else
			ld a, h
			cp HIGH(ARON)
		endc
	endc
	jr nz, .skipshineswarm
	jr .rollshiny

.ralts
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(RALTS)
	if HIGH(RALTS) == 0
		or h
	else
		jr nz, .skipshineswarm
		if HIGH(RALTS)
			dec h
		else
			ld a, h
			cp HIGH(RALTS)
		endc
	endc
	jr nz, .skipshineswarm
	jr .rollshiny

.croagunk
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(CROAGUNK)
	if HIGH(CROAGUNK) == 0
		or h
	else
		jr nz, .skipshineswarm
		if HIGH(CROAGUNK)
			dec h
		else
			ld a, h
			cp HIGH(CROAGUNK)
		endc
	endc
	jr nz, .skipshineswarm
	jr .rollshiny

.rollshiny
	call Random
	cp 7
	jr nc, .trynext
	ld b, ATKDEFDV_SHINY ; $ea
	ld c, SPDSPCDV_SHINY ; $aa
	jr .UpdateDVsSwarm
.trynext:
	call Random
	cp 7
	jr nc, .skipshineswarm
	ld b, ATKDEFDV_SHINYF ; 1a
	ld c, SPDSPCDV_SHINY ; $aa
	jr .UpdateDVsSwarm

.skipshineswarm:
; Generate new random DVs
	call BattleRandom
	ld b, a
	call BattleRandom
	ld c, a

.UpdateDVsSwarm:
; Input DVs in register bc
	ld hl, wEnemyMonDVs
	ld a, b
	ld [hli], a
	ld [hl], c
	ret
