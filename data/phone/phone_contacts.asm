phone: MACRO
; trainer class, trainer id, map, callee time, callee script, caller time, caller script
	db \1, \2
	map_id \3
	db \4
	dba \5
	db \6
	dba \7
ENDM

PhoneContacts:
; entries correspond to PHONE_* constants
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_MOM,      PLAYERS_HOUSE_1F,          ANYTIME, MomPhoneCalleeScript,     0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BIKESHOP, OAKS_LAB,                  0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BILL,     N_A,                       ANYTIME, BillPhoneCalleeScript,    0,       BillPhoneCallerScript
	phone TRAINER_NONE, PHONECONTACT_ELM,      ELMS_LAB,                  ANYTIME, ElmPhoneCalleeScript,     0,       ElmPhoneCallerScript
	phone SCHOOLBOY,    FINN,                  NATIONAL_PARK,             ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone POKEFANF,     BEVERLY1,              NATIONAL_PARK,             ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone SAILOR,       HUEY1,                 OLIVINE_LIGHTHOUSE_2F,     ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone COOLTRAINERF, BETH1,                 ROUTE_26,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone BIRD_KEEPER,  JOSE2,                 ROUTE_27,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone COOLTRAINERF, REENA1,                ROUTE_27,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone BUG_CATCHER,  WADE1,                 ROUTE_31,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone FISHER,       RALPH1,                ROUTE_32,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone PICNICKER,    HAYLEE,                ROUTE_32,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone HIKER,        ANTHONY2,              ROUTE_33,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone CAMPER,       TODD1,                 ROUTE_34,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone PICNICKER,    GINA1,                 ROUTE_34,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone JUGGLER,      IRWIN1,                ROUTE_35,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone BUG_CATCHER,  ARNIE1,                ROUTE_35,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone SCHOOLBOY,    ALAN1,                 ROUTE_36,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone SCHOOLBOY,    CHAD1,                 ROUTE_38,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone POKEFANM,     DEREK1,                ROUTE_39,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone FISHER,       FRED,                  ROUTE_42,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone POKEMANIAC,   BRENT1,                ROUTE_43,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone PICNICKER,    TIFFANY3,              ROUTE_43,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone BIRD_KEEPER,  SAL,                   ROUTE_44,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone FISHER,       LYLE1,                 ROUTE_44,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone BLACKBELT_T,  KENJI3,                ROUTE_45,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone HIKER,        PARRY1,                ROUTE_45,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone PICNICKER,    ERIN1,                 ROUTE_46,                  ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BUENA,    GOLDENROD_DEPT_STORE_ROOF, ANYTIME, UnusedPhoneScript,        ANYTIME, UnusedPhoneScript
