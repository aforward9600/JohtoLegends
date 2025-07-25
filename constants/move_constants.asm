; move ids
; indexes for:
; - Moves (see data/moves/moves.asm)
; - MoveNames (see data/moves/names.asm)
; - MoveDescriptions (see data/moves/descriptions.asm)
; - BattleAnimations (see data/moves/animations.asm)
	const_def
	const NO_MOVE      ; 00
	const POUND        ; 01
	const KARATE_CHOP  ; 02
	const DOUBLESLAP   ; 03
	const COMET_PUNCH  ; 04
	const MEGA_PUNCH   ; 05
	const PAY_DAY      ; 06
	const FIRE_PUNCH   ; 07
	const ICE_PUNCH    ; 08
	const THUNDERPUNCH ; 09
	const SCRATCH      ; 0a
	const VICEGRIP     ; 0b
	const GUILLOTINE   ; 0c
	const RAZOR_WIND   ; 0d
	const SWORDS_DANCE ; 0e
	const CUT          ; 0f
	const GUST         ; 10
	const WING_ATTACK  ; 11
	const WHIRLWIND    ; 12
	const FLY          ; 13
	const BIND         ; 14
	const SLAM         ; 15
	const VINE_WHIP    ; 16
	const STOMP        ; 17
	const DOUBLE_KICK  ; 18
	const MEGA_KICK    ; 19
	const JUMP_KICK    ; 1a
	const ROLLING_KICK ; 1b
	const SAND_ATTACK  ; 1c
	const HEADBUTT     ; 1d
	const HORN_ATTACK  ; 1e
	const FURY_ATTACK  ; 1f
	const HORN_DRILL   ; 20
	const TACKLE       ; 21
	const BODY_SLAM    ; 22
	const WRAP         ; 23
	const TAKE_DOWN    ; 24
	const THRASH       ; 25
	const DOUBLE_EDGE  ; 26
	const TAIL_WHIP    ; 27
	const POISON_STING ; 28
	const TWINEEDLE    ; 29
	const PIN_MISSILE  ; 2a
	const LEER         ; 2b
	const BITE         ; 2c
	const GROWL        ; 2d
	const ROAR         ; 2e
	const SING         ; 2f
	const SUPERSONIC   ; 30
	const SONICBOOM    ; 31
	const DISABLE      ; 32
	const ACID         ; 33
	const EMBER        ; 34
	const FLAMETHROWER ; 35
	const MIST         ; 36
	const WATER_GUN    ; 37
	const HYDRO_PUMP   ; 38
	const SURF         ; 39
	const ICE_BEAM     ; 3a
	const BLIZZARD     ; 3b
	const PSYBEAM      ; 3c
	const BUBBLEBEAM   ; 3d
	const AURORA_BEAM  ; 3e
	const HYPER_BEAM   ; 3f
	const PECK         ; 40
	const DRILL_PECK   ; 41
	const SUBMISSION   ; 42
	const LOW_KICK     ; 43
	const COUNTER      ; 44
	const SEISMIC_TOSS ; 45
	const STRENGTH     ; 46
	const ABSORB       ; 47
	const MEGA_DRAIN   ; 48
	const LEECH_SEED   ; 49
	const GROWTH       ; 4a
	const RAZOR_LEAF   ; 4b
	const SOLARBEAM    ; 4c
	const POISONPOWDER ; 4d
	const STUN_SPORE   ; 4e
	const SLEEP_POWDER ; 4f
	const PETAL_DANCE  ; 50
	const STRING_SHOT  ; 51
	const DRAGON_RAGE  ; 52
	const FIRE_SPIN    ; 53
	const THUNDERSHOCK ; 54
	const THUNDERBOLT  ; 55
	const THUNDER_WAVE ; 56
	const THUNDER      ; 57
	const ROCK_THROW   ; 58
	const EARTHQUAKE   ; 59
	const FISSURE      ; 5a
	const DIG          ; 5b
	const TOXIC        ; 5c
	const CONFUSION    ; 5d
	const PSYCHIC_M    ; 5e
	const HYPNOSIS     ; 5f
	const MEDITATE     ; 60
	const AGILITY      ; 61
	const QUICK_ATTACK ; 62
	const RAGE         ; 63
	const TELEPORT     ; 64
	const NIGHT_SHADE  ; 65
	const MIMIC        ; 66
	const SCREECH      ; 67
	const DOUBLE_TEAM  ; 68
	const RECOVER      ; 69
	const HARDEN       ; 6a
	const MINIMIZE     ; 6b
	const SMOKESCREEN  ; 6c
	const CONFUSE_RAY  ; 6d
	const WITHDRAW     ; 6e
	const DEFENSE_CURL ; 6f
	const BARRIER      ; 70
	const LIGHT_SCREEN ; 71
	const HAZE         ; 72
	const REFLECT      ; 73
	const FOCUS_ENERGY ; 74
	const ROCK_TOMB    ; 75
	const METRONOME    ; 76
	const MIRROR_MOVE  ; 77
	const SELFDESTRUCT ; 78
	const EGG_BOMB     ; 79
	const LICK         ; 7a
	const SMOG         ; 7b
	const SLUDGE       ; 7c
	const BONE_CLUB    ; 7d
	const FIRE_BLAST   ; 7e
	const WATERFALL    ; 7f
	const CLAMP        ; 80
	const SWIFT        ; 81
	const SKULL_BASH   ; 82
	const SPIKE_CANNON ; 83
	const CONSTRICT    ; 84
	const AMNESIA      ; 85
	const KINESIS      ; 86
	const SOFTBOILED   ; 87
	const HI_JUMP_KICK ; 88
	const GLARE        ; 89
	const DREAM_EATER  ; 8a
	const POISON_GAS   ; 8b
	const BARRAGE      ; 8c
	const LEECH_LIFE   ; 8d
	const LOVELY_KISS  ; 8e
	const SKY_ATTACK   ; 8f
	const TRANSFORM    ; 90
	const BUBBLE       ; 91
	const DIZZY_PUNCH  ; 92
	const SPORE        ; 93
	const FLASH        ; 94
	const PSYWAVE      ; 95
	const SPLASH       ; 96
	const ACID_ARMOR   ; 97
	const CRABHAMMER   ; 98
	const EXPLOSION    ; 99
	const FURY_SWIPES  ; 9a
	const BONEMERANG   ; 9b
	const REST         ; 9c
	const ROCK_SLIDE   ; 9d
	const HYPER_FANG   ; 9e
	const SHARPEN      ; 9f
	const CONVERSION   ; a0
	const TRI_ATTACK   ; a1
	const SUPER_FANG   ; a2
	const SLASH        ; a3
	const SUBSTITUTE   ; a4
	const STRUGGLE     ; a5
	const SKETCH       ; a6
	const TRIPLE_KICK  ; a7
	const THIEF        ; a8
	const SPIDER_WEB   ; a9
	const MIND_READER  ; aa
	const FEATHERDANCE ; ab
	const FLAME_WHEEL  ; ac
	const SNORE        ; ad
	const CURSE        ; ae
	const FLAIL        ; af
	const CALM_MIND    ; b0
	const AEROBLAST    ; b1
	const COTTON_SPORE ; b2
	const REVERSAL     ; b3
	const SPITE        ; b4
	const POWDER_SNOW  ; b5
	const PROTECT      ; b6
	const MACH_PUNCH   ; b7
	const SCARY_FACE   ; b8
	const FAINT_ATTACK ; b9
	const SWEET_KISS   ; ba
	const BELLY_DRUM   ; bb
	const SLUDGE_BOMB  ; bc
	const MUD_SLAP     ; bd
	const OCTAZOOKA    ; be
	const SPIKES       ; bf
	const ZAP_CANNON   ; c0
	const FORESIGHT    ; c1
	const DESTINY_BOND ; c2
	const PERISH_SONG  ; c3
	const ICY_WIND     ; c4
	const DETECT       ; c5
	const BONE_RUSH    ; c6
	const LOCK_ON      ; c7
	const OUTRAGE      ; c8
	const SANDSTORM    ; c9
	const GIGA_DRAIN   ; ca
	const ENDURE       ; cb
	const CHARM        ; cc
	const ROLLOUT      ; cd
	const FALSE_SWIPE  ; ce
	const SWAGGER      ; cf
	const MILK_DRINK   ; d0
	const SPARK        ; d1
	const FURY_CUTTER  ; d2
	const STEEL_WING   ; d3
	const MEAN_LOOK    ; d4
	const ATTRACT      ; d5
	const SLEEP_TALK   ; d6
	const HEAL_BELL    ; d7
	const RETURN       ; d8
	const PRESENT      ; d9
	const COSMIC_POWER ; da
	const SAFEGUARD    ; db
	const PAIN_SPLIT   ; dc
	const SACRED_FIRE  ; dd
	const MAGNITUDE    ; de
	const DYNAMICPUNCH ; df
	const MEGAHORN     ; e0
	const DRAGONBREATH ; e1
	const BATON_PASS   ; e2
	const ENCORE       ; e3
	const PURSUIT      ; e4
	const RAPID_SPIN   ; e5
	const SWEET_SCENT  ; e6
	const IRON_TAIL    ; e7
	const METAL_CLAW   ; e8
	const VITAL_THROW  ; e9
	const MORNING_SUN  ; ea
	const SYNTHESIS    ; eb
	const MOONLIGHT    ; ec
	const HIDDEN_POWER ; ed
	const CROSS_CHOP   ; ee
	const TWISTER      ; ef
	const RAIN_DANCE   ; f0
	const SUNNY_DAY    ; f1
	const CRUNCH       ; f2
	const MIRROR_COAT  ; f3
	const PSYCH_UP     ; f4
	const EXTREMESPEED ; f5
	const ANCIENTPOWER ; f6
	const SHADOW_BALL  ; f7
	const FUTURE_SIGHT ; f8
	const ROCK_SMASH   ; f9
	const WHIRLPOOL    ; fa
	const STRENGTH_SAP ; fb
	const DARK_PULSE   ; fc
	const DRAGON_CLAW  ; fd
	const MIRROR_SHOT  ; fe
	const DRAGON_PULSE ; ff
	const NIGHT_SLASH
	const ICE_SHARD
	const FLASH_CANNON
	const BUG_BUZZ
	const BRAVE_BIRD
	const DRAIN_PUNCH
	const SILVER_WIND
	const SHADOW_CLAW
	const BULLDOZE
	const SEED_BOMB
	const DRAGON_RUSH
	const BULLET_PUNCH
	const ZEN_HEADBUTT
	const POISON_JAB
	const DRILL_RUN
	const DRAININGKISS
	const FAIRY_WIND
	const METAL_SOUND
	const DISARM_VOICE
	const WILD_CHARGE
	const POWER_WHIP
	const DAZZLINGLEAM
	const GIGA_IMPACT
	const NASTY_PLOT
	const PLAY_ROUGH
	const FOCUS_BLAST
	const WATER_PULSE
	const GUNK_SHOT
	const SLUDGE_WAVE
	const EARTH_POWER
	const IRON_HEAD
	const SIGNAL_BEAM
	const ICICLE_CRASH
	const STONE_EDGE
	const EXTRASENSORY
	const X_SCISSOR
	const AQUA_JET
	const AQUA_TAIL
	const AERIAL_ACE
	const MAGICAL_LEAF
	const ENERGY_BALL
	const POWER_GEM
	const MUD_BOMB
	const HEX
	const VENOSHOCK
	const HURRICANE
	const FIRE_FANG
	const ICE_FANG
	const THUNDER_FANG
	const DRACO_FANG
	const STEEL_SLICE
	const PIXIE_PUNCH
	const WILL_O_WISP
	const MOONBLAST
	const FLARE_BLITZ
	const HYPER_VOICE
	const AIR_SLASH
	const AVALANCHE
	const REVENGE
	const ROCK_WRECKER
	const ICICLE_SPEAR
	const FLAME_BURST
	const DISCHARGE
	const IRON_DEFENSE
	const ROCK_BLAST
	const BULLET_SEED
	const PETAL_BLIZZ
	const SOLAR_BLADE
	const INFERNO
	const WOOD_HAMMER
	const PAYBACK
	const SNARL
	const ASTONISH
	const SHADOW_PUNCH
	const ROUND_M
	const HIHORSEPOWER
	const MUD_SHOT
	const SAND_TOMB
	const AURA_SPHERE
	const HAMMER_ARM
	const CLOSE_COMBAT
	const LOW_SWEEP
	const BULK_UP
	const SUPERPOWER
	const POWERUPPUNCH
	const DRAGON_DANCE
	const SHELL_SMASH
	const HONE_CLAWS
	const POISON_FANG
	const FLAME_CHARGE
	const HAIL
	const BRICK_BREAK
	const QUIVER_DANCE
	const ROOST
	const CROSS_POISON
	const SMART_STRIKE
	const BELCH
	const ACID_SPRAY
	const NUZZLE
	const VOLT_TACKLE
	const CRUSH_CLAW
	const PLAY_NICE
	const AIR_CUTTER
	const ODOR_SLEUTH
	const HOWL
	const CIRCLE_THROW
	const PSYCHO_CUT
	const DUAL_CHOP
	const BOUNCE
	const ROCK_POLISH
	const GYRO_BALL
	const SLACK_OFF
	const DOUBLE_HIT_M
	const CHARGE_BEAM
	const BLAZE_KICK
	const DRAGON_TAIL
	const SHEER_COLD
	const LEAF_BLADE
	const SUCKER_PUNCH
	const GRASS_KNOT
	const WORK_UP
	const ECHOED_VOICE
	const MUDDY_WATER
	const HEAT_WAVE
	const LAVA_PLUME
	const STONE_BASH
	const SHADOW_SNEAK
	const NEEDLE_ARM
	const FLATTER
	const GRASSWHISTLE
	const OMINOUS_WIND
	const FRENZY_PLANT
	const BLAST_BURN
	const HYDRO_CANNON
	const AQUA_RING
	const KNOCK_OFF
	const U_TURN
	const ACROBATICS
	const VOLT_SWITCH
	const COIL
	const PINCIRFLURRY
	const JURASSICBEAM
	const SIGNAL_WAVE
	const WAVE_CRASH
	const FAKE_OUT
	const HEADLONGRUSH
	const DUALWINGBEAT
	const TWIN_BEAM
	const CATASTROPHE
	const PSYSHIELD
	const METEOR_MASH
	const FORCE_PALM
	const SKY_UPPERCUT
;	const WAKE_UP_SLAP
NUM_ATTACKS EQU const_value + -1

	if NUM_ATTACKS > $3fff
		fail "Too many moves defined!"
	endc

; Battle animations use the same constants as the moves
	const ANIM_SWEET_SCENT_2     ; fc
; Animations with negative IDs will play even when animations are disabled
const_value = -$1c ;fix if more negative values are added
	const ANIM_THROW_POKE_BALL   ; -17 (ffea)
	const ANIM_SEND_OUT_MON      ; -16 (ffeb)
	const ANIM_RETURN_MON        ; -15 (ffec)
	const ANIM_CONFUSED          ; -14 (ffed)
	const ANIM_SLP               ; -13 (ffee)
	const ANIM_BRN               ; -12 (ffef)
	const ANIM_PSN               ; -11 (fff0)
	const ANIM_SAP               ; -10 (fff1)
	const ANIM_FRZ               ;  -f (fff2)
	const ANIM_PAR               ;  -e (fff3)
	const ANIM_IN_LOVE           ;  -d (fff4)
	const ANIM_IN_SANDSTORM      ;  -c (fff5)
	const ANIM_IN_NIGHTMARE      ;  -b (fff6)
	const ANIM_IN_WHIRLPOOL      ;  -a (fff7)
	const ANIM_IN_HAIL           ;	-9
	const ANIM_IN_RAIN
	const ANIM_IN_SUN
	const ANIM_BERRY_RECOVER
	const ANIM_PERISH_BODY
	const ANIM_IMPOSTER
; battle anims
	const ANIM_MISS              ;  -8 (fff8)
	const ANIM_ENEMY_DAMAGE      ;  -7 (fff9)
	const ANIM_ENEMY_STAT_DOWN   ;  -6 (fffa)
	const ANIM_PLAYER_STAT_DOWN  ;  -5 (fffb)
	const ANIM_PLAYER_DAMAGE     ;  -4 (fffc)
	const ANIM_WOBBLE            ;  -3 (fffd)
	const ANIM_SHAKE             ;  -2 (fffe)
	const ANIM_HIT_CONFUSION     ;  -1 (ffff)

	if const_value
		fail "Please adjust the initial constant value to ensure that the last animation constant has a value of -1"
	endc

; wNumHits uses offsets from ANIM_MISS
	const_def
	const BATTLEANIM_NONE
	const BATTLEANIM_ENEMY_DAMAGE
	const BATTLEANIM_ENEMY_STAT_DOWN
	const BATTLEANIM_PLAYER_STAT_DOWN
	const BATTLEANIM_PLAYER_DAMAGE
	const BATTLEANIM_WOBBLE
	const BATTLEANIM_SHAKE
	const BATTLEANIM_HIT_CONFUSION
