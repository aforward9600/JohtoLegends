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
