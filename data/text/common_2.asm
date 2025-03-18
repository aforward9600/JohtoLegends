UnknownText_0x1c0000::
	text "Oh, no picture?"
	line "Come again, OK?"
	done

UnknownText_0x1c0021::
	text "An Egg? My talent"
	line "is worth more…"
	done

UnknownText_0x1c0043::
	text "Hello, hello! I'm"
	line "the Name Rater."

	para "I rate the names"
	line "of #mon."

	para "Would you like me"
	line "to rate names?"
	done

_TeamGainedExpText::
	text "The rest of the"
	line "team gained Exp!"
	prompt

UnknownText_0x1c00a0::
	text "Which #mon's"
	line "nickname should I"
	cont "rate for you?"
	prompt

UnknownText_0x1c00cd::
	text "Hm… @"
	text_ram wStringBuffer1
	text "…"
	line "That's a fairly"
	cont "decent name."

	para "But, how about a"
	line "slightly better"
	cont "nickname?"

	para "Want me to give it"
	line "a better name?"
	done

UnknownText_0x1c0142::
	text "All right. What"
	line "name should we"
	cont "give it, then?"
	prompt

UnknownText_0x1c0171::
	text "That's a better"
	line "name than before!"

	para "Well done!"
	done

UnknownText_0x1c019e::
	text "OK, then. Come"
	line "again sometime."
	done

UnknownText_0x1c01be::
	text "Hm… @"
	text_ram wStringBuffer1
	text "?"
	line "What a great name!"
	cont "It's perfect."

	para "Treat @"
	text_ram wStringBuffer1
	text_start
	line "with loving care."
	done

UnknownText_0x1c0208::
	text "Whoa… That's just"
	line "an Egg."
	done

UnknownText_0x1c0222::
	text "It might look the"
	line "same as before,"

	para "but this new name"
	line "is much better!"

	para "Well done!"
	done

UnknownText_0x1c0272::
	text "All right. This"
	line "#mon is now"
	cont "named @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " gained@"
	text_end

Text_ABoostedStringBuffer2ExpPoints::
	text_start
	line "a boosted"
	cont "@"
	text_decimal wStringBuffer2, 2, 4
	text " Exp. Points!"
	prompt

Text_ExpPointsFromShareText::
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 4
	text " Exp. Points"
	cont "from Exp.Share!"
	prompt

Text_StringBuffer2ExpPoints::
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 4
	text " Exp. Points!"
	prompt

Text_GoMon::
	text "Go! @"
	text_end

Text_DoItMon::
	text "Do it! @"
	text_end

Text_GoForItMon::
	text "Go for it,"
	line "@"
	text_end

Text_YourFoesWeakGetmMon::
	text "Your foe's weak!"
	line "Get'm, @"
	text_end

Text_BattleMonNick01::
	text_ram wBattleMonNick
	text "!"
	done

Text_BattleMonNickComma::
	text_ram wBattleMonNick
	text ",@"
	text_end

Text_ThatsEnoughComeBack::
	text " that's"
	line "enough! Come back!@"
	text_end

Text_OKComeBack::
	text " OK!"
	line "Come back!@"
	text_end

Text_GoodComeBack::
	text " good!"
	line "Come back!@"
	text_end

Text_ComeBack::
	text " come"
	line "back!"
	done

UnknownText_0x1c0373::
	text "Booted up a TM."
	prompt

UnknownText_0x1c0384::
	text "Booted up an HM."
	prompt

UnknownText_0x1c0396::
	text "It contained"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Teach @"
	text_ram wStringBuffer2
	text_start
	line "to a #mon?"
	done

UnknownText_0x1c03c2::
	text_ram wStringBuffer2
	text " is"
	line "not compatible"
	cont "with @"
	text_ram wStringBuffer1
	text "."

	para "It can't learn"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c03fa::
	text "You have no room"
	line "for any more"
	cont "@"
	text_ram wStringBuffer1
	text "S."
	prompt

UnknownText_0x1c0421::
	text "You received"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

UnknownText_0x1c0436::
	text "The link has been"
	line "cancelled."
	prompt

UnknownText_0x1c0454::
	text "Communication"
	line "error."
	prompt

UnknownText_0x1c046a::
	text "Must retrieve GIFT"
	line "at #mon CENTER."
	prompt

UnknownText_0x1c048e::
	text "Your friend isn't"
	line "ready."
	prompt

UnknownText_0x1c04a7::
	text "Sorry--only five"
	line "GIFTS a day."
	prompt

UnknownText_0x1c04c6::
	text "Sorry. One GIFT"
	line "a day per person."
	prompt

UnknownText_0x1c04e9::
	text_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c04fa::
	text_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "to @"
	text_ram wMysteryGiftPlayerName
	text "'s home."
	prompt

UnknownText_0x1c051a::
	text "Received"
	line "@"
	text_ram wc850
	text "'s CARD."
	prompt

UnknownText_0x1c0531::
	text_ram wc850
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wDeciramBuffer, 1, 2
	text "."
	prompt

UnknownText_0x1c0555::
	text "The CARD was not"
	line "registered."
	prompt

UnknownText_0x1c0573::
	text "The link has been"
	line "cancelled."
	prompt

UnknownText_0x1c0591::
	text "Communication"
	line "error."
	prompt

_BadgeRequiredText::
	text "Sorry! A new Badge"
	line "is required."
	prompt

UnknownText_0x1c05c8::
	text "Can't use that"
	line "here."
	prompt

UnknownText_0x1c05dd::
	text "Scyther appeared"
	line "and cut!"
	prompt

UnknownText_0x1c05ec::
	text "There's nothing to"
	line "cut here."
	prompt

UnknownText_0x1c0609::
	text "Voltorb illuminat-"
	line "ed the area!@"
	text_waitbutton
	text_end

	text_end ; unused

_UsedSurfText::
	text "Lapras appeared"
	line "and let you ride!"
	done

_CantSurfText::
	text "You can't call"
	line "Lapras here."
	prompt

_AlreadySurfingText::
	text "You're already"
	line "on Lapras."
	prompt

_AskSurfText::
	text "The water is calm."
	line "Wanna call Lapras?"
	done

UnknownText_0x1c068e::
	text "Lapras climbed"
	line "the waterfall!"
	done

UnknownText_0x1c06a3::
	text "Wow, it's a huge"
	line "waterfall."
	done

UnknownText_0x1c06bf::
	text "Do you want to cl-"
	line "imb the waterfall?"
	done

UnknownText_0x1c06de::
	text_ram wStringBuffer2
	text " used"
	line "Dig!"
	done

UnknownText_0x1c06ed::
	text "<PLAYER> used an"
	line "Escape Rope."
	done

UnknownText_0x1c0705::
	text "Can't use that"
	line "here."
	done

UnknownText_0x1c071a::
	text "Return to the last"
	line "#mon Center."
	done

UnknownText_0x1c073b::
	text "Can't use that"
	line "here."

	para ""
	done

UnknownText_0x1c0751::
	text "Machamp is using"
	line "Strength already."
	prompt

UnknownText_0x1c0774::
	text "Machamp used"
	line "Strength!"
	done

UnknownText_0x1c0788::
	text "Machamp can"
	line "move boulders."
	prompt

UnknownText_0x1c07a0::
	text "A #mon may be"
	line "able to move this."

	para "Want to call"
	line "Machamp?"
	done

UnknownText_0x1c07d8::
	text "Boulders may now"
	line "be moved!"
	done

UnknownText_0x1c07f4::
	text "A #mon may be"
	line "able to move this."
	done

UnknownText_0x1c0816::
	text "Lapras dissipated"
	line "the whirlpool!"
	prompt

UnknownText_0x1c082b::
	text "It's a vicious"
	line "whirlpool!"

	para "A #mon may be"
	line "able to pass it."
	done

UnknownText_0x1c0864::
	text "A whirlpool is in"
	line "the way."

	para "Want Lapras to"
	line "use Whirlpool?"
	done

UnknownText_0x1c0897::
	text "Snubbull did a"
	line "Headbutt!"
	prompt

UnknownText_0x1c08ac::
	text "Nope. Nothing…"
	done

UnknownText_0x1c08bc::
	text "A #mon could be"
	line "in this tree."

	para "Want to call"
	line "Snubbull?"
	done

UnknownText_0x1c08f0::
	text "Golem smashed"
	line "the rock!"
	prompt

UnknownText_0x1c0906::
	text "Maybe a #mon"
	line "can break this."
	done

UnknownText_0x1c0924::
	text "This rock looks"
	line "breakable."

	para "Want to have Golem"
	line "smash the rock?"
	done

UnknownText_0x1c0958::
	text "Oh!"
	line "A bite!"
	prompt

UnknownText_0x1c0965::
	text "Not even a nibble!"
	prompt

UnknownText_0x1c0979::
	text "Looks like there's"
	line "nothing here."
	prompt

UnknownText_0x1c099a::
	text "You can't get off"
	line "here!"
	done

UnknownText_0x1c09b2::
	text "<PLAYER> got on the"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c09c7::
	text "<PLAYER> got off"
	line "the @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c09dd::
	text "This tree can be"
	line "cut!"

	para "Want to call"
	line "Scyther?"
	done

UnknownText_0x1c0a05::
	text "This tree can be"
	line "cut!"
	done

UnknownText_0x1c0a1c::
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

UnknownText_0x1c0a2c::
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

UnknownText_0x1c0a4e::
	text "<PLAYER> is out of"
	line "useable #mon!"

	para "<PLAYER> whited"
	line "out!"
	done

UnknownText_0x1c0a77::
	text "Yes! Itemfinder"
	line "indicates there's"
	cont "an item nearby."
	prompt

UnknownText_0x1c0aa9::
	text "Nope! Itemfinder"
	line "isn't responding."
	prompt

UnknownText_0x1c0acc::
	text_ram wStringBuffer3
	text_start
	line "survived the"
	cont "poisoning!"
	prompt

UnknownText_0x1c0b03::
	text_ram wStringBuffer3
	text " used"
	line "Sweet Scent!"
	done

UnknownText_0x1c0b1a::
	text "Looks like there's"
	line "nothing here…"
	done

UnknownText_0x1c0b3b::
	text "<PLAYER> sprinkled"
	line "water."

	para "But nothing"
	line "happened…"
	done

UnknownText_0x1c0b65::
	text "<PLAYER>'s #mon"
	line "were all healed!"
	done

Text_AnEGGCantHoldAnItem::
	text "An Egg can't hold"
	line "an item."
	prompt

UnknownText_0x1c0b9a::
	text "No items."
	done

UnknownText_0x1c0ba5::
	text "Throw away how"
	line "many?"
	done

UnknownText_0x1c0bbb::
	text "Throw away @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(s)?"
	done

UnknownText_0x1c0bd8::
	text "Threw away"
	line "@"
	text_ram wStringBuffer2
	text "(s)."
	prompt

UnknownText_0x1c0bee::
	text "Granny: <PLAYER>!"
	line "Are you certain"
	cont "this is the time"
	cont "to use that?"
	prompt

Text_YouDontHaveAMon::
	text "You don't have a"
	line "#mon!"
	prompt

UnknownText_0x1c0c2e::
	text "Registered the"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c0c45::
	text "You can't register"
	line "that item."
	prompt

UnknownText_0x1c0c63::
	text "Where should this"
	line "be moved to?"
	done

UnknownText_0x1c0c83::
	text_start
	done

Text_YouCantUseItInABattle::
	text "You can't use it"
	line "in a battle."
	prompt

Text_AreYouABoyOrAreYouAGirl::
	text "Are you a boy?"
	line "Or are you a girl?"
	done

UnknownText_0x1c0cc6::
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

UnknownText_0x1c0cd0::
	text_pause
	text "<SCROLL>went way up!"
	prompt

UnknownText_0x1c0ce0::
	text " went up!"
	prompt

UnknownText_0x1c0ceb::
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

UnknownText_0x1c0cf5::
	text_pause
	text "<SCROLL>sharply fell!"
	prompt

UnknownText_0x1c0d06::
	text " fell!"
	prompt

UnknownText_0x1c0d0e::
	text "<USER>@"
	text_end

UnknownText_0x1c0d12::
	text_start
	line "made a whirlwind!"
	prompt

UnknownText_0x1c0d26::
	text_start
	line "took in sunlight!"
	prompt

UnknownText_0x1c0d3a::
	text_start
	line "lowered its head!"
	prompt

UnknownText_0x1c0d4e::
	text_start
	line "is glowing!"
	prompt

UnknownText_0x1c0d5c::
	text_start
	line "flew up high!"
	prompt

UnknownText_0x1c0d6c::
	text_start
	line "dug a hole!"
	prompt

BounceText::
	text_start
	line "bounce high!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMoveText::
	text_start
	line "used @"
	text_end

_UsedInsteadText::
	text "instead,"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text "!"
	done

UnknownText_0x1c0db0::
	text "Huh?"

	para "@"
	text_end

UnknownText_0x1c0db8::
	text_start
	done

UnknownText_0x1c0dba::
	text_ram wStringBuffer1
	text " came"
	line "out of its Egg!@"
	sound_caught_mon
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c0dd8::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c0df3::
	text "It's @"
	text_ram wBreedMon2Nick
	text_start
	line "that was left with"
	cont "the Day-Care Lady."
	done

UnknownText_0x1c0e24::
	text "It's @"
	text_ram wBreedMon1Nick
	text_start
	line "that was left with"
	cont "the Day-Care Man."
	done

UnknownText_0x1c0e54::
	text "It's brimming with"
	line "energy."
	prompt

UnknownText_0x1c0e6f::
	text "It has no interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0e8d::
	text "It appears to care"
	line "for @"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0eac::
	text "It's friendly with"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0ec6::
	text "It shows interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "There's no Mail"
	line "here."
	prompt

ClearedMailPutAwayText::
	text "The cleared Mail"
	line "was put away."
	prompt

MailPackFullText::
	text "The Pack is full."
	prompt

MailMessageLostText::
	text "The Mail's message"
	line "will be lost. OK?"
	done

MailAlreadyHoldingItemText::
	text "It's already hold-"
	line "ing an item."
	prompt

MailEggText::
	text "An Egg can't hold"
	line "any Mail."
	prompt

MailMovedFromBoxText::
	text "The Mail was moved"
	line "from the Mailbox."
	prompt

UnknownText_0x1c0fb3::
	text "Yes"
	prompt

UnknownText_0x1c0fb8::
	text "No"
	prompt

UnknownText_0x1c0fbc::
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Animation type @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

UnknownText_0x1c0fdd::
	text "#mon number?"
	done

Text_WasSentToBillsPC::
	text_ram wStringBuffer1
	text " was"
	line "sent to ADS."
	prompt

UnknownText_0x1c1006::
	text "You gotta have"
	line "#mon to call!"
	prompt

UnknownText_0x1c1024::
	text "What?"
	done

UnknownText_0x1c102b::
	text "There is a #mon"
	line "holding Mail."

	para "Please remove the"
	line "Mail."
	prompt

UnknownText_0x1c1062::
	text "You don't have a"
	line "single #mon!"
	prompt

UnknownText_0x1c1080::
	text "You can't deposit"
	line "your last #mon!"
	prompt

UnknownText_0x1c10a2::
	text "You can't take any"
	line "more #mon."
	prompt

UnknownText_0x1c10c0::
	text "Caught @"
	text_ram wStringBuffer1
	text "!"
	prompt

UnknownText_0x1c10cf::
	text "Switch #mon?"
	done

UnknownText_0x1c10dd::
	text "You already caught"
	line "a @"
	text_ram wStringBuffer1
	text "."
	prompt

ContestJudging_FirstPlaceText::
	text "This Bug-Catching"
	line "Contest winner is@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "who caught a"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_FirstPlaceScoreText::
	text_start

	para "The winning score"
	line "was @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " points!"
	prompt

ContestJudging_SecondPlaceText::
	text "Placing second was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_SecondPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " points!"
	prompt

ContestJudging_ThirdPlaceText::
	text "Placing third was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_ThirdPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " points!"
	prompt

UnknownText_0x1c1203::
	text "Let me measure"
	line "that Magikarp."

	para "…Hm, it measures"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c123a::
	text "Current Record"

	para "@"
	text_ram wStringBuffer1
	text " caught by"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c1261::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_ram wStringBuffer1
	text " in"
	line "your party."
	prompt

UnknownText_0x1c12ae::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_ram wStringBuffer1
	text " in"
	line "your Box."
	prompt

UnknownText_0x1c12fc::
	text "Give a nickname to"
	line "the @"
	text_ram wStringBuffer1
	text " you"
	cont "received?"
	done

UnknownText_0x1c1328::
	text "Bzzzzt! You must"
	line "have a #mon to"
	cont "use this!"
	prompt

UnknownText_0x1c1353::
	text "<PLAYER> picked"
	line "up the phone."
	prompt

UnknownText_0x1c1368::
	text "What do you want"
	line "to do?"
	done

_PlayersPCHowManyWithdrawText::
	text "How many do you"
	line "want to withdraw?"
	done

_PlayersPCWithdrewItemsText::
	text "Withdrew @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "There's no room"
	line "for more items."
	prompt

UnknownText_0x1c13df::
	text "No items here!"
	prompt

_PlayersPCHowManyDepositText::
	text "How many do you"
	line "want to deposit?"
	done

_PlayersPCDepositItemsText::
	text "Deposited @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(s)."
	prompt

_PlayersPCNoRoomDepositText::
	text "There's no room to"
	line "store items."
	prompt

UnknownText_0x1c144d::
	text "<PLAYER> picked"
	line "up the phone."
	prompt

UnknownText_0x1c1462::
	text "Call who?"
	done

UnknownText_0x1c1474::
	text "#mon Delivery"
	line "accessed."

	para "#mon Storage"
	line "System called."
	prompt

UnknownText_0x1c14a4::
	text "Accessed personal"
	line "account."

	para "Item Storage"
	line "System opened."
	prompt

UnknownText_0x1c14d2::
	text "Hello there!"
	line "This is Prof"

	para "Oak speaking!"
	line "How are you?"
	prompt

UnknownText_0x1c1505::
	text "…"
	line "Call ended…"
	done

_OakPCText1::
	text "Want to get your"
	line "Journal rated?"
	done

_OakPCText2::
	text "Current Journal"
	line "completion level:"
	prompt

_OakPCText3::
	text_ram wStringBuffer3
	text " #mon seen"
	line "@"
	text_ram wStringBuffer4
	text " #mon owned"

	para "Prof.Oak's"
	line "Rating:"
	done

_OakRating01::
	text "Look for #mon"
	line "in grassy areas!"
	done

_OakRating02::
	text "Good. I see you"
	line "understand how to"
	cont "use # Balls."
	done

_OakRating03::
	text "You're getting"
	line "good at this."

	para "But you have a"
	line "long way to go."
	done

_OakRating04::
	text "You need to fill"
	line "up the Journal."

	para "Catch different"
	line "kinds of #mon!"
	done

_OakRating05::
	text "You're trying--I"
	line "can see that."

	para "Your Journal is"
	line "coming together."
	done

_OakRating06::
	text "To evolve, some"
	line "#mon grow,"

	para "others use the"
	line "effects of Stones."
	done

_OakRating07::
	text "Have you gotten a"
	line "fishing Rod? You"

	para "can catch #mon"
	line "by fishing."
	done

_OakRating08::
	text "Excellent! You"
	line "seem to like col-"
	cont "lecting things!"
	done

_OakRating09::
	text "Some #mon only"
	line "appear during"

	para "certain times of"
	line "the day."
	done

_OakRating10::
	text "Your Journal is"
	line "filling up. Keep"
	cont "up the good work!"
	done

_OakRating11::
	text "I'm impressed."
	line "You're evolving"

	para "#mon, not just"
	line "catching them."
	done

_OakRating12::
	text "Have you met the"
	line "son of Kurt? His"
	cont "custom Balls"

	para "should help."
	done

_OakRating13::
	text "Wow! You've found"
	line "more #mon than"

	para "the last Journal"
	line "research project!"
	done

_OakRating14::
	text "Are you using"
	line "Link Cables?"

	para "It's tough to do"
	line "this without"
	cont "them!"
	done

_OakRating15::
	text "Wow! You've hit"
	line "200! Your Journal"
	cont "is looking great!"
	done

_OakRating16::
	text "You've found so"
	line "many #mon!"

	para "You've really"
	line "helped my studies!"
	done

_OakRating17::
	text "Magnificent! You"
	line "could become a"

	para "#mon professor"
	line "right now!"
	done

_OakRating18::
	text "Your Journal is"
	line "amazing! You're"

	para "ready to turn"
	line "professional!"
	done

_OakRating19::
	text "Whoa! A perfect"
	line "Journal! I've"

	para "dreamt about this!"
	line "Congratulations!"
	done

_OakPCText4::
	text "The call with"
	line "Prof.Oak ended."
	done

UnknownText_0x1c19cd::
	text "Triple-theme"
	line "trainer ranking!"

	para "The SAVE file you"
	line "just sent might"
	cont "make the rankings!"

	para ""
	done

UnknownText_0x1c1a22::
	text "There is no"
	line "ranking data."

	para "Link to obtain"
	line "ranking data."

	para ""
	done

UnknownText_0x1c1a5b::
	text " , yeah!"
	done

UnknownText_0x1c1a65::
	text "Darn…"
	done

UnknownText_0x1c1a6c::
	text "Would you like to"
	line "end the Contest?"
	done

UnknownText_0x1c1a90::
	text "Toss out how many"
	line "@"
	text_ram wStringBuffer2
	text "(s)?"
	done

UnknownText_0x1c1aad::
	text "Throw away @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(s)?"
	done

UnknownText_0x1c1aca::
	text "Discarded"
	line "@"
	text_ram wStringBuffer1
	text "(s)."
	prompt

UnknownText_0x1c1adf::
	text "That's too impor-"
	line "tant to toss out!"
	prompt

UnknownText_0x1c1b03::
	text "Granny: <PLAYER>!"
	line "Are you certain"
	cont "this is the time"
	cont "to use that?"
	done

UnknownText_0x1c1b2c::
	text "Took @"
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "@"
	text_ram wStringBuffer1
	text " and"

	para "made it hold"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c1b57::
	text "Made @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "hold @"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c1b6f::
	text "Please remove the"
	line "MAIL first."
	prompt

UnknownText_0x1c1b8e::
	text_ram wMonOrItemNameBuffer
	text " isn't"
	line "holding anything."
	prompt

UnknownText_0x1c1baa::
	text "Item storage space"
	line "full."
	prompt

UnknownText_0x1c1bc4::
	text "Took @"
	text_ram wStringBuffer1
	text_start
	line "from @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

UnknownText_0x1c1bdc::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "already holding"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Switch items?"
	done

UnknownText_0x1c1c09::
	text "This item can't be"
	line "held."
	prompt

UnknownText_0x1c1c22::
	text "The Mail will lose"
	line "its message. OK?"
	done

UnknownText_0x1c1c47::
	text "Mail detached from"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c1c62::
	text "There's no space"
	line "for removing Mail."
	prompt

UnknownText_0x1c1c86::
	text "Send the removed"
	line "Mail to your Box?"
	done

UnknownText_0x1c1ca9::
	text "Your Mailbox"
	line "is full."
	prompt

UnknownText_0x1c1cc4::
	text "The Mail was sent"
	line "to your Box."
	prompt

UnknownText_0x1c1ce3::
	text "Not enough HP!"
	prompt

UnknownText_0x1c1cf3::
	text "An item in your"
	line "Pack may be"

	para "registered for use"
	line "on Select Button."
	done

_OakText1::
	text "Greetings!"

	para "I apologize for"
	line "making you wait."

	para "Welcome to the"
	line "world of #mon!"

	para "You may call me"
	line "Master."

	para "I am the elder of"
	line "Blackthorn City,"
	cont "home of the"
	cont "Dragons."
	prompt

_OakText2::
	text "This world is in-"
	line "habited by crea-"
	cont "tures that we call"
	cont "#mon.@"
	text_end

_OakText3::
	text_waitbutton
	text_end

	text_end ; unused

_OakText4::
	text "People and #mon"
	line "live together by"

	para "supporting each"
	line "other."

	para "Some people play"
	line "with #mon, some"
	cont "battle with them."
	prompt

_OakText5::
	text "The bond between"
	line "trainers and"
	cont "#mon is"
	cont "paramount to"

	para "success. That is"
	line "what I always"
	cont "strive to teach my"
	cont "students."

	para "Students such as"
	line "you."
	prompt

Text_PasswordOption::
	text "Enter a starter"
	line "password?"
	prompt

Text_PasswordOption2::
	text "Enter a different"
	line "password?"
	prompt
