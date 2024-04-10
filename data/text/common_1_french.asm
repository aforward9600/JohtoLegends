_FruitBearingTreeText::
	text "C'est un arbre à"
	line "fruits."
	done

_HeyItsFruitText::
	text "Hé! C'est un(e)"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text "Obtenu:"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "Mais le Sac"
	line "est plein..."
	done

_NothingHereText::
	text "Il n'y a rien"
	line "ici..."
	done

_WhichApricornText::
	text "Which Apricorn"
	line "should I use?"
	done

_HowManyShouldIMakeText::
	text "How many should I"
	line "make?"
	done

_RecoveredSomeHPText::
	text_ram wStringBuffer1
	text_start
	line "regagne @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "PV!"
	done

_CuredOfPoisonText::
	text_ram wStringBuffer1
	text " n'est"
	line "plus empoisonné."
	done

_RidOfParalysisText::
	text_ram wStringBuffer1
	text " n'est"
	line "plus paralysé."
	done

_BurnWasHealedText::
	text_ram wStringBuffer1
	text_start
	line "ne brûle plus."
	done

_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "n'est plus gelé."
	done

_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "se réveille."
	done

_HealthReturnedText::
	text_ram wStringBuffer1
	text " regagne"
	line "son énergie."
	done

_RevitalizedText::
	text_ram wStringBuffer1
	text " est"
	line "revitalisé."
	done

_GrewToLevelText::
	text_ram wStringBuffer1
	text " monte"
	line "au niveau @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_waitbutton
	text_end

	text_end ; unused

_CameToItsSensesText::
	text_ram wStringBuffer1
	text " revient"
	line "à lui."
	done

_EnterNewPasscodeText::
	text "Entrez un nombre"
	line "à 4 chiffres."
	done

_ConfirmPasscodeText::
	text "Entrez le même No."
	line "pour confirmation."
	done

_PasscodesNotSameText::
	text "Ce n'est pas le"
	line "même numéro."
	done

_PasscodeSetText:: ; unreferenced
	text "Your PASSCODE has"
	line "been set."

	para "Enter this number"
	line "next time to open"
	cont "the CARD FOLDER."

	para ""
	done

_FourZerosInvalidText:: ; unreferenced
	text "0000 is invalid!"

	para ""
	done

_EnterPasscodeText:: ; unreferenced
	text "Enter the CARD"
	next "FOLDER PASSCODE."
	done

_IncorrectPasscodeText:: ; unreferenced
	text "Incorrect"
	line "PASSCODE!"

	para ""
	done

_CardFolderOpenText:: ; unreferenced
	text "CARD FOLDER open.@"
	text_end

_OakTimeText1::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz...Hm? Quoi...?"
	line "Tu m'as réveillé!"

	para "Mais quelle heure"
	line "est-il?"
	prompt

_OakTimeText2::
	text "Quelle heure"
	line "est-il?"
	done

_OakTimeText3::
	text "Quoi?@"
	text_end

_OakTimeText4::
	text "?"
	done

_OakTimeText5::
	text "Combien de"
	line "minutes?"
	done

_OakTimeText6::
	text "Whoa!@"
	text_end

_OakTimeText7::
	text "?"
	done

_OakTimeText8::
	text "!"
	line "J'suis en retard!"
	done

_OakTimeText11::
	text "!"
	line "Non! J'suis en"
	cont "retard!"
	done

_OakTimeText12::
	text "!"
	line "C'est normal qu'il"
	cont "fasse nuit!"
	done

_OakTimeNappedText::
	text "!"
	line "I napped for"
	cont "too long!"
	done

_OakTimeText13::
	text "Quel jour?"
	done

_OakTimeText14::
	text "?"
	done

UnknownText_0x1bc384:: ; unreferenced
	text "There is nothing"
	line "connected."
	done

UnknownText_0x1bc3a1:: ; unreferenced
	text "Check cell phone"
	line "adapter."
	done

UnknownText_0x1bc3bc:: ; unreferenced
	text "Check CDMA"
	line "adapter."
	done

UnknownText_0x1bc3d1:: ; unreferenced
	text "Check DOCOMO PHS"
	line "adapter."
	done

UnknownText_0x1bc3ec:: ; unreferenced
	text "Check DDI PHS"
	line "adapter."
	done

UnknownText_0x1bc404:: ; unreferenced
	text "Check unlimited"
	line "battle mobile"
	cont "adapter."
	done

UnknownText_0x1bc42c:: ; unreferenced
	text "The password is:"
	line ""
	done

UnknownText_0x1bc43f:: ; unreferenced
	text "Is this OK?"
	done

UnknownText_0x1bc44c:: ; unreferenced
	text "Enter the"
	line "ID no."
	done

UnknownText_0x1bc45e:: ; unreferenced
	text "Enter the"
	line "amount."
	done

_NothingToChooseText::
	text "Il n'y a rien"
	line "à choisir."
	prompt

_WhichSidePutOnText::
	text "Mettre de quel"
	line "côté?"
	done

_WhichSidePutAwayText::
	text "Ranger de quel"
	line "côté?"
	done

_PutAwayTheDecoText::
	text "Rangé:"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_NothingToPutAwayText::
	text "Il n'y a rien"
	line "à ranger."
	prompt

_SetUpTheDecoText::
	text "Installé:"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PutAwayAndSetUpText::
	text "Rangé:"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "et installé:"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

_AlreadySetUpText::
	text "C'est déjà"
	line "installé."
	prompt

_LookTownMapText::
	text "C'est la Carte."
	done

_LookPikachuPosterText::
	text "C'est un poster du"
	line "mignon Pikachu."
	done

_LookClefairyPosterText::
	text "C'est un poster du"
	line "mignon Mélofée."
	done

_LookJigglypuffPosterText::
	text "C'est un poster du"
	line "mignon Rondoudou."
	done

_LookAdorableDecoText::
	text "Un(e) superbe"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

_PlayedTheConsoleText::
	text "You played the"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "…Okay, time to go!"
	done

_LookGiantDecoText::
	text "Une poupée géante!"
	line "C'est super doux."
	done

_MomShoppingText1:: ; unreferenced
	text "Hi, <PLAYER>!"
	line "How are you?"
	prompt

_MomShoppingText2:: ; unreferenced
	text "I found a useful"
	line "item shopping, so"
	prompt

_MomShoppingText3:: ; unreferenced
	text "I bought it with"
	line "your money. Sorry!"
	prompt

_MomShoppingText4:: ; unreferenced
	text "It's in your PC."
	line "You'll like it!"
	done

_MomShoppingText5:: ; unreferenced
	text "While shopping"
	line "today, I saw this"
	cont "adorable doll, so"
	prompt

_MomShoppingText6:: ; unreferenced
	text "It's in your room."
	line "You'll love it!"
	done

_TradingText1::
	text_ram wPlayerTrademonSpeciesName
	text " est"
	line "envoyé à @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TradingText2::
	text_start
	done

_TradingText3::
	text_ram wOTTrademonSenderName
	text " dit"
	line "adieu à"
	done

_TradingText4::
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText5::
	text "Prends soin de"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText6::
	text "Contre @"
	text_ram wPlayerTrademonSenderName
	text_start
	line "de @"
	text_ram wPlayerTrademonSpeciesName
	text ","
	done

_TradingText7::
	text_ram wOTTrademonSenderName
	text " envoie"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText8::
	text_ram wOTTrademonSenderName
	text " va échan-"
	line "ger @"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unused

_TradingText9::
	text "contre @"
	text_ram wPlayerTrademonSenderName
	text_start
	line "de @"
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

_TradingText10::
	text_ram wPlayerTrademonSenderName
	text " va échan-"
	line "ger @"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unused

_TradingText11:: ; unreferenced
	text "for @"
	text_ram wOTTrademonSenderName
	text "'s"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText12:: ; unreferenced
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

_TradingText13:: ; unreferenced
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText14:: ; unreferenced
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

_TradingText15:: ; unreferenced
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText16:: ; unreferenced
	text_ram wOTTrademonSpeciesName
	text " came"
	line "back!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "Lula: Chronique"
	done

_OPT_IntroText2::
	text_start
	line "Du Prof.Chen!"
	done

_OPT_IntroText3::
	text_start
	line "Avec moi, Lula!"
	done

_OPT_OakText1::
	text_start
	line "Chen: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unused

_OPT_OakText2::
	text_start
	line "est près de:"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "Lula: @"
	text_ram wStringBuffer1
	done

OPT_SweetAdorably::
	text_start
	line "est adorable et"
	done

OPT_WigglySlickly::
	text_start
	line "est mou et"
	done

OPT_AptlyNamed::
	text_start
	line "bien nommé et"
	done

OPT_UndeniablyKindOf::
	text_start
	line "est vraiment"
	done

OPT_Unbearably::
	text_start
	line "est très"
	done

OPT_WowImpressively::
	text_start
	line "est super"
	done

OPT_AlmostPoisonously::
	text_start
	line "est toxique et"
	done

OPT_Sensually::
	text_start
	line "est sensuel et"
	done

OPT_Mischievously::
	text_start
	line "est vicieux et"
	done

OPT_Topically::
	text_start
	line "est célèbre et"
	done

OPT_Addictively::
	text_start
	line "est très"
	done

OPT_LooksInWater::
	text_start
	line "dans l'eau est"
	done

OPT_EvolutionMustBe::
	text_start
	line "évolué est"
	done

OPT_Provocatively::
	text_start
	line "est provoquant et"
	done

OPT_FlippedOut::
	text_start
	line "est fou et"
	done

OPT_HeartMeltingly::
	text_start
	line "est tellement"
	done

OPT_Cute::
	text_start
	line "mignon."
	done

OPT_Weird::
	text_start
	line "bizarre."
	done

OPT_Pleasant::
	text_start
	line "agréable."
	done

OPT_BoldSortOf::
	text_start
	line "courageux."
	done

OPT_Frightening::
	text_start
	line "effrayant."
	done

OPT_SuaveDebonair::
	text_start
	line "rapide!"
	done

OPT_Powerful::
	text_start
	line "puissant."
	done

OPT_Exciting::
	text_start
	line "vigoureux."
	done

OPT_Groovy::
	text_start
	line "cool!"
	done

OPT_Inspiring::
	text_start
	line "exaltant."
	done

OPT_Friendly::
	text_start
	line "amical."
	done

OPT_HotHotHot::
	text_start
	line "chaud!"
	done

OPT_Stimulating::
	text_start
	line "stimulant."
	done

OPT_Guarded::
	text_start
	line "protégé."
	done

OPT_Lovely::
	text_start
	line "gracieux."
	done

OPT_Speedy::
	text_start
	line "rapide."
	done

_OPT_PokemonChannelText::
	text "#mon"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

; Pokémon Music Channel / Pokémusic

_BenIntroText1:: ; unreferenced
	text_start
	line "BEN: #mon MUSIC"
	done

_BenIntroText2:: ; unreferenced
	text_start
	line "CHANNEL!"
	done

_BenIntroText3:: ; unreferenced
	text_start
	line "It's me, DJ BEN!"
	done

_FernIntroText1:: ; unreferenced
	text_start
	line "FERN: #MUSIC!"
	done

_FernIntroText2:: ; unreferenced
	text_start
	line "With DJ FERN!"
	done

_BenFernText1:: ; unreferenced
	text_start
	line "Today's @"
	text_today
	text ","
	done

_BenFernText2A:: ; unreferenced
	text_start
	line "so let us jam to"
	done

_BenFernText2B:: ; unreferenced
	text_start
	line "so chill out to"
	done

_BenFernText3A:: ; unreferenced
	text_start
	line "#mon March!"
	done

_BenFernText3B:: ; unreferenced
	text_start
	line "#mon Lullaby!"
	done

; Lucky Channel

_LC_Text1:: ; unreferenced
	text_start
	line "REED: Yeehaw! How"
	done

_LC_Text2:: ; unreferenced
	text_start
	line "y'all doin' now?"
	done

_LC_Text3:: ; unreferenced
	text_start
	line "Whether you're up"
	done

_LC_Text4:: ; unreferenced
	text_start
	line "or way down low,"
	done

_LC_Text5:: ; unreferenced
	text_start
	line "don't you miss the"
	done

_LC_Text6:: ; unreferenced
	text_start
	line "LUCKY NUMBER SHOW!"
	done

_LC_Text7:: ; unreferenced
	text_start
	line "This week's Lucky"
	done

_LC_Text8:: ; unreferenced
	text_start
	line "Number is @"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9:: ; unreferenced
	text_start
	line "I'll repeat that!"
	done

_LC_Text10:: ; unreferenced
	text_start
	line "Match it and go to"
	done

_LC_Text11:: ; unreferenced
	text_start
	line "the RADIO TOWER!"
	done

_LC_DragText1:: ; unreferenced
	text_start
	line "…Repeating myself"
	done

_LC_DragText2:: ; unreferenced
	text_start
	line "gets to be a drag…"
	done

; Places and People

_PnP_Text1:: ; unreferenced
	text_start
	line "PLACES AND PEOPLE!"
	done

_PnP_Text2:: ; unreferenced
	text_start
	line "Brought to you by"
	done

_PnP_Text3:: ; unreferenced
	text_start
	line "me, DJ LILY!"
	done

_PnP_Text4:: ; unreferenced
	text_start
	line "@"
	text_ram wStringBuffer2
	text " @"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

_PnP_cute:: ; unreferenced
	text_start
	line "is cute."
	done

_PnP_lazy:: ; unreferenced
	text_start
	line "is sort of lazy."
	done

_PnP_happy:: ; unreferenced
	text_start
	line "is always happy."
	done

_PnP_noisy:: ; unreferenced
	text_start
	line "is quite noisy."
	done

_PnP_precocious:: ; unreferenced
	text_start
	line "is precocious."
	done

_PnP_bold:: ; unreferenced
	text_start
	line "is somewhat bold."
	done

_PnP_picky:: ; unreferenced
	text_start
	line "is too picky!"
	done

_PnP_sortofok:: ; unreferenced
	text_start
	line "is sort of OK."
	done

_PnP_soso:: ; unreferenced
	text_start
	line "is just so-so."
	done

_PnP_great:: ; unreferenced
	text_start
	line "is actually great."
	done

_PnP_mytype:: ; unreferenced
	text_start
	line "is just my type."
	done

_PnP_cool:: ; unreferenced
	text_start
	line "is so cool, no?"
	done

_PnP_inspiring:: ; unreferenced
	text_start
	line "is inspiring!"
	done

_PnP_weird:: ; unreferenced
	text_start
	line "is kind of weird."
	done

_PnP_rightforme:: ; unreferenced
	text_start
	line "is right for me?"
	done

_PnP_odd:: ; unreferenced
	text_start
	line "is definitely odd!"
	done

_PnP_Text5:: ; unreferenced
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

_RocketRadioText1:: ; unreferenced
	text_start
	line "… …Ahem, we are"
	done

_RocketRadioText2:: ; unreferenced
	text_start
	line "TEAM ROCKET!"
	done

_RocketRadioText3:: ; unreferenced
	text_start
	line "After three years"
	done

_RocketRadioText4:: ; unreferenced
	text_start
	line "of preparation, we"
	done

_RocketRadioText5:: ; unreferenced
	text_start
	line "have risen again"
	done

_RocketRadioText6:: ; unreferenced
	text_start
	line "from the ashes!"
	done

_RocketRadioText7:: ; unreferenced
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Can you"
	done

_RocketRadioText8:: ; unreferenced
	text_start
	line "hear?@"
	text_pause
	text " We did it!"
	done

_RocketRadioText9:: ; unreferenced
	text_start
	line "@"
	text_pause
	text "Where is our boss?"
	done

_RocketRadioText10:: ; unreferenced
	text_start
	line "@"
	text_pause
	text "Is he listening?"
	done

_BuenaRadioText1:: ; unreferenced
	text_start
	line "BUENA: BUENA here!"
	done

_BuenaRadioText2:: ; unreferenced
	text_start
	line "Today's password!"
	done

_BuenaRadioText3:: ; unreferenced
	text_start
	line "Let me think… It's"
	done

_BuenaRadioText4:: ; unreferenced
	text_start
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_BuenaRadioText5:: ; unreferenced
	text_start
	line "Don't forget it!"
	done

_BuenaRadioText6:: ; unreferenced
	text_start
	line "I'm in GOLDENROD's"
	done

_BuenaRadioText7:: ; unreferenced
	text_start
	line "RADIO TOWER!"
	done

_BuenaRadioMidnightText1:: ; unreferenced
	text_start
	line "BUENA: Oh my…"
	done

_BuenaRadioMidnightText2:: ; unreferenced
	text_start
	line "It's midnight! I"
	done

_BuenaRadioMidnightText3:: ; unreferenced
	text_start
	line "have to shut down!"
	done

_BuenaRadioMidnightText4:: ; unreferenced
	text_start
	line "Thanks for tuning"
	done

_BuenaRadioMidnightText5:: ; unreferenced
	text_start
	line "in to the end! But"
	done

_BuenaRadioMidnightText6:: ; unreferenced
	text_start
	line "don't stay up too"
	done

_BuenaRadioMidnightText7:: ; unreferenced
	text_start
	line "late! Presented to"
	done

_BuenaRadioMidnightText8:: ; unreferenced
	text_start
	line "you by DJ BUENA!"
	done

_BuenaRadioMidnightText9:: ; unreferenced
	text "I'm outta here!"
	done

_BuenaRadioMidnightText10:: ; unreferenced
	text "…"
	done

_BuenaOffTheAirText:: ; unreferenced
	text_start
	line ""
	done

Text_EnemyWithdrew::
	text "<ENEMY>"
	line "retire"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

Text_EnemyUsedOn::
	text "<ENEMY>"
	line "utilise"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text " sur"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

Text_ThatCantBeUsedRightNow:: ; unreferenced
	text "That can't be used"
	line "right now."
	prompt

Text_ThatItemCantBePutInThePack:: ; unreferenced
	text "That item can't be"
	line "put in the PACK."
	done

Text_TheItemWasPutInThePack:: ; unreferenced
	text "The @"
	text_ram wStringBuffer1
	text_start
	line "was put in the"
	cont "PACK."
	done

Text_RemainingTime:: ; unreferenced
	text "Remaining Time"
	done

Text_YourMonsHPWasHealed:: ; unreferenced
	text "Your #mon's HP"
	line "was healed."
	prompt

Text_Warping:: ; unreferenced
	text "Warping…"
	done

UnknownText_0x1bd05e:: ; unreferenced
	text "Which number"
	line "should be changed?"
	done

UnknownText_0x1bd07f:: ; unreferenced
	text "Will you play with"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1bd09a:: ; unreferenced
	text "You need two #-"
	line "mon for breeding."
	prompt

Text_BreedingIsNotPossible:: ; unreferenced
	text "Breeding is not"
	line "possible."
	prompt

UnknownText_0x1bd0d8:: ; unreferenced
	text "The compatibility"
	line "is @"
	text_decimal wBreedingCompatibility, 1, 3
	text "."
	cont "Should they breed?"
	done

UnknownText_0x1bd109:: ; unreferenced
	text "There is no EGG."
	line ""
	prompt

UnknownText_0x1bd11c:: ; unreferenced
	text "It's going to"
	line "hatch!"
	prompt

UnknownText_0x1bd131:: ; unreferenced
	text "Test event"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

UnknownText_0x1bd145:: ; unreferenced
	text "Start!"
	done

UnknownText_0x1bd14d:: ; unreferenced
	text "End!"
	done

UnknownText_0x1bd153:: ; unreferenced
	text "For a boy!"
	done

UnknownText_0x1bd15f:: ; unreferenced
	text "For a girl!"
	done

UnknownText_0x1bd16c:: ; unreferenced
	text "This doesn't"
	line "concern a boy!"
	done

UnknownText_0x1bd188:: ; unreferenced
	text "The BOX is full!"
	done

UnknownText_0x1bd19a:: ; unreferenced
	text "A new CARD arrived"
	line "from @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1bd1ba:: ; unreferenced
	text "Put this CARD in"
	line "the CARD FOLDER?"
	done

UnknownText_0x1bd1dd:: ; unreferenced
	text_ram wStringBuffer2
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wStringBuffer1, 1, 2
	text "."
	prompt

UnknownText_0x1bd201:: ; unreferenced
	text "Starting link."
	done

UnknownText_0x1bd211:: ; unreferenced
	text "Link terminated."
	done

UnknownText_0x1bd223:: ; unreferenced
	text "Closing link."
	done

UnknownText_0x1bd232:: ; unreferenced
	text "Clear the time"
	line "limit?"
	done

UnknownText_0x1bd249:: ; unreferenced
	text "The time limit was"
	line "cleared."
	done

UnknownText_0x1bd266:: ; unreferenced
	text "Pick which packet"
	line "as an error?"
	done

UnknownText_0x1bd286::
	text "Exchange @"
	text_ram wStringBuffer2
	text_start
	line "contre @"
	text_ram wStringBuffer1
	text "…"
	done

UnknownText_0x1bd2a0:: ; unreferenced
	text "Obtained the"
	line "VOLTORBBADGE!"
	done

UnknownText_0x1bd2bc::
	text "Quel étage?"
	done

UnknownText_0x1bd2ca::
	text "Presentateur: BIP!"

	para "Temps écoulé!"
	done

UnknownText_0x1bd2e7::
	text "Presentateur: Le"
	line "councours est fini!"
	done

_RepelWoreOffText::
	text "Effet du Repousse"
	line "terminé."
	done

_UseAnotherRepelText::
	text "Effet du Repousse"
	line "terminé."

	para "Utiliser un autre?"
	done

_PlayerFoundItemText::
	text "<PLAYER> trouve"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ButNoSpaceText::
	text "Mais <PLAYER> n'z"
	line "pluse de place…"
	done

_JustSawSomeRareMonText::
	text "J'ai vu un"
	line "@"
	text_ram wStringBuffer1
	text " rare"
	cont "vers @"
	text_ram wStringBuffer2
	text "."

	para "Je t'appelle si je"
	line "vois un autre"
	cont "#mon rare, OK?"
	prompt

_SavingRecordText::
	text "Sauvengarde…"
	line "Ne pas eteindre!"
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " reçoit"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_waitbutton
	text_end

	text_end ; unused

_NoCoinsText::
	text "Vous n'avez pas de"
	line "jetons."
	prompt

_NoCoinCaseText::
	text "Vous n'avez pas de"
	line "Boite Jeton."
	prompt

UnknownText_0x1bd407::
	text "OK, connectez le"
	line "Câble Game Link."
	prompt

UnknownText_0x1bd429::
	text "<PLAYER> échange"
	line "@"
	text_ram wMonOrItemNameBuffer
	text " contre"
	cont "@"
	text_ram wStringBuffer2
	text ".@"
	text_end

UnknownText_0x1bd445::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unused

_NPCTradeIntroText1::
	text "Je collectionne"
	line "les #mon. As-tu"
	cont "@"
	text_ram wStringBuffer1
	text "?"

	para "Tu veux l'échanger"
	line "contre @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText1::
	text "Pas d'échange?"
	line "Maiiiiiis!!!"
	done

_NPCTradeWrongText1::
	text "Hein? C'est pas"
	line "@"
	text_ram wStringBuffer1
	text ". "
	cont "Tu plaisantes…?"
	done

_NPCTradeCompleteText1::
	text "Ouais! J'ai un"
	line "@"
	text_ram wStringBuffer1
	text "!"
	cont "Cool!"
	done

_NPCTradeAFterText1::
	text "Comment va mon"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeIntroText2::
	text "Salut! Je cherche"
	line "ce #mon."

	para "Si tu as"
	line "@"
	text_ram wStringBuffer1
	text ","

	para "peux-tu l'échanger"
	line "contre @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText2::
	text "T'en as pas non"
	line "plus?"

	para "Pfff…"
	line "Et zut…"
	done

_NPCTradeWrongText2::
	text "Tu n'as pas"
	line "@"
	text_ram wStringBuffer1
	text "?"
	cont "C'est dommage."
	done

_NPCTradeCompleteText2::
	text "Cool! Merci!"

	para "J'ai enfin"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_NPCTradeAfterText2::
	text "Salut! @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "est en pleine for-"
	cont "me! Merci encore!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text " est"
	line "mignon mais je"

	para "l'ai pas. Toi t'as"
	line "@"
	text_ram wStringBuffer1
	text "?"

	para "Tu veux l'échanger"
	line "contre @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText3::
	text "Tu veux pas échan-"
	line "ger? Bah mince..."
	done

_NPCTradeWrongText3::
	text "C'est pas"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Amène-m'en un, par"
	line "pitié!!!"
	done

_NPCTradeCompleteText3::
	text "Woah! Merci!"
	line "Je voulais tant un"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

_NPCTradeAfterText3::
	text "Comment va mon"
	line "@"
	text_ram wStringBuffer2
	text "?"
	cont "Toujours la pêche?"

	para "Ton @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "est si mignon!"
	done

_NPCTradeCompleteText4::
	text "Bah alors?"
	done

_NPCTradeAfterText4::
	text "Echanger c'est"
	line "trop bizarre..."

	para "J'ai beaucoup à"
	line "apprendre."
	done

_MomLeavingText1:: ; unreferenced
	text "So, this is it."

	para "Your adventure"
	line "begins now."

	para "OK!"
	line "I'll help too."

	para "But what can I do"
	line "for you?"

	para "I know! I'll save"
	line "money for you."

	para "On a long journey,"
	line "money's important."

	para "Do you want me to"
	line "save your money?"
	done

_MomLeavingText2:: ; unreferenced
	text "OK, I'll take care"
	line "of your money."

	para "<……><……><……>"
	prompt

_MomLeavingText3:: ; unreferenced
	text "Be careful."

	para "#mon are your"
	line "friends. You need"
	cont "to work as a team."

	para "Now, go on!"
	done

_MomVisitingText1:: ; unreferenced
	text "Hi! Welcome home!"
	line "You're trying very"
	cont "hard, I see."

	para "I've kept your"
	line "room tidy."

	para "Or is this about"
	line "your money?"
	done

_MomVisitingText2:: ; unreferenced
	text "What do you want"
	line "to do?"
	done

_MomVisitingText3:: ; unreferenced
	text "How much do you"
	line "want to save?"
	done

_MomVisitingText4:: ; unreferenced
	text "How much do you"
	line "want to take?"
	done

_MomVisitingText5:: ; unreferenced
	text "Do you want to"
	line "save some money?"
	done

_MomVisitingText6:: ; unreferenced
	text "You haven't saved"
	line "that much."
	prompt

_MomVisitingText7:: ; unreferenced
	text "You can't take"
	line "that much."
	prompt

_MomVisitingText8:: ; unreferenced
	text "You don't have"
	line "that much."
	prompt

_MomVisitingText9:: ; unreferenced
	text "You can't save"
	line "that much."
	prompt

_MomVisitingText10:: ; unreferenced
	text "OK, I'll save your"
	line "money. Trust me!"

	para "<PLAYER>, stick"
	line "with it!"
	done

_MomVisitingText11:: ; unreferenced
	text "Your money's safe"
	line "here! Get going!"
	done

_MomVisitingText12:: ; unreferenced
	text "<PLAYER>, don't"
	line "give up!"
	done

_MomVisitingText13:: ; unreferenced
	text "Just do what"
	line "you can."
	done

_DaycareDummyText:: ; unreferenced
	text_start
	done

_DayCareManIntroText::
	text "Je m'occupe de la"
	line "Pension. Veux-tu"
	cont "que j'entraîne un"
	cont "#mon?"
	done

_DayCareManOddEggText::
	text "Je m'occupe de la"
	line "Pension. Connais-"
	cont "tu les Oeufs?"

	para "J'élevais des"
	line "#mon avec"
	cont "ma femme et..."

	para "Surprise! On a"
	line "trouvé un Oeuf!"

	para "C'est super dingue"
	line "comme truc!"

	para "Alors tu veux que"
	line "j'entraîne un"
	cont "#mon?"
	done

_DayCareLadyIntroText::
	text "Je suis la femme"
	line "du type qui"
	cont "s'occupe de la"
	cont "Pension."

	para "Veux-tu que"
	line "j'entraîne un"
	cont "#mon?"
	done

_DayCareLadyOddEggText::
	text "Je suis la femme"
	line "du type qui"
	cont "s'occupe de la"
	cont "Pension. Connais-"
	cont "tu les Oeufs?"

	para "J'élevais des"
	line "#mon avec"
	cont "mon mari et..."

	para "Surprise! On a"
	line "trouvé un Oeuf!"

	para "C'est super dingue"
	line "comme truc!"

	para "Alors tu veux que"
	line "j'entraîne un"
	cont "#mon?"
	done

_WhatShouldIRaiseText::
	text "Qui veux-tu que"
	line "j'entraîne?"
	prompt

_OnlyOneMonText::
	text "Oh? Mais tu n'as"
	line "qu'un #mon."
	prompt

_CantRaiseEggText::
	text "Ah...Je n'accepte"
	line "pas les Oeufs."
	prompt

_RemoveMailText::
	text "Enlève les Lettres"
	line "avant de me voir."
	prompt

_LastHealthyMonText::
	text "Si tu me le donnes"
	line "qui va combattre"
	cont "pour toi?"
	prompt

_IllRaiseYourMonText::
	text "Entendu. Je vais"
	line "entraîner ton"
	text_ram wStringBuffer1
	text "."
	prompt

_ComeBackLaterText::
	text "Reviens le prendre"
	line "plus tard."
	done

_AreWeGeniusesText::
	text "On est trop bon!"
	line "Tu veux voir"
	cont "ton @"
	text_ram wStringBuffer1
	text "?"
	done

_YourMonHasGrownText::
	text "Ton @"
	text_ram wStringBuffer1
	text_start
	line "a bein grandi."

	para "Il a gagné"
	line "@"
	text_decimal wStringBuffer2 + 1, 1, 3
	text "niveau(x)."

	para "Si tu veux récupé-"
	line "rer ton #MON,"
	cont "tu dois payer"
	cont "@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "¥."
	done

_PerfectHeresYourMonText::
	text "Parfait! Voilà"
	line "ton #mon."
	prompt

_GotBackMonText::
	text "<PLAYER> récupère"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BackAlreadyText::
	text "Hein? Déjà?"
	line "Ton @"
	text_ram wStringBuffer1
	text_start
	para "a besoin de plus"
	line "de temps! Pour"

	para "récupérer ton"
	line "#mon, tu dois"
	cont "payer 100¥."
	done

_HaveNoRoomText::
	text "Tu n'as pas de"
	line "place."
	prompt

_DCNotEnoughMoneyText::
	text "Tu n'as pas assez"
	line "d'argent."
	prompt

_OhFineThenText::
	text "Très bien."
	prompt

_ComeAgainText::
	text "A bientôt."
	done

_NotYetText::
	text "Pas encore…"
	done

_FoundAnEggText::
	text "Ah, c'est toi!"

	para "On entraînait ton"
	line "#mon, et..."
	cont "Surprise totale!"

	para "Ton #mon a"
	line "pondu un Oeuf!"

	para "On sait pas trop"
	line "comment mais..."

	para "Il est là en tout"
	line "cas. Tu le veux?"
	done

_ReceivedEggText::
	text "<PLAYER> reçoit"
	line "l'OEUF!"
	done

_TakeGoodCareOfEggText::
	text "Prends-en soin!"
	done

_RefuseEggText::
	text "Bon ben..."
	line "J'le garde. Merci!"
	done

_NoRoomForEggText::
	text "Tu n'as pas de"
	line "place dans ton"
	cont "équipe..."
	done

_WhichMonPhotoText::
	text "Quel #mon"
	line "dois-je photogra-"
	cont "phier?"
	prompt

_HoldOnText::
	text "Parfait. Parfait."
	line "On ne bouge plus."
	prompt

_PrestoAllDoneText::
	text "Fini! Terminé!"
	line "A bientôt!"
	done
