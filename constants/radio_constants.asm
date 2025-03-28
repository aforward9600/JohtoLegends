; radio channel ids
; indexes for:
; - RadioChannelSongs (see data/radio/channel_music.asm)
; - PlayRadioShow/RadioJumptable (see engine/pokegear/radio.asm)
; - RadioChannels (see engine/pokegear/pokegear.asm)
	const_def
	const OAKS_POKEMON_TALK      ; 00 used
	const POKEDEX_SHOW           ; 01 used
	const POKEMON_MUSIC          ; 02 used
	const LUCKY_CHANNEL          ; 03 used
	const BUENAS_PASSWORD        ; 04 used
	const PLACES_AND_PEOPLE      ; 05 used
	const LETS_ALL_SING          ; 06 used
	const ROCKET_RADIO           ; 07
	const POKE_FLUTE_RADIO       ; 08
	const UNOWN_RADIO            ; 09
	const EVOLUTION_RADIO        ; 0a
; internal indexes for channel segments
	const OAKS_POKEMON_TALK_2    ; 0b used
	const OAKS_POKEMON_TALK_3    ; 0c used
	const OAKS_POKEMON_TALK_4    ; 0d used
	const OAKS_POKEMON_TALK_5    ; 0e used
	const OAKS_POKEMON_TALK_6    ; 0f used
	const OAKS_POKEMON_TALK_7    ; 10 used
	const OAKS_POKEMON_TALK_8    ; 11 used
	const OAKS_POKEMON_TALK_9    ; 12 used
	const POKEDEX_SHOW_2         ; 13 used
	const POKEDEX_SHOW_3         ; 14
	const POKEDEX_SHOW_4         ; 15
	const POKEDEX_SHOW_5         ; 16
	const POKEMON_MUSIC_2        ; 17 used
	const POKEMON_MUSIC_3        ; 18 used
	const POKEMON_MUSIC_4        ; 19 used
	const POKEMON_MUSIC_5        ; 1a
	const POKEMON_MUSIC_6        ; 1b
	const POKEMON_MUSIC_7        ; 1c
	const LETS_ALL_SING_2        ; 1d used
	const LUCKY_NUMBER_SHOW_2    ; 1e used
	const LUCKY_NUMBER_SHOW_3    ; 1f
	const LUCKY_NUMBER_SHOW_4    ; 20
	const LUCKY_NUMBER_SHOW_5    ; 21
	const LUCKY_NUMBER_SHOW_6    ; 22
	const LUCKY_NUMBER_SHOW_7    ; 23
	const LUCKY_NUMBER_SHOW_8    ; 24
	const LUCKY_NUMBER_SHOW_9    ; 25
	const LUCKY_NUMBER_SHOW_10   ; 26
	const LUCKY_NUMBER_SHOW_11   ; 27
	const LUCKY_NUMBER_SHOW_12   ; 28
	const LUCKY_NUMBER_SHOW_13   ; 29
	const LUCKY_NUMBER_SHOW_14   ; 2a
	const LUCKY_NUMBER_SHOW_15   ; 2b
	const PLACES_AND_PEOPLE_2    ; 2c used
	const PLACES_AND_PEOPLE_3    ; 2d used
	const PLACES_AND_PEOPLE_4    ; 2e
	const PLACES_AND_PEOPLE_5    ; 2f
	const PLACES_AND_PEOPLE_6    ; 30
	const PLACES_AND_PEOPLE_7    ; 31
	const ROCKET_RADIO_2         ; 32 used
	const ROCKET_RADIO_3         ; 33 used
	const ROCKET_RADIO_4         ; 34 used
	const ROCKET_RADIO_5         ; 35 used
	const ROCKET_RADIO_6         ; 36 used
	const ROCKET_RADIO_7         ; 37 used
	const ROCKET_RADIO_8         ; 38 used
	const ROCKET_RADIO_9         ; 39 used
	const ROCKET_RADIO_10        ; 3a used
	const OAKS_POKEMON_TALK_10   ; 3b
	const OAKS_POKEMON_TALK_11   ; 3c
	const OAKS_POKEMON_TALK_12   ; 3d
	const OAKS_POKEMON_TALK_13   ; 3e
	const OAKS_POKEMON_TALK_14   ; 3f
	const BUENAS_PASSWORD_2      ; 40 used
	const BUENAS_PASSWORD_3      ; 41 used
	const BUENAS_PASSWORD_4      ; 42 used
	const BUENAS_PASSWORD_5      ; 43 used
	const BUENAS_PASSWORD_6      ; 44 used
	const BUENAS_PASSWORD_7      ; 45 used
	const BUENAS_PASSWORD_8      ; 46 used
	const BUENAS_PASSWORD_9      ; 47 used
	const BUENAS_PASSWORD_10     ; 48 used
	const BUENAS_PASSWORD_11     ; 49 used
	const BUENAS_PASSWORD_12     ; 4a used
	const BUENAS_PASSWORD_13     ; 4b used
	const BUENAS_PASSWORD_14     ; 4c used
	const BUENAS_PASSWORD_15     ; 4d used
	const BUENAS_PASSWORD_16     ; 4e used
	const BUENAS_PASSWORD_17     ; 4f used
	const BUENAS_PASSWORD_18     ; 50
	const BUENAS_PASSWORD_19     ; 51 used
	const BUENAS_PASSWORD_20     ; 52 used
	const BUENAS_PASSWORD_21     ; 53 used
	const RADIO_SCROLL           ; 54
	const POKEDEX_SHOW_6         ; 55
	const POKEDEX_SHOW_7         ; 56
	const POKEDEX_SHOW_8         ; 57

; PlayRadio.StationPointers indexes (see engine/pokegear/pokegear.asm)
	const_def
	const MAPRADIO_POKEMON_CHANNEL
	const MAPRADIO_OAKS_POKEMON_TALK
	const MAPRADIO_POKEDEX_SHOW
	const MAPRADIO_POKEMON_MUSIC
	const MAPRADIO_LUCKY_CHANNEL
	const MAPRADIO_UNOWN
	const MAPRADIO_PLACES_PEOPLE
	const MAPRADIO_LETS_ALL_SING
	const MAPRADIO_ROCKET

; These tables in engine/pokegear/radio.asm are all sized to a power of 2
; so there's no need for a rejection sampling loop
NUM_OAKS_POKEMON_TALK_ADVERBS    EQU 16 ; OaksPKMNTalk8.Adverbs
NUM_OAKS_POKEMON_TALK_ADJECTIVES EQU 16 ; OaksPKMNTalk9.Adjectives
NUM_PNP_PEOPLE_ADJECTIVES    EQU 16 ; PeoplePlaces5.Adjectives
NUM_PNP_PLACES_ADJECTIVES    EQU 16 ; PeoplePlaces7.Adjectives

; BuenasPasswordTable sizes (see data/radio/buenas_passwords.asm)
NUM_PASSWORD_CATEGORIES    EQU 11
NUM_PASSWORDS_PER_CATEGORY EQU  3

; GetBuenasPassword.StringFunctionJumpTable indexes (see engine/pokegear/radio.asm)
	const_def
	const BUENA_MON
	const BUENA_ITEM
	const BUENA_MOVE
	const BUENA_STRING
