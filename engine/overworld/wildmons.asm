LoadWildMonData:
	call _GrassWildmonLookup
	jr c, .copy
	ld hl, wMornEncounterRate
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	jr .done_copy

.copy
	inc hl
	inc hl
	ld de, wMornEncounterRate
	ld bc, 3
	call CopyBytes
	ld a, [wNiteEncounterRate]
	ld [wEveEncounterRate], a
.done_copy
	call _WaterWildmonLookup
	ld a, 0
	jr nc, .no_copy
	inc hl
	inc hl
	ld a, [hl]
.no_copy
	ld [wWaterEncounterRate], a
	ret

GetTimeOfDayNotEve:
	ld a, [wTimeOfDay]
	cp EVE_F
	ret nz
	ld a, NITE_F ; ld a, DAY_F to make evening use day encounters
	ret

FindNest:
; Parameters:
; e: 0 = Johto, 1 = Kanto
; wNamedObjectIndexBuffer: species
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	ld a, [wNamedObjectIndexBuffer]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld a, e
	cp 1
	jr z, .kanto
	cp 2
	jr z, .sevii
	decoord 0, 0
	ld hl, JohtoGrassWildMons
	call .FindGrass
	ld hl, JohtoWaterWildMons
	jr .FindWater

.kanto
	decoord 0, 0
	ld hl, KantoGrassWildMons
	call .FindGrass
	ld hl, KantoWaterWildMons
	jr .FindWater

.sevii
	decoord 0, 0
	ld hl, SeviiGrassWildMons
	call .FindGrass
	ld hl, SeviiWaterWildMons
	jr .FindWater

.FindGrass:
	ld a, [hl]
	cp -1
	ret z
	push bc
	push hl
	; use the math buffers as storage, since we're not doing any math
	ld a, [hli]
	ldh [hMathBuffer], a
	ld a, [hli]
	ldh [hMathBuffer + 1], a
	inc hl
	inc hl
	inc hl
	ld a, NUM_GRASSMON * 3
	call .SearchMapForMon
	jr nc, .next_grass
	ld [de], a
	inc de

.next_grass
	pop hl
	ld bc, GRASS_WILDDATA_LENGTH
	add hl, bc
	pop bc
	jr .FindGrass

.FindWater:
	ld a, [hl]
	cp -1
	ret z
	push bc
	push hl
	; use the math buffers as storage, since we're not doing any math
	ld a, [hli]
	ldh [hMathBuffer], a
	ld a, [hli]
	ldh [hMathBuffer + 1], a
	inc hl
	ld a, NUM_WATERMON
	call .SearchMapForMon
	jr nc, .next_water
	ld [de], a
	inc de

.next_water
	pop hl
	ld bc, WATER_WILDDATA_LENGTH
	add hl, bc
	pop bc
	jr .FindWater

.SearchMapForMon:
	inc hl
.ScanMapLoop:
	push af
	ld a, [hli]
	cp c
	ld a, [hli]
	jr nz, .next_mon
	cp b
	jr z, .found
.next_mon
	inc hl
	pop af
	dec a
	jr nz, .ScanMapLoop
	and a
	ret

.found
	pop af
	ldh a, [hMathBuffer]
	ld b, a
	ldh a, [hMathBuffer + 1]
	ld c, a

.AppendNest:
	push de
	call GetWorldMapLocation
	ld c, a
	hlcoord 0, 0
	ld de, SCREEN_WIDTH * SCREEN_HEIGHT
.AppendNestLoop:
	ld a, [hli]
	cp c
	jr z, .found_nest
	dec de
	ld a, e
	or d
	jr nz, .AppendNestLoop
	ld a, c
	pop de
	scf
	ret

.found_nest
	pop de
	and a
	ret

TryWildEncounter::
; Try to trigger a wild encounter.
	call ChooseWildEncounter
	jr nz, .no_battle
	call .EncounterRate
	jr nc, .no_battle
	call CheckRepelEffect
	jr nc, .no_battle
	xor a
	ret

.no_battle
	xor a ; BATTLETYPE_NORMAL
	ld [wTempWildMonSpecies], a
	ld [wBattleType], a
	ld a, 1
	and a
	ret

.EncounterRate:
	call GetMapEncounterRate
	call ApplyMusicEffectOnEncounterRate
	call ApplyCleanseTagEffectOnEncounterRate
	call SetBattlerLevel
	call ApplyAbilityEffectsOnEncounterMon
	call Random
	cp b
	ret

GetMapEncounterRate:
	ld hl, wMornEncounterRate
	call CheckOnWater
	ld a, wWaterEncounterRate - wMornEncounterRate
	jr z, .ok
	call GetTimeOfDayNotEve
.ok
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	ret

ApplyMusicEffectOnEncounterRate::
; Pokemon March and Ruins of Alph signal double encounter rate.
; Pokemon Lullaby halves encounter rate.
	ld a, [wMapMusic]
	cp MUSIC_POKEMON_MARCH
	jr z, .double
	cp MUSIC_RUINS_OF_ALPH_RADIO
	jr z, .double
	cp MUSIC_POKEMON_LULLABY
	ret nz
	srl b
	ret

.double
	sla b
	ret

ApplyCleanseTagEffectOnEncounterRate::
; Cleanse Tag halves encounter rate.
	ld hl, wPartyMon1Item
	ld de, PARTYMON_STRUCT_LENGTH
	ld a, [wPartyCount]
	ld c, a
.loop
	ld a, [hl]
	cp CLEANSE_TAG
	jr z, .cleansetag
	add hl, de
	dec c
	jr nz, .loop
	ret

.cleansetag
	srl b
	ret

SetBattlerLevel:
	push bc
	ld hl, wPartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH - 1

.loop
	ld a, [hli]
	or [hl]
	jr nz, .ok
	add hl, bc
	jr .loop

.ok
	pop bc
rept 4
	dec hl
endr
	ld c, [hl]
	ret

ChooseWildEncounter:
	ld c, $ff
_ChooseWildEncounter:
	push bc
	call LoadWildMonDataPointer
	pop bc
	jp nc, .nowildbattle

	push bc
	ld a, c
	add 1
	call c, CheckEncounterRoamMon
	pop bc
	jp c, .startwildbattle

	inc hl
	inc hl
	inc hl
	push bc
	call CheckOnWater
	ld de, WaterMonProbTable
	jr z, .got_table
	inc hl
	inc hl
	call GetTimeOfDayNotEve
	ld bc, NUM_GRASSMON * 3
	call AddNTimes
	ld de, GrassMonProbTable

.got_table
	pop bc
	ld b, 0
	inc hl
	push af

.encounter_loop
	push hl
.randomloop
	push bc
	inc c
	jr z, .type_check_done


	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld a, BANK(BaseData)
	ld hl, BaseData
	call LoadIndirectPointer
	ld bc, BASE_TYPES
	add hl, bc
	ld b, a
	call GetFarByte
	inc hl
	ld c, a
	ld a, b
	call GetFarByte
	ld l, c
	pop bc
	push bc
	cp c
	jr z, .type_check_done
	ld a, l
	cp c
	jr nz, .next

.type_check_done
	pop bc

	push bc
	ld a, [de]
	ld c, a
	add b
	ld b, a
	call RandomRange
	cp c
	ld a, b
	pop bc
	ld b, a
	push bc
	jr nc, .next

	pop bc
	pop hl
	pop af
	ld a, e
	push af
	push hl
	push bc
.next
	pop bc
	pop hl

	inc hl
	inc hl
	inc hl
	inc de

	ld a, [de]
	and a
	jr nz, .encounter_loop

	ld a, b
	and a
	pop bc

	jp z, .nowildbattle

	ld a, b
	sub e
	ld e, a
	ld d, $ff

	add hl, de
	add hl, de
	add hl, de

	dec hl
	ld a, [hli]
	ld b, a
; If the Pokemon is encountered by surfing, we need to give the levels some variety.
	call CheckOnWater
	jr nz, .ok
; Check if we buff the wild mon, and by how much.
	call Random
	cp 35 percent
	jr c, .waterdone
	inc b
	cp 65 percent
	jr c, .waterdone
	inc b
	cp 85 percent
	jr c, .waterdone
	inc b
	cp 95 percent
	jr c, .waterdone
	inc b
	jr .waterdone
; Store the level
.ok
	call Random
	cp 35 percent
	jr c, .waterdone
	inc b
	cp 65 percent
	jr c, .waterdone
	inc b
	cp 85 percent
	jr c, .waterdone
	inc b
.waterdone
	ld a, b
	ld [wCurPartyLevel], a

	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ValidateTempWildMonSpecies
	jr c, .nowildbattle

	ld a, [wMapTileset]
	cp TILESET_RUINS_OF_ALPH
	jr nz, .done

	ld a, [wBattleType]
	cp BATTLETYPE_SUICUNE
	jr z, .done

	ld a, [wUnlockedUnowns]
	and a
	jr z, .nowildbattle

.done
	call GetPokemonIDFromIndex
	ld [wTempWildMonSpecies], a

.startwildbattle
	xor a
	ret

.nowildbattle
	ld a, 1
	and a
	ret

INCLUDE "data/wild/probabilities.asm"

CheckRepelEffect::
; If there is no active Repel, there's no need to be here.
	ld a, [wRepelEffect]
	and a
	jr z, .encounter
	call SetBattlerLevel

	ld a, [wCurPartyLevel]
	cp c
.encounter
	ccf
	ret

ApplyAbilityEffectsOnEncounterMon:
	call GetLeadAbility
	and a
	ret z
	ld hl, .AbilityEffects
	jp BattleJumptable
	ret

.AbilityEffects:
	dbw ARENA_TRAP,   .ArenaTrap
	dbw FLASH_FIRE,   .FlashFire
	dbw HUSTLE,       .Hustle
	dbw ILLUMINATE,   .Illuminate
	dbw INTIMIDATE,   .Intimidate
	dbw KEEN_EYE,     .KeenEye
	dbw MAGNET_PULL,  .MagnetPull
	dbw PRESSURE,     .Pressure
	dbw STATIC,       .Static
	dbw STENCH,       .Stench
	dbw VITAL_SPIRIT, .VitalSpirit
	dbw QUICK_FEET,   .QuickFeet
	dbw INFILTRATOR,  .Infiltrator
	dbw NO_GUARD,     .NoGuard
	db -1, -1

.NoGuard:
.ArenaTrap:
.Illuminate:
.double_encounter_rate
	sla b
	ret nc
	ld b, $ff
	ret

.Stench:
.QuickFeet:
.Infiltrator:
.halve_encounter_rate
	srl b
.avoid_rate_underflow
	ld a, b
	and a
	ret nz
	ld b, 1
	ret

.Hustle:
.Pressure:
.VitalSpirit:
	call Random
	rrca
	ret c
	ld a, c
	cp 100
	ret nc
	inc c
	ret

.Intimidate:
.KeenEye:
	ld a, [wCurPartyLevel]
	add 5
	cp c
	ret nc
	jr .halve_encounter_rate

.FlashFire:
	push bc
	ld c, FIRE
	jr .force_wildtype
.MagnetPull:
	push bc
	ld c, STEEL
	jr .force_wildtype
.Static:
	push bc
	ld c, ELECTRIC
.force_wildtype
	call Random
	add a
	call nc, _ChooseWildEncounter
	pop bc
	ret

LoadWildMonDataPointer:
	call CheckOnWater
	jr z, _WaterWildmonLookup

_GrassWildmonLookup:
	ld hl, SwarmGrassWildMonsAlt
	push hl
	ld hl, wSwarmFlags
	bit SWARMFLAGS_ALT_SWARM_F, [hl]
	pop hl
	jr nz, .nextgrass
	ld hl, SwarmGrassWildMons
.nextgrass
	ld bc, GRASS_WILDDATA_LENGTH
	call _SwarmWildmonCheck
	ret c
	ld hl, JohtoGrassWildMons
	ld de, KantoGrassWildMons
	ld bc, SeviiGrassWildMons
	call _JohtoWildmonCheck
	ld bc, GRASS_WILDDATA_LENGTH
	jp _NormalWildmonOK

_WaterWildmonLookup:
	ld hl, SwarmWaterWildMons
	ld bc, WATER_WILDDATA_LENGTH
	call _SwarmWildmonCheck
	ret c
	ld hl, JohtoWaterWildMons
	ld de, KantoWaterWildMons
	ld bc, SeviiWaterWildMons
	call _JohtoWildmonCheck
	ld bc, WATER_WILDDATA_LENGTH
	ld a, [wMapGroup]
	ld d, a
	ld a, [wMapNumber]
	ld e, a
	jp LookUpWildmonsForMapDE

_JohtoWildmonCheck:
	push bc
	call IsInJohto
	and a
	pop bc
	ret z
	cp 2
	jr z, .sevii
	ld h, d
	ld l, e
	ret

.sevii
	ld h, b
	ld l, c
	ret

_SwarmWildmonCheck:
	call CopyCurrMapDE
	ld a, [wSwarmMapGroup]
	cp d
	jr nz, _NoSwarmWildmon
	ld a, [wSwarmMapNumber]
	cp e
	jr nz, _NoSwarmWildmon
	call LookUpWildmonsForMapDE
	jr nc, _NoSwarmWildmon
	scf
	ret

_NoSwarmWildmon:
	and a
	ret

_NormalWildmonOK:
	call CopyCurrMapDE
	jr LookUpWildmonsForMapDE

CopyCurrMapDE:
	push bc
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	ld d, b
	ld e, c
	push de
	call GetWorldMapLocation
	pop de
	pop bc
	ret
	cp MT_EMBER
	jr z, .LoadMtEmber
	cp ICEFALL_CAVE
	jr z, .LoadIcefallCave
	cp SPROUT_TOWER
	jr z, .LoadSproutTower
	cp TANOBI_RUINS
	jr z, .LoadTanobiRuins
	cp UNION_CAVE
	jr z, .LoadUnionCave
	cp WHIRL_ISLANDS
	jr z, .LoadWhirlIsland
	ret

.LoadMtEmber:
	ld a, GROUP_MT_EMBER_OUTSIDE
	ld d, a
	ld a, MAP_MT_EMBER_OUTSIDE
	ld e, a
	ret

.LoadIcefallCave:
	ld a, GROUP_ICEFALL_CAVE_ENTRANCE
	ld d, a
	ld a, MAP_ICEFALL_CAVE_ENTRANCE
	ld e, a
	ret

.LoadSproutTower:
	ld a, GROUP_SPROUT_TOWER_1F
	ld d, a
	ld a, MAP_SPROUT_TOWER_1F
	ld e, a
	ret

.LoadTanobiRuins:
	ld a, GROUP_TANOBI_RUINS_INSIDE
	ld d, a
	ld a, MAP_TANOBI_RUINS_INSIDE
	ld e, a
	ret

.LoadUnionCave:
	ld a, GROUP_UNION_CAVE_1F
	ld d, a
	ld a, MAP_UNION_CAVE_1F
	ld e, a
	ret

.LoadWhirlIsland:
	ld a, GROUP_WHIRL_ISLAND_CAVE
	ld d, a
	ld a, MAP_WHIRL_ISLAND_CAVE
	ld e, a
	ret

LookUpGrassJohtoWildmons::
	ld hl, JohtoGrassWildMons
	ld bc, GRASS_WILDDATA_LENGTH
LookUpWildmonsForMapDE:
.loop
	push hl
	ld a, [hl]
	inc a
	jr z, .nope
	ld a, d
	cp [hl]
	jr nz, .next
	inc hl
	ld a, e
	cp [hl]
	jr z, .yup

.next
	pop hl
	add hl, bc
	jr .loop

.nope
	pop hl
	and a
	ret

.yup
	pop hl
	scf
	ret

InitRoamMons:

CheckEncounterRoamMon:
	push hl
; Don't trigger an encounter if we're on water.
	call CheckOnWater
	jr z, .DontEncounterRoamMon
; Load the current map group and number to de
	call CopyCurrMapDE
; Randomly select a beast.
	call Random
	cp 100 ; 25/64 chance
	jr nc, .DontEncounterRoamMon
	and %00000011 ; Of that, a 3/4 chance.  Running total: 75/256, or around 29.3%.
	jr z, .DontEncounterRoamMon
	dec a ; 1/3 chance that it's Entei, 1/3 chance that it's Raikou
; Compare its current location with yours
	ld hl, wRoamMon1MapGroup
	ld c, a
	ld b, 0
	ld a, 7 ; length of the roam_struct
	call AddNTimes
	ld a, d
	cp [hl]
	jr nz, .DontEncounterRoamMon
	inc hl
	ld a, e
	cp [hl]
	jr nz, .DontEncounterRoamMon
; We've decided to take on a beast, so stage its information for battle.
	dec hl
	dec hl
	dec hl
	ld a, [hli]
	ld [wTempWildMonSpecies], a
	ld a, [hl]
	ld [wCurPartyLevel], a
	ld a, BATTLETYPE_ROAMING
	ld [wBattleType], a

	pop hl
	scf
	ret

.DontEncounterRoamMon:
	pop hl
	and a
	ret

UpdateRoamMons:

JumpRoamMons:

JumpRoamMon:
	ret

_BackUpMapIndices:
	ld a, [wRoamMons_CurMapNumber]
	ld [wRoamMons_LastMapNumber], a
	ld a, [wRoamMons_CurMapGroup]
	ld [wRoamMons_LastMapGroup], a
	ld a, [wMapNumber]
	ld [wRoamMons_CurMapNumber], a
	ld a, [wMapGroup]
	ld [wRoamMons_CurMapGroup], a
	ret

INCLUDE "data/wild/roammon_maps.asm"

ValidateTempWildMonSpecies:
	ld a, h
	or l
	scf
	ret z
	ld a, h
	if LOW(NUM_POKEMON) == $FF
		cp HIGH(NUM_POKEMON) + 1
	else
		cp HIGH(NUM_POKEMON)
		ccf
		ret nz
		ld a, l
		cp LOW(NUM_POKEMON) + 1
	endc
	ccf
	ret

GetCallerRouteWildGrassMons:
	farcall GetCallerLocation
	ld d, b
	ld e, c
	ld hl, JohtoGrassWildMons
	ld bc, GRASS_WILDDATA_LENGTH
	call LookUpWildmonsForMapDE
	jr c, .found
	ld hl, KantoGrassWildMons
	call LookUpWildmonsForMapDE
	ret nc ; no carry = no grass wild mons for that route
.found
	ld bc, 5 ; skip the map ID and encounter rates
	add hl, bc
	call GetTimeOfDayNotEve
	ld bc, NUM_GRASSMON * 3
	call AddNTimes
	scf
	ret

; Finds a rare wild Pokemon in the route of the trainer calling, then checks if it's been Seen already.
; The trainer will then tell you about the Pokemon if you haven't seen it.
RandomUnseenWildMon:
	call GetCallerRouteWildGrassMons
	jr nc, .done
	push hl
.randloop1
	call Random
	and %11
	jr z, .randloop1
	ld bc, 10 ; skip three mons plus the level of the fourth
	add hl, bc
	ld c, a
	add hl, bc
	add hl, bc
	add hl, bc
	; We now have the pointer to one of the last (rarest) three wild Pokemon found in that area.
	; Load the species index of this rare Pokemon
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	inc hl ; Species index of the most common Pokemon on that route
	ld b, 4
.loop2
	ld a, [hli]
	cp e ; Compare this common Pokemon with the rare one stored in de.
	ld a, [hli]
	jr nz, .next
	cp d
	jr z, .done
.next
	inc hl
	dec b
	jr nz, .loop2
; This Pokemon truly is rare.
	push de
	call CheckSeenMonIndex
	pop bc
	jr nz, .done
; Since we haven't seen it, have the caller tell us about it.
	ld de, wStringBuffer1
	call CopyName1
	ld h, b
	ld l, c
	call GetPokemonIDFromIndex
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, .SawRareMonText
	call PrintText
	xor a
	ld [wScriptVar], a
	ret

.done
	ld a, $1
	ld [wScriptVar], a
	ret

.SawRareMonText:
	; I just saw some rare @  in @ . I'll call you if I see another rare #MON, OK?
	text_far _JustSawSomeRareMonText
	text_end

RandomPhoneWildMon:
	call GetCallerRouteWildGrassMons
	call Random
	and %11
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetPokemonIDFromIndex
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wStringBuffer4
	ld bc, MON_NAME_LENGTH
	jp CopyBytes

RandomPhoneMon:
; Get a random monster owned by the trainer who's calling.
	farcall GetCallerLocation
	ld hl, TrainerGroups
	ld a, d
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, BANK(TrainerGroups)
	call GetFarByte
	ld [wTrainerGroupBank], a
	inc hl
	ld a, BANK(TrainerGroups)
	and TRAINERTYPE_NICKNAME
	jr nz, .got_mon
	call GetFarHalfword

.skip_trainer
	dec e
	jr z, .skipped
.skip
	ld a, [wTrainerGroupBank]
	call GetFarByte
	add a, l
	ld l, a
	jr nc, .skip_trainer
	inc h
	jr .skip_trainer
.skipped
	inc hl

.skip_name
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .skip_name

	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	ld c, a
	ld a, 3
	bit TRAINERTYPE_ITEM_F, c
	jr z, .no_item
	inc a
.no_item
	bit TRAINERTYPE_MOVES_F, c
	jr z, .no_moves
	add a, NUM_MOVES * 2
.no_moves
	ld c, a
	ld b, 0

	ld e, b
	push hl
.count_mon
	inc e
	add hl, bc
	ld a, [wTrainerGroupBank]
	call GetFarByte
	cp -1
	jr nz, .count_mon
	pop hl

.rand
	call Random
	maskbits PARTY_LENGTH
	cp e
	jr nc, .rand

	inc a
.get_mon
	dec a
	jr z, .got_mon
	add hl, bc
	jr .get_mon
.got_mon

	inc hl ; species
	ld a, [wTrainerGroupBank]
	call GetFarHalfword
	call GetPokemonIDFromIndex
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wStringBuffer4
	ld bc, MON_NAME_LENGTH
	jp CopyBytes

INCLUDE "data/wild/johto_grass.asm"
INCLUDE "data/wild/johto_water.asm"
INCLUDE "data/wild/kanto_grass.asm"
INCLUDE "data/wild/kanto_water.asm"
INCLUDE "data/wild/swarm_grass.asm"
INCLUDE "data/wild/swarm_water.asm"
INCLUDE "data/wild/swarm_grass_alt.asm"
INCLUDE "data/wild/sevii_grass.asm"
INCLUDE "data/wild/sevii_water.asm"
