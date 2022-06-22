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
	cp OLIVINE_CITY
	jr z, .qwilfish
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
	jr nz, .skipshineswarm
	jr .rollshiny

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
	jr nz, .skipshineswarm
	jr .rollshiny

.qwilfish
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
