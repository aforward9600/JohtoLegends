StdScripts::
; entries correspond to constants/std_constants.asm
	dba PokecenterNurseScript
	dba DifficultBookshelfScript
	dba PictureBookshelfScript
	dba MagazineBookshelfScript
	dba TeamRocketOathScript
	dba IncenseBurnerScript
	dba MerchandiseShelfScript
	dba TownMapScript
	dba WindowScript
	dba TVScript
	dba HomepageScript
	dba Radio1Script
	dba Radio2Script
	dba TrashCanScript
	dba StrengthBoulderScript
	dba SmashRockScript
	dba PokecenterSignScript
	dba MartSignScript
	dba GoldenrodRocketsScript
	dba RadioTowerRocketsScript
	dba ElevatorButtonScript
	dba DayToTextScript
	dba BugContestResultsWarpScript
	dba BugContestResultsScript
	dba InitializeEventsScript
	dba AskNumber1MScript
	dba AskNumber2MScript
	dba RegisteredNumberMScript
	dba NumberAcceptedMScript
	dba NumberDeclinedMScript
	dba PhoneFullMScript
	dba RematchMScript
	dba GiftMScript
	dba PackFullMScript
	dba RematchGiftMScript
	dba AskNumber1FScript
	dba AskNumber2FScript
	dba RegisteredNumberFScript
	dba NumberAcceptedFScript
	dba NumberDeclinedFScript
	dba PhoneFullFScript
	dba RematchFScript
	dba GiftFScript
	dba PackFullFScript
	dba RematchGiftFScript
	dba GymStatue1Script
	dba GymStatue2Script
	dba ReceiveItemScript
	dba ReceiveTogepiEggScript
	dba PCScript
	dba GameCornerCoinVendorScript
	dba HappinessCheckScript
	dba GymStatue3Script
	dba GymStatue4Script
	dba NinjaHideoutClear
	dba StaticPokemonRefresh
	dba TelevisionScript
	dba SwarmScript
	dba GetDecoEvent
	dba GymStatue5Script

PokecenterNurseScript:
; EVENT_WELCOMED_TO_POKECOM_CENTER is never set

	opentext
	checktime MORN
	iftrue .morn
	checktime DAY
	iftrue .day
	checktime EVE
	iftrue .eve
	checktime NITE
	iftrue .nite
	sjump .ok

.morn
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .morn_comcenter
	farwritetext NurseMornText
	buttonsound
	sjump .ok
.morn_comcenter
	farwritetext PokeComNurseMornText
	buttonsound
	sjump .ok

.day
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .day_comcenter
	farwritetext NurseDayText
	buttonsound
	sjump .ok
.day_comcenter
	farwritetext PokeComNurseDayText
	buttonsound
	sjump .ok

.eve
	farwritetext NurseEveningText
	buttonsound
	sjump .ok

.nite
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .nite_comcenter
	farwritetext NurseNiteText
	buttonsound
	sjump .ok
.nite_comcenter
	farwritetext PokeComNurseNiteText
	buttonsound
	sjump .ok

.ok
	; only do this once
	clearevent EVENT_WELCOMED_TO_POKECOM_CENTER

	farwritetext NurseAskHealText
	yesorno
	iffalse .done

	farwritetext NurseTakePokemonText
	pause 20
	special StubbedTrainerRankings_Healings
	turnobject LAST_TALKED, LEFT
	pause 10
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_POKECENTER
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	turnobject LAST_TALKED, DOWN
	pause 10

	checkphonecall ; elm already called about pokerus
	iftrue .no
	checkflag ENGINE_CAUGHT_POKERUS
	iftrue .no
	special CheckPokerus
	iftrue .pokerus
.no

	farwritetext NurseReturnPokemonText
	pause 20

.done
	farwritetext NurseGoodbyeText

	turnobject LAST_TALKED, UP
	pause 10
	turnobject LAST_TALKED, DOWN
	pause 10

	waitbutton
	closetext
	end

.pokerus
	; already cleared earlier in the script
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .pokerus_comcenter
	farwritetext NursePokerusText
	waitbutton
	closetext
	sjump .pokerus_done

.pokerus_comcenter
	farwritetext PokeComNursePokerusText
	waitbutton
	closetext

.pokerus_done
	setflag ENGINE_CAUGHT_POKERUS
	specialphonecall SPECIALCALL_POKERUS
	end

DifficultBookshelfScript:
	farjumptext DifficultBookshelfText

PictureBookshelfScript:
	farjumptext PictureBookshelfText

MagazineBookshelfScript:
	farjumptext MagazineBookshelfText

TeamRocketOathScript:
	farjumptext TeamRocketOathText

IncenseBurnerScript:
	farjumptext IncenseBurnerText

MerchandiseShelfScript:
	farjumptext MerchandiseShelfText

TownMapScript:
	opentext
	farwritetext TownMapText
	waitbutton
	special OverworldTownMap
	closetext
	end

WindowScript:
	farjumptext WindowText

TVScript:
	opentext
	farwritetext TVText
	waitbutton
	closetext
	end

HomepageScript:
	farjumptext HomepageText

Radio1Script:
	opentext
	setval MAPRADIO_POKEMON_CHANNEL
	special MapRadio
	closetext
	end

Radio2Script:
; Lucky Channel
	opentext
	setval MAPRADIO_LUCKY_CHANNEL
	special MapRadio
	closetext
	end

TrashCanScript:
	farjumptext TrashCanText

PCScript:
	opentext
	special PokemonCenterPC
	closetext
	end

ElevatorButtonScript:
	playsound SFX_READ_TEXT_2
	pause 15
	playsound SFX_ELEVATOR_END
	end

StrengthBoulderScript:
	farsjump AskStrengthScript

SmashRockScript:
	farsjump AskRockSmashScript

PokecenterSignScript:
	farjumptext PokecenterSignText

MartSignScript:
	farjumptext MartSignText

DayToTextScript:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday
	getstring STRING_BUFFER_3, .SundayText
	end
.Monday:
	getstring STRING_BUFFER_3, .MondayText
	end
.Tuesday:
	getstring STRING_BUFFER_3, .TuesdayText
	end
.Wednesday:
	getstring STRING_BUFFER_3, .WednesdayText
	end
.Thursday:
	getstring STRING_BUFFER_3, .ThursdayText
	end
.Friday:
	getstring STRING_BUFFER_3, .FridayText
	end
.Saturday:
	getstring STRING_BUFFER_3, .SaturdayText
	end
.SundayText:
	db "Sunday@"
.MondayText:
	db "Monday@"
.TuesdayText:
	db "Tuesday@"
.WednesdayText:
	db "Wednesday@"
.ThursdayText:
	db "Thursday@"
.FridayText:
	db "Friday@"
.SaturdayText:
	db "Saturday@"

GoldenrodRocketsScript:
	clearevent EVENT_GOLDENROD_TOWER_TAKEOVER
	setevent EVENT_GOLDENROD_CITY_CIVILIANS
	setevent EVENT_GOLDENROD_CITY_GUARD_1
	clearevent EVENT_GOLDENROD_CITY_GUARD_2
	setmapscene GOLDENROD_GYM, SCENE_FINISHED
	setflag ENGINE_ROCKETS_IN_RADIO_TOWER
	end

RadioTowerRocketsScript:
	setevent EVENT_GOLDENROD_CITY_GUARD_1
	clearevent EVENT_GOLDENROD_CITY_GUARD_2
	setmapscene GOLDENROD_GYM, SCENE_FINISHED
	end

BugContestResultsWarpScript:
	special ClearBGPalettes
	scall BugContestResults_CopyContestantsToResults
	setevent EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	clearevent EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
	setevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	warp ROUTE_36_NATIONAL_PARK_GATE, 0, 4
	applymovement PLAYER, Movement_ContestResults_WalkAfterWarp

BugContestResultsScript:
	clearflag ENGINE_BUG_CONTEST_TIMER
	clearevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	opentext
	farwritetext ContestResults_ReadyToJudgeText
	waitbutton
	special BugContestJudging
	getnum STRING_BUFFER_3
	ifequal 1, BugContestResults_FirstPlace
	ifequal 2, BugContestResults_SecondPlace
	ifequal 3, BugContestResults_ThirdPlace
	farwritetext ContestResults_ConsolationPrizeText
	buttonsound
	waitsfx
	verbosegiveitem ORAN_BERRY
	iffalse BugContestResults_NoRoomForBerry

BugContestResults_DidNotWin:
	farwritetext ContestResults_DidNotWinText
	buttonsound
	sjump BugContestResults_FinishUp

BugContestResults_ReturnAfterWinnersPrize:
	farwritetext ContestResults_JoinUsNextTimeText
	buttonsound

BugContestResults_FinishUp:
	checkevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	iffalse BugContestResults_DidNotLeaveMons
	farwritetext ContestResults_ReturnPartyText
	waitbutton
	special ContestReturnMons
BugContestResults_DidNotLeaveMons:
	special CheckPartyFullAfterContest
	ifequal BUGCONTEST_CAUGHT_MON, BugContestResults_CleanUp
	ifequal BUGCONTEST_NO_CATCH, BugContestResults_CleanUp
	; BUGCONTEST_BOXED_MON
	farwritetext ContestResults_PartyFullText
	waitbutton
BugContestResults_CleanUp:
	closetext
	setscene SCENE_ROUTE36NATIONALPARKGATE_NOTHING
	setmapscene ROUTE_35_NATIONAL_PARK_GATE, SCENE_ROUTE35NATIONALPARKGATE_NOTHING
	setevent EVENT_BUG_CATCHING_CONTESTANT_1A
	setevent EVENT_BUG_CATCHING_CONTESTANT_2A
	setevent EVENT_BUG_CATCHING_CONTESTANT_3A
	setevent EVENT_BUG_CATCHING_CONTESTANT_4A
	setevent EVENT_BUG_CATCHING_CONTESTANT_5A
	setevent EVENT_BUG_CATCHING_CONTESTANT_6A
	setevent EVENT_BUG_CATCHING_CONTESTANT_7A
	setevent EVENT_BUG_CATCHING_CONTESTANT_8A
	setevent EVENT_BUG_CATCHING_CONTESTANT_9A
	setevent EVENT_BUG_CATCHING_CONTESTANT_10A
	setevent EVENT_BUG_CATCHING_CONTESTANT_1B
	setevent EVENT_BUG_CATCHING_CONTESTANT_2B
	setevent EVENT_BUG_CATCHING_CONTESTANT_3B
	setevent EVENT_BUG_CATCHING_CONTESTANT_4B
	setevent EVENT_BUG_CATCHING_CONTESTANT_5B
	setevent EVENT_BUG_CATCHING_CONTESTANT_6B
	setevent EVENT_BUG_CATCHING_CONTESTANT_7B
	setevent EVENT_BUG_CATCHING_CONTESTANT_8B
	setevent EVENT_BUG_CATCHING_CONTESTANT_9B
	setevent EVENT_BUG_CATCHING_CONTESTANT_10B
	setflag ENGINE_DAILY_BUG_CONTEST
	special PlayMapMusic
	end

BugContestResults_FirstPlace:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	getitemname STRING_BUFFER_4, SUN_STONE
	farwritetext ContestResults_PlayerWonAPrizeText
	waitbutton
	verbosegiveitem SUN_STONE
	iffalse BugContestResults_NoRoomForSunStone
	sjump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_SecondPlace:
	getitemname STRING_BUFFER_4, EVERSTONE
	farwritetext ContestResults_PlayerWonAPrizeText
	waitbutton
	verbosegiveitem EVERSTONE
	iffalse BugContestResults_NoRoomForEverstone
	sjump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_ThirdPlace:
	getitemname STRING_BUFFER_4, SITRUS_BERRY
	farwritetext ContestResults_PlayerWonAPrizeText
	waitbutton
	verbosegiveitem SITRUS_BERRY
	iffalse BugContestResults_NoRoomForGoldBerry
	sjump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_NoRoomForSunStone:
	farwritetext BugContestPrizeNoRoomText
	buttonsound
	setevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	sjump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_NoRoomForEverstone:
	farwritetext BugContestPrizeNoRoomText
	buttonsound
	setevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	sjump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_NoRoomForGoldBerry:
	farwritetext BugContestPrizeNoRoomText
	buttonsound
	setevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	sjump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_NoRoomForBerry:
	farwritetext BugContestPrizeNoRoomText
	buttonsound
	setevent EVENT_CONTEST_OFFICER_HAS_BERRY
	sjump BugContestResults_DidNotWin

BugContestResults_CopyContestantsToResults:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .skip1
	clearevent EVENT_BUG_CATCHING_CONTESTANT_1B
.skip1
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .skip2
	clearevent EVENT_BUG_CATCHING_CONTESTANT_2B
.skip2
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .skip3
	clearevent EVENT_BUG_CATCHING_CONTESTANT_3B
.skip3
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .skip4
	clearevent EVENT_BUG_CATCHING_CONTESTANT_4B
.skip4
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .skip5
	clearevent EVENT_BUG_CATCHING_CONTESTANT_5B
.skip5
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .skip6
	clearevent EVENT_BUG_CATCHING_CONTESTANT_6B
.skip6
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .skip7
	clearevent EVENT_BUG_CATCHING_CONTESTANT_7B
.skip7
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .skip8
	clearevent EVENT_BUG_CATCHING_CONTESTANT_8B
.skip8
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .skip9
	clearevent EVENT_BUG_CATCHING_CONTESTANT_9B
.skip9
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .skip10
	clearevent EVENT_BUG_CATCHING_CONTESTANT_10B
.skip10
	end

InitializeEventsScript:
	setevent EVENT_GOLDENROD_TOWER_TAKEOVER
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	setevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_DRAGONITE
	setevent EVENT_RIVAL_TEAM_ROCKET_BASE
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setevent EVENT_RIVAL_AZALEA_TOWN
	setevent EVENT_RIVAL_GOLDENROD_UNDERGROUND
	setevent EVENT_KURTS_HOUSE_SLOWPOKE
	setevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	setevent EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	setevent EVENT_COP_IN_ELMS_LAB
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	setevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	setevent EVENT_MT_MOON_SQUARE_CLEFAIRY
	setevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	setevent EVENT_INITIALIZED_EVENTS
	setevent EVENT_BUG_CATCHING_CONTESTANT_1A
	setevent EVENT_BUG_CATCHING_CONTESTANT_2A
	setevent EVENT_BUG_CATCHING_CONTESTANT_3A
	setevent EVENT_BUG_CATCHING_CONTESTANT_4A
	setevent EVENT_BUG_CATCHING_CONTESTANT_5A
	setevent EVENT_BUG_CATCHING_CONTESTANT_6A
	setevent EVENT_BUG_CATCHING_CONTESTANT_7A
	setevent EVENT_BUG_CATCHING_CONTESTANT_8A
	setevent EVENT_BUG_CATCHING_CONTESTANT_9A
	setevent EVENT_BUG_CATCHING_CONTESTANT_10A
	setevent EVENT_BUG_CATCHING_CONTESTANT_1B
	setevent EVENT_BUG_CATCHING_CONTESTANT_2B
	setevent EVENT_BUG_CATCHING_CONTESTANT_3B
	setevent EVENT_BUG_CATCHING_CONTESTANT_4B
	setevent EVENT_BUG_CATCHING_CONTESTANT_5B
	setevent EVENT_BUG_CATCHING_CONTESTANT_6B
	setevent EVENT_BUG_CATCHING_CONTESTANT_7B
	setevent EVENT_BUG_CATCHING_CONTESTANT_8B
	setevent EVENT_BUG_CATCHING_CONTESTANT_9B
	setevent EVENT_BUG_CATCHING_CONTESTANT_10B
	setevent EVENT_FAST_SHIP_1F_GENTLEMAN
	setevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	setevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	setevent EVENT_LAKE_OF_RAGE_CIVILIANS
	setevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_TIN_TOWER_ROOF_HO_OH
	setevent EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_LUGIA
	setevent EVENT_PLAYERS_HOUSE_2F_CONSOLE
	setevent EVENT_PLAYERS_HOUSE_2F_DOLL_1
	setevent EVENT_PLAYERS_HOUSE_2F_DOLL_2
	setevent EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	setevent EVENT_DECO_BED_1
	setevent EVENT_DECO_PLANT_4
	setevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
	setevent EVENT_OLIVINE_GYM_JASMINE
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	setevent EVENT_MET_BILL
	setevent EVENT_ECRUTEAK_POKE_CENTER_BILL
	setevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	setevent EVENT_LAKE_OF_RAGE_MIYAMOTO
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	setevent EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	setevent EVENT_DRAGONS_DEN_CLAIR
	setevent EVENT_RIVAL_OLIVINE_CITY
	setevent EVENT_RIVAL_VICTORY_ROAD
	setevent EVENT_RIVAL_DRAGONS_DEN
	setevent EVENT_LANCES_ROOM_OAK_AND_MARY
	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	setevent EVENT_BURNED_TOWER_B1F_BEASTS_1
	setevent EVENT_RED_IN_MT_SILVER
	setevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	setevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	setevent EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
	setevent EVENT_KURTS_HOUSE_KURT_2
	setevent EVENT_KURTS_HOUSE_GRANDDAUGHTER_2
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_FLORIA_AT_SUDOWOODO
	setevent EVENT_GOLDENROD_CITY_MOVE_TUTOR
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	setevent EVENT_BATTLE_TOWER_BATTLE_ROOM_YOUNGSTER
	setevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setevent EVENT_AZALEA_TOWN_KURT
	setevent EVENT_AZALEA_TOWN_KURT
	setevent EVENT_ILEX_FOREST_KURT
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_IN_WALKWAY
	setevent EVENT_ILEX_FOREST_LASS
	setevent EVENT_GOLDENROD_SALE_OFF
	setevent EVENT_ECRUTEAK_CITY_GRAMPS
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	setevent EVENT_PLAYERS_HOUSE_MOM_2
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	setevent EVENT_CIANWOOD_CITY_EUSINE
	setevent EVENT_TIN_TOWER_1F_EUSINE
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	setflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setflag ENGINE_ROCKETS_IN_MAHOGANY
	variablesprite SPRITE_WEIRD_TREE, SPRITE_SUDOWOODO
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_ROCKET
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_ROCKET
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_OFFICER_JENNY
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_OFFICER_JENNY
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_OFFICER_JENNY
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_OFFICER_JENNY
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_LASS
	setevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setevent EVENT_CERULEAN_GYM_ROCKET
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_ROUTE_25_MISTY_BOYFRIEND
	setevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setevent EVENT_COPYCATS_HOUSE_2F_DOLL
	setevent EVENT_VIRIDIAN_GYM_BLUE
	setevent EVENT_ECRUTEAK_GYM_KIDS
	setevent EVENT_TIN_TOWER_ENTRANCE_ROCKET
	setevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_SHERLES
	setevent EVENT_CIANWOOD_GYM_RIVAL1
	setevent EVENT_CIANWOOD_GYM_RIVAL2
	setevent EVENT_ITEMFINDER_GUY
	setevent EVENT_ROUTE_36_GUY
	setevent EVENT_AFTER_RESCUING_BURNED_TOWER_GIRL
	setevent EVENT_JAILED_ROCKET
	setevent EVENT_BURNED_TOWER_1F_ENOKI_2
	setevent EVENT_RIVAL_AT_LAKE_OF_RAGE_1
	setevent EVENT_MOUNT_MORTAR_HIKER_1
	setevent EVENT_ROUTE_36_GUY_2
	setevent EVENT_GOLDENROD_CITY_GUARD_2
	setevent EVENT_GOLDENROD_CITY_TOWER_ROCKETS
	setevent EVENT_GOLDENROD_GYM_RIVAL_1
	variablesprite SPRITE_RIVAL, SPRITE_KRIS
	setevent EVENT_GOLDENROD_TOWER_DIRECTOR
	setevent EVENT_GOLDENROD_TOWER_SHERLES
	setevent EVENT_GOLDENROD_TOWER_POLICE
	setevent EVENT_DAY_CARE_RIVAL
	setevent EVENT_ROUTE_34_NINJA
	setevent EVENT_GOLDENROD_TOWER_RIVAL_2
	setevent EVENT_ROUTE_44_REMATCH
	setevent EVENT_MART_RIVAL
	setevent EVENT_MART_SHERLES
	setevent EVENT_MART_KOGA
	setevent EVENT_BLACKTHORN_CITY_RIVAL
	setevent EVENT_WILD_AREA_CYNTHIA
	setevent EVENT_RUINS_OF_ALPH_CYNTHIA
	setevent EVENT_CHAMPION_OAK
	setevent EVENT_CHAMPION_CYNTHIA
	setevent EVENT_CHALLENGER_OAK
	setevent EVENT_CHALLENGER_CYNTHIA
	setevent EVENT_CHALLENGER_RIVAL
	setevent EVENT_VICTORY_ROAD_GATE_OAK
	setevent EVENT_VICTORY_ROAD_GATE_RIVAL
	setmapscene PLAYERS_HOUSE_1F, SCENE_GRANDMA_GIVES_YOU_WATCH
	setevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	setevent EVENT_BELLCHIME_PATH_ENOKI_WALK
	setevent EVENT_BELLCHIME_PATH_ENOKI_PANIC
	setevent EVENT_ICE_PATH_1F_PRYCE
	setevent EVENT_RIVALS_HOUSE_RIVAL
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_CHERRYGROVE_CYNTHIA
	setevent EVENT_ROUTE_47_SUICUNE
	setevent EVENT_BURNED_TOWER_B1F_ENTEI
	setevent EVENT_VICTORY_ROAD_GATE_RIVAL_2
	setmapscene VICTORY_ROAD_GATE, SCENE_VICTORY_ROAD_GATE_GUARD
	setevent EVENT_VICTORY_ROAD_GATE_GUARD_2
	return

AskNumber1MScript:
	special RandomPhoneMon
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_JUGGLER_IRWIN, .Irwin
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackAskNumber1Text
	end
.Huey:
	farwritetext HueyAskNumber1Text
	end
.Jose:
	farwritetext JoseAskNumber1Text
	end
.Wade:
	farwritetext WadeAskNumber1Text
	end
.Ralph:
	farwritetext RalphAskNumber1Text
	end
.Anthony:
	farwritetext AnthonyAskNumber1Text
	end
.Todd:
	farwritetext ToddAskNumber1Text
	end
.Irwin:
	farwritetext IrwinAskNumber1Text
	end
.Arnie:
	farwritetext ArnieAskNumber1Text
	end
.Alan:
	farwritetext AlanAskNumber1Text
	end
.Chad:
	farwritetext ChadAskNumber1Text
	end
.Derek:
	farwritetext DerekAskNumber1Text
	end
.Tully:
	farwritetext TullyAskNumber1Text
	end
.Brent:
	farwritetext BrentAskNumber1Text
	end
.Vance:
	farwritetext VanceAskNumber1Text
	end
.Wilton:
	farwritetext WiltonAskNumber1Text
	end
.Kenji:
	farwritetext KenjiAskNumber1Text
	end
.Parry:
	farwritetext ParryAskNumber1Text
	end

AskNumber2MScript:
	special RandomPhoneMon
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_JUGGLER_IRWIN, .Irwin
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackAskNumber2Text
	end
.Huey:
	farwritetext HueyAskNumber2Text
	end
.Jose:
	farwritetext JoseAskNumber2Text
	end
.Wade:
	farwritetext WadeAskNumber2Text
	end
.Ralph:
	farwritetext RalphAskNumber2Text
	end
.Anthony:
	farwritetext AnthonyAskNumber2Text
	end
.Todd:
	farwritetext ToddAskNumber2Text
	end
.Irwin:
	farwritetext IrwinAskNumber2Text
	end
.Arnie:
	farwritetext ArnieAskNumber2Text
	end
.Alan:
	farwritetext AlanAskNumber2Text
	end
.Chad:
	farwritetext ChadAskNumber2Text
	end
.Derek:
	farwritetext DerekAskNumber2Text
	end
.Tully:
	farwritetext TullyAskNumber2Text
	end
.Brent:
	farwritetext BrentAskNumber2Text
	end
.Vance:
	farwritetext VanceAskNumber2Text
	end
.Wilton:
	farwritetext WiltonAskNumber2Text
	end
.Kenji:
	farwritetext KenjiAskNumber2Text
	end
.Parry:
	farwritetext ParryAskNumber2Text
	end

RegisteredNumberMScript:
	farwritetext RegisteredNumber1Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	end

NumberAcceptedMScript:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_JUGGLER_IRWIN, .Irwin
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackNumberAcceptedText
	waitbutton
	closetext
	end
.Huey:
	farwritetext HueyNumberAcceptedText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JoseNumberAcceptedText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadeNumberAcceptedText
	waitbutton
	closetext
	end
.Ralph:
	farwritetext RalphNumberAcceptedText
	waitbutton
	closetext
	end
.Anthony:
	farwritetext AnthonyNumberAcceptedText
	waitbutton
	closetext
	end
.Todd:
	farwritetext ToddNumberAcceptedText
	waitbutton
	closetext
	end
.Irwin:
	farwritetext IrwinNumberAcceptedText
	waitbutton
	closetext
	end
.Arnie:
	farwritetext ArnieNumberAcceptedText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanNumberAcceptedText
	waitbutton
	closetext
	end
.Chad:
	farwritetext ChadNumberAcceptedText
	waitbutton
	closetext
	end
.Derek:
	farwritetext DerekNumberAcceptedText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyNumberAcceptedText
	waitbutton
	closetext
	end
.Brent:
	farwritetext BrentNumberAcceptedText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VanceNumberAcceptedText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonNumberAcceptedText
	waitbutton
	closetext
	end
.Kenji:
	farwritetext KenjiNumberAcceptedText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryNumberAcceptedText
	waitbutton
	closetext
	end

NumberDeclinedMScript:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_JUGGLER_IRWIN, .Irwin
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackNumberDeclinedText
	waitbutton
	closetext
	end
.Huey:
	farwritetext HueyNumberDeclinedText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JoseNumberDeclinedText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadeNumberDeclinedText
	waitbutton
	closetext
	end
.Ralph:
	farwritetext RalphNumberDeclinedText
	waitbutton
	closetext
	end
.Anthony:
	farwritetext AnthonyNumberDeclinedText
	waitbutton
	closetext
	end
.Todd:
	farwritetext ToddNumberDeclinedText
	waitbutton
	closetext
	end
.Irwin:
	farwritetext IrwinNumberDeclinedText
	waitbutton
	closetext
	end
.Arnie:
	farwritetext ArnieNumberDeclinedText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanNumberDeclinedText
	waitbutton
	closetext
	end
.Chad:
	farwritetext ChadNumberDeclinedText
	waitbutton
	closetext
	end
.Derek:
	farwritetext DerekNumberDeclinedText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyNumberDeclinedText
	waitbutton
	closetext
	end
.Brent:
	farwritetext BrentNumberDeclinedText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VanceNumberDeclinedText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonNumberDeclinedText
	waitbutton
	closetext
	end
.Kenji:
	farwritetext KenjiNumberDeclinedText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryNumberDeclinedText
	waitbutton
	closetext
	end

PhoneFullMScript:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_JUGGLER_IRWIN, .Irwin
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackPhoneFullText
	waitbutton
	closetext
	end
.Huey:
	farwritetext HueyPhoneFullText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JosePhoneFullText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadePhoneFullText
	waitbutton
	closetext
	end
.Ralph:
	farwritetext RalphPhoneFullText
	waitbutton
	closetext
	end
.Anthony:
	farwritetext AnthonyPhoneFullText
	waitbutton
	closetext
	end
.Todd:
	farwritetext ToddPhoneFullText
	waitbutton
	closetext
	end
.Irwin:
	farwritetext IrwinPhoneFullText
	waitbutton
	closetext
	end
.Arnie:
	farwritetext ArniePhoneFullText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanPhoneFullText
	waitbutton
	closetext
	end
.Chad:
	farwritetext ChadPhoneFullText
	waitbutton
	closetext
	end
.Derek:
	farwritetext DerekPhoneFullText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyPhoneFullText
	waitbutton
	closetext
	end
.Brent:
	farwritetext BrentPhoneFullText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VancePhoneFullText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonPhoneFullText
	waitbutton
	closetext
	end
.Kenji:
	farwritetext KenjiPhoneFullText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryPhoneFullText
	waitbutton
	closetext
	end

RematchMScript:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackRematchText
	waitbutton
	closetext
	end
.Huey:
	farwritetext HueyRematchText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JoseRematchText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadeRematchText
	waitbutton
	closetext
	end
.Ralph:
	farwritetext RalphRematchText
	waitbutton
	closetext
	end
.Anthony:
	farwritetext AnthonyRematchText
	waitbutton
	closetext
	end
.Todd:
	farwritetext ToddRematchText
	waitbutton
	closetext
	end
.Arnie:
	farwritetext ArnieRematchText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanRematchText
	waitbutton
	closetext
	end
.Chad:
	farwritetext ChadRematchText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyRematchText
	waitbutton
	closetext
	end
.Brent:
	farwritetext BrentRematchText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VanceRematchText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonRematchText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryRematchText
	waitbutton
	closetext
	end

GiftMScript:
	readvar VAR_CALLERID
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji

.Jose:
	farwritetext JoseGiftText
	buttonsound
	end
.Wade:
	farwritetext WadeGiftText
	buttonsound
	end
.Alan:
	farwritetext AlanGiftText
	buttonsound
	end
.Derek:
	farwritetext DerekGiftText
	buttonsound
	end
.Tully:
	farwritetext TullyGiftText
	buttonsound
	end
.Wilton:
	farwritetext WiltonGiftText
	buttonsound
	end
.Kenji:
	farwritetext KenjiGiftText
	buttonsound
	end

PackFullMScript:
	readvar VAR_CALLERID
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry

.Huey:
	farwritetext HueyPackFullText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JosePackFullText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadePackFullText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanPackFullText
	waitbutton
	closetext
	end
.Derek:
	farwritetext DerekPackFullText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyPackFullText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VancePackFullText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonPackFullText
	waitbutton
	closetext
	end
.Kenji:
	farwritetext KenjiPackFullText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryPackFullText
	waitbutton
	closetext
	end

RematchGiftMScript:
	opentext
	readvar VAR_CALLERID
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_HIKER_PARRY, .Parry

.Huey:
	farwritetext HueyRematchGiftText
	buttonsound
	end
.Vance:
	farwritetext VanceRematchGiftText
	buttonsound
	end
.Parry:
	farwritetext ParryRematchGiftText
	buttonsound
	end

AskNumber1FScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyAskNumber1Text
	end
.Beth:
	farwritetext BethAskNumber1Text
	end
.Reena:
	farwritetext ReenaAskNumber1Text
	end
.Liz:
	farwritetext LizAskNumber1Text
	end
.Gina:
	farwritetext GinaAskNumber1Text
	end
.Tiffany:
	farwritetext TiffanyAskNumber1Text
	end
.Erin:
	farwritetext ErinAskNumber1Text
	end

AskNumber2FScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyAskNumber2Text
	end
.Beth:
	farwritetext BethAskNumber2Text
	end
.Reena:
	farwritetext ReenaAskNumber2Text
	end
.Liz:
	farwritetext LizAskNumber2Text
	end
.Gina:
	farwritetext GinaAskNumber2Text
	end
.Tiffany:
	farwritetext TiffanyAskNumber2Text
	end
.Erin:
	farwritetext ErinAskNumber2Text
	end

RegisteredNumberFScript:
	farwritetext RegisteredNumber2Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	end

NumberAcceptedFScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyNumberAcceptedText
	waitbutton
	closetext
	end
.Beth:
	farwritetext BethNumberAcceptedText
	waitbutton
	closetext
	end
.Reena:
	farwritetext ReenaNumberAcceptedText
	waitbutton
	closetext
	end
.Liz:
	farwritetext LizNumberAcceptedText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaNumberAcceptedText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyNumberAcceptedText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinNumberAcceptedText
	waitbutton
	closetext
	end

NumberDeclinedFScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyNumberDeclinedText
	waitbutton
	closetext
	end
.Beth:
	farwritetext BethNumberDeclinedText
	waitbutton
	closetext
	end
.Reena:
	farwritetext ReenaNumberDeclinedText
	waitbutton
	closetext
	end
.Liz:
	farwritetext LizNumberDeclinedText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaNumberDeclinedText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyNumberDeclinedText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinNumberDeclinedText
	waitbutton
	closetext
	end

PhoneFullFScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyPhoneFullText
	waitbutton
	closetext
	end
.Beth:
	farwritetext BethPhoneFullText
	waitbutton
	closetext
	end
.Reena:
	farwritetext ReenaPhoneFullText
	waitbutton
	closetext
	end
.Liz:
	farwritetext LizPhoneFullText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaPhoneFullText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyPhoneFullText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinPhoneFullText
	waitbutton
	closetext
	end

RematchFScript:
	readvar VAR_CALLERID
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beth:
	farwritetext BethRematchText
	waitbutton
	closetext
	end
.Reena:
	farwritetext ReenaRematchText
	waitbutton
	closetext
	end
.Liz:
	farwritetext LizRematchText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaRematchText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyRematchText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinRematchText
	waitbutton
	closetext
	end

GiftFScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany

.Beverly:
	farwritetext BeverlyGiftText
	buttonsound
	end
.Gina:
	farwritetext GinaGiftText
	buttonsound
	end
.Tiffany:
	farwritetext TiffanyGiftText
	buttonsound
	end

PackFullFScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyPackFullText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaPackFullText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyPackFullText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinPackFullText
	waitbutton
	closetext
	end

RematchGiftFScript:
	readvar VAR_CALLERID
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Erin:
	opentext
	farwritetext ErinRematchGiftText
	buttonsound
	end

GymStatue1Script:
	getcurlandmarkname STRING_BUFFER_3
	opentext
	farwritetext GymStatue_CityGymText
	buttonsound
	farwritetext GymStatue_DahliaText
	waitbutton
	closetext
	end

GymStatue2Script:
	getcurlandmarkname STRING_BUFFER_3
	opentext
	farwritetext GymStatue_CityGymText
	buttonsound
	farwritetext GymStatue_WinningTrainersText
	waitbutton
	closetext
	end

ReceiveItemScript:
	waitsfx
	farwritetext ReceivedItemText
	playsound SFX_ITEM
	waitsfx
	end

ReceiveTogepiEggScript:
	waitsfx
	farwritetext ReceivedItemText
	playsound SFX_GET_EGG_FROM_DAY_CARE_LADY
	waitsfx
	end

GameCornerCoinVendorScript:
	faceplayer
	opentext
	farwritetext CoinVendor_WelcomeText
	buttonsound
	checkitem COIN_CASE
	iftrue CoinVendor_IntroScript
	farwritetext CoinVendor_NoCoinCaseText
	waitbutton
	closetext
	end

CoinVendor_IntroScript:
	farwritetext CoinVendor_IntroText

.loop
	special DisplayMoneyAndCoinBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Buy50
	ifequal 2, .Buy500
	sjump .Cancel

.Buy50:
	checkcoins MAX_COINS - 50
	ifequal HAVE_MORE, .CoinCaseFull
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .NotEnoughMoney
	givecoins 50
	takemoney YOUR_MONEY, 1000
	waitsfx
	playsound SFX_TRANSACTION
	farwritetext CoinVendor_Buy50CoinsText
	waitbutton
	sjump .loop

.Buy500:
	checkcoins MAX_COINS - 500
	ifequal HAVE_MORE, .CoinCaseFull
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney
	givecoins 500
	takemoney YOUR_MONEY, 10000
	waitsfx
	playsound SFX_TRANSACTION
	farwritetext CoinVendor_Buy500CoinsText
	waitbutton
	sjump .loop

.NotEnoughMoney:
	farwritetext CoinVendor_NotEnoughMoneyText
	waitbutton
	closetext
	end

.CoinCaseFull:
	farwritetext CoinVendor_CoinCaseFullText
	waitbutton
	closetext
	end

.Cancel:
	farwritetext CoinVendor_CancelText
	waitbutton
	closetext
	end

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db " 50 :  ¥1000@"
	db "500 : ¥10000@"
	db "CANCEL@"

HappinessCheckScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	ifless 50, .Unhappy
	ifless 150, .KindaHappy
	farwritetext HappinessText3
	waitbutton
	closetext
	end

.KindaHappy:
	farwritetext HappinessText2
	waitbutton
	closetext
	end

.Unhappy:
	farwritetext HappinessText1
	waitbutton
	closetext
	end

GymStatue3Script:
	getcurlandmarkname STRING_BUFFER_3
	opentext
	farwritetext GymStatue_WinningTrainers3Text
	buttonsound
	closetext
	end

GymStatue4Script:
	getcurlandmarkname STRING_BUFFER_3
	opentext
	farwritetext GymStatue_CityGymText
	waitbutton
	closetext
	end

NinjaHideoutClear:
	setevent EVENT_HIDEOUT_NINJA
	setevent EVENT_HIDEOUT_NINJA2
	setevent EVENT_HIDEOUT_NINJA3
	setevent EVENT_HIDEOUT_NINJA4
	setevent EVENT_HIDEOUT_NINJA5
	setevent EVENT_HIDEOUT_NINJA6
	setevent EVENT_HIDEOUT_NINJA7
	setevent EVENT_HIDEOUT_NINJA8
	setevent EVENT_HIDEOUT_NINJA9
	setevent EVENT_HIDEOUT_NINJA10
	setevent EVENT_HIDEOUT_NINJA11
	setevent EVENT_HIDEOUT_NINJA12
	setevent EVENT_HIDEOUT_BF1_MIYAMOTO
	setevent EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_POPULATION
	clearevent EVENT_MART_RIVAL
	setevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	return

Movement_ContestResults_WalkAfterWarp:
	step RIGHT
	step DOWN
	turn_head UP
	step_resume

GetDecoEvent:
	setevent EVENT_DECO_TOTODILE_DOLL
	setevent EVENT_DECO_GENGAR_DOLL
	setevent EVENT_DECO_BULBASAUR_DOLL
	setevent EVENT_DECO_CHARMANDER_DOLL
	setevent EVENT_DECO_CHIKORITA_DOLL
	setevent EVENT_DECO_CYNDAQUIL_DOLL
	setevent EVENT_DECO_SQUIRTLE_DOLL
	setevent EVENT_DECO_BIG_SALAMENCE_DOLL
	setevent EVENT_DECO_PLANT_3
	setevent EVENT_DECO_CARPET_1
	setevent EVENT_DECO_PIKACHU_DOLL
	setevent EVENT_DECO_POSTER_3
	setevent EVENT_DECO_SILVER_TROPHY
	return

StaticPokemonRefresh:
	checkevent EVENT_BEAT_FARFETCHD
	iftrue .refreshfarfetchd
	checkevent EVENT_BEAT_RAIKOU
	iftrue .refreshraikou
	checkevent EVENT_BEAT_ENTEI
	iftrue .refreshentei
	checkevent EVENT_BEAT_SUICUNE
	iftrue .refreshsuicune
	checkevent EVENT_BEAT_DUSKNOIR
	iftrue .refreshdusknoir
	checkevent EVENT_BEAT_CELEBI
	iftrue .refreshcelebi
	checkevent EVENT_BEAT_MOLTRES
	iftrue .refreshmoltres
	checkevent EVENT_BEAT_ZAPDOS
	iftrue .refreshzapdos
	checkevent EVENT_BEAT_SNORLAX
	iftrue .refreshsnorlax
	checkevent EVENT_BEAT_MISSINGNO
	iftrue .refreshmissingno
	checkevent EVENT_BEAT_MEWTWO
	iftrue .refreshmewtwo
	checkevent EVENT_BEAT_MEW
	iftrue .refreshmew
	checkevent EVENT_BEAT_LUGIA
	iftrue .refreshlugia
	checkevent EVENT_BEAT_HO_OH
	iftrue .refreshhooh
	return

.refreshfarfetchd:
	clearevent EVENT_BEAT_FARFETCHD
	sjump StaticPokemonRefresh

.refreshraikou:
	clearevent EVENT_BEAT_RAIKOU
	sjump StaticPokemonRefresh

.refreshentei:
	clearevent EVENT_BEAT_ENTEI
	sjump StaticPokemonRefresh

.refreshsuicune:
	clearevent EVENT_BEAT_SUICUNE
	sjump StaticPokemonRefresh

.refreshdusknoir:
	clearevent EVENT_BEAT_DUSKNOIR
	sjump StaticPokemonRefresh

.refreshcelebi:
	setevent EVENT_FOREST_IS_RESTLESS
	clearevent EVENT_BEAT_CELEBI
	sjump StaticPokemonRefresh

.refreshmoltres:
	clearevent EVENT_BEAT_MOLTRES
	sjump StaticPokemonRefresh

.refreshzapdos:
	clearevent EVENT_BEAT_ZAPDOS
	sjump StaticPokemonRefresh

.refreshsnorlax:
	clearevent EVENT_BEAT_SNORLAX
	clearevent EVENT_VERMILION_CITY_SNORLAX
	sjump StaticPokemonRefresh

.refreshmewtwo:
	clearevent EVENT_BEAT_MEWTWO
	sjump StaticPokemonRefresh

.refreshmissingno:
	clearevent EVENT_BEAT_MISSINGNO
	sjump StaticPokemonRefresh

.refreshmew:
	clearevent EVENT_BEAT_MEW
	sjump StaticPokemonRefresh

.refreshlugia:
	clearevent EVENT_BEAT_LUGIA
	sjump StaticPokemonRefresh

.refreshhooh:
	clearevent EVENT_BEAT_HO_OH
	sjump StaticPokemonRefresh

TelevisionScript:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday
	playmusic MUSIC_POKEMON_LULLABY
	opentext
	checkflag ENGINE_DAILY_TELEVISION
	iftrue .WatchNextWeek
	farwritetext LullabyText
	waitbutton
	closetext
	sjump .endchannel
.Monday:
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	checkflag ENGINE_DAILY_TELEVISION
	iftrue .WatchNextWeek
	farwritetext VillainousText
	waitbutton
	closetext
	sjump .endchannel
.Tuesday:
	sjump SwarmScript
	end
.Wednesday:
	playmusic MUSIC_POKEMON_TALK
	opentext
	farwritetext WelcomeToPokemonTalk
	waitbutton
	random 20
	ifequal 0, .Skarmini
	ifequal 1, .Cyndaquil
	ifequal 2, .Chikorita
	ifequal 3, .Totodile
	ifequal 4, .Croagunk
	ifequal 5, .Electrike
	ifequal 6, .Ralts
	ifequal 7, .Duskull
	ifequal 8, .Wynaut
	ifequal 9, .Budew
	ifequal 10, .Cacnea
	ifequal 11, .Snorunt
	ifequal 12, .Aron
	ifequal 13, .Gible
	ifequal 14, .Tyrogue
	ifequal 15, .Corsola
	ifequal 16, .Bonsly
	ifequal 17, .MimeJr
	ifequal 18, .Eevee
	ifequal 19, .Bronzor

.Skarmini:
	farwritetext SkarminiOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Cyndaquil:
	farwritetext CyndaquilOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Chikorita:
	farwritetext ChikoritaOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Totodile:
	farwritetext TotodileOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Croagunk:
	farwritetext CroagunkOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Electrike:
	farwritetext ElectrikeOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Ralts:
	farwritetext RaltsOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Duskull:
	farwritetext DuskullOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Wynaut:
	farwritetext WynautOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Budew:
	farwritetext BudewOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Cacnea:
	farwritetext CacneaOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Snorunt:
	farwritetext SnoruntOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Aron:
	farwritetext AronOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Gible:
	farwritetext GibleOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Tyrogue:
	farwritetext TyrogueOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Corsola:
	farwritetext CorsolaOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Bonsly:
	farwritetext BonslyOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.MimeJr:
	farwritetext MimeJrOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Eevee:
	farwritetext EeveeOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.Bronzor:
	farwritetext BronzorOakText
	waitbutton
	closetext
	sjump .EndOakTalk

.EndOakTalk:
	special FadeOutMusic
	pause 15
	special RestartMapMusic
	end

.Thursday:
	playmusic MUSIC_SHOW_ME_AROUND
	opentext
	farwritetext ComedyShowText
	waitbutton
	closetext
	sjump .endchannel
.Friday:
	playmusic MUSIC_ELITE_FOUR
	opentext
	farwritetext ChampionBattleShowText
	waitbutton
	closetext
	sjump .endchannel
.Saturday:
	playmusic MUSIC_UNWAVERING_HEART
	opentext
	checkflag ENGINE_DAILY_TELEVISION
	iftrue .WatchNextWeek
	farwritetext DramaticShowText
	waitbutton
	closetext
.endchannel
	special FadeOutMusic
	pause 15
	special RestartMapMusic
	setflag ENGINE_DAILY_TELEVISION
	end

.WatchNextWeek:
	farwritetext TuneInNextTimeText
	waitbutton
	closetext
	special FadeOutMusic
	pause 15
	special RestartMapMusic
	end

SwarmScript:
	playmusic MUSIC_POKEMON_MARCH
	opentext
	checkflag ENGINE_SWARM
	iftrue .skiprandomswarm
	farwritetext WhatSwarmTodayText
	waitbutton
.SwarmReroll:
	random 29
	ifequal 0,  .noswarm
	ifequal 1,  .yanma
	ifequal 2,  .dunsparce
	ifequal 3,  .qwilfish
	ifequal 4,  .eevee
	ifequal 5,  .kangaskhan
	ifequal 6,  .gible
	ifequal 7,  .sneasel
	ifequal 8,  .misdreavus
	ifequal 9,  .scyther
	ifequal 10, .pinsir
	ifequal 11, .aron
	ifequal 12, .ralts
	ifequal 13, .kotora
	ifequal 14, .parasect
	ifequal 15, .gligar
	ifequal 16, .toxicroak
	ifequal 17, .murkrow
	ifequal 18, .ditto
	ifequal 19, .slowpoke
	ifequal 20, .ponyta
	ifequal 21, .cyndaquil
	ifequal 22, .chikorita
	ifequal 23, .totodile
	ifequal 24, .elekid
	ifequal 25, .smoochum
	ifequal 26, .magby
	ifequal 27, .tyrogue
	ifequal 28, .chansey

.noswarm
	setflag ENGINE_SWARM
	farwritetext NoSwarmTodayText
	waitbutton
	closetext
	sjump .endswarmchannel

.yanma
	setflag ENGINE_SWARM
	swarm ROUTE_39
	getlandmarkname STRING_BUFFER_5, ROUTE_39
	getmonname STRING_BUFFER_3, YANMA
	farwritetext RouteSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.dunsparce
	setflag ENGINE_SWARM
	swarm DARK_CAVE_NEW_ENTRANCE
	getlandmarkname STRING_BUFFER_5, DARK_CAVE
	getmonname STRING_BUFFER_3, DUNSPARCE
	farwritetext CaveSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.qwilfish
	checkflag ENGINE_FOGBADGE
	iffalse .SwarmReroll
	setflag ENGINE_SWARM
	setval FISHSWARM_QWILFISH
	special ActivateFishingSwarm
	getlandmarkname STRING_BUFFER_5, WILD_AREA_OUTSIDE
	getmonname STRING_BUFFER_3, QWILFISH
	farwritetext CaveSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.eevee
	checkflag ENGINE_FOGBADGE
	iffalse .SwarmReroll
	setflag ENGINE_SWARM
	swarm WILD_AREA_2_3
	getlandmarkname STRING_BUFFER_5, WILD_AREA_OUTSIDE
	getmonname STRING_BUFFER_3, EEVEE
	farwritetext CaveSwarmVowelText
	waitbutton
	closetext
	sjump .endswarmchannel

.kangaskhan
	checkflag ENGINE_FOGBADGE
	iffalse .SwarmReroll
	setflag ENGINE_SWARM
	swarm WILD_AREA_CAVE
	getlandmarkname STRING_BUFFER_5, WILD_AREA_OUTSIDE
	getmonname STRING_BUFFER_3, KANGASKHAN
	farwritetext CaveSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.gible
	checkflag ENGINE_FOGBADGE
	iffalse .SwarmReroll
	setflag ENGINE_SWARM
	swarm WILD_AREA_4
	getlandmarkname STRING_BUFFER_5, WILD_AREA_OUTSIDE
	getmonname STRING_BUFFER_3, GIBLE
	farwritetext CaveSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.sneasel
	setflag ENGINE_SWARM
	swarm ICE_PATH_B1F
	getlandmarkname STRING_BUFFER_5, ICE_PATH
	getmonname STRING_BUFFER_3, SNEASEL
	farwritetext CaveSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.smoochum
	setflag ENGINE_ALT_SWARM
	setflag ENGINE_SWARM
	swarm ICE_PATH_B1F
	getlandmarkname STRING_BUFFER_5, ICE_PATH
	getmonname STRING_BUFFER_3, SMOOCHUM
	farwritetext CaveSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.misdreavus
	checkflag ENGINE_FOGBADGE
	iffalse .SwarmReroll
	setflag ENGINE_SWARM
	swarm BURNED_TOWER_1F
	getlandmarkname STRING_BUFFER_5, BURNED_TOWER
	getmonname STRING_BUFFER_3, MISDREAVUS
	farwritetext CaveSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.magby
	checkflag ENGINE_FOGBADGE
	iffalse .SwarmReroll
	setflag ENGINE_ALT_SWARM
	setflag ENGINE_SWARM
	swarm BURNED_TOWER_1F
	getlandmarkname STRING_BUFFER_5, BURNED_TOWER
	getmonname STRING_BUFFER_3, MAGBY
	farwritetext CaveSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.scyther
	setflag ENGINE_SWARM
	swarm ROUTE_38
	getlandmarkname STRING_BUFFER_5, ROUTE_38
	getmonname STRING_BUFFER_3, SCYTHER
	farwritetext RouteSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.pinsir
	checkflag ENGINE_MINERALBADGE
	iffalse .SwarmReroll
	setflag ENGINE_SWARM
	swarm NATIONAL_PARK
	farwritetext PinsirSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.aron
	setflag ENGINE_SWARM
	swarm MOUNT_MORTAR_1F_OUTSIDE
	getlandmarkname STRING_BUFFER_5, MT_MORTAR
	getmonname STRING_BUFFER_3, ARON
	farwritetext CaveSwarmVowelText
	waitbutton
	closetext
	sjump .endswarmchannel

.tyrogue
	setflag ENGINE_ALT_SWARM
	setflag ENGINE_SWARM
	swarm MOUNT_MORTAR_1F_OUTSIDE
	getlandmarkname STRING_BUFFER_5, MT_MORTAR
	getmonname STRING_BUFFER_3, TYROGUE
	farwritetext CaveSwarmVowelText
	waitbutton
	closetext
	sjump .endswarmchannel

.ralts
	setflag ENGINE_SWARM
	swarm ROUTE_43
	getlandmarkname STRING_BUFFER_5, ROUTE_43
	getmonname STRING_BUFFER_3, RALTS
	farwritetext RouteSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.kotora
	setflag ENGINE_SWARM
	swarm LAKE_OF_RAGE
	farwritetext LakeOfRageSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.parasect
	checkflag ENGINE_HIVEBADGE
	iffalse .SwarmReroll
	setflag ENGINE_SWARM
	swarm ILEX_FOREST
	getlandmarkname STRING_BUFFER_5, ILEX_FOREST
	getmonname STRING_BUFFER_3, PARASECT
	farwritetext CaveSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.gligar
	checkflag ENGINE_HIVEBADGE
	iffalse .SwarmReroll
	setflag ENGINE_SWARM
	swarm UNION_CAVE_1F
	getlandmarkname STRING_BUFFER_5, UNION_CAVE
	getmonname STRING_BUFFER_3, GLIGAR
	farwritetext CaveSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.toxicroak
	checkflag ENGINE_HIVEBADGE
	iffalse .SwarmReroll
	setflag ENGINE_SWARM
	swarm ROUTE_32
	getlandmarkname STRING_BUFFER_5, ROUTE_32
	getmonname STRING_BUFFER_3, TOXICROAK
	farwritetext RouteSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.murkrow
	setflag ENGINE_SWARM
	swarm ROUTE_37
	getlandmarkname STRING_BUFFER_5, ROUTE_37
	getmonname STRING_BUFFER_3, MURKROW
	farwritetext RouteSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.ditto
	checkflag ENGINE_MINERALBADGE
	iffalse .SwarmReroll
	setflag ENGINE_SWARM
	swarm ROUTE_35
	getlandmarkname STRING_BUFFER_5, ROUTE_35
	getmonname STRING_BUFFER_3, DITTO
	farwritetext RouteSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.slowpoke
	setflag ENGINE_SWARM
	swarm ROUTE_44
	getlandmarkname STRING_BUFFER_5, ROUTE_44
	getmonname STRING_BUFFER_3, SLOWPOKE
	farwritetext RouteSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.ponyta
	setflag ENGINE_SWARM
	swarm ROUTE_42
	getlandmarkname STRING_BUFFER_5, ROUTE_42
	getmonname STRING_BUFFER_3, PONYTA
	farwritetext RouteSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.elekid
	setflag ENGINE_ALT_SWARM
	setflag ENGINE_SWARM
	swarm ROUTE_42
	getlandmarkname STRING_BUFFER_5, ROUTE_42
	getmonname STRING_BUFFER_3, ELEKID
	farwritetext RouteSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.cyndaquil
	setflag ENGINE_ALT_SWARM
	setflag ENGINE_SWARM
	swarm DARK_CAVE_NEW_ENTRANCE
	getlandmarkname STRING_BUFFER_5, DARK_CAVE
	getmonname STRING_BUFFER_3, CYNDAQUIL
	farwritetext CaveSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.chikorita
	setflag ENGINE_ALT_SWARM
	setflag ENGINE_SWARM
	swarm ROUTE_44
	getlandmarkname STRING_BUFFER_5, ROUTE_44
	getmonname STRING_BUFFER_3, CHIKORITA
	farwritetext RouteSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.totodile
	setflag ENGINE_ALT_SWARM
	setflag ENGINE_SWARM
	swarm ROUTE_43
	getlandmarkname STRING_BUFFER_5, ROUTE_43
	getmonname STRING_BUFFER_3, TOTODILE
	farwritetext RouteSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.chansey
	checkflag ENGINE_RISINGBADGE
	iffalse, .SwarmReroll
	setflag ENGINE_SWARM
	swarm ROUTE_47
	getlandmarkname STRING_BUFFER_5, ROUTE_47
	getmonname STRING_BUFFER_3, CHANSEY
	farwritetext RouteSwarmText
	waitbutton
	closetext
	sjump .endswarmchannel

.skiprandomswarm
	farwritetext ThatsAllFolksText
	waitbutton
	closetext
	sjump .endswarmchannel

.endswarmchannel
	special FadeOutMusic
	pause 15
	special RestartMapMusic
	end

GymStatue5Script:
	getcurlandmarkname STRING_BUFFER_3
	opentext
	farwritetext GymStatue_CityGymText
	buttonsound
	farwritetext GymStatue_WinningTrainers5Text
	waitbutton
	closetext
	end
