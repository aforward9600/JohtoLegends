ShowLinkBattleParticipants:
; If we're not in a communications room,
; we don't need to be here.
	ld a, [wLinkMode]
	and a
	ret z

	farcall _ShowLinkBattleParticipants
	ld c, 150
	call DelayFrames
	call ClearTileMap
	jp ClearSprites

FindFirstAliveMonAndStartBattle:
;	call GetMapEnvironment
;	cp CAVE
;	jr z, .nightpal
;	cp INDOOR
;	jr z, .daypal
;
;	ld a, [wTimeOfDay]
;	cp NITE_F
;	jr z, .nightpal
;
;.daypal
;	ld a, 0
;	ld [wBattleTimeOfDay], a
;	jr .timeofdaypalset
;
;.nightpal
;	ld a, 1
;	ld [wBattleTimeOfDay], a
;
;.timeofdaypalset
	xor a
	ldh [hMapAnims], a
	call DelayFrame
	predef DoBattleTransition
	farcall _LoadBattleFontsHPBar
	ld a, 1
	ldh [hBGMapMode], a
	call ClearSprites
	call ClearTileMap
	xor a
	ldh [hBGMapMode], a
	ldh [hWY], a
	ldh [rWY], a
	ldh [hMapAnims], a
	ret

PlayBattleMusic:
	push hl
	push de
	push bc

	xor a
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume

	ld a, [wBattleType]
	cp BATTLETYPE_MEWTWO
	ld de, MUSIC_MEWTWO_BATTLE
	jp z, .done
	cp BATTLETYPE_REGI
	ld de, MUSIC_REGI_BATTLE
	jp z, .done
	cp BATTLETYPE_HO_OH
	ld de, MUSIC_HO_OH_BATTLE
	jp z, .done
	cp BATTLETYPE_LUGIA
	ld de, MUSIC_LUGIA_BATTLE
	jp z, .done
	cp BATTLETYPE_LEGENDARY
	ld de, MUSIC_KANTO_LEGEND_BATTLE_XY
	jp z, .done
	cp BATTLETYPE_SUICUNE
	ld de, MUSIC_SUICUNE_BATTLE
	jp z, .done
	cp BATTLETYPE_ROAMING
	jp z, .done
	cp BATTLETYPE_CELEBI
	jp z, .done

	; Are we fighting a trainer?
	ld a, [wOtherTrainerClass]
	and a
	jr nz, .trainermusic

	farcall RegionCheck
	ld a, e
	and a
	jr nz, .kantowild

	ld de, MUSIC_JOHTO_WILD_BATTLE
	ld a, [wTimeOfDay]
	cp NITE_F
	jp nz, .done
	ld de, MUSIC_JOHTO_WILD_BATTLE_NIGHT
	jp .done

.kantowild
	ld de, MUSIC_KANTO_WILD_BATTLE
	ld a, [wTimeOfDay]
    cp NITE_F
    jp c, .done ; not NITE_F or EVE_F
    ld de, MUSIC_KANTO_WILD_BATTLE_NIGHT
	jp .done

.trainermusic
	ld de, MUSIC_MEGALOVANIA
	cp FERROPEXOLA_TRAINER
	jp z, .done

	ld de, MUSIC_CHAMPION_BATTLE
	cp CHAMPION_DAHLIA
	jp z, .done
	cp CHAMPION_DRACO
	jp z, .done
	cp CHALLENGER_DAHLIA
	jp z, .done
	cp CHALLENGER_DRACO
	jp z, .done

	ld de, MUSIC_OAK_BATTLE
	cp POKEMON_PROF
	jp z, .done

	ld de, MUSIC_CYNTHIA_BATTLE
	cp CHALLENGER_CYNTHIA
	jp z, .done

	ld de, MUSIC_MARNIE_BATTLE
	cp RIVAL3
	jp z, .done

	ld de, MUSIC_ROCKET_BATTLE
	cp GRUNTM
	jr z, .done
	cp GRUNTF
	jr z, .done
	cp ARCHER
	jr z, .done
	cp ARIANA
	jr z, .done
	cp SCIENTIST
	jr z, .done
	cp MYSTERIOUS
	jr z, .done
	cp MNINJA_M
	jr z, .done
	cp MNINJA_F
	jr z, .done
	cp EIN
	jr z, .done

	ld de, MUSIC_UNWAVERING_HEART
	cp DEPRESSED_DAHLIA
	jr z, .done
	cp DEPRESSED_DRACO
	jr z, .done

	ld de, MUSIC_MADAME_BOSS
	cp MADAME_BOSS
	jr z, .done
	cp FED_LEADER
	jr z, .done

	ld de, MUSIC_KANTO_GYM_LEADER_BATTLE
	farcall IsKantoGymLeader
	jr c, .done

	; IsGymLeader also counts CHAMPION, RED, and the Kanto gym leaders
	; but they have been taken care of before this
	ld de, MUSIC_ELITE_FOUR
	farcall IsEliteFour
	jr c, .done

	ld de, MUSIC_JOHTO_GYM_LEADER_BATTLE
	farcall IsGymLeader
	jr c, .done

	ld de, MUSIC_RIVAL_BATTLE
	ld a, [wOtherTrainerClass]
	cp RIVAL4
	jr nz, .othertrainer
	jr .done

.othertrainer
	ld a, [wLinkMode]
	and a
	jr nz, .johtotrainer

	farcall RegionCheck
	ld a, e
	and a
	jr nz, .kantotrainer

.johtotrainer
	ld de, MUSIC_JOHTO_TRAINER_BATTLE
	jr .done

.kantotrainer
	ld de, MUSIC_KANTO_TRAINER_BATTLE

.done
	call PlayMusic

	pop bc
	pop de
	pop hl
	ret

ClearBattleRAM:
	xor a
	ld [wBattlePlayerAction], a
	ld [wBattleResult], a

	ld hl, wPartyMenuCursor
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld [wMenuScrollPosition], a
	ld [wCriticalHit], a
	ld [wBattleMonSpecies], a
	ld [wBattleParticipantsNotFainted], a
	ld [wCurBattleMon], a
	ld [wForcedSwitch], a
	ld [wTimeOfDayPal], a
	ld [wPlayerTurnsTaken], a
	ld [wEnemyTurnsTaken], a
	ld [wEvolvableFlags], a

	ld hl, wPlayerHPPal
	ld [hli], a
	ld [hl], a

	ld hl, wBattleMonDVs
	ld [hli], a
	ld [hl], a

	ld hl, wEnemyMonDVs
	ld [hli], a
	ld [hl], a

; Clear the entire BattleMons area
	ld hl, wBattle
	ld bc, wBattleEnd - wBattle
	xor a
	call ByteFill

	callfar ResetEnemyStatLevels

	call ClearWindowData

	ld hl, hBGMapAddress
	xor a ; LOW(vBGMap0)
	ld [hli], a
	ld [hl], HIGH(vBGMap0)
	ret
