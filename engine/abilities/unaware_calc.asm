_UnawarePlayer::
; Player has Unaware during player's turn

	ldh a, [hBattleTurn]
	and a
	jp nz, _UnawareEnemy

	ld a, [wPlayerAbility]
	cp UNAWARE
	jr z, .CheckEnemyUnaware
	ld a, [wEnemyAbility]
	cp UNAWARE
	ret nz
	jp _UnawarePlayerDefense

.CheckEnemyUnaware:
	ld a, [wEnemyAbility]
	cp UNAWARE
	jp z, _UnawareBothPlayer

	ld hl, wPlayerMoveStructPower
	ld a, [hli]
	and a
	ld d, a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .specialattacker

.physicalattacker
	ld hl, wEnemyDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call HailDefBoost2

	ld a, [wEnemyScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcritattacker
	sla c
	rl b

.physicalcritattacker
	ld hl, wBattleMonAttack
	call CheckDamageStatsCritical2
	ld b,b
	jr c, .thickclub

	ld hl, wEnemyDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wPlayerAttack
	jr .thickclub

.specialattacker
	ld hl, wEnemySpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call SandstormSpDefBoost2

	ld a, [wEnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcritattacker
	sla c
	rl b

.specialcritattacker
	ld hl, wBattleMonSpclAtk
	call CheckDamageStatsCritical2
	jr c, .lightball

	ld hl, wEnemySpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wPlayerSpAtk
.lightball
	call LightBallBoost2
	jr .done

.thickclub
	call ThickClubBoost2

.done
	call TruncateHL_BC2

	ld a, [wBattleMonLevel]
	ld e, a
	call DittoMetalPowder2
	call UnevolvedEviolite2

	ld a, 1
	and a
	ret

_UnawarePlayerDefense::
; Enemy has Unaware during player's turn

	ld hl, wPlayerMoveStructPower
	ld a, [hli]
	and a
	ld d, a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .specialdefender

.physicaldefender
	ld hl, wEnemyMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call HailDefBoost2

	ld a, [wPlayerAbility]
	cp INFILTRATOR
	jr z, .physicalcritdefender
	ld a, [wEnemyScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcritdefender
	sla c
	rl b

.physicalcritdefender
	ld hl, wPlayerAttack
	call CheckDamageStatsCritical2
	jr c, .thickclub

	ld hl, wEnemyDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wPlayerAttack
	jr .thickclub

.specialdefender
	ld hl, wEnemyMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call SandstormSpDefBoost2

	ld a, [wPlayerAbility]
	cp INFILTRATOR
	jr z, .specialcritdefender
	ld a, [wEnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcritdefender
	sla c
	rl b

.specialcritdefender
	ld hl, wPlayerSpAtk
	call CheckDamageStatsCritical2
	jr c, .lightball

	ld hl, wEnemySpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wPlayerSpAtk
.lightball
	call LightBallBoost2
	jr .done

.thickclub
	call ThickClubBoost2

.done
	call TruncateHL_BC2

	ld a, [wBattleMonLevel]
	ld e, a
	call DittoMetalPowder2
	call UnevolvedEviolite2

	ld a, 1
	and a
	ret

_UnawareEnemy::
; Enemy has Unaware during enemy's turn

	ld a, [wEnemyAbility]
	cp UNAWARE
	jr z, .CheckPlayerEnemy
	ld a, [wPlayerAbility]
	cp UNAWARE
	ret nz
	jp _UnawareEnemyDefense

.CheckPlayerEnemy:
	ld a, [wPlayerAbility]
	cp UNAWARE
	jp z, _UnawareBothEnemy

	ld hl, wPlayerMoveStructPower
	ld a, [hli]
	and a
	ld d, a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .specialattacker

.physicalattacker
	ld hl, wPlayerDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call HailDefBoost2

	ld a, [wPlayerScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcritattacker
	sla c
	rl b

.physicalcritattacker
	ld hl, wEnemyMonAttack
	call CheckDamageStatsCritical2
	jr c, .thickclub

	ld hl, wPlayerDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemyAttack
	jr .thickclub

.specialattacker
	ld hl, wPlayerSpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call SandstormSpDefBoost2

	ld a, [wPlayerScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcritattacker
	sla c
	rl b

.specialcritattacker
	ld hl, wEnemyMonSpclAtk
	call CheckDamageStatsCritical2
	jr c, .lightball

	ld hl, wPlayerSpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemySpAtk
.lightball
	call LightBallBoost2
	jr .done

.thickclub
	call ThickClubBoost2

.done
	call TruncateHL_BC2

	ld a, [wBattleMonLevel]
	ld e, a
	call DittoMetalPowder2
	call UnevolvedEviolite2

	ld a, 1
	and a
	ret

_UnawareEnemyDefense::
; Player has Unaware during enemy's turn

	ld hl, wPlayerMoveStructPower
	ld a, [hli]
	and a
	ld d, a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .specialdefender

.physicaldefender
	ld hl, wBattleMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call HailDefBoost2

	ld a, [wEnemyAbility]
	cp INFILTRATOR
	jr z, .physicalcritdefender
	ld a, [wPlayerScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcritdefender
	sla c
	rl b

.physicalcritdefender
	ld hl, wEnemyAttack
	call CheckDamageStatsCritical2
	jr c, .thickclub

	ld hl, wPlayerDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemyAttack
	jr .thickclub

.specialdefender
	ld hl, wBattleMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call SandstormSpDefBoost2

	ld a, [wEnemyAbility]
	cp INFILTRATOR
	jr z, .specialcritdefender
	ld a, [wPlayerScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcritdefender
	sla c
	rl b

.specialcritdefender
	ld hl, wEnemySpAtk
	call CheckDamageStatsCritical2
	jr c, .lightball

	ld hl, wPlayerSpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemySpAtk
.lightball
	call LightBallBoost2
	jr .done

.thickclub
	call ThickClubBoost2

.done
	call TruncateHL_BC2

	ld a, [wBattleMonLevel]
	ld e, a
	call DittoMetalPowder2
	call UnevolvedEviolite2

	ld a, 1
	and a
	ret

_UnawareBothPlayer::
; Player has Unaware during player's turn

	ld hl, wPlayerMoveStructPower
	ld a, [hli]
	and a
	ld d, a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .specialattacker

.physicalattacker
	ld hl, wEnemyDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call HailDefBoost2

	ld a, [wEnemyScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcritattacker
	sla c
	rl b

.physicalcritattacker
	ld hl, wPlayerAttack
	jr .thickclub

.specialattacker
	ld hl, wEnemySpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call SandstormSpDefBoost2

	ld a, [wEnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcritattacker
	sla c
	rl b

.specialcritattacker
	ld hl, wPlayerSpAtk
.lightball
	call LightBallBoost2
	jr .done

.thickclub
	call ThickClubBoost2

.done
	call TruncateHL_BC2

	ld a, [wBattleMonLevel]
	ld e, a
	call DittoMetalPowder2
	call UnevolvedEviolite2

	ld a, 1
	and a
	ret

_UnawareBothEnemy::
; Player has Unaware during player's turn

	ld hl, wPlayerMoveStructPower
	ld a, [hli]
	and a
	ld d, a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .specialattacker

.physicalattacker
	ld hl, wPlayerDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call HailDefBoost2

	ld a, [wPlayerScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcritattacker
	sla c
	rl b

.physicalcritattacker
	ld hl, wEnemyAttack
	jr .thickclub

.specialattacker
	ld hl, wPlayerSpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call SandstormSpDefBoost2

	ld a, [wPlayerScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcritattacker
	sla c
	rl b

.specialcritattacker
	ld hl, wEnemySpAtk
.lightball
	call LightBallBoost2
	jr .done

.thickclub
	call ThickClubBoost2

.done
	call TruncateHL_BC2

	ld a, [wBattleMonLevel]
	ld e, a
	call DittoMetalPowder2
	call UnevolvedEviolite2

	ld a, 1
	and a
	ret

TruncateHL_BC2:
.loop
; Truncate 16-bit values hl and bc to 8-bit values b and c respectively.
; b = hl, c = bc

	ld a, h
	or b
	jr z, .finish

	srl b
	rr c
	srl b
	rr c

	ld a, c
	or b
	jr nz, .done_bc
	inc c

.done_bc
	srl h
	rr l
	srl h
	rr l

	ld a, l
	or h
	jr nz, .finish
	inc l

.finish
; If we go back to the loop point,
; it's the same as doing this exact
; same check twice.
	ld a, h
	or b
	jr nz, .loop

	ld b, l
	ret

CheckDamageStatsCritical2:
; Return carry if boosted stats should be used in damage calculations.
; Unboosted stats should be used if the attack is a critical hit,
;  and the stage of the opponent's defense is higher than the user's attack.

	ld a, [wCriticalHit]
	and a
	scf
	ret z

	push hl
	push bc
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wPlayerMoveStructType]
	cp SPECIAL
; special
	ld a, [wPlayerSAtkLevel]
	ld b, a
	ld a, [wEnemySDefLevel]
	jr nc, .end
; physical
	ld a, [wPlayerAtkLevel]
	ld b, a
	ld a, [wEnemyDefLevel]
	jr .end

.enemy
	ld a, [wEnemyMoveStructType]
	cp SPECIAL
; special
	ld a, [wEnemySAtkLevel]
	ld b, a
	ld a, [wPlayerSDefLevel]
	jr nc, .end
; physical
	ld a, [wEnemyAtkLevel]
	ld b, a
	ld a, [wPlayerDefLevel]
.end
	cp b
	pop bc
	pop hl
	ret

ThickClubBoost2:
; Return in hl the stat value at hl.

; If the attacking monster is Cubone or Marowak and
; it's holding a Thick Club, double it.
	push bc
	push de
	ld bc, CUBONE
	ld d, THICK_CLUB
	call SpeciesItemBoost2
	if MAROWAK == (CUBONE + 1)
		inc bc
	else
		ld bc, MAROWAK
	endc
	call DoubleStatIfSpeciesHoldingItem2
	pop de
	pop bc
	ret

LightBallBoost2:
; Return in hl the stat value at hl.

; If the attacking monster is Pikachu and it's
; holding a Light Ball, double it.
	push bc
	push de
	ld bc, PIKACHU
	ld d, LIGHT_BALL
	call SpeciesItemBoost2
	if RAICHU == (PIKACHU + 1)
		inc bc
	else
		ld bc, RAICHU
	endc
	call DoubleStatIfSpeciesHoldingItem2
	pop de
	pop bc
	ret

SpeciesItemBoost2:
; Return in hl the stat value at hl.

; If the attacking monster is species bc and
; it's holding item d, double it.

	ld a, [hli]
	ld l, [hl]
	ld h, a
	; fallthrough

DoubleStatIfSpeciesHoldingItem2:
; If the attacking monster is species bc and
; it's holding item d, double the stat in hl.

	push hl
	ld a, MON_SPECIES
	call BattlePartyAttr

	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr z, .CompareSpecies
	ld a, [wTempEnemyMonSpecies]
.CompareSpecies:

	call GetPokemonIndexFromID
	ld a, h
	cp b
	ld a, l
	pop hl
	ret nz
	cp c
	ret nz

	push hl
	call GetUserItem2
	ld a, [hl]
	pop hl
	cp d
	ret nz

; Double the stat
	sla l
	rl h
	ret

GetUserItem2:
; Return the effect of the user's item in bc, and its id at hl.
	ld hl, wBattleMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wEnemyMonItem
.go
	push hl
	call IsOpponentItemUsable
	pop hl
	ld b, [hl]
	jp z, GetItemHeldEffect2
	ld bc, 0
	ret

DittoMetalPowder2:
	ld a, MON_SPECIES
	call BattlePartyAttr
	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .Ditto
	ld a, [wTempEnemyMonSpecies]

.Ditto:
	push hl
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(DITTO)
	if HIGH(DITTO) == 0
		or h
		pop hl
	else
		ld a, h
		pop hl
		ret nz
		if HIGH(DITTO) == 1
			dec a
		else
			cp HIGH(DITTO)
		endc
	endc
	ret nz

	push bc
	call GetOpponentItem2
	ld a, [hl]
	cp METAL_POWDER
	pop bc
	ret nz

	ld a, c
	srl a
	add c
	ld c, a
	ret nc

	srl b
	ld a, b
	and a
	jr nz, .done
	inc b
.done
	scf
	rr c
	ret

GetOpponentItem2:
; Return the effect of the opponent's item in bc, and its id at hl.
	ld hl, wEnemyMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wBattleMonItem
.go
	ld b, [hl]

	; Check if item is usable
	push hl
	call IsOpponentItemUsable
	pop hl
	jr z, GetItemHeldEffect2
	ld bc, 0
	ret

GetItemHeldEffect2:
; Return the effect of item b in bc.
	ld a, b
	and a
	ret z

	push hl
	ld hl, ItemAttributes + ITEMATTR_EFFECT
	dec a
	ld c, a
	ld b, 0
	ld a, ITEMATTR_STRUCT_LENGTH
	call AddNTimes
	ld a, BANK(ItemAttributes)
	call GetFarHalfword
	ld b, l
	ld c, h
	pop hl
	ret

UnevolvedEviolite2:
; get the defender's species
	ld a, MON_SPECIES
	call BattlePartyAttr
	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .got_species
	ld a, [wTempEnemyMonSpecies]

.got_species
; check if the defender has any evolutions
; hl := EvosAttacksPointers + (species - 1) * 2
	dec a
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
; hl := the species' entry from EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
; a := the first byte of the species' *EvosAttacks data
	ld a, BANK("Evolutions and Attacks 1")
	ld a, BANK("Evolutions and Attacks 2")
	call GetFarByte
; if a == 0, there are no evolutions, so don't boost stats
	and a
	pop bc
	pop hl
	ret z

; check if the defender's item is Eviolite
	push bc
	call GetOpponentItem2
	ld a, b
	cp HELD_EVIOLITE
	pop bc
	ret nz

; boost the relevant defense stat in bc by 50%
	ld a, c
	srl a
	add c
	ld c, a
	ret nc

	srl b
	ld a, b
	and a
	jr nz, .done
	inc b
.done
	scf
	rr c
	ret

SandstormSpDefBoost2:
; First, check if Sandstorm is active.
	call CheckCloudNine
	ret z
.SkipCloudNine
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	ret nz

; Then, check the opponent's types.
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonType1
.ok
	ld a, [hli]
	cp ROCK
	jr z, .start_boost
	ld a, [hl]
	cp ROCK
	ret nz

.start_boost
	ld h, b
	ld l, c
	srl b
	rr c
	add hl, bc
	ld b, h
	ld c, l
	ret

HailDefBoost2:
; First, check if Hail is active.
	call CheckCloudNine
	ret z
.SkipCloudNine
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	ret nz

; Then, check the opponent's types.
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonType1
.ok
	ld a, [hli]
	cp ICE
	jr z, .start_boost
	ld a, [hl]
	cp ICE
	ret nz

.start_boost
	ld h, b
	ld l, c
	srl b
	rr c
	add hl, bc
	ld b, h
	ld c, l
	ret
