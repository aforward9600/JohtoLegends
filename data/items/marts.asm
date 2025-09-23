Marts:
; entries correspond to MART_* constants
	dw MartCherrygrove
	dw MartViolet
	dw MartAzalea
	dw MartCianwood
	dw MartGoldenrod2F1
	dw MartGoldenrod2F2
	dw MartGoldenrod3F
	dw MartGoldenrod4F
	dw MartGoldenrod5F
	dw MartGoldenrodBlackMarket1
	dw MartGoldenrodBlackMarket2
	dw MartGoldenrodBlackMarket3
	dw MartGoldenrodBlackMarket4
	dw MartOlivine
	dw MartEcruteak
	dw MartMahogany1
	dw MartMahogany2
	dw MartBlackthorn
	dw MartBlackthornJournal
	dw MartViridian
	dw MartPewter
	dw MartCerulean
	dw MartLavender
	dw MartVermilion
	dw MartCeladon2F1
	dw MartCeladon2F2
	dw MartCeladon3F
	dw MartCeladon4F
	dw MartCeladon5F1
	dw MartCeladon5F2
	dw MartFuchsia
	dw MartSaffron
	dw MartMtMoon
	dw MartIndigoPlateau
	dw MartUnderground
	dw MartWildArea
	dw MartEcruteakBalls
	dw MartOlivineTMs
	dw MartBlackthornTMs
	dw MartAzaleaTMs
	dw MartVioletTMs
	dw MartLakeOfRage
	dw MartCherrygroveTMs
	dw MartMooMooMilk
	dw MartCinnabarIsland
	dw MartBerries1
	dw MartBerries2
	dw MartThreeIsland
	dw MartFourIsland
	dw MartFourIsland
	dw MartSevenIsland
.End

MartCherrygrove:
	db 8 ; # items
	db ULTRA_BALL
	db HYPER_POTION
	db ESCAPE_ROPE
	db REVIVE
	db FULL_HEAL
	db MAX_REPEL
	db MAX_POTION
	db FULL_RESTORE
	db -1 ; end

MartCherrygroveDex:
	db 5 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db -1 ; end

MartViolet:
	db 7 ; # items
	db ULTRA_BALL
	db HYPER_POTION
	db ESCAPE_ROPE
	db REVIVE
	db FULL_HEAL
	db MAX_REPEL
	db MAX_POTION
	db -1 ; end

MartAzalea:
	db 9 ; # items
	db CHARCOAL
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db ESCAPE_ROPE
	db SUPER_REPEL
	db REVIVE
	db FULL_HEAL
	db -1 ; end

MartCianwood:
	db 5 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db -1 ; end

MartGoldenrod2F1:
	db 8 ; # items
	db POTION
	db SUPER_POTION
	db REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db -1 ; end

MartGoldenrod2F2:
	db 7 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ESCAPE_ROPE
	db SUPER_REPEL
	db REVIVE
	db FULL_HEAL
	db POKE_DOLL
	db -1 ; end

MartGoldenrod3F:
	db 7 ; # items
	db X_SPEED
	db X_SPECIAL
	db X_DEFEND
	db X_ATTACK
	db DIRE_HIT
	db GUARD_SPEC
	db X_ACCURACY
	db -1 ; end

MartGoldenrod4F:
	db 6 ; # items
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db HP_UP
	db ZINC
	db -1 ; end

MartGoldenrod5F:
	db 4 ; # items
	db TM_ACROBATICS
	db TM_LIGHT_SCREEN
	db TM_REFLECT
	db TM_PROTECT
	db -1 ; end

MartGoldenrodBlackMarket1:
	db 10 ; # items
	db WATER_STONE
	db FIRE_STONE
	db THUNDERSTONE
	db LEAF_STONE
	db MOON_STONE
	db SUN_STONE
	db ICE_STONE
	db SHINY_STONE
	db DUSK_STONE
	db DAWN_STONE
	db -1 ; end

MartGoldenrodBlackMarket2:
	db 10 ; # items
	db DRAGON_SCALE
	db LINK_CABLE
	db UP_GRADE
	db ROYAL_ROCK
	db METAL_COAT
	db RAZOR_CLAW
	db RAZOR_FANG
	db PROTECTOR
	db ELECTIRIZER
	db MAGMARIZER
	db -1 ; end

MartGoldenrodBlackMarket3:
	db 7 ; # items
	db WATER_STONE
	db FIRE_STONE
	db THUNDERSTONE
	db LEAF_STONE
	db MOON_STONE
	db SUN_STONE
	db ICE_STONE
	db -1 ; end

MartGoldenrodBlackMarket4:
	db 7 ; # items
	db UP_GRADE
	db ROYAL_ROCK
	db METAL_COAT
	db SHINY_STONE
	db DUSK_STONE
	db LINK_CABLE
	db DAWN_STONE
	db -1 ; end

MartOlivine:
	db 8 ; # items
	db POKE_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db -1 ; end

MartEcruteak:
	db 9 ; # items
	db POKE_BALL
	db POTION
	db ESCAPE_ROPE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db X_DEFEND
	db X_ATTACK
	db X_SPEED
	db -1 ; end

MartMahogany1:
	db 5 ; # items
	db TINYMUSHROOM
	db ESCAPE_ROPE
	db POKE_BALL
	db POTION
	db TM_THIEF
	db -1 ; end

MartMahogany2:
	db 8 ; # items
	db RAGECANDYBAR
	db GREAT_BALL
	db SUPER_POTION
	db HYPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db SUPER_REPEL
	db REVIVE
	db TM_THIEF
	db -1 ; end

MartBlackthorn:
	db 4 ; # items
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db -1 ; end

MartBlackthornJournal:
	db 7 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db ESCAPE_ROPE
	db REPEL
	db -1 ; end

MartViridian:
	db 5 ; # items
	db ULTRA_BALL
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db FULL_RESTORE
	db -1 ; end

MartPewter:
	db 7 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db SUPER_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db -1 ; end

MartCerulean:
	db 8 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db SUPER_REPEL
	db FULL_HEAL
	db X_DEFEND
	db X_ATTACK
	db DIRE_HIT
	db -1 ; end

MartLavender:
	db 8 ; # items
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db MAX_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db -1 ; end

MartVermilion:
	db 7 ; # items
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db -1 ; end

MartCeladon2F1:
	db 7 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db REVIVE
	db SUPER_REPEL
	db MAX_REPEL
	db -1 ; end

MartCeladon2F2:
	db 10 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db ESCAPE_ROPE
	db FULL_HEAL
	db ANTIDOTE
	db BURN_HEAL
	db ICE_HEAL
	db AWAKENING
	db PARLYZ_HEAL
	db -1 ; end

MartCeladon3F:
	db 3 ; # items
	db TM_GIGA_IMPACT
	db TM_FOCUS_BLAST
	db TM_HYPER_BEAM
	db -1 ; end

MartCeladon4F:
	db 1 ; # items
	db POKE_DOLL
	db -1 ; end

MartCeladon5F1:
	db 6 ; # items
	db HP_UP
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db ZINC
	db -1 ; end

MartCeladon5F2:
	db 7 ; # items
	db X_ACCURACY
	db GUARD_SPEC
	db DIRE_HIT
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPECIAL
	db -1 ; end

MartFuchsia:
	db 6 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db FULL_HEAL
	db MAX_REPEL
	db -1 ; end

MartSaffron:
	db 7 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_HEAL
	db X_ATTACK
	db X_DEFEND
	db -1 ; end

MartMtMoon:
	db 5 ; # items
	db POKE_DOLL
	db FRESH_WATER
	db SODA_POP
	db LEMONADE
	db REPEL
	db -1 ; end

MartIndigoPlateau:
	db 7 ; # items
	db ULTRA_BALL
	db MAX_REPEL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db FULL_HEAL
	db -1 ; end

MartUnderground:
	db 1
	db POTION
;	db 4 ; # items
;	db ENERGYPOWDER
;	db ENERGY_ROOT
;	db HEAL_POWDER
;	db REVIVAL_HERB
	db -1 ; end

MartWildArea:
	db 9 ; # items
	db POKE_BALL
	db GREAT_BALL
	db SUPER_POTION
	db ESCAPE_ROPE
	db SUPER_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db -1 ; end

MartEcruteakBalls:
	db 8 ; # items
	db HEAVY_BALL
	db LURE_BALL
	db FRIEND_BALL
	db LOVE_BALL
	db LEVEL_BALL
	db FAST_BALL
	db MOON_BALL
	db DUSK_BALL
	db -1 ; end

MartOlivineTMs:
	db 3
	db TM_SHADOW_CLAW
	db TM_SAFEGUARD
	db TM_POISON_JAB
	db -1 ; end

MartBlackthornTMs:
	db 4
	db TM_DOUBLE_TEAM
	db TM_SUBSTITUTE
	db TM_SLEEP_TALK
	db TM_ATTRACT
	db -1 ; end

MartAzaleaTMs:
	db 4
	db TM_SUNNY_DAY
	db TM_ROCK_SLIDE
	db TM_BULLDOZE
	db TM_REST
	db -1 ; end

MartVioletTMs:
	db 4
	db TM_THUNDERBOLT
	db TM_ICE_BEAM
	db TM_FLAMETHROWER
	db TM_STEEL_WING
	db -1 ; end

DefaultMart:
	db 2 ; # items
	db POKE_BALL
	db POTION
	db -1 ; end

MartLakeOfRage:
	db 7 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db ESCAPE_ROPE
	db REPEL
	db -1 ; end

MartCherrygroveTMs:
	db 6 ; # items
	db TM_PSYCHIC_M
	db TM_STONE_EDGE
	db TM_NASTY_PLOT
	db TM_FOCUS_BLAST
	db TM_TOXIC
	db TM_ENERGY_BALL
	db -1 ; end

MartMooMooMilk:
	db 1 ; # items
	db MOOMOO_MILK
	db -1 ; end

MartCinnabarIsland:
	db 8
	db HYPER_POTION
	db FULL_RESTORE
	db FULL_HEAL
	db ULTRA_BALL
	db ESCAPE_ROPE
	db REVIVE
	db MAX_REPEL
	db PP_UP
	db -1

MartBerries1:
	db 9
	db ORAN_BERRY
	db SITRUS_BERRY
	db CHESTO_BERRY
	db CHERRI_BERRY
	db PECHA_BERRY
	db RAWST_BERRY
	db ASPEAR_BERRY
	db PERSIM_BERRY
	db LUM_BERRY
	db -1

MartBerries2:
	db 7
	db LEPPA_BERRY
	db POMEG_BERRY
	db KELPSY_BERRY
	db QUALOT_BERRY
	db HONDEW_BERRY
	db GREPA_BERRY
	db TAMATO_BERRY
	db -1

MartSevenIsland:
	db 9 ; # items
	db ULTRA_BALL
	db FULL_RESTORE
	db HYPER_POTION
	db FULL_HEAL
	db MAX_REPEL
	db GREAT_BALL
	db MAX_POTION
	db REVIVE
	db ESCAPE_ROPE
	db -1 ; end

MartThreeIsland:
	db 6
	db ULTRA_BALL
	db REVIVE
	db ESCAPE_ROPE
	db HYPER_POTION
	db FULL_HEAL
	db MAX_REPEL
	db -1

MartFourIsland:
	db 8
	db ULTRA_BALL
	db MAX_POTION
	db ICE_HEAL
	db ESCAPE_ROPE
	db FULL_RESTORE
	db REVIVE
	db FULL_HEAL
	db MAX_REPEL
	db -1
