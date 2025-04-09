JackPhoneTips:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0900:
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0908:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0910:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0918:
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0920:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0928:
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0930:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0938:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0940:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0948:
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0950:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0958:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0960:
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0968:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0970:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0978:
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa0980:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0988:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0990:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa0998:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa09a0:
	sjump PhoneScript_HangupText_Female

VanceLookingForward:
	sjump PhoneScript_HangupText_Male

WiltonHaventFoundAnything:
	sjump PhoneScript_HangupText_Male

ParryBattleWithMe:
	sjump PhoneScript_HangupText_Male

ErinWorkingHardScript:
	sjump PhoneScript_HangupText_Female

UnknownScript_0xa09c8:
	random 3
	ifequal 0, UnknownScript_0xa09d6
	ifequal 1, UnknownScript_0xa09de
	ifequal 2, UnknownScript_0xa09e6

UnknownScript_0xa09d6:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa09de:
	sjump PhoneScript_HangupText_Male

UnknownScript_0xa09e6:
	sjump PhoneScript_HangupText_Male

KenjiAnswerPhoneScript:
	readvar VAR_KENJI_BREAK
	ifequal 2, .Training
	ifequal 1, .OnBreak
	sjump PhoneScript_HangupText_Male

.Training:
	sjump PhoneScript_HangupText_Male

.OnBreak:
	checktime MORN
	iftrue .Morning
	checktime NITE
	iftrue .Night
	setevent EVENT_KENJI_ON_BREAK
	sjump PhoneScript_HangupText_Male

.Morning:
	sjump PhoneScript_HangupText_Male

.Night:
	sjump PhoneScript_HangupText_Male
