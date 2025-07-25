; Audio interfaces.

MapSetup_Sound_Off::
	push hl
	push de
	push bc
	push af

	ldh a, [hROMBank]
	push af
	ld a, BANK(_MapSetup_Sound_Off)
	rst Bankswitch

	call _MapSetup_Sound_Off

	pop af
	rst Bankswitch

	pop af
	pop bc
	pop de
	pop hl
	ret

UpdateSound::
	push hl
	push de
	push bc
	push af

	ldh a, [hROMBank]
	push af
	ld a, BANK(_UpdateSound)
	rst Bankswitch

	call _UpdateSound

	pop af
	rst Bankswitch

	pop af
	pop bc
	pop de
	pop hl
	ret

_LoadMusicByte::
; wCurMusicByte = [a:de]
	rst Bankswitch

	ld a, [de]
	ld [wCurMusicByte], a
	ld a, BANK(LoadMusicByte)

	rst Bankswitch
	ret

PlayMusic::
; Play music de.

	push hl
	push de
	push bc
	push af

	ldh a, [hROMBank]
	push af
	ld a, BANK(_PlayMusic) ; aka BANK(_MapSetup_Sound_Off)
	rst Bankswitch

	ld a, e
	and a
	jr z, .nomusic

	call _PlayMusic
	jr .end

.nomusic
	call _MapSetup_Sound_Off

.end
	pop af
	rst Bankswitch
	pop af
	pop bc
	pop de
	pop hl
	ret

PlayMusic2::
; Stop playing music, then play music de.

	push hl
	push de
	push bc
	push af

	ldh a, [hROMBank]
	push af
	ld a, BANK(_PlayMusic)
	rst Bankswitch

	push de
	ld de, MUSIC_NONE
	call _PlayMusic
	call DelayFrame
	pop de
	call _PlayMusic

	pop af
	rst Bankswitch

	pop af
	pop bc
	pop de
	pop hl
	ret

PlayCry::
; Play cry de.

	push hl
	push de
	push bc
	push af

	ldh a, [hROMBank]
	push af

	; Cries are stuck in one bank.
	ld a, BANK(PokemonCries)
	rst Bankswitch

	ld hl, PokemonCries
rept 6 ; sizeof(mon_cry)
	add hl, de
endr

	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

	ld a, [hli]
	ld [wCryPitch], a
	ld a, [hli]
	ld [wCryPitch + 1], a
	ld a, [hli]
	ld [wCryLength], a
	ld a, [hl]
	ld [wCryLength + 1], a

	ld a, BANK(_PlayCry)
	rst Bankswitch

	call _PlayCry

	pop af
	rst Bankswitch

	pop af
	pop bc
	pop de
	pop hl
	ret

WaitPlaySFX::
	call WaitSFX
	; fallthrough
PlaySFX::
; Play sound effect de.
; Sound effects are ordered by priority (highest to lowest)

	push hl
	push de
	push bc
	push af

	; Is something already playing?
	call CheckSFX
	jr nc, .play

	; Does it have priority?
	ld a, [wCurSFX]
	cp e
	jr c, .done

.play
	ldh a, [hROMBank]
	push af
	ld a, BANK(_PlaySFX)
	rst Bankswitch

	ld a, e
	ld [wCurSFX], a
	call _PlaySFX

	pop af
	rst Bankswitch

.done
	pop af
	pop bc
	pop de
	pop hl
	ret

WaitSFX::
; infinite loop until sfx is done playing

	push hl

	jr .handleLoop

.wait
	call DelayFrame
.handleLoop
	ld hl, wChannel5Flags1
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel6Flags1
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel7Flags1
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel8Flags1
	bit 0, [hl]
	jr nz, .wait

	pop hl
	ret

IsSFXPlaying::
; Return carry if no sound effect is playing.
; The inverse of CheckSFX.
	push hl

	ld hl, wChannel5Flags1
	bit 0, [hl]
	jr nz, .playing
	ld hl, wChannel6Flags1
	bit 0, [hl]
	jr nz, .playing
	ld hl, wChannel7Flags1
	bit 0, [hl]
	jr nz, .playing
	ld hl, wChannel8Flags1
	bit 0, [hl]
	jr nz, .playing

	pop hl
	scf
	ret

.playing
	pop hl
	and a
	ret

MaxVolume::
	ld a, MAX_VOLUME
	ld [wVolume], a
	ret

LowVolume::
	ld a, $33 ; 40%
	ld [wVolume], a
	ret

VolumeOff::
	xor a
	ld [wVolume], a
	ret

FadeInMusic::
	ld a, 4 | (1 << MUSIC_FADE_IN_F)
	ld [wMusicFade], a
	ret

SkipMusic::
; Skip a frames of music.
.loop
	and a
	ret z
	dec a
	call UpdateSound
	jr .loop

FadeToMapMusic::
	push hl
	push de
	push bc
	push af

	call GetMapMusic_MaybeSpecial
	ld a, [wMapMusic]
	cp e
	jr z, .done

	ld a, 8
	ld [wMusicFade], a
	ld a, e
	ld [wMusicFadeID], a
	ld a, d
	ld [wMusicFadeID + 1], a
	ld a, e
	ld [wMapMusic], a

.done
	pop af
	pop bc
	pop de
	pop hl
	ret

PlayMapMusic::
	push hl
	push de
	push bc
	push af

	call GetMapMusic_MaybeSpecial
	ld a, [wMapMusic]
	cp e
	jr z, .done

	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de
	ld a, e
	ld [wMapMusic], a
	call PlayMusic

.done
	pop af
	pop bc
	pop de
	pop hl
	ret

EnterMapMusic::
	push hl
	push de
	push bc
	push af

	xor a
	ld [wDontPlayMapMusicOnReload], a
	ld de, MUSIC_BICYCLE
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr z, .play
	call GetMapMusic_MaybeSpecial
.play
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de

	ld a, e
	ld [wMapMusic], a
	call PlayMusic

	pop af
	pop bc
	pop de
	pop hl
	ret

TryRestartMapMusic::
	ld a, [wDontPlayMapMusicOnReload]
	and a
	jr z, RestartMapMusic
	xor a
	ld [wMapMusic], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	xor a
	ld [wDontPlayMapMusicOnReload], a
	ret

RestartMapMusic::
	push hl
	push de
	push bc
	push af
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld a, [wMapMusic]
	ld c, a
	call ChangeMusicIfNight
	ld e, c
	ld d, 0
	call PlayMusic
	pop af
	pop bc
	pop de
	pop hl
	ret

SpecialMapMusic::
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .surf
	cp PLAYER_SURF_PIKA
	jr z, .surf

.no
	and a
	ret

.bike
	ld de, MUSIC_BICYCLE
	scf
	ret

.surf
	ld a, [wMapTileset]
	cp TILESET_ICE_PATH
	jr z, .NoSurfMusic
	ld a, [wMapTileset]
	cp TILESET_CAVE
	jr z, .NoSurfMusic
	ld de, MUSIC_SURF
	scf
	ret

.NoSurfMusic
	and a
	ret

GetMapMusic_MaybeSpecial::
	call SpecialMapMusic
	ret c
	jp GetMapMusic

CheckSFX::
; Return carry if any SFX channels are active.
	ld a, [wChannel5Flags1]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel6Flags1]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel7Flags1]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel8Flags1]
	bit 0, a
	jr nz, .playing
	and a
	ret
.playing
	scf
	ret

TerminateExpBarSound::
	xor a
	ld [wChannel5Flags1], a
	ld [wSoundInput], a
	ldh [rNR10], a
	ldh [rNR11], a
	ldh [rNR12], a
	ldh [rNR13], a
	ldh [rNR14], a
	ret

ChannelsOff::
; Quickly turn off music channels
	xor a
	ld [wChannel1Flags1], a
	ld [wChannel2Flags1], a
	ld [wChannel3Flags1], a
	ld [wChannel4Flags1], a
	ld [wSoundInput], a
	ret

SFXChannelsOff::
; Quickly turn off sound effect channels
	xor a
	ld [wChannel5Flags1], a
	ld [wChannel6Flags1], a
	ld [wChannel7Flags1], a
	ld [wChannel8Flags1], a
	ld [wSoundInput], a
	ret
