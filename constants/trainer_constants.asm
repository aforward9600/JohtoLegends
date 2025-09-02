trainerclass: MACRO
	enum \1
const_value = 1
ENDM

; trainer class ids
; `trainerclass` indexes are for:
; - TrainerClassNames (see data/trainers/class_names.asm)
; - TrainerClassAttributes (see data/trainers/attributes.asm)
; - TrainerClassDVs (see data/trainers/dvs.asm)
; - TrainerGroups (see data/trainers/party_pointers.asm)
; - TrainerEncounterMusic (see data/trainers/encounter_music.asm)
; - TrainerPicPointers (see data/trainers/pic_pointers.asm)
; - TrainerPalettes (see data/trainers/palettes.asm)
; - BTTrainerClassSprites (see data/trainers/sprites.asm)
; - BTTrainerClassGenders (see data/trainers/genders.asm)
; trainer constants are Trainers indexes, for the sub-tables of TrainerGroups (see data/trainers/parties.asm)
	enum_start
CHRIS EQU __enum__
	trainerclass TRAINER_NONE ; 0
	const PHONECONTACT_MOM
	const PHONECONTACT_BIKESHOP
	const PHONECONTACT_BILL
	const PHONECONTACT_ELM
	const PHONECONTACT_BUENA

	trainerclass WALKER ; 1
	const WALKER1
	const WALKER2
	const WALKER3

	trainerclass MILTON ; 2
	const MILTON1
	const MILTON2
	const MILTON3
	const MILTON4
	const MILTON5

	trainerclass KURT ; 3
	const KURT1
	const KURT2
	const KURT3
	const KURT4

	trainerclass ENOKI ; 4
	const ENOKI1
	const ENOKI_ALTERNATE

	trainerclass PRYCE ; 5
	const PRYCE1
	const PRYCE2
	const PRYCE_ALTERNATE

	trainerclass BYRON ; 6
	const BYRON1

	trainerclass CHUCK ; 7
	const CHUCK1

	trainerclass CLAIR ; 8
	const CLAIR1

	trainerclass RIVAL1 ; 9
	const RIVAL1_2_CHIKORITA

	trainerclass POKEMON_PROF ; a
	const OAK

	trainerclass FLORINA ; b
	const FLORINA1
	const FLORINA2

	trainerclass CAL ; c
	const CAL1
	const CAL2
	const CAL3

	trainerclass MARTHA ; d
	const MARTHA1
	const MARTHA2

	trainerclass AGATHA ; e
	const AGATHA1
	const AGATHA2

	trainerclass KOGA ; f
	const KOGA1

	trainerclass CHAMPION_DAHLIA ; 10
	const CHAMP_DAHLIA_1
	const CHAMP_DAHLIA_2
	const CHAMP_DAHLIA_3
	const CHAMP_DAHLIA_4
	const CHAMP_DAHLIA_5
	const CHAMP_DAHLIA_6

	trainerclass FLINT ; 11
	const FLINT1

	trainerclass SENSATIONAL1 ; 12
	const VIOLET1

	trainerclass LT_SURGE ; 13
	const LT_SURGE1

	trainerclass SCIENTIST ; 14
	const MAC_2
	const MAC

	trainerclass ERIKA ; 15
	const ERIKA1

	trainerclass YOUNGSTER ; 16
	const COTTON
	const TIMMY
	const ALBERT
	const CALEB
	const GORDY
	const RANDY
	const BARNEY_YOUNGSTER
	const MIK

	trainerclass SCHOOLBOY ; 17
	const FINN
	const PIERCE
	const ALAN1
	const DANNY
	const CHAD1
	const JACK2

	trainerclass BIRD_KEEPER ; 18
	const RODNEY1
	const ABEL
	const GUNNER
	const THAD
	const TOBY
	const LUCAS
	const SAL
	const TERRY
	const BORIS
	const CARL
	const PEDRO
	const JOSE2
	const SAL2
	const SAL3

	trainerclass LASS ; 19
	const JACKIE
	const ARIELLE
	const VIVIAN
	const CONNIE1
	const LINDA
	const LAURA
	const USAGI
	const MICHELLE
	const GABRIELLE

	trainerclass JANINE ; 1a
	const JANINE1

	trainerclass COOLTRAINERM ; 1b
	const FABIO
	const AJ
	const ADRIEN
	const JACQUES
	const EMILE
	const GAVEN1
	const KOSU
	const ROBERT1
	const JUAN
	const GARY
	const COREY1
	const ALM
	const BUMI
	const JOSEPH

	trainerclass COOLTRAINERF ; 1c
	const TERESA
	const EMIKO
	const HAZEL
	const TINA
	const REESE
	const HARLEY
	const MARY1
	const BETH1
	const REENA1
	const MARIA
	const TERRA
	const SOL
	const CARA
	const JESSIE
	const REENA2
	const ELLA

	trainerclass BEAUTY ; 1d
	const ASHLEY
	const BETTY
	const JULIA
	const VALERIE
	const OLIVIA

	trainerclass POKEMANIAC ; 1e
	const ALVIN
	const DAMIEN
	const PALMER
	const BRENT1
	const JARVIS
	const ALLAN1

	trainerclass GRUNTM ; 1f
	const GRUNTM_1
	const GRUNTM_2
	const GRUNTM_3
	const GRUNTM_4
	const GRUNTM_5
	const GRUNTM_6
	const GRUNTM_7
	const GRUNTM_10
	const GRUNTM_11
	const GRUNTM_12
	const GRUNTM_13
	const GRUNTM_14
	const GRUNTM_15
	const GRUNTM_16
	const GRUNTM_17
	const GRUNTM_18
	const GRUNTM_22

	trainerclass GENTLEMAN ; 20
	const CROFTON
	const FRANK

	trainerclass SKIER ; 21
	const BRANDY
	const PAM
	const LUPITA

	trainerclass TEACHER ; 22
	const ABIGAIL
	const ISAKO
	const CADI
	const CADI2
	const CADI3
	const KAWAKAMI
	const CHARLENE

	trainerclass SABRINA ; 23
	const SABRINA1

	trainerclass BUG_CATCHER ; 24
	const ANTON
	const COLTON
	const STEVIE
	const WADE1
	const ELMER
	const ARTHUR
	const BUZZY
	const ARNIE1
	const NAT
	const THOR
	const OLLY
	const MARTY
	const DOM
	const PETE

	trainerclass FISHER ; 25
	const RUSTY
	const RALPH1
	const ARNOLD
	const KYLE
	const MARLIN
	const FISHER_SHANE
	const FRED
	const AIDAN
	const NOAH
	const LYLE1
	const JONAH
	const MARTIN
	const BUTCH

	trainerclass SWIMMERM ; 26
	const HAROLD
	const DERRICK
	const JACKSON
	const CHARLIE
	const GEORGE
	const BERKE
	const KIRK
	const MATHEW
	const TUCKER
	const CAMERON
	const SETH
	const TANNER
	const DARYL

	trainerclass SWIMMERF ; 27
	const ANGIE
	const KAITLYN
	const KAYLEE
	const SUSIE
	const DENISE
	const KARA
	const WENDY
	const DAWN
	const HARLENE
	const NICOLE
	const LORI
	const NIKKI
	const AQUA
	const SHEILA
	const TARA

	trainerclass SAILOR ; 28
	const EUGENE
	const HUEY1
	const HARRY

	trainerclass SUPER_NERD ; 29
	const DEXTER
	const IRWIN
	const NED1
	const SUPER_NERD_JASON
	const SUPER_NERD_RICHARD
	const HERBERT_SUPER_NERD
	const ALBERT_SUPER_NERD
	const JOSEF
	const DAISUKE
	const RUSS
	const MARKUS

	trainerclass RIVAL2 ; 2a
	const RIVAL2_1_CHIKORITA

	trainerclass GUITARIST ; 2b
	const CLYDE

	trainerclass HIKER ; 2c
	const ANTHONY1
	const OZZY
	const PHIL1
	const GUNTHER
	const ANTHONY2
	const PARRY1
	const BUBBA

	trainerclass BIKER ; 2d
	const BUFORD
	const BIKER_BRANDON
	const DWAYNE
	const HARRIS
	const ZEKE
	const CHARLES
	const RILEY
	const JOEL
	const AL
	const FOREST_BIKER
	const CALVIN
	const RIVER
	const CHANCE
	const SPIKE
	const BLUNO
	const ROSSO
	const ANTONIO
	const BIKER_KEVIN
	const JAMIE
	const BURGESS
	const BLAZER

	trainerclass BLAINE ; 2e
	const BLAINE1

	trainerclass BURGLAR ; 2f
	const LOCKE
	const MARV
	const BURGLAR_HARRY
	const BURGLAR_ERIK
	const ARSENE
	const KIDD

	trainerclass FIREBREATHER ; 30
	const CHAZ
	const FARREL
	const BLART
	const KELVIN

	trainerclass JUGGLER ; 31
	const IRWIN1
	const PERCY

	trainerclass BLACKBELT_T ; 32
	const HIDEO
	const YOSHI
	const SATORU
	const HIROSHI
	const NOB
	const TANABE
	const LUNG
	const KENJI3

	trainerclass ARCHER ; 33
	const ARCHER_1
	const ARCHER_2
	const ARCHER_3
	const ARCHER_4
	const ARCHER_5

	trainerclass PSYCHIC_T ; 34
	const JORDAN
	const CHRIS_PSYCHIC
	const MARK
	const HOUDINI
	const JEREMY_PSYCHIC
	const JORDAN_2
	const JORDAN_3

	trainerclass PICNICKER ; 35
	const HAYLEE
	const GINA1 ; Chloe 2
	const CHLOE
	const LACY
	const BARBARA
	const VIVIAN_PICNICKER
	const ERIN1 ; Chloe 3
	const TANYA
	const TIFFANY3

	trainerclass CAMPER ; 36
	const CAMPER_GARRET
	const TODD1
	const HOWARD
	const EMIL
	const JAOQUIN
	const GARRET2
	const GARRET3
	const GERALD

	trainerclass ARIANA ; 37
	const ARIANA_1
	const ARIANA_2
	const ARIANA_3
	const ARIANA_4
	const ARIANA_5

	trainerclass SAGE ; 38
	const CHOW
	const NICO
	const JIN
	const TROY
	const JEFFREY
	const PING
	const EDMOND
	const NEAL
	const LI
	const GAKU
	const MASA
	const KOJI

	trainerclass MEDIUM ; 39
	const BETHANY

	trainerclass BOARDER ; 3a
	const GARETH
	const BRODY
	const SONNY

	trainerclass POKEFANM ; 3b
	const BERNARD
	const DEREK1
	const ROBERTO
	const TRENTON

	trainerclass KIMONO_GIRL ; 3c
	const RUI

	trainerclass TWINS ; 3d
	const GINGERANDSAM1
	const GINGERANDSAM2
	const JOANDZOE1
	const JOANDZOE2

	trainerclass POKEFANF ; 3e
	const BEVERLY1
	const ETHEL1
	const GEORGIA
	const ETHEL2

	trainerclass RED ; 3f
	const RED1

	trainerclass GIOVANNI ; 40
	const GIOVANNI1

	trainerclass OFFICER ; 41
	const TOBY1
	const CLANCY

	trainerclass GRUNTF ; 42
	const GRUNTF_1
	const GRUNTF_2
	const GRUNTF_3
	const GRUNTF_4
	const GRUNTF_5
	const GRUNTF_6
	const GRUNTF_7
	const GRUNTF_8
	const GRUNTF_9
	const GRUNTF_10
	const GRUNTF_11
	const GRUNTF_12
	const GRUNTF_13
	const GRUNTF_14

	trainerclass MYSTICALMAN ; 43
	const EUSINE

	trainerclass RIVAL3 ; 44
	const RIVAL3_A_LARVITAR
	const RIVAL3_A_DRATINI
	const RIVAL3_B_LARVITAR
	const RIVAL3_B_DRATINI
	const RIVAL3_C_LARVITAR
	const RIVAL3_C_DRATINI

	trainerclass RIVAL4 ; 45
	const RIVAL4_A_LARVITAR
	const RIVAL4_A_DRATINI
	const RIVAL4_B_LARVITAR
	const RIVAL4_B_DRATINI
	const RIVAL4_C_LARVITAR
	const RIVAL4_C_DRATINI

	trainerclass BREEDER ; 46
	const EMILY
	const NINA
	const SARAH
	const BRIDGET

	trainerclass HEX_MANIAC ; 47
	const HILDA
	const ZELDA
	const SABRINA2
	const MAEVE
	const EDALYN
	const BECKY
	const LILLITH

	trainerclass CHIGUSA ; 48
	const CHIGUSA1
	const CHIGUSA2

	trainerclass MASTER ; 49
	const MASTER1
	const MASTER2

	trainerclass GEN_SURGE ; 4a
	const GEN_SURGE1
	const GEN_SURGE2

	trainerclass DRAGON_KID ; 4b
	const LANCE1

	trainerclass PASSERBY ; 4c
	const MIYAMOTO

	trainerclass MYSTERIOUS ; 4d
	const MIYAMOTO1
	const MIYAMOTO2
	const MIYAMOTO3

	trainerclass TOURIST ; 4e
	const CYNTHIA1
	const CYNTHIA2
	const CYNTHIA4
	const CYNTHIA5

	trainerclass ENGINEER ; 4f
	const HARVEY1
	const OSWALD
	const DANTE
	const RUDY
	const GABE
	const BERNIE

	trainerclass MNINJA_M ; 50
	const MNINJA_M1
	const MNINJA_M2
	const MNINJA_M3
	const MNINJA_M4
	const MNINJA_M5
	const MNINJA_M6

	trainerclass MNINJA_F ; 51
	const MNINJA_F1
	const MNINJA_F2
	const MNINJA_F3
	const MNINJA_F4
	const MNINJA_F5
	const MNINJA_F6

	trainerclass DEPRESSED_DAHLIA ; 52
	const DAHLIA_LARVITAR_1
	const DAHLIA_DRATINI_1
	const DAHLIA_LARVITAR_2
	const DAHLIA_DRATINI_2

	trainerclass DEPRESSED_DRACO ; 52
	const DRACO_LARVITAR_1
	const DRACO_DRATINI_1
	const DRACO_LARVITAR_2
	const DRACO_DRATINI_2

	trainerclass EIN ; 53
	const EIN1

	trainerclass DRAGON_TAMER_F
	const DAWNA
	const DANI
	const DARIA
	const DORA
	const DEBBY
	const DORIS_TAMER

	trainerclass DRAGON_TAMER_M
	const DREW
	const DEVIN
	const DAVIS
	const DARIUS
	const DYLAN
	const DARBY

	trainerclass MADAME_BOSS
	const BOSS

	trainerclass CYNTHIA
	const CYNTHIA3

	trainerclass PRYCE_2 ; b
	const PRYCE3
	const PRYCE4
	const PRYCE5

	trainerclass PRYCE_3
	const PRYCE6
	const PRYCE7
	const PRYCE8
	const PRYCE9

	trainerclass ENOKI_2
	const ENOKI2
	const ENOKI3
	const ENOKI4

	trainerclass ENOKI_3
	const ENOKI5
	const ENOKI6
	const ENOKI7
	const ENOKI8

	trainerclass CHIGUSA_2
	const CHIGUSA3
	const CHIGUSA4
	const CHIGUSA5
	const CHIGUSA6
	const CHIGUSA7

	trainerclass BYRON_2
	const BYRON2
	const BYRON3
	const BYRON4
	const BYRON5
	const BYRON6

	trainerclass LINK_TRAINER
	const LINK_TRAINER_1

	trainerclass FED_LEADER
	const PAXTON

	trainerclass CHAMPION_DRACO
	const CHAMP_DRACO_1
	const CHAMP_DRACO_2
	const CHAMP_DRACO_3
	const CHAMP_DRACO_4
	const CHAMP_DRACO_5
	const CHAMP_DRACO_6

	trainerclass CHALLENGER_DAHLIA
	const CHALLENGER_DAHLIA_1
	const CHALLENGER_DAHLIA_2
	const CHALLENGER_DAHLIA_3
	const CHALLENGER_DAHLIA_4
	const CHALLENGER_DAHLIA_5
	const CHALLENGER_DAHLIA_6

	trainerclass CHALLENGER_DRACO
	const CHALLENGER_DRACO_1
	const CHALLENGER_DRACO_2
	const CHALLENGER_DRACO_3
	const CHALLENGER_DRACO_4
	const CHALLENGER_DRACO_5
	const CHALLENGER_DRACO_6

	trainerclass CHALLENGER_CYNTHIA
	const CHALLENGER_CYNTHIA_1
	const CHALLENGER_CYNTHIA_2

	trainerclass DELINQUENT
	const KAREN
	const TRACY
	const SHARON
	const SHERRY
	const TABITHA
	const JILLIAN
	const BERTHA
	const KATHY
	const MARCY
	const MAKOTO
	const CAROL
	const ELLY
	const AYASE
	const CHIE
	const YUKARI

	trainerclass SENSATIONAL2
	const DAISY

	trainerclass SENSATIONAL3
	const LILY

	trainerclass ROUGHNECK
	const TERRANCE
	const PHILLIP
	const KYLE_2
	const CAMERON_2
	const GUIDO
	const CURLY
	const MOE
	const LARRY_ROUGHNECK
	const CARTER_ROUGHNECK
	const KANDORI
	const DIRK
	const KANJI

	trainerclass SOLDIER
	const DWIGHT
	const SHERMAN
	const ULYSSES
	const DOUGLAS
	const GRANT
	const MCCLELLAN

	trainerclass KARATE_KING
	const KOICHI

	trainerclass FNINJA_M
	const FNINJA_M_1
	const FNINJA_M_2

	trainerclass FNINJA_F
	const FNINJA_F_1
	const FNINJA_F_2

	trainerclass FERROPEXOLA_TRAINER
	const FERROPEXOLA1

KRIS EQU __enum__
NUM_TRAINER_CLASSES EQU __enum__
