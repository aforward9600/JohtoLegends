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

.Jack:
	end

PhoneScript_AnswerPhone_Male_Day:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack

.Jack:
	end

PhoneScript_AnswerPhone_Male_Nite:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack

.Jack:
	end

PhoneScript_AnswerPhone_Female:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly

.Beverly:
	end

PhoneScript_AnswerPhone_Female_Day:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly

.Beverly:
	end

PhoneScript_AnswerPhone_Female_Nite:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly

.Beverly:
	end

PhoneScript_GreetPhone_Male:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack

.Jack:
	end

PhoneScript_GreetPhone_Male_Day:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack

.Jack:
	end

PhoneScript_GreetPhone_Male_Nite:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack

.Jack:
	end

PhoneScript_GreetPhone_Female:
	checktime DAY
	iftrue PhoneScript_GreetPhone_Female_Day
	checktime NITE
	iftrue PhoneScript_GreetPhone_Female_Nite
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly

.Beverly:
	end

PhoneScript_GreetPhone_Female_Day:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly

.Beverly:
	end

PhoneScript_GreetPhone_Female_Nite:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly

.Beverly:
	end

PhoneScript_Generic_Male:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack

.Jack:
	end

PhoneScript_Generic_Female:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly

.Beverly:
	end

PhoneScript_MonFlavorText:
	special RandomPhoneMon
	farscall PhoneScript_Random2
	ifequal $0, .TooEnergetic
	farsjump PhoneScript_HangupText_Male

.TooEnergetic:
	farsjump .unnecessary

.unnecessary
	farsjump PhoneScript_HangupText_Male

GrandmaString: db "Grandma@"
GrandpaString: db "Grandpa@"
MomString: db "Mom@"
DadString: db "Dad@"
SisterString: db "Sister@"
BrotherString: db "Brother@"
