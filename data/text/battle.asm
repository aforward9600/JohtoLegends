BattleText:: ; used only for BANK(BattleText)

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER> picked up"
	line "¥@"
	text_decimal wPayDayMoney, 3, 6
	text "!"
	prompt

WildPokemonAppearedText:
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "appeared!"
	prompt

HookedPokemonAttackedText:
	text "The hooked"
	line "@"
	text_ram wEnemyMonNick
	text_start
	cont "attacked!"
	prompt

PokemonFellFromTreeText:
	text_ram wEnemyMonNick
	text " fell"
	line "out of the tree!"
	prompt

WildCelebiAppearedText:
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "appeared!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "wants to battle!"
	prompt

BattleText_WildFled:
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "fled!"
	prompt

BattleText_EnemyFled:
	text "Foe @"
	text_ram wEnemyMonNick
	text_start
	line "fled!"
	prompt

HurtByPoisonText:
	text "<USER>"
	line "is hurt by poison!"
	prompt

HurtByBurnText:
	text "<USER>'s"
	line "hurt by its burn!"
	prompt

LeechSeedSapsText:
	text "Leech Seed saps"
	line "<USER>!"
	prompt

HasANightmareText:
	text "<USER>"
	line "has a Nightmare!"
	prompt

HurtByCurseText:
	text "<USER>'s"
	line "hurt by the Curse!"
	prompt

SandstormHitsText:
	text "The Sandstorm hits"
	line "<USER>!"
	prompt

HailBuffetsText:
	text "The Hail hits"
	line "<USER>!"
	prompt

PerishCountText:
	text "<USER>'s"
	line "Perish count is @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

BattleText_TargetRecoveredWithItem:
	text "<TARGET>"
	line "recovered with"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "recovered PP using"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_TargetWasHitByFutureSight:
	text "<TARGET>"
	line "was hit by Future"
	cont "Sight!"
	prompt

BattleText_SafeguardFaded:
	text "<USER>'s"
	line "Safeguard faded!"
	prompt

BattleText_MonsLightScreenFell:
	text_ram wStringBuffer1
	text " #mon's"
	line "Light Screen fell!"
	prompt

BattleText_MonsReflectFaded:
	text_ram wStringBuffer1
	text " #mon's"
	line "Reflect faded!"
	prompt

BattleText_RainContinuesToFall:
	text "Rain continues to"
	line "fall."
	prompt

BattleText_TheSunlightIsStrong:
	text "The sunlight is"
	line "strong."
	prompt

BattleText_TheSandstormRages:
	text "The Sandstorm"
	line "rages."
	prompt

BattleText_HailContinues:
	text "The Hail storm"
	line "continues."
	prompt

BattleText_TheRainStopped:
	text "The rain stopped."
	prompt

BattleText_TheSunlightFaded:
	text "The sunlight"
	line "faded."
	prompt

BattleText_TheSandstormSubsided:
	text "The Sandstorm"
	line "subsided."
	prompt

BattleText_HailEnds:
	text "The Hail storm"
	line "subsided."
	prompt

BattleText_EnemyMonFainted:
	text "Foe @"
	text_ram wEnemyMonNick
	text_start
	line "fainted!"
	prompt

GotMoneyForWinningText:
	text "<PLAYER> got ¥@"
	text_decimal wBattleReward, 3, 6
	text_start
	line "for winning!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "was defeated!"
	prompt

TiedAgainstText:
	text "Tied against"
	line "<ENEMY>!"
	prompt

SentSomeToMomText:
	text "<PLAYER> got ¥@"
	text_decimal wBattleReward, 3, 6
	text_start
	line "for winning!"
	cont "Sent some to MOM!"
	prompt

SentHalfToMomText:
	text "Sent half to MOM!"
	prompt

SentAllToMomText:
	text "Sent all to MOM!"
	prompt

BattleText_0x80a4f:
	text "<RIVAL>: Huh? I"
	line "should've chosen"
	cont "your #mon!"
	prompt

BattleText_MonFainted:
	text_ram wBattleMonNick
	text_start
	line "fainted!"
	prompt

BattleText_UseNextMon:
	text "Use next #mon?"
	done

LostAgainstText:
	text "Lost against"
	line "<ENEMY>!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerChangeMon:
	text "<ENEMY>"
	line "is about to use"
	cont "@"
	text_ram wEnemyMonNick
	text "."

	para "Will <PLAYER>"
	line "change #mon?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "sent out"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	done

BattleText_TheresNoWillToBattle:
	text "There's no will to"
	line "battle!"
	prompt

BattleText_AnEGGCantBattle:
	text "An Egg can't"
	line "battle!"
	prompt

BattleText_CantEscape2:
	text "Can't escape!"
	prompt

BattleText_TheresNoEscapeFromTrainerBattle:
	text "No! There's no"
	line "running from a"
	cont "trainer battle!"
	prompt

BattleText_GotAwaySafely:
	text "Got away safely!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "<USER>"
	line "fled using a"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_CantEscape:
	text "Can't escape!"
	prompt

BattleText_UserHurtBySpikes:
	text "<USER>'s"
	line "hurt by Spikes!"
	prompt

RecoveredUsingText:
	text "<TARGET>"
	line "recovered with its"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

PinchBerryText:
	text "<USER>"
	line "consumed its"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "activated!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Items can't be"
	line "used right now."
	prompt

BattleText_MonIsAlreadyOut:
	text_ram wBattleMonNick
	text_start
	line "is already out."
	prompt

BattleText_MonCantBeRecalled:
	text_ram wBattleMonNick
	text_start
	line "can't be recalled!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "There's no PP left"
	line "for this move!"
	prompt

BattleText_TheMoveIsDisabled:
	text "The move is"
	line "Disabled!"
	prompt

BattleText_MonHasNoMovesLeft:
	text_ram wBattleMonNick
	text_start
	line "has no moves left!"
	done

BattleText_TargetsEncoreEnded:
	text "<TARGET>'s"
	line "Encore ended!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text_ram wStringBuffer1
	text " grew to"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	text_end

BattleText_WildMonIsEating:
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "is eating!"
	prompt

BattleText_WildMonIsAngry:
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "is angry!"
	prompt

FastAsleepText:
	text "<USER>"
	line "is fast asleep!"
	prompt

WokeUpText:
	text "<USER>"
	line "woke up!"
	prompt

FrozenSolidText:
	text "<USER>"
	line "is frozen solid!"
	prompt

FlinchedText:
	text "<USER>"
	line "flinched!"
	prompt

MustRechargeText:
	text "<USER>"
	line "must recharge!"
	prompt

DisabledNoMoreText:
	text "<USER>'s"
	line "disabled no more!"
	prompt

IsConfusedText:
	text "<USER>"
	line "is confused!"
	prompt

HurtItselfText:
	text "It hurt itself in"
	line "its confusion!"
	prompt

ConfusedNoMoreText:
	text "<USER>'s"
	line "confused no more!"
	prompt

BecameConfusedText:
	text "<TARGET>"
	line "became confused!"
	prompt

BattleText_ItemHealedConfusion:
	text "A @"
	text_ram wStringBuffer1
	text " rid"
	line "<TARGET>"
	cont "of its confusion."
	prompt

AlreadyConfusedText:
	text "<TARGET>'s"
	line "already confused!"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text "<USER>'s"
	line "hurt by"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "<USER>"
	line "was released from"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

UsedBindText:
	text "<USER>"
	line "used Bind on"
	cont "<TARGET>!"
	prompt

WhirlpoolTrapText:
	text "<TARGET>"
	line "was trapped!"
	prompt

FireSpinTrapText:
	text "<TARGET>"
	line "was trapped!"
	prompt

WrappedByText:
	text "<TARGET>"
	line "was Wrapped by"
	cont "<USER>!"
	prompt

ClampedByText:
	text "<TARGET>"
	line "was Clamped by"
	cont "<USER>!"
	prompt

HungOnText:
	text "<TARGET>"
	line "hung on with"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "<TARGET>"
	line "Endured the hit!"
	prompt

InLoveWithText:
	text "<USER>"
	line "is in love with"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "<USER>'s"
	line "infatuation kept"
	cont "it from attacking!"
	prompt

DisabledMoveText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer1
	text " is"
	cont "Disabled!"
	prompt

LoafingAroundText:
	text_ram wBattleMonNick
	text " is"
	line "loafing around."
	prompt

BeganToNapText:
	text_ram wBattleMonNick
	text " began"
	line "to nap!"
	prompt

WontObeyText:
	text_ram wBattleMonNick
	text " won't"
	line "obey!"
	prompt

TurnedAwayText:
	text_ram wBattleMonNick
	text " turned"
	line "away!"
	prompt

IgnoredOrdersText:
	text_ram wBattleMonNick
	text " ignored"
	line "orders!"
	prompt

IgnoredSleepingText:
	text_ram wBattleMonNick
	text " ignored"
	line "orders…sleeping!"
	prompt

NoPPLeftText:
	text "But no PP is left"
	line "for the move!"
	prompt

HasNoPPLeftText:
	text "<USER>"
	line "has no PP left for"
	cont "@"
	text_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText:
	text "<USER>"
	line "went to sleep!"
	done

RestedText:
	text "<USER>"
	line "fell asleep and"
	cont "became healthy!"
	done

RegainedHealthText:
	text "<USER>"
	line "regained health!"
	prompt

AttackMissedText:
	text "<USER>'s"
	line "attack missed!"
	prompt

AttackMissed2Text:
	text "<USER>'s"
	line "attack missed!"
	prompt

AvoidStatusText:
	text "<TARGET>"
	line "avoided the"
	cont "attack!"
	prompt

CrashedText:
	text "<USER>"
	line "kept going and"
	cont "crashed!"
	prompt

UnaffectedText:
	text "<TARGET>'s"
	line "unaffected!"
	prompt

DoesntAffectText:
	text "It doesn't affect"
	line "<TARGET>!"
	prompt

CriticalHitText:
	text "A critical hit!"
	prompt

OneHitKOText:
	text "It's a one-hit KO!"
	prompt

SuperEffectiveText:
	text "It's super-"
	line "effective!"
	prompt

NotVeryEffectiveText:
	text "It's not very"
	line "effective…"
	prompt

TookDownWithItText:
	text "<TARGET>"
	line "took down with it,"
	cont "<USER>!"
	prompt

RageBuildingText:
	text "<USER>'s"
	line "Rage is building!"
	prompt

GotAnEncoreText:
	text "<TARGET>"
	line "got an Encore!"
	prompt

SharedPainText:
	text "The battlers"
	line "shared pain!"
	prompt

TookAimText:
	text "<USER>"
	line "took aim!"
	prompt

SketchedText:
	text "<USER>"
	line "Sketched"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

DestinyBondEffectText:
	text "<USER>'s"
	line "trying to take its"
	cont "opponent with it!"
	prompt

SpiteEffectText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer1
	text " was"
	cont "reduced by @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

BellChimedText:
	text "A bell chimed!"
	line ""
	prompt

FellAsleepText:
	text "<TARGET>"
	line "fell asleep!"
	prompt

AlreadyAsleepText:
	text "<TARGET>'s"
	line "already asleep!"
	prompt

WasPoisonedText:
	text "<TARGET>"
	line "was poisoned!"
	prompt

BadlyPoisonedText:
	text "<TARGET>'s"
	line "badly poisoned!"
	prompt

AlreadyPoisonedText:
	text "<TARGET>'s"
	line "already poisoned!"
	prompt

SuckedHealthText:
	text "Sucked health from"
	line "<TARGET>!"
	prompt

DreamEatenText:
	text "<TARGET>'s"
	line "dream was eaten!"
	prompt

WasBurnedText:
	text "<TARGET>"
	line "was burned!"
	prompt

DefrostedOpponentText:
	text "<TARGET>"
	line "was defrosted!"
	prompt

WasFrozenText:
	text "<TARGET>"
	line "was frozen solid!"
	prompt

WontRiseAnymoreText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text " won't"
	cont "rise anymore!"
	prompt

WontDropAnymoreText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2
	text " won't"
	cont "drop anymore!"
	prompt

FledFromBattleText::
	text "<USER>"
	line "fled from battle!"
	prompt

FledInFearText:
	text "<TARGET>"
	line "fled in fear!"
	prompt

BlownAwayText:
	text "<TARGET>"
	line "was blown away!"
	prompt

PlayerHitTimesText:
	text "Hit @"
	text_decimal wPlayerDamageTaken, 1, 1
	text " times!"
	prompt

EnemyHitTimesText:
	text "Hit @"
	text_decimal wEnemyDamageTaken, 1, 1
	text " times!"
	prompt

MistText:
	text "<USER>'s"
	line "shrouded in Mist!"
	prompt

ProtectedByMistText:
	text "<TARGET>'s"
	line "protected by Mist."
	prompt

GettingPumpedText:
	text_pause
	text "<USER>'s"
	line "getting pumped!"
	prompt

RecoilText:
	text "<USER>'s"
	line "hit with recoil!"
	prompt

MadeSubstituteText:
	text "<USER>"
	line "made a Substitute!"
	prompt

HasSubstituteText:
	text "<USER>"
	line "has a Substitute!"
	prompt

TooWeakSubText:
	text "Too weak to make"
	line "a Substitute!"
	prompt

SubTookDamageText:
	text "The Substitute"
	line "took damage for"
	cont "<TARGET>!"
	prompt

SubFadedText:
	text "<TARGET>'s"
	line "Substitute faded!"
	prompt

LearnedMoveText:
	text "<USER>"
	line "learned"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

WasSeededText:
	text "<TARGET>"
	line "was seeded!"
	prompt

EvadedText:
	text "<TARGET>"
	line "evaded the attack!"
	prompt

WasDisabledText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer1
	text " was"
	cont "Disabled!"
	prompt

CoinsScatteredText:
	text "Coins scattered"
	line "everywhere!"
	prompt

TransformedTypeText:
	text "<USER>"
	line "transformed into"
	cont "the @"
	text_ram wStringBuffer1
	text "-type!"
	prompt

EliminatedStatsText:
	text "All stat changes"
	line "were eliminated!"
	prompt

ClearSmogText:
	text "<TARGET>'s"
	line "stats were reset!"
	prompt

TransformedText:
	text "<USER>"
	line "Transformed into"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

LightScreenEffectText:
	text "<USER>'s"
	line "Spcl.Def rose!"
	prompt

ReflectEffectText:
	text "<USER>'s"
	line "Defense rose!"
	prompt

NothingHappenedText:
	text "But nothing"
	line "happened."
	prompt

ButItFailedText:
	text "But it failed!"
	prompt

ItFailedText:
	text "It failed!"
	prompt

DidntAffect1Text:
	text "It didn't affect"
	line "<TARGET>!"
	prompt

DidntAffect2Text:
	text "It didn't affect"
	line "<TARGET>!"
	prompt

HPIsFullText:
	text "<USER>'s"
	line "HP is full!"
	prompt

DraggedOutText:
	text "<USER>"
	line "was dragged out!"
	prompt

ParalyzedText:
	text "<TARGET>'s"
	line "paralyzed! Maybe"
	cont "it can't attack!"
	prompt

FullyParalyzedText:
	text "<USER>'s"
	line "fully paralyzed!"
	prompt

AlreadyParalyzedText:
	text "<TARGET>'s"
	line "already paralyzed!"
	prompt

ProtectedByText:
	text "<TARGET>'s"
	line "protected by"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

MirrorMoveFailedText:
	text "The Mirror Move"
	next "failed!"
	prompt

StoleText:
	text "<USER>"
	line "stole @"
	text_ram wStringBuffer1
	text_start
	cont "from its foe!"
	prompt

CantEscapeNowText:
	text "<TARGET>"
	line "can't escape now!"
	prompt

StartedNightmareText:
	text "<TARGET>"
	line "started to have a"
	cont "Nightmare!"
	prompt

WasDefrostedText:
	text "<USER>"
	line "was defrosted!"
	prompt

PutACurseText:
	text "<USER>"
	line "cut its own HP and"

	para "put a Curse on"
	line "<TARGET>!"
	prompt

ProtectedItselfText:
	text "<USER>"
	line "Protected itself!"
	prompt

ProtectingItselfText:
	text "<TARGET>'s"
	line "Protecting itself!"
	done

SpikesText:
	text "Spikes scattered"
	line "all around"
	cont "<TARGET>!"
	prompt

IdentifiedText:
	text "<USER>"
	line "identified"
	cont "<TARGET>!"
	prompt

StartPerishText:
	text "Both #mon will"
	line "faint in 3 turns!"
	prompt

SandstormBrewedText:
	text "A Sandstorm"
	line "brewed!"
	prompt

HailStartsText:
	text "A Hail Storm"
	line "has started!"
	prompt

BracedItselfText:
	text "<USER>"
	line "braced itself!"
	prompt

FellInLoveText:
	text "<TARGET>"
	line "fell in love!"
	prompt

CoveredByVeilText:
	text "<USER>'s"
	line "covered by a veil!"
	prompt

SafeguardProtectText:
	text "<TARGET>"
	line "is protected by"
	cont "Safeguard!"
	prompt

MagnitudeText:
	text "Magnitude @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

ReleasedByText:
	text "<USER>"
	line "was released by"
	cont "<TARGET>!"
	prompt

ShedLeechSeedText:
	text "<USER>"
	line "shed Leech Seed!"
	prompt

BlewSpikesText:
	text "<USER>"
	line "blew away Spikes!"
	prompt

BrokeReflectText:
	text "<USER>"
	line "broke Reflect!"
	prompt

BrokeLightScreenText:
	text "<USER> broke"
	line "Light Screen!"
	prompt

DownpourText:
	text "A downpour"
	line "started!"
	prompt

SunGotBrightText:
	text "The sunlight got"
	line "bright!"
	prompt

BellyDrumContraryText:
	text "<USER>"
	line "cut its HP and"
	cont "minimized Attack!"
	prompt

StatsCantLowerText:
	text "<TARGET>'s"
	line "stats can't lower"
	cont "any further!"
	prompt

StatsCantRaiseText:
	text "<USER>'s"
	line "stats can't raise"
	cont "any further!"
	prompt

BellyDrumText:
	text "<USER>"
	line "cut its HP and"
	cont "maximized Attack!"
	prompt

CopiedStatsText:
	text "<USER>"
	line "copied the stat"

	para "changes of"
	line "<TARGET>!"
	prompt

ForesawAttackText:
	text "<USER>"
	line "foresaw an attack!"
	prompt

BeatUpAttackText:
	text_ram wStringBuffer1
	text "'s"
	line "attack!"
	done

RefusedGiftText:
	text "<TARGET>"
	line "refused the gift!"
	prompt

IgnoredOrders2Text:
	text "<USER>"
	line "ignored orders!"
	prompt

BattleText_LinkErrorBattleCanceled:
	text "Link error…"

	para "The battle has"
	line "been canceled…"
	prompt

BattleText_0x8188e:
	text "There is no time"
	line "left today!"
	done

SurroundedByWaterText:
	text "<USER> has"
	line "surrounded itself"

	para "with a veil of"
	line "water!"
	prompt

RecoveredWithSomethingText:
	text "<USER>"
	line "recovered with"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

AlreadyBurnedText:
	text "<TARGET>'s"
	line "already burned!"
	prompt

AlreadyFrozenText:
	text "<TARGET>'s"
	line "already frozen!"
	prompt

KnockedOffItemText:
	text "<USER>"
	line "knocked off"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserLostSomeOfItsHP:
	text "<USER>"
	line "lost some of its"
	cont "HP!"
	prompt

TeleportOutText:
	text "<USER>"
	line "teleported away!"
	prompt

UTurnOutPlayerText:
	text "<USER>"
	line "returned to"
	cont "<PLAYER>!"
	prompt

UTurnOutEnemyText:
	text "<USER>"
	line "returned to"
	cont "<ENEMY>!"
	prompt

TeleportInText:
	text "<USER>"
	line "took its place!"
	prompt

ToxicOrbText:
	text "<TARGET> was"
	line "badly poisoned by"
	cont "its Toxic Orb!"
	prompt

FlameOrbText:
	text "<TARGET> was"
	line "burned by its"
	cont "Flame Orb!"
	prompt

AirBalloonText:
	text "<TARGET>'s Air"
	line "Balloon lets it"
	cont "float!"
	prompt

AirBalloonPoppedText:
	text "<TARGET>'s Air"
	line "Balloon popped!"
	prompt

IntimidateText:
	text "<USER>'s"
	line "Intimidate lowered"
	cont "<TARGET>'s"
	cont "Attack!"
	prompt

MoxieText:
	text "<USER>'s"
	line "Moxie raised"
	cont "its Attack!"
	prompt

IntimidateContraryText:
	text "<USER>'s"
	line "Intimidate raised"
	cont "<TARGET>'s"
	cont "Attack!"
	prompt

TanglingHairText:
	text "<USER>'s"
	line "Tangling Hair"
	cont "lowered"
	cont "<TARGET>'s"
	cont "Speed!"
	prompt

TanglingHairContraryText:
	text "<USER>'s"
	line "Tangling Hair"
	cont "raised"
	cont "<TARGET>'s"
	cont "Speed!"
	prompt

SynchronizeText:
	text "<USER>'s"
	line "Synchronize"
	cont "activated!"
	prompt

AttackNotLoweredText:
	text "<TARGET>'s"
	line "Attack was not"
	cont "lowered!"
	prompt

DownloadText:
	text "<USER>'s"
	line "Download raised"
	cont "its Sp.Attack!"
	prompt

EnemyTraceText:
	text "<USER>'s"
	line "Trace copied"
	cont "<TARGET>'s"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

PlayerTraceText:
	text "<USER> traced"
	line "<TARGET>'s"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

FriskText:
	text "<USER>"
	line "frisked the foe"
	cont "and found one"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

ScreenCleanText:
	text "<USER>"
	line "cleaned screens!"
	prompt

UnnerveText:
	text "<TARGET> is"
	line "too nervous to"
	cont "eat Berries!"
	prompt

NeutralGasText:
	text "<USER>'s"
	line "Neutral Gas has"
	cont "surpressed"
	cont "<TARGET>'s"
	cont "ability!"
	prompt

PressureText:
	text "<USER> is"
	line "exerting its"
	cont "pressure!"
	prompt

BattleText_MoldBreaker:
	text "<USER> is"
	line "breaking the mold!"
	prompt

CloudNineText:
	text "The effects of"
	line "weather have"
	cont "disappeard!"
	prompt

JustifiedText:
	text "<TARGET>'s"
	line "Justified raised"
	cont "its Attack stat!"
	prompt

DefiantText:
	text "<TARGET>'s"
	line "Defiant sharply"
	cont "raised Attack!"
	prompt

CompetitiveText:
	text "<TARGET>'s"
	line "Competitive"
	cont "sharply raised"
	cont "Spcl.Atk!"
	prompt

SteadfastText:
	text "<USER>'s"
	line "Steadfast raised"
	cont "its Speed!"
	prompt

DefiantUserText:
	text "<USER>'s"
	line "Defiant sharply"
	cont "raised Attack!"
	prompt

MoodyText:
	text "<USER>'s"
	line "Moody activated!"
	prompt

MoodyStatDownText:
	text "<USER>'s"
	line "Moody lowered"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

ArenaTrapText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "prevents esacape!"
	prompt

SturdyText:
	text "<TARGET>"
	line "hung on with"
	cont "Sturdy!"
	prompt

UnburdenText:
	text "<TARGET>'s"
	line "Unburden greatly"
	cont "raised Speed!"
	prompt

RattledText:
	text "<TARGET> was"
	line "rattled and its"
	cont "Speed rose!"
	prompt

CuteCharmText:
	text "<USER>"
	line "fell in love due"
	cont "to Cute Charm!"
	prompt

RoughSkinText:
	text "<USER> was"
	line "damaged by"
	cont "Rough Skin!"
	prompt

WeakArmorSpeedText:
	text "<TARGET>'s"
	line "Weak Armor sharply"
	cont "raised its Speed!"
	prompt

WeakArmorDefenseText:
	text "<TARGET>'s"
	line "Weak Armor lowered"
	cont "its Defense!"
	prompt

BattleText_Damp:
	text "<TARGET>'s"
	line "Damp prevented the"
	cont "attack!"
	prompt

ArmorTailText:
	text "<TARGET>'s"
	line "Armor Tail"
	cont "prevented the"
	cont "attack!"
	prompt

LiquidOozeText:
	text "<TARGET>'s"
	line "Liquid Ooze"
	cont "damaged"
	cont "<USER>!"
	prompt

SuctionCupsText:
	text "<TARGET>'s"
	line "Suction Cups"
	cont "prevented the"
	cont "attack!"
	prompt

WaterAbsorbText:
	text "<TARGET>"
	line "healed itself with"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

AftermathText:
	text "<TARGET>'s"
	line "Aftermath damaged"
	cont "<USER>!"
	prompt

SlowStartText:
	text "<USER> is"
	line "off to a slow"
	cont "start!"
	prompt

SlowStartEndText:
	text "<USER>'s"
	line "Slow Start has"
	cont "ended!"
	prompt

BouncedBackText:
	text "<USER>"
	line "bounced the"
	cont "@"
	text_ram wStringBuffer1
	text " back!"
	prompt

ObliviousText:
	text "<TARGET> was"
	line "immune to Attract!"
	prompt

SwaggerOwnTempoText:
	text "<USER>'s"
	line "Own Tempo prevents"
	cont "confusion!"
	prompt

AngerPointText:
	text "<TARGET>'s"
	line "Anger Point maxed"
	cont "out its Attack!"
	prompt

FlashFireText:
	text "<TARGET>'s"
	line "Attack raised with"
	cont "Flash Fire!"
	prompt

SapSipperText:
	text "<TARGET>'s"
	line "Attack raised with"
	cont "Sap Sipper!"
	prompt

SoundproofText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "protected it!"
	prompt

LevitateText:
	text "<TARGET>'s"
	line "Levitate makes"
	cont "Ground moves miss!"
	prompt

LightningRodText:
	text "<TARGET>'s"
	line "Sp.Atk raised with"
	cont "Lightning Rod!"
	prompt

MotorDriveText:
	text "<TARGET>'s"
	line "Speed raised with"
	cont "Motor Drive!"
	prompt

DrySkinHurtText:
	text "<USER> was"
	line "hurt by Dry Skin!"
	prompt

SpeedBoostText:
	text "<USER>'s"
	line "Speed Boost raised"
	cont "its Speed!"
	prompt

ShedSkinText:
	text "<USER>"
	line "shed its skin!"
	prompt

HydrationText:
	text "<USER>'s"
	line "Hydration healed"
	cont "its status!"
	prompt

SolarPowerText:
	text "<USER> is"
	line "hurt by its"
	cont "Solar Power!"
	prompt

RestInsomniaText:
	text "<USER>"
	line "can't fall asleep!"
	prompt

InsomniaText:
	text "<TARGET>"
	line "can't fall asleep!"
	prompt
