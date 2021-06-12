BugContestantPointers:
; there are NUM_BUG_CONTESTANTS + 1 entries
	dw BugContestant_BugCatcherDon ; this reverts back to the player
	dw BugContestant_BugCatcherDon
	dw BugContestant_BugCatcherEd
	dw BugContestant_CooltrainerMNick
	dw BugContestant_PokefanMWilliam
	dw BugContestant_BugCatcherElmer
	dw BugContestant_CamperBarry
	dw BugContestant_PicnickerCindy
	dw BugContestant_BugCatcherBuzzy
	dw BugContestant_YoungsterSamuel
	dw BugContestant_SchoolboyPierce

; contestant format:
;   db class, id
;   dw 1st-place mon, score
;   dw 2nd-place mon, score
;   dw 3rd-place mon, score

BugContestant_BugCatcherDon:
	db BUG_CATCHER, ANTON
	dw KAKUNA,     300
	dw METAPOD,    285
	dw CATERPIE,   226

BugContestant_BugCatcherEd:
	db BUG_CATCHER, STEVIE
	dw BUTTERFREE, 286
	dw BUTTERFREE, 251
	dw CATERPIE,   237

BugContestant_CooltrainerMNick:
	db COOLTRAINERM, FABIO
	dw SCYTHER,    357
	dw BUTTERFREE, 349
	dw PINSIR,     368

BugContestant_PokefanMWilliam:
	db POKEFANM, BERNARD
	dw PINSIR,     332
	dw BUTTERFREE, 324
	dw VENONAT,    321

BugContestant_BugCatcherElmer:
	db BUG_CATCHER, ELMER
	dw BUTTERFREE, 318
	dw WEEDLE,     295
	dw CATERPIE,   285

BugContestant_CamperBarry:
	db CAMPER, CAMPER_GARRET
	dw PINSIR,     366
	dw VENONAT,    329
	dw KAKUNA,     314

BugContestant_PicnickerCindy:
	db PICNICKER, HAYLEE
	dw BUTTERFREE, 341
	dw METAPOD,    301
	dw CATERPIE,   264

BugContestant_BugCatcherBuzzy:
	db BUG_CATCHER, BUZZY
	dw SCYTHER,    326
	dw BUTTERFREE, 292
	dw METAPOD,    282

BugContestant_YoungsterSamuel:
	db YOUNGSTER, TIMMY
	dw WEEDLE,     270
	dw PINSIR,     282
	dw CATERPIE,   251

BugContestant_SchoolboyPierce:
	db SCHOOLBOY, PIERCE
	dw VENONAT,    267
	dw PARAS,      254
	dw KAKUNA,     259
