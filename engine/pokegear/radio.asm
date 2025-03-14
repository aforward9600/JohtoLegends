PlayRadioShow:
; If we're already in the radio program proper, we don't need to be here.
	ld a, [wCurRadioLine]
	cp POKE_FLUTE_RADIO
	jr nc, .ok
; If Team Rocket is not occupying the radio tower, we don't need to be here.
;	ld a, [wStatusFlags2]
;	bit STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F, a
;	jr z, .ok
; If we're in Kanto, we don't need to be here.
;	call IsInJohto
;	and a
;	jr nz, .ok
; Team Rocket broadcasts on all stations.
;	ld a, ROCKET_RADIO
;	ld [wCurRadioLine], a
.ok
; Jump to the currently loaded station.  The index to which we need to jump is in wCurRadioLine.
	ld a, [wCurRadioLine]
	ld e, a
	ld d, 0
	ld hl, RadioJumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

RadioJumptable:
; entries correspond to constants/radio_constants.asm
	dw OaksPKMNTalk1  ; $00
	dw PokedexShow1 ; $01
	dw BenMonMusic1  ; $02
	dw LuckyNumberShow1 ; $03
	dw BuenasPassword1 ; $04
	dw PeoplePlaces1 ; $05
	dw FernMonMusic1 ; $06
	dw RocketRadio1 ; $07
	dw PokeFluteRadio ; $08
	dw UnownRadio ; $09
	dw EvolutionRadio ; $0a
; OaksPKMNTalk
	dw OaksPKMNTalk2  ; $0b
	dw OaksPKMNTalk3  ; $0c
	dw OaksPKMNTalk4  ; $0d
	dw OaksPKMNTalk5  ; $0e
	dw OaksPKMNTalk6  ; $0f
	dw OaksPKMNTalk7  ; $10
	dw OaksPKMNTalk8  ; $11
	dw OaksPKMNTalk9  ; $12
	dw PokedexShow2 ; $13
	dw PokedexShow3 ; $14
	dw PokedexShow4 ; $15
	dw PokedexShow5 ; $16
; Ben Music
	dw BenMonMusic2  ; $17
	dw BenMonMusic3  ; $18
	dw BenFernMusic4 ; $19
	dw BenFernMusic5 ; $1a
	dw BenFernMusic6 ; $1b
	dw BenFernMusic7 ; $1c
	dw FernMonMusic2 ; $1d
; Lucky Number Show
	dw LuckyNumberShow2 ; $1e
	dw LuckyNumberShow3 ; $1f
	dw LuckyNumberShow4 ; $20
	dw LuckyNumberShow5 ; $21
	dw LuckyNumberShow6 ; $22
	dw LuckyNumberShow7 ; $23
	dw LuckyNumberShow8 ; $24
	dw LuckyNumberShow9 ; $25
	dw LuckyNumberShow10 ; $26
	dw LuckyNumberShow11 ; $27
	dw LuckyNumberShow12 ; $28
	dw LuckyNumberShow13 ; $29
	dw LuckyNumberShow14 ; $2a
	dw LuckyNumberShow15 ; $2b
; People & Places
	dw PeoplePlaces2 ; $2c
	dw PeoplePlaces3 ; $2d
	dw PeoplePlaces4 ; $2e
	dw PeoplePlaces5 ; $2f
	dw PeoplePlaces6 ; $30
	dw PeoplePlaces7 ; $31
; Rocket Radio
	dw RocketRadio2 ; $32
	dw RocketRadio3 ; $33
	dw RocketRadio4 ; $34
	dw RocketRadio5 ; $35
	dw RocketRadio6 ; $36
	dw RocketRadio7 ; $37
	dw RocketRadio8 ; $38
	dw RocketRadio9 ; $39
	dw RocketRadio10 ; $3a
; More Pokemon Channel stuff
	dw OaksPKMNTalk10 ; $3b
	dw OaksPKMNTalk11 ; $3c
	dw OaksPKMNTalk12 ; $3d
	dw OaksPKMNTalk13 ; $3e
	dw OaksPKMNTalk14 ; $3f
; Buenas Password
	dw BuenasPassword2 ; $40
	dw BuenasPassword3 ; $41
	dw BuenasPassword4 ; $42
	dw BuenasPassword5 ; $43
	dw BuenasPassword6 ; $44
	dw BuenasPassword7 ; $45
	dw BuenasPassword8 ; $46
	dw BuenasPassword9 ; $47
	dw BuenasPassword10 ; $48
	dw BuenasPassword11 ; $49
	dw BuenasPassword12 ; $4a
	dw BuenasPassword13 ; $4b
	dw BuenasPassword14 ; $4c
	dw BuenasPassword15 ; $4d
	dw BuenasPassword16 ; $4e
	dw BuenasPassword17 ; $4f
	dw BuenasPassword18 ; $50
	dw BuenasPassword19 ; $51
	dw BuenasPassword20 ; $52
	dw BuenasPassword21 ; $53
	dw RadioScroll ; $54
; More Pokemon Channel stuff
	dw PokedexShow6 ; $55
	dw PokedexShow7 ; $56
	dw PokedexShow8 ; $57

PrintRadioLine:
	ld [wNextRadioLine], a
	ld hl, wRadioText
	ld a, [wNumRadioLinesPrinted]
	cp 2
	jr nc, .print
	inc hl
	ld [hl], TX_START
	inc a
	ld [wNumRadioLinesPrinted], a
	cp 2
	jr nz, .print
	bccoord 1, 16
	call PlaceHLTextAtBC
	jr .skip
.print
	call PrintTextboxText
.skip
	ld a, RADIO_SCROLL
	ld [wCurRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	ret

ReplacePeriodsWithSpaces:
	push hl
	ld b, SCREEN_WIDTH * 2
.loop
	ld a, [hl]
	cp "."
	jr nz, .next
	ld [hl], " "

.next
	inc hl
	dec b
	jr nz, .loop
	pop hl
	ret

RadioScroll:
	ld hl, wRadioTextDelay
	ld a, [hl]
	and a
	jr z, .proceed
	dec [hl]
	ret
.proceed
	ld a, [wNextRadioLine]
	ld [wCurRadioLine], a
	ld a, [wNumRadioLinesPrinted]
	cp 1
	call nz, CopyBottomLineToTopLine
	jp ClearBottomLine

OaksPKMNTalk1:
	call StartPokemonMusicChannel
	ld hl, JunichiMasudaSoloText
	ld a, OAKS_POKEMON_TALK_2
	jp NextRadioLine
	ret

OaksPKMNTalk2:
	ld hl, GoIchinoseText
	ld a, OAKS_POKEMON_TALK_3
	jp NextRadioLine

OaksPKMNTalk3:
	ld hl, JunichiMasudaSoloText
	ld a, OAKS_POKEMON_TALK_2
	jp NextRadioLine

OaksPKMNTalk4:
	call StartPokemonMusicChannel
	ld hl, GoIchinoseText
	ld a, OAKS_POKEMON_TALK_5
	jp NextRadioLine

INCLUDE "data/radio/oaks_pkmn_talk_routes.asm"

OaksPKMNTalk5:
	ld hl, OPT_OakText2
	ld a, OAKS_POKEMON_TALK_4
	jp NextRadioLine

OaksPKMNTalk6:
	ld hl, GoIchinoseText
	ld a, OAKS_POKEMON_TALK_5
	jp PrintRadioLine

JunichiMasudaSoloText:
	; MARY: PROF.OAK'S
	text_far _JunichiMasudaSoloText
	text_end

GoIchinoseText:
	; #MON TALK!
	text_far _GoIchinoseText
	text_end

OPT_IntroText3:
	; With me, MARY!
	text_far _OPT_IntroText3
	text_end

OPT_OakText1:
	; OAK: @ @
	text_far _OPT_OakText1
	text_end

OPT_OakText2:
	; may be seen around
	text_far _OPT_OakText2
	text_end

OPT_OakText3:
	; @ .
	text_far _OPT_OakText3
	text_end

OaksPKMNTalk7:
	call StartPokemonMusicChannel
	ld hl, OPT_MaryText1
	ld a, OAKS_POKEMON_TALK_8
	jp NextRadioLine

OPT_MaryText1:
	; MARY: @ 's
	text_far _OPT_MaryText1
	text_end

OaksPKMNTalk8:
	ld hl, TriteHexagonText
	ld a, OAKS_POKEMON_TALK_9
	jp NextRadioLine

TriteHexagonText:
	text_far _TriteHexagonText
	text_end

OaksPKMNTalk9:
	ld hl, OPT_MaryText1
	ld a, OAKS_POKEMON_TALK_8
	jp NextRadioLine

OaksPKMNTalk10:
	farcall RadioMusicRestartPokemonChannel
	ld hl, OPT_RestartText
	call PrintText
	call WaitBGMap
	ld hl, OPT_PokemonChannelText
	call PrintText
	ld a, OAKS_POKEMON_TALK_11
	ld [wCurRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	ret

OPT_PokemonChannelText:
	; #MON
	text_far _OPT_PokemonChannelText
	text_end

OPT_RestartText:
	text_end

OaksPKMNTalk11:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 9, 14
	ld de, .pokemon_string
	ld a, OAKS_POKEMON_TALK_12
	jp PlaceRadioString

.pokemon_string
	db "#MON@"

OaksPKMNTalk12:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 1, 16
	ld de, .pokemon_channel_string
	ld a, OAKS_POKEMON_TALK_13
	jp PlaceRadioString

.pokemon_channel_string
	db "#MON Channel@"

OaksPKMNTalk13:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 12, 16
	ld de, .terminator
	ld a, OAKS_POKEMON_TALK_14
	jp PlaceRadioString

.terminator
	db "@"

OaksPKMNTalk14:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	ld de, MUSIC_POKEMON_TALK
	callfar RadioMusicRestartDE
	ld hl, .terminator
	call PrintText
	ld a, OAKS_POKEMON_TALK_4
	ld [wNextRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, RADIO_SCROLL
	ld [wCurRadioLine], a
	ld a, 10
	ld [wRadioTextDelay], a
	ret

.terminator
	db "@"

PlaceRadioString:
	ld [wCurRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	jp PlaceString

CopyBottomLineToTopLine:
	hlcoord 0, 15
	decoord 0, 13
	ld bc, SCREEN_WIDTH * 2
	jp CopyBytes

ClearBottomLine:
	hlcoord 1, 15
	ld bc, SCREEN_WIDTH - 2
	ld a, " "
	call ByteFill
	hlcoord 1, 16
	ld bc, SCREEN_WIDTH - 2
	ld a, " "
	jp ByteFill

PokedexShow1:
	call StartPokemonMusicChannel
	ld hl, JunichiMasudaSoloText
	ld a, POKEDEX_SHOW_2
	jp NextRadioLine

PokedexShow2:
	ret
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	dec hl
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc
	ld bc, PokedexDataPointerTable
	add hl, bc
	ld a, BANK(PokedexDataPointerTable)
	call GetFarByte
	ld b, a
	inc hl
	ld a, BANK(PokedexDataPointerTable)
	call GetFarHalfword
	ld a, b
	push af
	push hl
	call CopyDexEntryPart1
	dec hl
	ld [hl], "<DONE>"
	ld hl, wPokedexShowPointerAddr
	call CopyRadioTextToRAM
	pop hl
	pop af
	call CopyDexEntryPart2
rept 4
	inc hl
endr
	ld a, l
	ld [wPokedexShowPointerAddr], a
	ld a, h
	ld [wPokedexShowPointerAddr + 1], a
	ld a, POKEDEX_SHOW_3
	jp PrintRadioLine

PokedexShow3:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_4
	jp PrintRadioLine

PokedexShow4:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_5
	jp PrintRadioLine

PokedexShow5:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_6
	jp PrintRadioLine

PokedexShow6:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_7
	jp PrintRadioLine

PokedexShow7:
	call CopyDexEntry
	ld a, POKEDEX_SHOW_8
	jp PrintRadioLine

PokedexShow8:
	call CopyDexEntry
	ld a, POKEDEX_SHOW
	jp PrintRadioLine

CopyDexEntry:
	ld a, [wPokedexShowPointerAddr]
	ld l, a
	ld a, [wPokedexShowPointerAddr + 1]
	ld h, a
	ld a, [wPokedexShowPointerBank]
	push af
	push hl
	call CopyDexEntryPart1
	dec hl
	ld [hl], "<DONE>"
	ld hl, wPokedexShowPointerAddr
	call CopyRadioTextToRAM
	pop hl
	pop af
	call CopyDexEntryPart2
	ret

CopyDexEntryPart1:
	ld de, wPokedexShowPointerBank
	ld bc, SCREEN_WIDTH - 1
	call FarCopyBytes
	ld hl, wPokedexShowPointerAddr
	ld [hl], TX_START
	inc hl
	ld [hl], "<LINE>"
	inc hl
.loop
	ld a, [hli]
	cp "@"
	ret z
	cp "<NEXT>"
	ret z
	cp "<DEXEND>"
	ret z
	jr .loop

CopyDexEntryPart2:
	ld d, a
.loop
	ld a, d
	call GetFarByte
	inc hl
	cp "@"
	jr z, .okay
	cp "<NEXT>"
	jr z, .okay
	cp "<DEXEND>"
	jr nz, .loop
.okay
	ld a, l
	ld [wPokedexShowPointerAddr], a
	ld a, h
	ld [wPokedexShowPointerAddr + 1], a
	ld a, d
	ld [wPokedexShowPointerBank], a
	ret

PokedexShowText:
	; @ @
	text_far _PokedexShowText
	text_end

BenMonMusic1:
	call StartPokemonMusicChannel
	ld hl, BenIntroText1
	ld a, POKEMON_MUSIC_2
	jp NextRadioLine

BenMonMusic2:
	ld hl, BenIntroText2
	ld a, POKEMON_MUSIC_3
	jp NextRadioLine

BenMonMusic3:
	ld hl, BenIntroText1
	ld a, POKEMON_MUSIC_2
	jp NextRadioLine

FernMonMusic1:
	call StartPokemonMusicChannel
	ld hl, FernIntroText1
	ld a, LETS_ALL_SING_2
	jp NextRadioLine

FernMonMusic2:
	ld hl, FernIntroMusic2
	ld a, POKEMON_MUSIC_4
	jp NextRadioLine

BenFernMusic4:
	ld hl, FernIntroText1
	ld a, LETS_ALL_SING_2
	jp NextRadioLine

BenFernMusic5:
	call GetWeekday
	and 1
	ld hl, BenFernText2A
	jr z, .SunTueThurSun
	ld hl, BenFernText2B
.SunTueThurSun:
	ld a, POKEMON_MUSIC_6
	jp NextRadioLine

BenFernMusic6:
	call GetWeekday
	and 1
	ld hl, BenFernText3A
	jr z, .SunTueThurSun
	ld hl, BenFernText3B
.SunTueThurSun:
	ld a, POKEMON_MUSIC_7
	jp NextRadioLine

BenFernMusic7:
	ret

StartPokemonMusicChannel:
	call RadioTerminator
	call PrintText
;	ld de, MUSIC_NONE
;	call GetWeekday
;	and 1
;	jr z, .SunTueThurSun
;	ld de, MUSIC_POKEMON_LULLABY
;.SunTueThurSun:
;	callfar RadioMusicRestartDE
	ret

BenIntroText1:
	; BEN: #MON MUSIC
	text_far _BenIntroText1
	text_end

BenIntroText2:
	; CHANNEL!
	text_far _BenIntroText2
	text_end

BenIntroText3:
	; It's me, DJ BEN!
	text_far _BenIntroText3
	text_end

FernIntroText1:
	; FERN: #MUSIC!
	text_far _FernIntroText1
	text_end

FernIntroMusic2:
	; With DJ FERN!
	text_far _FernIntroText2
	text_end

BenFernText1:
	; Today's @ ,
	text_far _BenFernText1
	text_end

BenFernText2A:
	; so let us jam to
	text_far _BenFernText2A
	text_end

BenFernText2B:
	; so chill out to
	text_far _BenFernText2B
	text_end

BenFernText3A:
	; #MON March!
	text_far _BenFernText3A
	text_end

BenFernText3B:
	; #MON Lullaby!
	text_far _BenFernText3B
	text_end

LuckyNumberShow1:
	call StartPokemonMusicChannel
	ld hl, GoIchinoseText
	ld a, LUCKY_NUMBER_SHOW_2
	jp NextRadioLine

LuckyNumberShow2:
	ret

LuckyNumberShow3:
	ld hl, LC_Text3
	ld a, LUCKY_NUMBER_SHOW_4
	jp NextRadioLine

LuckyNumberShow4:
	ld hl, LC_Text4
	ld a, LUCKY_NUMBER_SHOW_5
	jp NextRadioLine

LuckyNumberShow5:
	ld hl, LC_Text5
	ld a, LUCKY_NUMBER_SHOW_6
	jp NextRadioLine

LuckyNumberShow6:
	ld hl, LC_Text6
	ld a, LUCKY_NUMBER_SHOW_7
	jp NextRadioLine

LuckyNumberShow7:
	ld hl, LC_Text7
	ld a, LUCKY_NUMBER_SHOW_8
	jp NextRadioLine

LuckyNumberShow8:
	ld hl, wStringBuffer1
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld a, "@"
	ld [wStringBuffer1 + 5], a
	ld hl, LC_Text8
	ld a, LUCKY_NUMBER_SHOW_9
	jp NextRadioLine

LuckyNumberShow9:
	ld hl, LC_Text9
	ld a, LUCKY_NUMBER_SHOW_10
	jp NextRadioLine

LuckyNumberShow10:
	ld hl, LC_Text7
	ld a, LUCKY_NUMBER_SHOW_11
	jp NextRadioLine

LuckyNumberShow11:
	ld hl, LC_Text8
	ld a, LUCKY_NUMBER_SHOW_12
	jp NextRadioLine

LuckyNumberShow12:
	ld hl, LC_Text10
	ld a, LUCKY_NUMBER_SHOW_13
	jp NextRadioLine

LuckyNumberShow13:
	ld hl, LC_Text11
	call Random
	and a
	ld a, LUCKY_CHANNEL
	jr nz, .okay
	ld a, LUCKY_NUMBER_SHOW_14
.okay
	jp NextRadioLine

LuckyNumberShow14:
	ld hl, LC_DragText1
	ld a, LUCKY_NUMBER_SHOW_15
	jp NextRadioLine

LuckyNumberShow15:
	ld hl, LC_DragText2
	ld a, LUCKY_CHANNEL
	jp NextRadioLine

LC_Text1:
	; REED: Yeehaw! How
	text_far _LC_Text1
	text_end

LC_Text2:
	; y'all doin' now?
	text_far _LC_Text2
	text_end

LC_Text3:
	; Whether you're up
	text_far _LC_Text3
	text_end

LC_Text4:
	; or way down low,
	text_far _LC_Text4
	text_end

LC_Text5:
	; don't you miss the
	text_far _LC_Text5
	text_end

LC_Text6:
	; LUCKY NUMBER SHOW!
	text_far _LC_Text6
	text_end

LC_Text7:
	; This week's Lucky
	text_far _LC_Text7
	text_end

LC_Text8:
	; Number is @ !
	text_far _LC_Text8
	text_end

LC_Text9:
	; I'll repeat that!
	text_far _LC_Text9
	text_end

LC_Text10:
	; Match it and go to
	text_far _LC_Text10
	text_end

LC_Text11:
	; the RADIO TOWER!
	text_far _LC_Text11
	text_end

LC_DragText1:
	; …Repeating myself
	text_far _LC_DragText1
	text_end

LC_DragText2:
	; gets to be a drag…
	text_far _LC_DragText2
	text_end

PeoplePlaces1:
	call StartPokemonMusicChannel
	ld hl, PnP_Text1
	ld a, PLACES_AND_PEOPLE_2
	jp NextRadioLine

PeoplePlaces2:
	ld hl, PnP_Text2
	ld a, PLACES_AND_PEOPLE_3
	jp NextRadioLine

PeoplePlaces3:
	ld hl, PnP_Text1
	ld a, PLACES_AND_PEOPLE_2
	jp NextRadioLine

PnP_Text1:
	; PLACES AND PEOPLE!
	text_far _PnP_Text1
	text_end

PnP_Text2:
	; Brought to you by
	text_far _PnP_Text2
	text_end

PnP_Text3:
	; me, DJ LILY!
	text_far _PnP_Text3
	text_end

PeoplePlaces4: ; People
	call Random
	maskbits NUM_TRAINER_CLASSES
	inc a
	cp NUM_TRAINER_CLASSES - 1
	jr nc, PeoplePlaces4
	push af
	ld hl, PnP_HiddenPeople
	ld a, [wStatusFlags]
	bit STATUSFLAGS_HALL_OF_FAME_F, a
	jr z, .ok
	ld hl, PnP_HiddenPeople_BeatE4
	ld a, [wKantoBadges]
	cp %11111111 ; all badges
	jr nz, .ok
	ld hl, PnP_HiddenPeople_BeatKanto
.ok
	pop af
	ld c, a
	ld de, 1
	push bc
	call IsInArray
	pop bc
	jr c, PeoplePlaces4
	push bc
	callfar GetTrainerClassName
	ld de, wStringBuffer1
	call CopyName1
	pop bc
	ld b, 1
	callfar GetTrainerName
	ld hl, PnP_Text4
	ld a, PLACES_AND_PEOPLE_5
	jp NextRadioLine

INCLUDE "data/radio/pnp_hidden_people.asm"

PnP_Text4:
	; @  @ @
	text_far _PnP_Text4
	text_end

PeoplePlaces5:
	; 0-15 are all valid indexes into .Adjectives,
	; so no need for a retry loop
	call Random
	maskbits NUM_PNP_PEOPLE_ADJECTIVES
	ld e, a
	ld d, 0
	ld hl, .Adjectives
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	cp 4 percent
	ld a, PLACES_AND_PEOPLE
	jr c, .ok
	call Random
	cp 49 percent - 1
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp NextRadioLine

.Adjectives:
; there are NUM_PNP_PEOPLE_ADJECTIVES entries
	dw PnP_cute
	dw PnP_lazy
	dw PnP_happy
	dw PnP_noisy
	dw PnP_precocious
	dw PnP_bold
	dw PnP_picky
	dw PnP_sortofok
	dw PnP_soso
	dw PnP_great
	dw PnP_mytype
	dw PnP_cool
	dw PnP_inspiring
	dw PnP_weird
	dw PnP_rightforme
	dw PnP_odd

PnP_cute:
	; is cute.
	text_far _PnP_cute
	text_end

PnP_lazy:
	; is sort of lazy.
	text_far _PnP_lazy
	text_end

PnP_happy:
	; is always happy.
	text_far _PnP_happy
	text_end

PnP_noisy:
	; is quite noisy.
	text_far _PnP_noisy
	text_end

PnP_precocious:
	; is precocious.
	text_far _PnP_precocious
	text_end

PnP_bold:
	; is somewhat bold.
	text_far _PnP_bold
	text_end

PnP_picky:
	; is too picky!
	text_far _PnP_picky
	text_end

PnP_sortofok:
	; is sort of OK.
	text_far _PnP_sortofok
	text_end

PnP_soso:
	; is just so-so.
	text_far _PnP_soso
	text_end

PnP_great:
	; is actually great.
	text_far _PnP_great
	text_end

PnP_mytype:
	; is just my type.
	text_far _PnP_mytype
	text_end

PnP_cool:
	; is so cool, no?
	text_far _PnP_cool
	text_end

PnP_inspiring:
	; is inspiring!
	text_far _PnP_inspiring
	text_end

PnP_weird:
	; is kind of weird.
	text_far _PnP_weird
	text_end

PnP_rightforme:
	; is right for me?
	text_far _PnP_rightforme
	text_end

PnP_odd:
	; is definitely odd!
	text_far _PnP_odd
	text_end

PeoplePlaces6: ; Places
	call Random
	cp (PnP_HiddenPlaces.End - PnP_HiddenPlaces) / 2
	jr nc, PeoplePlaces6
	ld hl, PnP_HiddenPlaces
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	call GetWorldMapLocation
	ld e, a
	farcall GetLandmarkName
	ld hl, PnP_Text5
	ld a, PLACES_AND_PEOPLE_7
	jp NextRadioLine

INCLUDE "data/radio/pnp_hidden_places.asm"

PnP_Text5:
	; @ @
	text_far _PnP_Text5
	text_end

PeoplePlaces7:
	; 0-15 are all valid indexes into .Adjectives,
	; so no need for a retry loop
	call Random
	maskbits NUM_PNP_PLACES_ADJECTIVES
	ld e, a
	ld d, 0
	ld hl, .Adjectives
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyRadioTextToRAM
	call Random
	cp 4 percent
	ld a, PLACES_AND_PEOPLE
	jr c, .ok
	call Random
	cp 49 percent - 1
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp PrintRadioLine

.Adjectives:
; there are NUM_PNP_PLACES_ADJECTIVES entries
	dw PnP_cute
	dw PnP_lazy
	dw PnP_happy
	dw PnP_noisy
	dw PnP_precocious
	dw PnP_bold
	dw PnP_picky
	dw PnP_sortofok
	dw PnP_soso
	dw PnP_great
	dw PnP_mytype
	dw PnP_cool
	dw PnP_inspiring
	dw PnP_weird
	dw PnP_rightforme
	dw PnP_odd

RocketRadio1:
	call StartPokemonMusicChannel
	ld hl, RocketRadioText1
	ld a, ROCKET_RADIO_2
	jp NextRadioLine

RocketRadio2:
	ld hl, RocketRadioText2
	ld a, ROCKET_RADIO_3
	jp NextRadioLine

RocketRadio3:
	ld hl, RocketRadioText1
	ld a, ROCKET_RADIO_2
	jp NextRadioLine

RocketRadio4:
	call StartPokemonMusicChannel
	ld hl, RocketRadioText4
	ld a, ROCKET_RADIO_5
	jp NextRadioLine

RocketRadio5:
	ld hl, RocketRadioText5
	ld a, ROCKET_RADIO_6
	jp NextRadioLine

RocketRadio6:
	ld hl, RocketRadioText6
	ld a, ROCKET_RADIO_7
	jp NextRadioLine

RocketRadio7:
	ld hl, RocketRadioText4
	ld a, ROCKET_RADIO_5
	jp NextRadioLine

RocketRadio8:
	call StartPokemonMusicChannel
	ld hl, RocketRadioText8
	ld a, ROCKET_RADIO_9
	jp NextRadioLine

RocketRadio9:
	ld hl, RocketRadioText9
	ld a, ROCKET_RADIO_10
	jp NextRadioLine

RocketRadio10:
	ld hl, RocketRadioText8
	ld a, ROCKET_RADIO_9
	jp NextRadioLine

RocketRadioText1:
	; … …Ahem, we are
	text_far _RocketRadioText1
	text_end

RocketRadioText2:
	; TEAM ROCKET!
	text_far _RocketRadioText2
	text_end

RocketRadioText3:
	; After three years
	text_far _RocketRadioText3
	text_end

RocketRadioText4:
	; of preparation, we
	text_far _RocketRadioText4
	text_end

RocketRadioText5:
	; have risen again
	text_far _RocketRadioText5
	text_end

RocketRadioText6:
	; from the ashes!
	text_far _RocketRadioText6
	text_end

RocketRadioText7:
	; GIOVANNI! @ Can you
	text_far _RocketRadioText7
	text_end

RocketRadioText8:
	; hear?@  We did it!
	text_far _RocketRadioText8
	text_end

RocketRadioText9:
	; @ Where is our boss?
	text_far _RocketRadioText9
	text_end

RocketRadioText10:
	; @ Is he listening?
	text_far _RocketRadioText10
	text_end

PokeFluteRadio:
	call StartRadioStation
	ld a, 1
	ld [wNumRadioLinesPrinted], a
	ret

UnownRadio:
	call StartRadioStation
	ld a, 1
	ld [wNumRadioLinesPrinted], a
	ret

EvolutionRadio:
	call StartRadioStation
	ld a, 1
	ld [wNumRadioLinesPrinted], a
	ret

BuenasPassword1:
; Determine if we need to be here
	call StartPokemonMusicChannel
	ld hl, BuenaRadioText1
	ld a, BUENAS_PASSWORD_2
	jp NextRadioLine

BuenasPassword2:
	ret

BuenasPassword3:
	call StartPokemonMusicChannel
	ld hl, BuenaRadioText3
	ld a, BUENAS_PASSWORD_4
	jp NextRadioLine

BuenasPassword4:
	ld hl, BuenaRadioText4
	ld a, BUENAS_PASSWORD_5
	jp NextRadioLine

GetBuenasPassword:
; The password indices are held in c.  High nybble contains the group index, low nybble contains the word index.
; Load the password group pointer in hl.
	ld a, c
	swap a
	and $f
	ld hl, BuenasPasswordTable
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
; Get the password type and store it in b.
	ld a, [hli]
	ld b, a
	push hl
	inc hl
; Get the password index.
	ld a, c
	and $f
	ld c, a
	push hl
	ld hl, .StringFunctionJumpTable
	ld e, b
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de ; de now contains the pointer to the value of this week's password, in Blue Card Points.
	call _hl_
	pop hl
	ld c, [hl]
	ret

.StringFunctionJumpTable:
; entries correspond to BUENA_* constants
	dw .Mon       ; BUENA_MON
	dw .Item      ; BUENA_ITEM
	dw .Move      ; BUENA_MOVE
	dw .RawString ; BUENA_STRING

.Mon:
	ld h, 0
	ld l, c
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetPokemonIDFromIndex
	call GetPokemonName
	ret

.Item:
	ld h, 0
	ld l, c
	add hl, de
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ret

.Move:
	ld h, 0
	ld l, c
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMoveIDFromIndex
	call GetMoveName
	ret

.RawString:
; Get the string from the table...
	ld a, c
	and a
	jr z, .skip
.read_loop
	ld a, [de]
	inc de
	cp "@"
	jr nz, .read_loop
	dec c
	jr nz, .read_loop
; ... and copy it into wStringBuffer1.
.skip
	ld hl, wStringBuffer1
.copy_loop
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .copy_loop
	ld de, wStringBuffer1
	ret

INCLUDE "data/radio/buenas_passwords.asm"

BuenasPassword5:
	ld hl, BuenaRadioText3
	ld a, BUENAS_PASSWORD_4
	jp NextRadioLine

BuenasPassword6:
	call StartPokemonMusicChannel
	ld hl, BuenaRadioText6
	ld a, BUENAS_PASSWORD_7
	jp NextRadioLine

BuenasPassword7:
	ld hl, BuenaRadioText7
	ld a, BUENAS_PASSWORD_8
	jp NextRadioLine

BuenasPasswordAfterMidnight:
	push hl
	ld hl, wDailyFlags2
	res DAILYFLAGS2_BUENAS_PASSWORD_F, [hl]
	pop hl
	ld a, BUENAS_PASSWORD_8
	jp NextRadioLine

BuenasPassword8:
	ld hl, BuenaRadioMidnightText10
	ld a, BUENAS_PASSWORD_9
	jp NextRadioLine

BuenasPassword9:
	ld hl, BuenaRadioText6
	ld a, BUENAS_PASSWORD_7
	jp NextRadioLine

BuenasPassword10:
	call StartPokemonMusicChannel
	ld hl, BuenaRadioMidnightText2
	ld a, BUENAS_PASSWORD_11
	jp NextRadioLine

BuenasPassword11:
	ld hl, BuenaRadioMidnightText3
	ld a, BUENAS_PASSWORD_12
	jp NextRadioLine

BuenasPassword12:
	ld hl, BuenaRadioMidnightText4
	ld a, BUENAS_PASSWORD_13
	jp NextRadioLine

BuenasPassword13:
	ld hl, BuenaRadioMidnightText5
	ld a, BUENAS_PASSWORD_14
	jp NextRadioLine

BuenasPassword14:
	ld hl, BuenaRadioMidnightText2
	ld a, BUENAS_PASSWORD_11
	jp NextRadioLine

BuenasPassword15:
	call StartPokemonMusicChannel
	ld hl, BuenaRadioMidnightText7
	ld a, BUENAS_PASSWORD_16
	jp NextRadioLine

BuenasPassword16:
	ld hl, BuenaRadioMidnightText8
	ld a, BUENAS_PASSWORD_17
	jp NextRadioLine

BuenasPassword17:
	ld hl, BuenaRadioMidnightText7
	ld a, BUENAS_PASSWORD_16
	jp NextRadioLine

BuenasPassword18:
	ld hl, BuenaRadioMidnightText10
	ld a, BUENAS_PASSWORD_19
	jp NextRadioLine

BuenasPassword19:
	call StartPokemonMusicChannel
	ld hl, BuenaRadioText6
	ld a, BUENAS_PASSWORD_20
	jp NextRadioLine

BuenasPassword20:
	ld hl, BuenaRadioText5
	ld a, BUENAS_PASSWORD_21
	jp NextRadioLine

BuenasPassword21:
	ld hl, BuenaRadioText6
	ld a, BUENAS_PASSWORD_20
	jp NextRadioLine

BuenasPasswordCheckTime:
	call UpdateTime
	ldh a, [hHours]
	cp NITE_HOUR
	ret

BuenasPasswordChannelName:
	db "BUENA'S PASSWORD@"

BuenaRadioText1:
	; BUENA: BUENA here!
	text_far _BuenaRadioText1
	text_end

BuenaRadioText2:
	; Today's password!
	text_far _BuenaRadioText2
	text_end

BuenaRadioText3:
	; Let me think… It's
	text_far _BuenaRadioText3
	text_end

BuenaRadioText4:
	; @ !
	text_far _BuenaRadioText4
	text_end

BuenaRadioText5:
	; Don't forget it!
	text_far _BuenaRadioText5
	text_end

BuenaRadioText6:
	; I'm in GOLDENROD's
	text_far _BuenaRadioText6
	text_end

BuenaRadioText7:
	; RADIO TOWER!
	text_far _BuenaRadioText7
	text_end

BuenaRadioMidnightText1:
	; BUENA: Oh my…
	text_far _BuenaRadioMidnightText1
	text_end

BuenaRadioMidnightText2:
	; It's midnight! I
	text_far _BuenaRadioMidnightText2
	text_end

BuenaRadioMidnightText3:
	; have to shut down!
	text_far _BuenaRadioMidnightText3
	text_end

BuenaRadioMidnightText4:
	; Thanks for tuning
	text_far _BuenaRadioMidnightText4
	text_end

BuenaRadioMidnightText5:
	; in to the end! But
	text_far _BuenaRadioMidnightText5
	text_end

BuenaRadioMidnightText6:
	; don't stay up too
	text_far _BuenaRadioMidnightText6
	text_end

BuenaRadioMidnightText7:
	; late! Presented to
	text_far _BuenaRadioMidnightText7
	text_end

BuenaRadioMidnightText8:
	; you by DJ BUENA!
	text_far _BuenaRadioMidnightText8
	text_end

BuenaRadioMidnightText9:
	; I'm outta here!
	text_far _BuenaRadioMidnightText9
	text_end

BuenaRadioMidnightText10:
	; …
	text_far _BuenaRadioMidnightText10
	text_end

BuenaOffTheAirText:
	;
	text_far _BuenaOffTheAirText
	text_end

CopyRadioTextToRAM:
	ld a, [hl]
	cp TX_FAR
	jp z, FarCopyRadioText
	ld de, wRadioText
	ld bc, SCREEN_WIDTH * 2
	jp CopyBytes

StartRadioStation:
	ld a, [wNumRadioLinesPrinted]
	and a
	ret nz
	call RadioTerminator
	call PrintText
	ld hl, RadioChannelSongs
	ld a, [wCurRadioLine]
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	callfar RadioMusicRestartDE
	ret

INCLUDE "data/radio/channel_music.asm"

NextRadioLine:
	push af
	call CopyRadioTextToRAM
	pop af
	jp PrintRadioLine
