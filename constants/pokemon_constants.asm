; pokemon ids
; indexes for:
; - PokemonNames (see data/pokemon/names.asm)
; - BaseData (see data/pokemon/base_stats.asm)
; - EvosAttacksPointers (see data/pokemon/evos_attacks_pointers.asm)
; - EggMovePointers (see data/pokemon/egg_move_pointers.asm)
; - PokemonCries (see data/pokemon/cries.asm)
; - MonMenuIcons (see data/pokemon/menu_icons.asm)
; - PokemonPicPointers (see data/pokemon/pic_pointers.asm)
; - PokemonPalettes (see data/pokemon/palettes.asm)
; - PokedexDataPointerTable (see data/pokemon/dex_entry_pointers.asm)
; - AlphabeticalPokedexOrder (see data/pokemon/dex_order_alpha.asm)
; - EZChat_SortedPokemon (see data/pokemon/ezchat_order.asm)
; - NewPokedexOrder (see data/pokemon/dex_order_new.asm)
; - Pokered_MonIndices (see data/pokemon/gen1_order.asm)
; - AnimationPointers (see gfx/pokemon/anim_pointers.asm)
; - AnimationIdlePointers (see gfx/pokemon/idle_pointers.asm)
; - BitmasksPointers (see gfx/pokemon/bitmask_pointers.asm)
; - FramesPointers (see gfx/pokemon/frame_pointers.asm)
; - Footprints (see gfx/footprints.asm)
	const_def 1
	const BULBASAUR    ; 01 1
	const IVYSAUR      ; 02 3
	const VENUSAUR     ; 03 5
	const CHARMANDER   ; 04 1
	const CHARMELEON   ; 05 3
	const CHARIZARD    ; 06 12
	const SQUIRTLE     ; 07 1
	const WARTORTLE    ; 08 3
	const BLASTOISE    ; 09 7
	const CATERPIE     ; 0a 0
	const METAPOD      ; 0b 1
	const BUTTERFREE   ; 0c 7
	const WEEDLE       ; 0d 0
	const KAKUNA       ; 0e 0
	const BEEDRILL     ; 0f 10
	const PIDGEY       ; 10 2
	const PIDGEOTTO    ; 11 3
	const PIDGEOT      ; 12 9
	const RATTATA      ; 13 2
	const RATTATA_A    ; 14 1
	const RATICATE     ; 15 3
	const RATICATE_A   ; 16 3
	const SPEAROW      ; 17 2
	const FEAROW       ; 18 5
	const EKANS        ; 19 1
	const ARBOK        ; 1a 19
	const PICHU        ; 1b 1
	const PIKACHU      ; 1c 1
	const RAICHU       ; 1d 11
	const RAICHU_A     ; 1e 20
	const SANDSHREW    ; 1f 2
	const SANDSHREW_A  ; 20 1
	const SANDSLASH    ; 21 7
	const SANDSLASH_A  ; 22 4
	const NIDORAN_F    ; 23 1
	const NIDORINA     ; 24 2
	const NIDOQUEEN    ; 25 10
	const NIDORAN_M    ; 26 2
	const NIDORINO     ; 27 2
	const NIDOKING     ; 28 9
	const CLEFFA       ; 29 1
	const CLEFAIRY     ; 2a 1
	const CLEFABLE     ; 2b 6
	const VULPIX       ; 2c 4
	const VULPIX_A     ; 2d 1
	const NINETALES    ; 2e 6
	const NINETALES_A  ; 2f 2
	const IGGLYBUFF    ; 30 2
	const JIGGLYPUFF   ; 31 2
	const WIGGLYTUFF   ; 32 4
	const ZUBAT        ; 33 4
	const GOLBAT       ; 34 3
	const CROBAT       ; 35 11
	const ODDISH       ; 36 2
	const GLOOM        ; 37 2
	const VILEPLUME    ; 38 6
	const BELLOSSOM    ; 39 6
	const PARAS        ; 3a 1
	const PARASECT     ; 3b 5
	const VENONAT      ; 3c 1
	const VENOMOTH     ; 3d 6
	const DIGLETT      ; 3e 1
	const DIGLETT_A    ; 3f 1
	const DUGTRIO      ; 40 7
	const DUGTRIO_A    ; 41 3
	const MEOWTH       ; 42 1
	const MEOWTH_A     ; 43 1
	const MEOWTH_G     ; 44 1
	const PERSIAN      ; 45 8
	const PERSIAN_A    ; 46 3
	const PERRSERKER   ; 47 2
	const PSYDUCK      ; 48 5
	const GOLDUCK      ; 49 4
	const MANKEY       ; 4a 2
	const PRIMEAPE     ; 4b 2
	const ANNIHILAPE   ; 4c 6
	const GROWLITHE    ; 4d 3
	const GROWLITHE_H  ; 4e 1
	const ARCANINE     ; 4f 11
	const ARCANINE_H   ; 50 6
	const POLIWAG      ; 51 1
	const POLIWHIRL    ; 52 1
	const POLIWRATH    ; 53 5
	const POLITOED     ; 54 7
	const ABRA         ; 55 1
	const KADABRA      ; 56 6
	const ALAKAZAM     ; 57 12
	const MACHOP       ; 58 6
	const MACHOKE      ; 59 4
	const MACHAMP      ; 5a 15
	const BELLSPROUT   ; 5b 4
	const WEEPINBELL   ; 5c 8
	const VICTREEBEL   ; 5d 12
	const TENTACOOL    ; 5e 4
	const TENTACRUEL   ; 5f 9
	const GEODUDE      ; 60 2
	const GEODUDE_A    ; 61 1
	const GRAVELER     ; 62 2
	const GRAVELER_A   ; 63 1
	const GOLEM        ; 64 8
	const GOLEM_A      ; 65 3
	const PONYTA       ; 66 2
	const PONYTA_G     ; 67 1
	const RAPIDASH     ; 68 6
	const RAPIDASH_G   ; 69 2
	const SLOWPOKE     ; 6a 7
	const SLOWPOKE_G   ; 6b 1
	const SLOWBRO      ; 6c 4
	const SLOWBRO_G    ; 6d 1
	const SLOWKING     ; 6e 2
	const SLOWKING_G   ; 6f 1
	const MAGNEMITE    ; 70 5
	const MAGNETON     ; 71 3
	const MAGNEZONE    ; 72 7
	const FARFETCH_D   ; 73 3
	const FARFETCH_D_G ; 74 2
	const SIRFETCH_D   ; 75 1
	const DODUO        ; 76 2
	const DODRIO       ; 77 11
	const SEEL         ; 78 2
	const DEWGONG      ; 79 10
	const GRIMER       ; 7a 1
	const GRIMER_A     ; 7b 1
	const MUK          ; 7c 6
	const MUK_A        ; 7d 4
	const SHELLDER     ; 7e 3
	const CLOYSTER     ; 7f 6
	const GASTLY       ; 80 2
	const HAUNTER      ; 81 1
	const GENGAR       ; 82 5
	const ONIX         ; 83 2
	const STEELIX      ; 84 11
	const DROWZEE      ; 85 2
	const HYPNO        ; 86 7
	const KRABBY       ; 87 1
	const KINGLER      ; 88 7
	const VOLTORB      ; 89 2
	const VOLTORB_H    ; 8a 1
	const ELECTRODE    ; 8b 7
	const ELECTRODE_H  ; 8c 3
	const EXEGGCUTE    ; 8d 1
	const EXEGGUTOR    ; 8e 4
	const EXEGGUTOR_A  ; 8f 2
	const CUBONE       ; 90 1
	const MAROWAK      ; 91 3
	const MAROWAK_A    ; 92 1
	const TYROGUE      ; 93 1
	const HITMONLEE    ; 94 4
	const HITMONCHAN   ; 95 7
	const HITMONTOP    ; 96 4
	const LICKITUNG    ; 97 1
	const LICKILICKY   ; 98 6
	const KOFFING      ; 99 2
	const WEEZING      ; 9a 13
	const WEEZING_G    ; 9b 2
	const RHYHORN      ; 9c 1
	const RHYDON       ; 9d 2
	const RHYPERIOR    ; 9e 6
	const HAPPINY      ; 9f 1
	const CHANSEY      ; a0 2
	const BLISSEY      ; a1 6
	const TANGELA      ; a2 2
	const TANGROWTH    ; a3 6
	const KANGASKHAN   ; a4 5
	const HORSEA       ; a5 5
	const SEADRA       ; a6 3
	const KINGDRA      ; a7 10
	const GOLDEEN      ; a8 7
	const SEAKING      ; a9 9
	const STARYU       ; aa 3
	const STARMIE      ; ab 12
	const MIME__JR     ; ac 1
	const MR__MIME     ; ad 10
	const MR__MIME_G   ; ae 2
	const MR__RIME     ; af 3
	const SCYTHER      ; b0 5
	const SCIZOR       ; b1 9
	const KLEAVOR      ; b2 1
	const SMOOCHUM     ; b3 3
	const JYNX         ; b4 5
	const ELEKID       ; b5 1
	const ELECTABUZZ   ; b6 4
	const ELECTIVIRE   ; b7 7
	const MAGBY        ; b8 1
	const MAGMAR       ; b9 2
	const MAGMORTAR    ; ba 8
JOHTO_POKEMON EQU const_value
	const PINSIR       ; bb 5
	const TAUROS       ; bc 8
	const TAUROS_P     ; bd 1
	const MAGIKARP     ; be 4
	const GYARADOS     ; bf 15
	const LAPRAS       ; c0 7
	const DITTO        ; c1 4
	const EEVEE        ; c2 2
	const VAPOREON     ; c3 6
	const JOLTEON      ; c4 8
	const FLAREON      ; c5 9
	const ESPEON       ; c6 11
	const UMBREON      ; c7 9
	const LEAFEON      ; c8 5
	const GLACEON      ; c9 3
	const SYLVEON      ; ca 2
	const PORYGON      ; cb 1
	const PORYGON2     ; cc 2
	const PORYGON_Z    ; cd 4
	const OMANYTE      ; ce 1
	const OMASTAR      ; cf 4
	const KABUTO       ; d0 1
	const KABUTOPS     ; d1 5
	const AERODACTYL   ; d2 5
	const MUNCHLAX     ; d3 1
	const SNORLAX      ; d4 5
	const ARTICUNO     ; d5 0
	const ARTICUNO_G   ; d6 1
	const ZAPDOS       ; d7 0
	const ZAPDOS_G     ; d8 1
	const MOLTRES      ; d9 0
	const MOLTRES_G    ; da 1
	const DRATINI      ; db 2
	const DRAGONAIR    ; dc 3
	const DRAGONITE    ; dd 7
	const MEWTWO       ; de 0
	const MEW          ; df 0
	const CHIKORITA    ; e0 1
	const BAYLEEF      ; e1 1
	const MEGANIUM     ; e2 5
	const CYNDAQUIL    ; e3 0
	const QUILAVA      ; e4 2
	const TYPHLOSION   ; e5 11
	const TYPHLOSION_H ; e6 2
	const TOTODILE     ; e7 0
	const CROCONAW     ; e8 3
	const FERALIGATR   ; e9 6
	const SENTRET      ; ea 1
	const FURRET       ; eb 7
	const HOOTHOOT     ; ec 0
	const NOCTOWL      ; ed 11
	const LEDYBA       ; ee 1
	const LEDIAN       ; ef 9
	const SPINARAK     ; f0 1
	const ARIADOS      ; f1 11
	const CHINCHOU     ; f2 1
	const LANTURN      ; f3 9
	const TOGEPI       ; f4 1
	const TOGETIC      ; f5 2
	const TOGEKISS     ; f6 5
	const NATU         ; f7 2
	const XATU         ; f8 12
	const MAREEP       ; f9 1
	const FLAAFFY      ; fa 2
	const AMPHAROS     ; fb 10
	const AZURILL      ; fc 0
	const MARILL       ; fd 2
	const AZUMARILL    ; fe 18
	const BONSLY       ; ff 1
	const SUDOWOODO    ; 100 7
	const HOPPIP       ; 101 1
	const SKIPLOOM     ; 102 2
	const JUMPLUFF     ; 103 10
	const AIPOM        ; 104 2
	const AMBIPOM      ; 105 5
	const SUNKERN      ; 106 0
	const SUNFLORA     ; 107 8
	const YANMA        ; 108 5
	const YANMEGA      ; 109 8
	const WOOPER       ; 10a 2
	const WOOPER_P     ; 10b 1
	const QUAGSIRE     ; 10c 12
	const CLODSIRE     ; 10d 2
	const MURKROW      ; 10e 1
	const HONCHKROW    ; 10f 7
	const MISDREAVUS   ; 110 2
	const MISMAGIUS    ; 111 3
	const UNOWN        ; 112 0
	const WYNAUT       ; 113 1
	const WOBBUFFET    ; 114 3
	const GIRAFARIG    ; 115 2
	const FARIGIRAF    ; 116 9
	const PINECO       ; 117 1
	const FORRETRESS   ; 118 8
	const DUNSPARCE    ; 119 1
	const DUDUNSPARS   ; 11a 7
	const GLIGAR       ; 11b 3
	const GLISCOR      ; 11c 11
	const SNUBBULL     ; 11d 1
	const GRANBULL     ; 11e 10
	const QWILFISH     ; 11f 1
	const OVERQWIL     ; 120 10
	const SHUCKLE      ; 121 5
	const HERACROSS    ; 122 10
	const SNEASEL      ; 123 2
	const SNEASEL_H    ; 124 2
	const WEAVILE      ; 125 8
	const SNEASLER     ; 126 2
	const TEDDIURSA    ; 127 2
	const URSARING     ; 128 4
	const URSALUNA     ; 129 5
	const URSALUNA_BLOOD ; 12a 1
	const SLUGMA       ; 12b 2
	const MAGCARGO     ; 12c 7
	const SWINUB       ; 12d 3
	const PILOSWINE    ; 12e 2
	const MAMOSWINE    ; 12f 5
	const CORSOLA_J    ; 130 1
	const CORSOLA      ; 131 4
	const CURSOLA      ; 132 4
	const REMORAID     ; 133 2
	const OCTILLERY    ; 134 10
	const DELIBIRD     ; 135 6
	const MANTYKE      ; 136 3
	const MANTINE      ; 137 10
	const SKARMINI     ; 138 0
	const SKARMORY     ; 139 11
	const HOUNDOUR     ; 13a 2
	const HOUNDOOM     ; 13b 5
	const PHANPY       ; 13c 1
	const DONPHAN      ; 13d 7
	const STANTLER     ; 13e 4
	const WYRDEER      ; 13f 6
	const SMEARGLE     ; 140 2
	const MILTANK      ; 141 5
	const KOTORA       ; 142 1
	const RAITORA      ; 143 3
	const GOROTORA     ; 144 5
	const BUDEW        ; 145 1
	const ROSELIA      ; 146 4
	const ROSERADE     ; 147 11
	const ELECTRIKE    ; 148 2
	const MANECTRIC    ; 149 8
	const CROAGUNK     ; 14a 2
	const TOXICROAK    ; 14b 6
	const SWABLU       ; 14c 1
	const ALTARIA      ; 14d 7
	const DUSKULL      ; 14e 3
	const DUSCLOPS     ; 14f 3
	const DUSKNOIR     ; 150 6
	const LOTAD        ; 151 1
	const LOMBRE       ; 152 1
	const LUDICOLO     ; 153 8
	const SNORUNT      ; 154 3
	const GLALIE       ; 155 3
	const FROSLASS     ; 156 6
	const BRONZOR      ; 157 2
	const BRONZONG     ; 158 6
	const CACNEA       ; 159 3
	const CACTURNE     ; 15a 8
	const RALTS        ; 15b 2
	const KIRLIA       ; 15c 2
	const GARDEVOIR    ; 15d 9
	const GALLADE      ; 15e 9
	const SHROOMISH    ; 15f 1
	const BRELOOM      ; 160 2
	const SABLEYE
	const MAWILE
	const ARON         ; 161 3
	const LAIRON       ; 162 3
	const AGGRON       ; 163 9
	const MEDITITE
	const MEDICHAM
	const CARVANHA
	const SHARPEDO
	const NUMEL
	const CAMERUPT
	const RAIKOU       ; 164 1
	const ENTEI        ; 165 1
	const SUICUNE      ; 166 1
	const LARVITAR     ; 167 1
	const PUPITAR      ; 168 2
	const TYRANITAR    ; 169 6
	const GIBLE        ; 16a 1
	const GABITE       ; 16b 5
	const GARCHOMP     ; 16c 9
	const BAGON        ; 16d 1
	const SHELGON      ; 16e 1
	const SALAMENCE    ; 16f 7
	const BELDUM       ; 170 1
	const METANG       ; 171 2
	const METAGROSS    ; 172 2
	const LUGIA        ; 173 1
	const HO_OH        ; 174 1
	const CELEBI       ; 175 0
	const NOWN         ; 176 0
	const MISSINGNO    ; 177 0
	const REGIROCK     ; 178 0
	const REGICE       ; 179 0
	const REGISTEEL    ; 17a 0
	const REGIELEKI    ; 17b
	const REGIDRAGO    ; 17c
	const REGIGIGAS    ; 17d
	const TAUROS_P_FIRE ; 17e
	const TAUROS_P_WATER ; 17f

NUM_POKEMON EQU const_value + -1

EGG EQU -3

; limits:
; 999: everything that prints dex counts
; 1407: size of wPokedexOrder
; 4095: hard limit; would require serious redesign to increase
if NUM_POKEMON > 999
	fail "Too many Pokémon defined!"
endc

; Unown forms
; indexes for:
; - UnownWords (see data/pokemon/unown_words.asm)
; - UnownPicPointers (see data/pokemon/unown_pic_pointers.asm)
; - UnownAnimationPointers (see gfx/pokemon/unown_anim_pointers.asm)
; - UnownAnimationIdlePointers (see gfx/pokemon/unown_idle_pointers.asm)
; - UnownBitmasksPointers (see gfx/pokemon/unown_bitmask_pointers.asm)
; - UnownFramesPointers (see gfx/pokemon/unown_frame_pointers.asm)
	const_def 1
	const UNOWN_A ;  1
	const UNOWN_B ;  2
	const UNOWN_C ;  3
	const UNOWN_D ;  4
	const UNOWN_E ;  5
	const UNOWN_F ;  6
	const UNOWN_G ;  7
	const UNOWN_H ;  8
	const UNOWN_I ;  9
	const UNOWN_J ; 10
	const UNOWN_K ; 11
	const UNOWN_L ; 12
	const UNOWN_M ; 13
	const UNOWN_N ; 14
	const UNOWN_O ; 15
	const UNOWN_P ; 16
	const UNOWN_Q ; 17
	const UNOWN_R ; 18
	const UNOWN_S ; 19
	const UNOWN_T ; 20
	const UNOWN_U ; 21
	const UNOWN_V ; 22
	const UNOWN_W ; 23
	const UNOWN_X ; 24
	const UNOWN_Y ; 25
	const UNOWN_Z ; 26
NUM_UNOWN EQU const_value + -1 ; 26

	const_def 1
	const TAUROS_PLAIN
	const TARUOS_FIRE
	const TAUROS_WATER
NUM_TAUROS EQU const_value + -1
