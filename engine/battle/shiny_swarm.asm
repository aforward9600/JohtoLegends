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
	jr z, .magcargo
	cp NATIONAL_PARK
	jr z, .pinsir
	cp ROUTE_38
	jp z, .scyther
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
	jr .rollshiny

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
	jr .rollshiny

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
		jr nz, .skipshineswarm
		if HIGH(GIBLE) == 1
			dec h
		else
			ld a, h
			cp HIGH(GIBLE)
		endc
	endc
	jr nz, .skipshineswarm
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

.magcargo
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(MAGCARGO)
	if HIGH(MAGCARGO) == 0
		or h
	else
		jr nz, .skipshineswarm
		if HIGH(MAGCARGO)
			dec h
		else
			ld a, h
			cp HIGH(MAGCARGO)
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
