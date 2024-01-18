PhoneScript_Random2:
	random 2
	end

PhoneScript_Random3:
	random 3
	end

PhoneScript_Random4:
	random 4
	end

PhoneScript_Random5:
	random 5
	end

PhoneScript_Random11:
	random 11
	end

PhoneScript_AnswerPhone_Male:
	checktime DAY
	iftrue PhoneScript_AnswerPhone_Male_Day
	checktime NITE
	iftrue PhoneScript_AnswerPhone_Male_Nite
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
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_AnswerPhone_Male_Day:
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
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_AnswerPhone_Male_Nite:
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
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_AnswerPhone_Female:
	checktime DAY
	iftrue PhoneScript_AnswerPhone_Female_Day
	checktime NITE
	iftrue PhoneScript_AnswerPhone_Female_Nite
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_AnswerPhone_Female_Day:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_AnswerPhone_Female_Nite:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_GreetPhone_Male:
	checktime DAY
	iftrue PhoneScript_GreetPhone_Male_Day
	checktime NITE
	iftrue PhoneScript_GreetPhone_Male_Nite
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
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_GreetPhone_Male_Day:
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
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_GreetPhone_Male_Nite:
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
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_GreetPhone_Female:
	checktime DAY
	iftrue PhoneScript_GreetPhone_Female_Day
	checktime NITE
	iftrue PhoneScript_GreetPhone_Female_Nite
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_GreetPhone_Female_Day:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_GreetPhone_Female_Nite:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_Generic_Male:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Unknown:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_Generic_Female:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

PhoneScript_MonFlavorText:
	special RandomPhoneMon
	farscall PhoneScript_Random2
	ifequal $0, .TooEnergetic
	farwritetext UnknownText_0x1b659d
	buttonsound
	farsjump PhoneScript_HangupText_Male

.TooEnergetic:
	farsjump .unnecessary

.unnecessary
	farwritetext UnknownText_0x1b659d
	buttonsound
	farsjump PhoneScript_HangupText_Male

GrandmaString: db "Grandma@"
GrandpaString: db "Grandpa@"
MomString: db "Mom@"
DadString: db "Dad@"
SisterString: db "Sister@"
BrotherString: db "Brother@"
