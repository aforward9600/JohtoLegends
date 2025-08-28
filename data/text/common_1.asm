_FruitBearingTreeText::
	text "It's a fruit-"
	line "bearing tree."
	done

_HeyItsFruitText::
	text "Hey! Found a"
	line "@"
	text_ram wStringBuffer3
	text ""
	para "tree!"
	done

_ObtainedFruitText::
	text "Obtained"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "But the Pack is"
	line "full…"
	done

_NothingHereText::
	text "There's nothing"
	line "here…"
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
	line "recovered @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "HP!"
	done

_CuredOfPoisonText::
	text_ram wStringBuffer1
	text "'s"
	line "cured of poison."
	done

_RidOfParalysisText::
	text_ram wStringBuffer1
	text "'s"
	line "rid of paralysis."
	done

_BurnWasHealedText::
	text_ram wStringBuffer1
	text "'s"
	line "burn was healed."
	done

_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "was defrosted."
	done

_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "woke up."
	done

_HealthReturnedText::
	text_ram wStringBuffer1
	text "'s"
	line "health returned."
	done

_RevitalizedText::
	text_ram wStringBuffer1
	text_start
	line "is revitalized."
	done

_GrewToLevelText::
	text_ram wStringBuffer1
	text " grew to"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_waitbutton
	text_end

_CameToItsSensesText::
	text_ram wStringBuffer1
	text " came"
	line "to its senses."
	done

_OakTimeText1::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz… Hm? Wha…?"
	line "You woke me up!"

	para "Will you check the"
	line "clock for me?"
	prompt

_OakTimeText2::
	text "What time is it?"
	done

_OakTimeText3::
	text "What?@"
	text_end

_OakTimeText4::
	text "?"
	done

_OakTimeText5::
	text "How many minutes?"
	done

_OakTimeText6::
	text "Whoa!@"
	text_end

_OakTimeText7::
	text "?"
	done

_OakTimeText8::
	text "!"
	line "I overslept!"
	done

_OakTimeText11::
	text "!"
	line "Yikes! I over-"
	cont "slept!"
	done

_OakTimeText12::
	text "!"
	line "No wonder it's so"
	cont "dark!"
	done

_OakTimeNappedText::
	text "!"
	line "I napped for"
	cont "too long!"
	done

_OakTimeText13::
	text "What day is it?"
	done

_OakTimeText14::
	text ", is it?"
	done

_NothingToChooseText::
	text "There's nothing to"
	line "choose."
	prompt

_WhichSidePutOnText::
	text "Which side do you"
	line "want to put it on?"
	done

_WhichSidePutAwayText::
	text "Which side do you"
	line "want to put away?"
	done

_PutAwayTheDecoText::
	text "Put away the"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_NothingToPutAwayText::
	text "There's nothing to"
	line "put away."
	prompt

_SetUpTheDecoText::
	text "Set up the"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PutAwayAndSetUpText::
	text "Put away the"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "and set up the"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

_AlreadySetUpText::
	text "That's already set"
	line "up."
	prompt

_LookTownMapText::
	text "It's the Town Map."
	done

_LookPikachuPosterText::
	text "It's a poster of a"
	line "cute Pikachu."
	done

_LookClefairyPosterText::
	text "It's a poster of a"
	line "cute Clefairy."
	done

_LookJigglypuffPosterText::
	text "It's a poster of a"
	line "cute Jigglypuff."
	done

_LookAdorableDecoText::
	text "It's an adorable"
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
	text "A giant doll! It's"
	line "fluffy and cuddly."
	done

_MomShoppingText1::
	text "Hi, <PLAYER>!"
	line "How are you?"
	prompt

_MomShoppingText2::
	text "I found a useful"
	line "item shopping, so"
	prompt

_MomShoppingText3::
	text "I bought it with"
	line "your money. Sorry!"
	prompt

_MomShoppingText4::
	text "It's in your PC."
	line "You'll like it!"
	done

_MomShoppingText5::
	text "While shopping"
	line "today, I saw this"
	cont "adorable doll, so"
	prompt

_MomShoppingText6::
	text "It's in your room."
	line "You'll love it!"
	done

_TradingText1::
	text_ram wPlayerTrademonSpeciesName
	text " was"
	line "sent to @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TradingText2::
	text_start
	done

_TradingText3::
	text_ram wOTTrademonSenderName
	text " bids"
	line "farewell to"
	done

_TradingText4::
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText5::
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText6::
	text "For @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text ","
	done

_TradingText7::
	text_ram wOTTrademonSenderName
	text " sends"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText8::
	text_ram wOTTrademonSenderName
	text " will"
	line "trade @"
	text_ram wOTTrademonSpeciesName
	text_end

_TradingText9::
	text "for @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

_TradingText10::
	text_ram wPlayerTrademonSenderName
	text " will"
	line "trade @"
	text_ram wPlayerTrademonSpeciesName
	text_end

_TradingText11::
	text "for @"
	text_ram wOTTrademonSenderName
	text "'s"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText12::
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

_TradingText13::
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText14::
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

_TradingText15::
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText16::
	text_ram wOTTrademonSpeciesName
	text " came"
	line "back!"
	done

; Oak's Pokémon Talk

_JunichiMasudaSoloText::
	text_start
	line "Junichi Masuda"
	done

_GoIchinoseText::
	text_start
	line "Go Ichinose"
	done

_OPT_OakText2::
	text_start
	line "Montsarules"
	done

_OPT_MaryText1::
	text_start
	line "Hitomi Sato"
	done

_TriteHexagonText::
	text_start
	line "TriteHexagon"
	done

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "Hajime Wakai"
	done

_BenIntroText2::
	text_start
	line "ShockSlayer"
	done

_BenIntroText3::
	text_start
	line "Go Ichinose"
	done

_FernIntroText1::
	text_start
	line "Junichi Masuda"
	done

_FernIntroText2::
	text_start
	line "Dannye"
	done

; Places and People

_PnP_Text1::
	text_start
	line "Hitomi Sato"
	done

_PnP_Text2::
	text_start
	line "Mmmmmm"
	done

_RocketRadioText1::
	text_start
	line "Junichi Masuda"
	done

_RocketRadioText2::
	text_start
	line "ryanisthebomb203"
	done

_RocketRadioText4::
	text_start
	line "Junichi Masuda"
	done

_RocketRadioText5::
	text_start
	line "Go Ichinose"
	done

_RocketRadioText6::
	text_start
	line "TriteHexagon"
	done

_RocketRadioText8::
	text_start
	line "Go Ichinose"
	done

_RocketRadioText9::
	text_start
	line "Pigu"
	done

_BuenaRadioText1::
	text_start
	line "Morikazu Aoki"
	done

_BuenaRadioText3::
	text_start
	line "Go Ichinose"
	done

_BuenaRadioText4::
	text_start
	line "TriteHexagon"
	done

_BuenaRadioText5::
	text_start
	line "LyricWulf"
	done

_BuenaRadioText6::
	text_start
	line "Shota Kageyama"
	done

_BuenaRadioText7::
	text_start
	line "GACT"
	done

_BuenaRadioMidnightText2::
	text_start
	line "Kenta Nagata"
	done

_BuenaRadioMidnightText3::
	text_start
	line "Hajime Wakai"
	done

_BuenaRadioMidnightText4::
	text_start
	line "Toru Minegishi"
	done

_BuenaRadioMidnightText5::
	text_start
	line "ShockSlayer"
	done

_BuenaRadioMidnightText7::
	text_start
	line "Radiation"
	done

_BuenaRadioMidnightText8::
	text_start
	line "ShockSlayer"
	done

_BuenaRadioMidnightText10::
	text "Pigu"
	done

Text_EnemyWithdrew::
	text "<ENEMY>"
	line "withdrew"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

Text_EnemyUsedOn::
	text "<ENEMY>"
	line "used @"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "on @"
	text_ram wEnemyMonNick
	text "!"
	prompt

UnknownText_0x1bd2bc::
	text "Which floor?"
	done

_RepelWoreOffText::
	text "Repel's effect"
	line "wore off."
	done

_UseAnotherRepelText::
	text "Repel's effect"
	line "wore off."

	para "Use another?"
	done

_PlayerFoundItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ButNoSpaceText::
	text "But <PLAYER> has"
	line "no space left…"
	done

_JustSawSomeRareMonText::
	text "I just saw some"
	line "rare @"
	text_ram wStringBuffer1
	text " in"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "I'll call you if I"
	line "see another rare"
	cont "#mon, OK?"
	prompt

_SavingRecordText::
	text "Saving Record…"
	line "Don't Turn Off!"
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " received"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_waitbutton
	text_end

_NoCoinsText::
	text "You have no coins."
	prompt

_NoCoinCaseText::
	text "You don't have a"
	line "Coin Case."
	prompt

UnknownText_0x1bd407::
	text "OK, connect the"
	line "Game Link Cable."
	prompt

UnknownText_0x1bd429::
	text "<PLAYER> traded"
	line "@"
	text_ram wMonOrItemNameBuffer
	text " for"
	cont "@"
	text_ram wStringBuffer2
	text ".@"
	text_end

UnknownText_0x1bd445::
	sound_dex_fanfare_80_109
	text_pause
	text_end

_NPCTradeIntroText1::
	text "I collect #mon."
	line "Do you have"
	cont "@"
	text_ram wStringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText1::
	text "You don't want to"
	line "trade? Aww…"
	done

_NPCTradeWrongText1::
	text "Huh? That's not"
	line "@"
	text_ram wStringBuffer1
	text ". "
	cont "What a letdown…"
	done

_NPCTradeCompleteText1::
	text "Yay! I got myself"
	line "@"
	text_ram wStringBuffer1
	text "!"
	cont "Thanks!"
	done

_NPCTradeAFterText1::
	text "Hi, how's my old"
	line "@"
	text_ram wStringBuffer2
	text " doing?"
	done

_NPCTradeIntroText2::
	text "Hi, I'm looking"
	line "for this #mon."

	para "If you have"
	line "@"
	text_ram wStringBuffer1
	text ", would"

	para "you trade it for"
	line "my @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText2::
	text "You don't have"
	line "one either?"

	para "Gee, that's really"
	line "disappointing…"
	done

_NPCTradeWrongText2::
	text "You don't have"
	line "@"
	text_ram wStringBuffer1
	text "? That's"
	cont "too bad, then."
	done

_NPCTradeCompleteText2::
	text "Great! Thank you!"

	para "I finally got"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_NPCTradeAfterText2::
	text "Hi! The @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "you traded me is"
	cont "doing great!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text "'s cute,"
	line "but I don't have"

	para "it. Do you have"
	line "@"
	text_ram wStringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText3::
	text "You don't want to"
	line "trade? Oh, darn…"
	done

_NPCTradeWrongText3::
	text "That's not"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Please trade with"
	line "me if you get one."
	done

_NPCTradeCompleteText3::
	text "Wow! Thank you!"
	line "I always wanted"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

_NPCTradeAfterText3::
	text "How is that"
	line "@"
	text_ram wStringBuffer2
	text " I"
	cont "traded you doing?"

	para "Your @"
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "so cute!"
	done

_NPCTradeCompleteText4::
	text "Uh? What happened?"
	done

_NPCTradeAfterText4::
	text "Trading is so odd…"

	para "I still have a lot"
	line "to learn about it."
	done

_MomLeavingText1::
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

_MomLeavingText2::
	text "OK, I'll take care"
	line "of your money."

	para "<……><……><……>"
	prompt

_MomLeavingText3::
	text "Be careful."

	para "#mon are your"
	line "friends. You need"
	cont "to work as a team."

	para "Now, go on!"
	done

_MomVisitingText1::
	text "Hi! Welcome home!"
	line "You're trying very"
	cont "hard, I see."

	para "I've kept your"
	line "room tidy."

	para "Or is this about"
	line "your money?"
	done

_MomVisitingText2::
	text "What do you want"
	line "to do?"
	done

_MomVisitingText3::
	text "How much do you"
	line "want to save?"
	done

_MomVisitingText4::
	text "How much do you"
	line "want to take?"
	done

_MomVisitingText5::
	text "Do you want to"
	line "save some money?"
	done

_MomVisitingText6::
	text "You haven't saved"
	line "that much."
	prompt

_MomVisitingText7::
	text "You can't take"
	line "that much."
	prompt

_MomVisitingText8::
	text "You don't have"
	line "that much."
	prompt

_MomVisitingText9::
	text "You can't save"
	line "that much."
	prompt

_MomVisitingText10::
	text "OK, I'll save your"
	line "money. Trust me!"

	para "<PLAYER>, stick"
	line "with it!"
	done

_MomVisitingText11::
	text "Your money's safe"
	line "here! Get going!"
	done

_MomVisitingText12::
	text "<PLAYER>, don't"
	line "give up!"
	done

_MomVisitingText13::
	text "Just do what"
	line "you can."
	done

_DaycareDummyText::
	text_start
	done

_DayCareManIntroText::
	text "I'm the Day-Care"
	line "Man. Want me to"
	cont "raise a #mon?"
	done

_DayCareManOddEggText::
	text "I'm the Day-Care"
	line "Man. Do you know"
	cont "about Eggs?"

	para "I was raising"
	line "#mon with my"
	cont "wife, you see."

	para "We were shocked to"
	line "find an Egg!"

	para "How incredible is"
	line "that?"

	para "So, want me to"
	line "raise a #mon?"
	done

_DayCareLadyIntroText::
	text "I'm the Day-Care"
	line "Lady."

	para "Should I raise a"
	line "#mon for you?"
	done

_DayCareLadyOddEggText::
	text "I'm the Day-Care"
	line "Lady. Do you know"
	cont "about Eggs?"

	para "My husband and I"
	line "were raising some"
	cont "#mon, you see."

	para "We were shocked to"
	line "find an Egg!"

	para "How incredible"
	line "could that be?"

	para "Should I raise a"
	line "#mon for you?"
	done

_WhatShouldIRaiseText::
	text "What should I"
	line "raise for you?"
	prompt

_OnlyOneMonText::
	text "Oh? But you have"
	line "just one #mon."
	prompt

_CantRaiseEggText::
	text "Sorry, but I can't"
	line "accept an Egg."
	prompt

_RemoveMailText::
	text "Remove Mail before"
	line "you come see me."
	prompt

_LastHealthyMonText::
	text "If you give me"
	line "that, what will"
	cont "you battle with?"
	prompt

_IllRaiseYourMonText::
	text "OK. I'll raise"
	line "your @"
	text_ram wStringBuffer1
	text "."
	prompt

_ComeBackLaterText::
	text "Come back for it"
	line "later."
	done

_AreWeGeniusesText::
	text "Are we geniuses or"
	line "what? Want to see"
	cont "your @"
	text_ram wStringBuffer1
	text "?"
	done

_YourMonHasGrownText::
	text "Your @"
	text_ram wStringBuffer1
	text_start
	line "has grown a lot."

	para "By level, it's"
	line "grown by @"
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "If you want your"
	line "#mon back, it"
	cont "will cost ¥@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "."
	done

_PerfectHeresYourMonText::
	text "Perfect! Here's"
	line "your #mon."
	prompt

_GotBackMonText::
	text "<PLAYER> got back"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BackAlreadyText::
	text "Huh? Back already?"
	line "Your @"
	text_ram wStringBuffer1
	text_start
	para "needs a little"
	line "more time with us."

	para "If you want your"
	line "#mon back, it"
	cont "will cost ¥100."
	done

_HaveNoRoomText::
	text "You have no room"
	line "for it."
	prompt

_DCNotEnoughMoneyText::
	text "You don't have"
	line "enough money."
	prompt

_OhFineThenText::
	text "Oh, fine then."
	prompt

_ComeAgainText::
	text "Come again."
	done

_NotYetText::
	text "Not yet…"
	done

_FoundAnEggText::
	text "Ah, it's you!"

	para "We were raising"
	line "your #mon, and"

	para "my goodness, were"
	line "we surprised!"

	para "Your #mon had"
	line "an Egg!"

	para "We don't know how"
	line "it got there, but"

	para "your #mon had"
	line "it. You want it?"
	done

_ReceivedEggText::
	text "<PLAYER> received"
	line "the Egg!"
	done

_TakeGoodCareOfEggText::
	text "Take good care of"
	line "it."
	done

_RefuseEggText::
	text "Well then, I'll"
	line "keep it. Thanks!"
	done

_NoRoomForEggText::
	text "You have no room"
	line "in your party."
	cont "Come back later."
	done

_WhichMonPhotoText::
	text "Which #mon"
	line "should I photo-"
	cont "graph?"
	prompt

_HoldOnText::
	text "All righty. Hold"
	line "still for a bit."
	prompt

_PrestoAllDoneText::
	text "Presto! All done."
	line "Come again, OK?"
	done
