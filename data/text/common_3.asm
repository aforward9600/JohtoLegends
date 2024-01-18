_OakText6::
	text "Now, remind me,"
	line "what did you say"
	cont "your name was?"
	prompt

_OakText7::
	text "<PLAYER>, are you"
	line "ready?"

	para "Your very own"
	line "#mon story is"
	cont "about to unfold."

	para "The Johto region"
	line "is rich in history"
	cont "and mythology."

	para "Your journey will"
	line "take you across"
	cont "Johto, and you'll"
	cont "meet new faces, as"
	cont "well as familiar"
	cont "ones."

	para "A world of dreams"
	line "and adventures"

	para "with #mon"
	line "awaits! Let's go!"

	para "I'll be seeing you"
	line "later!"
	done

UnknownText_0x1c40e6::
	text "The clock's time"
	line "may be wrong."

	para "Please reset the"
	line "time."
	prompt

UnknownText_0x1c411c::
	text "Set with the"
	line "Control Pad."

	para "Confirm: A Button"
	line "Cancel:  B Button"
	done

UnknownText_0x1c415b::
	text "Is this OK?"
	done

UnknownText_0x1c4168::
	text "The clock has been"
	line "reset."
	done

UnknownText_0x1c4183::
	text "Too much time has"
	line "elapsed. Please"
	cont "try again."
	prompt

UnknownText_0x1c41b1::
	text "If you trade that"
	line "#mon, you won't"
	cont "be able to battle."
	prompt

UnknownText_0x1c41e6::
	text "Your friend's"
	line "@"
	text_ram wStringBuffer1
	text " appears"
	cont "to be abnormal!"
	prompt

UnknownText_0x1c4212::
	text "Trade @"
	text_ram wd004
	text_start
	line "for @"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c422a::
	text "To enter a mobile"
	line "battle, you must"

	para "pick a team of"
	line "three #mon."

	para "Is that OK?"
	done

UnknownText_0x1c4275::
	text "Need more info on"
	line "mobile battles?"
	done

UnknownText_0x1c4298::
	text "For a mobile"
	line "battle, choose"
	cont "three #mon."

	para "The maximum daily"
	line "play time is ten"

	para "minutes for each"
	line "linked player."

	para "If a battle isn't"
	line "finished within"

	para "the time limit,"
	line "the player with"

	para "the fewest fainted"
	line "#mon wins."

	para "If tied, the team"
	line "that lost the"

	para "least amount of HP"
	line "wins."
	done

UnknownText_0x1c439c::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Would you like to"
	line "battle?"
	done

UnknownText_0x1c43dc::
	text "There are only @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min. left today."

	para "Want a quick"
	line "battle?"
	done

UnknownText_0x1c4419::
	text "There is only"
	line "1 min. left today!"

	para "Want to rush"
	line "through a battle?"
	done

UnknownText_0x1c445a::
	text "There is less than"
	line "1 min. left today!"

	para "Please try again"
	line "tomorrow."
	done

UnknownText_0x1c449c::
	text "Try again using"
	line "the same settings?"
	done

UnknownText_0x1c44c0::
	text "There is less than"
	line "1 min. left today!"
	done

UnknownText_0x1c44e7::
	text "No time left for"
	line "linking today."
	done

UnknownText_0x1c4508::
	text "Pick three #mon"
	line "for battle."
	done

UnknownText_0x1c4525::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

UnknownText_0x1c454b::
	text "Would you like to"
	line "save the game?"
	done

UnknownText_0x1c4590::
	text "<PLAYER> saved"
	line "the game."
	done

UnknownText_0x1c45d9::
	text "There is another"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

UnknownText_0x1c460d::
	text "The save file is"
	line "corrupted!"
	prompt

UnknownText_0x1c462a::
	text "When you change a"
	line "#mon Box, data"
	cont "will be saved. OK?"
	done

UnknownText_0x1c465f::
	text "Each time you move"
	line "a #mon, data"
	cont "will be saved. OK?"
	done

UnknownText_0x1c4693::
	text "The window save"
	line "area was exceeded."
	done

UnknownText_0x1c46b7::
	text "No windows avail-"
	line "able for popping."
	done

UnknownText_0x1c46dc::
	text "Corrupted event!"
	prompt

_ObjectEventText::
	text "Object event"
	done

UnknownText_0x1c46fc::
	text "BG event"
	done

UnknownText_0x1c4706::
	text "Coordinates event"
	done

UnknownText_0x1c4719::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

UnknownText_0x1c472c::
	text "<PLAYER> put the"
	line "@"
	text_ram wStringBuffer1
	text " in"
	cont "the @"
	text_ram wStringBuffer3
	text "."
	prompt

UnknownText_0x1c474b::
	text "The @"
	text_ram wStringBuffer3
	text_start
	line "is full…"
	prompt

UnknownText_0x1c475f::
	text "I see all."
	line "I know all…"

	para "Certainly, I know"
	line "of your #mon!"
	done

UnknownText_0x1c4797::
	text "Whaaaat? I can't"
	line "tell a thing!"

	para "How could I not"
	line "know of this?"
	done

UnknownText_0x1c47d4::
	text "Hm… I see you met"
	line "@"
	text_ram wSeerNickname
	text " here:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

UnknownText_0x1c47fa::
	text "The time was"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Its level was @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Am I good or what?"
	prompt

UnknownText_0x1c4837::
	text "Hm… @"
	text_ram wSeerNickname
	text_start
	line "came from @"
	text_ram wSeerOTName
	text_start
	cont "in a trade?"

	para "@"
	text_ram wSeerCaughtLocation
	text_start
	line "was where @"
	text_ram wSeerOTName
	text_start
	cont "met @"
	text_ram wSeerNickname
	text "!"
	prompt

UnknownText_0x1c487f::
	text "What!? Incredible!"

	para "I don't understand"
	line "how, but it is"

	para "incredible!"
	line "You are special."

	para "I can't tell where"
	line "you met it, but it"
	cont "was at level @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Am I good or what?"
	prompt

UnknownText_0x1c491d::
	text "Hey!"

	para "That's an EGG!"

	para "You can't say that"
	line "you've met it yet…"
	done

UnknownText_0x1c4955::
	text "Fufufu! I saw that"
	line "you'd do nothing!"
	done

UnknownText_0x1c497a::
	text "Incidentally…"

	para "It would be wise"
	line "to raise your"

	para "#mon with a"
	line "little more care."
	done

UnknownText_0x1c49c6::
	text "Incidentally…"

	para "It seems to have"
	line "grown a little."

	para "@"
	text_ram wSeerNickname
	text " seems"
	line "to be becoming"
	cont "more confident."
	done

UnknownText_0x1c4a21::
	text "Incidentally…"

	para "@"
	text_ram wSeerNickname
	text " has"
	line "grown. It's gained"
	cont "much strength."
	done

UnknownText_0x1c4a5b::
	text "Incidentally…"

	para "It certainly has"
	line "grown mighty!"

	para "This @"
	text_ram wSeerNickname
	text_start
	line "must have come"

	para "through numerous"
	line "#mon battles."

	para "It looks brimming"
	line "with confidence."
	done

UnknownText_0x1c4ae5::
	text "Incidentally…"

	para "I'm impressed by"
	line "your dedication."

	para "It's been a long"
	line "time since I've"

	para "seen a #mon as"
	line "mighty as this"
	cont "@"
	text_ram wSeerNickname
	text "."

	para "I'm sure that"
	line "seeing @"
	text_ram wSeerNickname
	text_start

	para "in battle would"
	line "excite anyone."
	done

UnknownText_0x1c4b92::
	text "Congratulations!"
	line "Your @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

UnknownText_0x1c4baf::
	text_start

	para "evolved into"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

UnknownText_0x1c4bc5::
	text "Huh? @"
	text_ram wStringBuffer2
	text_start
	line "stopped evolving!"
	prompt

UnknownText_0x1c4be3::
	text "What? @"
	text_ram wStringBuffer2
	text_start
	line "is evolving!"
	done

UnknownText_0x1c4bfd::
	text "How many?"
	done

AlreadyHaveTMText::
	text "You already have"
	line "that TM."
	done

UnknownText_0x1c4c08::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(s)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4c28::
	text "Hello, dear."

	para "I sell inexpensive"
	line "herbal medicine."

	para "They're good, but"
	line "a trifle bitter."

	para "Your #mon may"
	line "not like them."

	para "Hehehehe…"
	done

UnknownText_0x1c4ca3::
	text "How many?"
	done

UnknownText_0x1c4cae::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(s)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4cce::
	text "Thank you, dear."
	line "Hehehehe…"
	done

UnknownText_0x1c4cea::
	text "Oh? Your PACK is"
	line "full, dear."
	done

UnknownText_0x1c4d08::
	text "Hehehe… You don't"
	line "have the money."
	done

UnknownText_0x1c4d2a::
	text "Come again, dear."
	line "Hehehehe…"
	done

UnknownText_0x1c4d47::
	text "Hiya! Care to see"
	line "some bargains?"

	para "I sell rare items"
	line "that nobody else"

	para "carries--but only"
	line "one of each item."
	done

UnknownText_0x1c4db0::
	text_ram wStringBuffer2
	text " costs"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Want it?"
	done

UnknownText_0x1c4dcd::
	text "Thanks."
	done

UnknownText_0x1c4dd6::
	text "Uh-oh, your PACK"
	line "is chock-full."
	done

UnknownText_0x1c4df7::
	text "You bought that"
	line "already. I'm all"
	cont "sold out of it."
	done

UnknownText_0x1c4e28::
	text "Uh-oh, you're"
	line "short on funds."
	done

UnknownText_0x1c4e46::
	text "Come by again"
	line "sometime."
	done

UnknownText_0x1c4e5f::
	text "What's up? Need"
	line "some medicine?"
	done

UnknownText_0x1c4e7e::
	text "How many?"
	done

UnknownText_0x1c4e89::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(s)"
	line "will cost ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4eab::
	text "Thanks much!"
	done

UnknownText_0x1c4eb9::
	text "You don't have any"
	line "more space."
	done

UnknownText_0x1c4ed8::
	text "Huh? That's not"
	line "enough money."
	done

UnknownText_0x1c4ef6::
	text "All right."
	line "See you around."
	done

UnknownText_0x1c4f12::
	text "You don't have"
	line "anything to sell."
	prompt

UnknownText_0x1c4f33::
	text "How many?"
	done

UnknownText_0x1c4f3e::
	text "I can pay you"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Is that OK?"
	done

UnknownText_0x1c4f62::
	text "Welcome! How may I"
	line "help you?"
	done

UnknownText_0x1c4f80::
	text "Here you are."
	line "Thank you!"
	done

UnknownText_0x1c4f9a::
	text "You don't have"
	line "enough money."
	done

UnknownText_0x1c4fb7::
	text "You can't carry"
	line "any more items."
	done

UnknownText_0x1c4fd7::
	text "Sorry, I can't buy"
	line "that from you."
	prompt

UnknownText_0x1c4ff9::
	text "Please come again!"
	done

UnknownText_0x1c500d::
	text "Can I do anything"
	line "else for you?"
	done

UnknownText_0x1c502e::
	text "Got ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " for"
	line "@"
	text_ram wStringBuffer2
	text "(s)."
	done

UnknownText_0x1c5049::
	text "Bet how many"
	line "coins?"
	done

UnknownText_0x1c505e::
	text "Start!"
	done

UnknownText_0x1c5066::
	text "Not enough"
	line "coins."
	prompt

UnknownText_0x1c5079::
	text "Darn… Ran out of"
	line "coins…"
	done

UnknownText_0x1c5092::
	text "Play again?"
	done

UnknownText_0x1c509f::
	text "lined up!"
	line "Won @"
	text_ram wStringBuffer2
	text " coins!"
	done

UnknownText_0x1c50bb::
	text "Darn!"
	done

_MobileStadiumEntryText::
	text "Data for use in"
	line "the MOBILE STADIUM"

	para "of the N64 #mon"
	line "STADIUM 2 can be"
	cont "read here."

	para "Read the data?"
	done

_MobileStadiumSuccessText::
	text "Data transfer is"
	line "complete."

	para "We hope you enjoy"
	line "MOBILE STADIUM"

	para "battles in the N64"
	line "#mon STADIUM 2."

	para ""
	done

UnknownText_0x1c5182::
	text "Clock time unknown"
	done

UnknownText_0x1c5196::
	text "Delete the saved"
	line "LOG-IN PASSWORD?"
	done

UnknownText_0x1c51b9::
	text "Deleted the LOG-IN"
	line "PASSWORD."
	done

UnknownText_0x1c51d7::
	text "Pick three #mon"
	line "for battle."
	prompt

UnknownText_0x1c51f4::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " and"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Use these three?"
	done

UnknownText_0x1c521c::
	text "Only three #mon"
	line "may enter."
	prompt

UnknownText_0x1c5238::
	text "The CARD FOLDER"
	line "stores your and"

	para "your friends'"
	line "CARDS."

	para "A CARD contains"
	line "information like"

	para "the person's name,"
	line "phone number and"
	cont "profile."

	para ""
	done

UnknownText_0x1c52bc::
	text "This is your CARD."

	para "Once you've"
	line "entered your phone"

	para "number, you can"
	line "trade CARDS with"
	cont "your friends."

	para ""
	done

UnknownText_0x1c531e::
	text "If you have your"
	line "friend's CARD, you"

	para "can use it to make"
	line "a call from a"

	para "mobile phone on"
	line "the 2nd floor of a"
	cont "#mon CENTER."

	para ""
	done

UnknownText_0x1c5394::
	text "To safely store"
	line "your collection of"

	para "CARDS, you must"
	line "set a PASSCODE for"
	cont "your CARD FOLDER."

	para ""
	done

UnknownText_0x1c53ee::
	text "If the CARD FOLDER"
	line "is deleted, all"

	para "its CARDS and the"
	line "PASSCODE will also"
	cont "be deleted."

	para "Beware--a deleted"
	line "CARD FOLDER can't"
	cont "be restored."

	para "Want to delete"
	line "your CARD FOLDER?"
	done

UnknownText_0x1c5494::
	text "Are you sure you"
	line "want to delete it?"
	done

UnknownText_0x1c54b9::
	text "The CARD FOLDER"
	line "has been deleted."

	para ""
	done

UnknownText_0x1c54dd::
	text "There is an older"
	line "CARD FOLDER from a"
	cont "previous journey."

	para "Do you want to"
	line "open it?"
	done

UnknownText_0x1c552d::
	text "Delete the old"
	line "CARD FOLDER?"
	done

UnknownText_0x1c554a::
	text "Finish registering"
	line "CARDS?"
	done

UnknownText_0x1c5565::
	text "Huh? Sorry, wrong"
	line "number!"
	done

UnknownText_0x1c5580::
	text "Click!"
	done

UnknownText_0x1c5588::
	text "<……>"
	done

UnknownText_0x1c558b::
	text "That number is out"
	line "of the area."
	done

UnknownText_0x1c55ac::
	text "Just go talk to"
	line "that person!"
	done

UnknownText_0x1c55ca::
	text "Thank you!"
	done

UnknownText_0x1c55d6::
	text "  :"
	done

UnknownText_0x1c55db::
	text "Select Continue &"
	line "reset settings."
	prompt

UnknownText_0x1c560b::
	text "Wrong password!"
	prompt

UnknownText_0x1c561c::
	text "Reset the clock?"
	done

UnknownText_0x1c562e::
	text "Please enter the"
	line "password."
	done

UnknownText_0x1c564a::
	text "Clear all save"
	line "data?"
	done

UnknownText_0x1c5660::
	text_ram wMonOrItemNameBuffer
	text " learned"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5678::
	text "Which move should"
	next "be forgotten?"
	done

UnknownText_0x1c5699::
	text "Stop learning"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c56af::
	text_ram wMonOrItemNameBuffer
	text_start
	line "did not learn"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c56c9::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "trying to learn"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "But @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "can't learn more"
	cont "than four moves."

	para "Delete an older"
	line "move to make room"
	cont "for @"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c5740::
	text "1, 2 and…@"
	text_pause
	text_end

	text_end ; unused

UnknownText_0x1c574e::
	text " Poof!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " forgot"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "And…"
	prompt

UnknownText_0x1c5772::
	text "HM moves can't be"
	line "forgotten now."
	prompt

UnknownText_0x1c5793::
	text "Play with three"
	line "coins?"
	done

UnknownText_0x1c57ab::
	text "Not enough coins…"
	prompt

UnknownText_0x1c57be::
	text "Choose a card."
	done

UnknownText_0x1c57ce::
	text "Place your bet."
	done

UnknownText_0x1c57df::
	text "Want to play"
	line "again?"
	done

UnknownText_0x1c57f4::
	text "The cards have"
	line "been shuffled."
	prompt

UnknownText_0x1c5813::
	text "Yeah!"
	done

UnknownText_0x1c581a::
	text "Darn…"
	done

UnknownText_0x1c5821::
	text_today
	text_end

	text_end ; unused

UnknownText_0x1c5824::
	text "<……>"
	done

UnknownText_0x1c5827::
	text "You're out of the"
	line "service area."
	prompt

UnknownText_0x1c5847::
	text "Whom do you want"
	line "to call?"
	done

UnknownText_0x1c5862::
	text "Press any button"
	line "to exit."
	done

UnknownText_0x1c587d::
	text "Delete this stored"
	line "phone number?"
	done

UnknownText_0x1c589f::
	text "Which prize would"
	line "you like?"
	done

UnknownText_0x1c58bc::
	text_ram wStringBuffer1
	text "?"
	line "Is that right?"
	done

UnknownText_0x1c58d1::
	text "Here you go!"

	para ""
	done

UnknownText_0x1c58e0::
	text "You don't have"
	line "enough points."

	para ""
	done

UnknownText_0x1c58ff::
	text "You have no room"
	line "for it."

	para ""
	done

UnknownText_0x1c591a::
	text "Oh. Please come"
	line "back again!"
	done

UnknownText_0x1c5937::
	text "Excuse me!"

	para ""
	done

Text_ExcuseMeYoureNotReady::
	text "Excuse me."
	line "You're not ready."

	para ""
	done

UnknownText_0x1c5962::
	text "Please return when"
	line "you're ready."
	done

_NeedAtLeastThreeMonText::
	text "You need at least"
	line "three #mon."

	para ""
	done

_EggDoesNotQualifyText::
	text "Sorry, an EGG"
	line "doesn't qualify."

	para ""
	done

_OnlyThreeMonMayBeEnteredText::
	text "Only three #mon"
	line "may be entered."

	para ""
	done

_TheMonMustAllBeDifferentKindsText::
	text "The @"
	text_ram wStringBuffer2
	text " #mon"
	line "must all be"
	cont "different kinds."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "The @"
	text_ram wStringBuffer2
	text " #mon"
	line "must not hold the"
	cont "same items."

	para ""
	done

_YouCantTakeAnEggText::
	text "You can't take an"
	line "Egg!"

	para ""
	done

UnknownText_0x1c5a5a::
	text "It dodged the"
	line "thrown Ball!"

	para "This #mon"
	line "can't be caught!"
	prompt

UnknownText_0x1c5a90::
	text "You missed the"
	line "#mon!"
	prompt

UnknownText_0x1c5aa6::
	text "Oh no! The #mon"
	line "broke free!"
	prompt

UnknownText_0x1c5ac3::
	text "Aww! It appeared"
	line "to be caught!"
	prompt

UnknownText_0x1c5ae3::
	text "Aargh!"
	line "Almost had it!"
	prompt

UnknownText_0x1c5afa::
	text "Shoot! It was so"
	line "close too!"
	prompt

UnknownText_0x1c5b17::
	text "Gotcha! @"
	text_ram wEnemyMonNick
	text_start
	line "was caught!@"
	sound_caught_mon
	text_end

	text_end ; unused

Text_Waitbutton_2::
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5b38::
	text_ram wMonOrItemNameBuffer
	text " was"
	line "sent to the ADS."
	prompt

UnknownText_0x1c5b53::
	text_ram wEnemyMonNick
	text "'s data"
	line "was recorded in"
	cont "the Journal.@"
	sound_slot_machine_start
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5b7f::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c5b9a::
	text_ram wStringBuffer1
	text "'s"
	line "@"
	text_ram wStringBuffer2
	text " rose."
	prompt

UnknownText_0x1c5bac::
	text "That can't be used"
	line "on this #mon."
	prompt

Text_RepelUsedEarlierIsStillInEffect::
	text "The Repel used"
	line "earlier is still"
	cont "in effect."
	prompt

UnknownText_0x1c5bf9::
	text "Played the #"
	line "Flute."

	para "Now, that's a"
	line "catchy tune!"
	prompt

UnknownText_0x1c5c28::
	text "All sleeping"
	line "#mon woke up."
	prompt

UnknownText_0x1c5c44::
	text "<PLAYER> played the"
	line "# FLUTE.@"
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5c5e::
	text "You now have"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " points."
	done

UnknownText_0x1c5c7b::
	text "Coins:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unused

Text_RaiseThePPOfWhichMove::
	text "Raise the PP of"
	line "which move?"
	done

Text_RestoreThePPOfWhichMove::
	text "Restore the PP of"
	line "which move?"
	done

Text_PPIsMaxedOut::
	text_ram wStringBuffer2
	text "'s PP"
	line "is maxed out."
	prompt

Text_PPsIncreased::
	text_ram wStringBuffer2
	text "'s PP"
	line "increased."
	prompt

UnknownText_0x1c5cf1::
	text "PP was restored."
	prompt

UnknownText_0x1c5d03::
	text "There was a trophy"
	line "inside!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " sent the"
	line "trophy home."
	prompt

UnknownText_0x1c5d3e::
	text "It looks bitter…"
	prompt

UnknownText_0x1c5d50::
	text "That can't be used"
	line "on an Egg."
	prompt

UnknownText_0x1c5d6e::
	text "Granny: <PLAYER>!"
	line "Are you certain it"
	cont "is a good time for"
	cont "that?"
	prompt

UnknownText_0x1c5d97::
	text "That belongs to"
	line "someone else!"
	prompt

UnknownText_0x1c5db6::
	text "It won't have any"
	line "effect."
	prompt

UnknownText_0x1c5dd0::
	text "The trainer"
	line "blocked the Ball!"
	prompt

UnknownText_0x1c5def::
	text "Don't be a thief!"
	prompt

UnknownText_0x1c5e01::
	text "Cycling isn't"
	line "allowed here."
	prompt

UnknownText_0x1c5e1d::
	text "Can't get on your"
	line "@"
	text_ram wStringBuffer1
	text " now."
	prompt

UnknownText_0x1c5e3a::
	text "The #mon Box"
	line "is full. That"
	cont "can't be used now."
	prompt

UnknownText_0x1c5e68::
	text "<PLAYER> used the@"
	text_low
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c5e7b::
	text "<PLAYER> got on the@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5e90::
	text "<PLAYER> got off@"
	text_low
	text "the @"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5ea8::
	text_ram wStringBuffer1
	text " knows"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5eba::
	text "That #mon knows"
	line "only one move."
	done

UnknownText_0x1c5eda::
	text "Oh, make it forget"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c5ef5::
	text "Done! Your #mon"
	line "forgot the move."
	done

UnknownText_0x1c5f17::
	text "An Egg doesn't"
	line "know any moves!"
	done

UnknownText_0x1c5f36::
	text "No? Come visit me"
	line "again."
	done

UnknownText_0x1c5f50::
	text "Which move should"
	line "it forget, then?"
	prompt

UnknownText_0x1c5f74::
	text "Um… Oh, yes, I'm"
	line "the Move Deleter."

	para "I can make #mon"
	line "forget moves."

	para "Shall I make a"
	line "#mon forget?"
	done

UnknownText_0x1c5fd1::
	text "Which #mon?"
	prompt

Text_DSTIsThatOK::
	text " DST,"
	line "is that OK?"
	done

UnknownText_0x1c5ff1::
	text ","
	line "is that OK?"
	done

UnknownText_0x1c6000::
	text "Do you want to"
	line "switch to Daylight"
	cont "Saving Time?"
	done

UnknownText_0x1c6030::
	text "I set the clock"
	line "forward by one"
	cont "hour."
	prompt

UnknownText_0x1c6056::
	text "Is Daylight Saving"
	line "Time over?"
	done

UnknownText_0x1c6075::
	text "I put the clock"
	line "back one hour."
	prompt

UnknownText_0x1c6095::
	text "Do you want to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time?"
	done

UnknownText_0x1c60d1::
	text "I lost the in-"
	line "struction booklet"
	cont "for the Watch."

	para "Come back again in"
	line "a while."
	prompt

ShadyShop_IntroText::
	text "Hey."

	para "Want some"
	line "evolution items?"
	cont "Hard to come by"

	para "in these parts."
	line "Some come from"
	cont "other regions."
	done

ShadyShop_DontTellText::
	text "Don't tell the"
	line "cops. They're not"
	cont "exactly fans of"

	para "us here."
	done

ShadyShop_HowManyText::
	text "How many ya"
	line "want?"
	done

ShadyShop_CostsThisMuchText::
	text "Not the cheapest"
	line "stuff to get."
	cont "This'll cost ya"

	para "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Alright?"
	done

ShadyShop_InsufficientFundsText::
	text "Sorry, I can't"
	line "give credit. Come"
	cont "back when you're a"

	para "little, mm richer."
	done

ShadyShop_BagFullText::
	text "No room there,"
	line "stranger."
	done

ShadyShop_HereYouGoText::
	text "Thanks, stranger."
	done

TMSShop_IntroText::
	text "Welcome!"

	para "We've got some"
	line "good TMs on sale"
	cont "here! Want a few?"
	done

TMSShop_ComeAgainText::
	text "Come again!"
	done

TMSShop_InsufficientFundsText::
	text "I'm afraid you do"
	line "have enough for"
	cont "this purchase."
	done

TMSShop_BagFullText::
	text "Whoops!"

	para "Your bag is full!"
	done

TMSShop_HereYouGoText::
	text "Here you go!"
	done

BallsShop_IntroText::
	text "Welcome!"

	para "Want some special"
	line "# Balls?"

	para "My father used to"
	line "make them!"
	done

BallsShop_ComeAgainText::
	text "Come again!"
	done

BallsShop_InsufficientFundsText::
	text "I'm afraid you do"
	line "have enough for"
	cont "this purchase."
	done

BallsShop_BagFullText::
	text "Whoops!"

	para "Your bag is full!"
	done

BallsShop_HereYouGoText::
	text "Here you go!"
	done

_WarnVBAText::
	text "Please use a more"
	line "accurate emulator."
	done

_HiddenPowerGuyQuestion::
	text "Would you like to"
	line "know what Hidden"
	cont "Power your"
	cont "#mon has?"
	done

_HiddenPowerGuyWhichMon::
	text "Which #mon?"
	done

_HiddenPowerGuyEgg::
	text "That's an Egg…"
	done

_HiddenPowerGuyCancel::
	text "…Fine then…"
	done

_HiddenPowerGuyNoMon::
	text "How can I tell"
	line "what Hidden Power"
	cont "your #mon has,"

	para "if you have no"
	line "#mon?"
	done

_HiddenPowerGuyAnswer::
	text "…Hm, yes…"

	para "Its Hidden Power"
	line "is @"
	text_ram wStringBuffer1
	text "-type!"
	done

_TurnedOffExpShareText::
	text "The Exp.Share was"
	line "turned off."
	prompt

_TurnedOnExpShareText::
	text "The Exp.Share was"
	line "turned on."
	prompt

DramaticShowText::
	text "Woman: Please!"
	line "don't go!"

	para "Man: I'm sorry,"
	line "honey…"

	para "I have to."

	para "Woman: No you"
	line "don't! We can stay"
	cont "here together!"

	para "We can start a"
	line "family and live"
	cont "happily!"

	para "Man: We can't. Not"
	line "yet. Our country's"
	cont "under attack."

	para "I've been called to"
	line "defend it."

	para "Woman: I know,"
	line "but…"

	para "Man: Don't worry,"
	line "I'll be back once"
	cont "we win the war."

	para "The man turned"
	line "away, tears in his"
	cont "eyes."

	para "She drops to her"
	line "knees, sobbing."

	para "Little do they"
	line "know, this will be"
	cont "the last time they"
	cont "see each other."

	para "She was left to"
	line "take care of their"
	cont "unborn child,"
	cont "alone."

	para "The End."
	done

WhatSwarmTodayText::
	text "Hello everyone!"

	para "Welcome to the"
	line "Swarm Channel!"

	para "Will there be a"
	line "swarm in Johto"
	cont "today?"

	para "Let's find out!"
	done

NoSwarmTodayText::
	text "………………………"

	para "Bad luck,"
	line "trainers…"

	para "No #mon are"
	line "swarming today…"

	para "Better luck"
	line "tomorrow!"
	done

RouteSwarmText::
	text "………………………"
	
	para "Ah!"

	para "On @"
	text_ram wStringBuffer5
	text ","
	line "there is a swarm"
	cont "of @"
	text_ram wStringBuffer3
	text "!"

	para "Now's your chance,"
	line "trainers!"

	para "Head to @"
	text_ram wStringBuffer5
	text ","
	line "and catch a"
	cont "@"
	text_ram wStringBuffer3
	text "!"
	done

CaveSwarmText::
	text "………………………"
	
	para "Ah!"

	para "In @"
	text_ram wStringBuffer5
	text ","
	line "there is a swarm"
	cont "of @"
	text_ram wStringBuffer3
	text "!"

	para "Now's your chance,"
	line "trainers!"

	para "Head over to"
	line "@"
	text_ram wStringBuffer5
	text ","
	cont "and catch a"
	cont "@"
	text_ram wStringBuffer3
	text "!"
	done

CaveSwarmVowelText::
	text "………………………"
	
	para "Ah!"

	para "In @"
	text_ram wStringBuffer5
	text ","
	line "there is a swarm"
	cont "of @"
	text_ram wStringBuffer3
	text "!"

	para "Now's your chance,"
	line "trainers!"

	para "Head over to"
	line "@"
	text_ram wStringBuffer5
	text ","
	cont "and catch an"
	cont "@"
	text_ram wStringBuffer3
	text "!"
	done

LakeOfRageSwarmText::
	text "………………………"
	
	para "Ah!"

	para "At Lake of Rage,"
	line "there is a swarm"
	cont "Kotora!"

	para "Now's your chance,"
	line "trainers!"

	para "Head to the Lake"
	line "of Rage and catch"
	cont "a Kotora!"
	done

PinsirSwarmText::
	text "………………………"

	para "Ah!"

	para "In the National"
	line "Forest, there is"
	cont "a swarm of"
	cont "Pinsir!"

	para "Now's your chance,"
	line "trainers!"

	para "Head to National"
	line "Forest and catch a"
	cont "Pinsir!"
	done

ThatsAllFolksText::
	text "Tune in tomorrow"
	line "for another swarm"
	cont "update!"
	done

LullabyText::
	text "Having trouble"
	line "falling asleep?"

	para "Have any children"
	line "or #mon that"
	cont "need to sleep?"

	para "We've got the"
	line "music for you!"

	para "Keep our channel"
	line "on, and you'll"
	cont "feel your worries"

	para "just wash away!"
	done

VillainousText::
	text "Villain: Wahaha!"

	para "Soon, all the"
	line "world's cheeses"
	cont "will be mine!"

	para "Hero: Not so fast,"
	line "Meowth Burglar!"

	para "MB: Ah! I should"
	line "have known you'd"
	cont "show up, Growlithe"
	cont "Man!"

	para "Come to spoil my"
	line "party, have you?"

	para "GM: I always do."

	para "Now, go Growlithe!"
	line "Use Flamethrower!"

	para "MB: Hah! Meowth,"
	line "use Hydro Pump!"

	para "Growlithe was hit"
	line "by Hydro Pump and"
	cont "fainted!"

	para "GM: What! Meowth"
	line "can't learn that"
	cont "move!"

	para "MB: Hahaha! This"
	line "new Meowth of mine"
	cont "is quite special!"

	para "Had it made just"
	line "to get rid of you!"

	para "GM: Made? What do"
	line "you mean you"
	cont "villain?!"

	para "MB: A professional"
	line "doesn't reveal his"
	cont "secrets!"

	para "Later, loser!"

	para "Meowth Burglar"
	line "escapes in a hot"
	cont "air balloon shaped"
	cont "like a Meowth!"

	para "How did the Meowth"
	line "know Hydro Pump?"

	para "How will Growlithe"
	line "Man recover the"
	cont "cheese?"

	para "Tune in next time"
	line "to find out!"
	done

TuneInNextTimeText::
	text "Tune in next time"
	line "for more great"
	cont "entertainment!"
	done

WelcomeToPokemonTalk::
	text "Welcome to Prof."
	line "Oak's #mon"
	cont "Talk!"

	para "On this show, we"
	line "talk about rare"
	cont "#mon that can"
	cont "be found in the"
	cont "Johto and Kanto"
	cont "regions!"
	done

SkarminiOakText::
	text "Skarmini is quite"
	line "an interesting"
	cont "specimin."

	para "Found on Route 45,"
	line "Skarmini evolves"

	para "into Skarmory,"
	line "the Armor Bird"
	cont "#mon."

	para "It is flightless,"
	line "and continues to"
	cont "improve its wings"

	para "by brushing them"
	line "up against"
	cont "bramble."

	para "The existence of"
	line "this #mon was"
	cont "only recently"
	cont "discovered."

	para "Perhaps someday"
	line "species will no"
	cont "longer require"
	cont "this earlier form"
	cont "to survive."
	done

CyndaquilOakText::
	text "Cyndaquil, found"
	line "in Dark Cave, is"
	cont "a Fire-type that"
	cont "sprouts fire from"
	cont "its back."

	para "It evolves into"
	line "Quilava, and again"
	cont "into Typhlosion."

	para "Typhlosion gains"
	line "the Ground Type"
	cont "upon evolution."

	para "It lights up the"
	line "portion of Dark"
	cont "Cave it is in."
	done

ChikoritaOakText::
	text "Chikorita can be"
	line "found on Route 43,"
	cont "even in the"
	cont "current snow."

	para "It evolves into"
	line "Bayleef, and again"
	cont "into Meganium."

	para "Meganium gains the"
	line "Fairy Type upon"
	cont "evolution."

	para "The plants around"
	line "their bodies make"
	cont "pleasant odors,"

	para "making them great"
	line "to have around the"
	cont "house."
	done

TotodileOakText::
	text "Totodile can be"
	line "found on Route 43."

	para "It evolves into"
	line "Croconaw, and"
	cont "again into"
	cont "Feraligatr."

	para "Feraligatr gains"
	line "the Dark Type upon"
	cont "evolution."

	para "The Totodile line"
	line "has a strong bite,"

	para "so don't put your"
	line "hands or head into"
	cont "their mouths!"

	para "Trust me, I've"
	line "learned from"
	cont "experience!"
	done

CroagunkOakText::
	text "Croagunk can be"
	line "found at the Lake"
	cont "of Rage."

	para "Croagunk evolves"
	line "into Toxicroak."

	para "Croagunk is native"
	line "to the Sinnoh"
	cont "region."

	para "The poison sacs on"
	line "their cheeks can"
	cont "be inflated with"

	para "posion, which is"
	line "then spat up on"
	cont "its foes."

	para "It's quite the"
	line "nasty surprise!"
	done

ElectrikeOakText::
	text "Electrike can be"
	line "found at the Lake"
	cont "of Rage."

	para "Electrike evolves"
	line "into Manectric."

	para "Electrike are"
	line "native to Hoenn,"
	cont "not Johto."

	para "When they gather,"
	line "thunderstorms tend"
	cont "to form near."

	para "Don't go near"
	line "them with anything"
	cont "metal!"

	para "You'll be in for"
	line "a shock!"
	done

CantUsePokeBallMessageTextFar::
	text "You can't use a"
	line "Ball in a solo"
	cont "run!"
	prompt
