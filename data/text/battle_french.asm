BattleText:: ; used only for BANK(BattleText)

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER> obtient"
	line "¥@"
	text_decimal wPayDayMoney, 3, 6
	text "!"
	prompt

WildPokemonAppearedText:
	text "Un @"
	text_ram wEnemyMonNick
	text_start
	line "sauvage apparaît!"
	prompt

HookedPokemonAttackedText:
	text "Le @"
	text_ram wEnemyMonNick
	text_start
	cont "pêché attaque!"
	prompt

PokemonFellFromTreeText:
	text_ram wEnemyMonNick
	text_start
	text "tombe de l'arbre!"
	prompt

WildCelebiAppearedText:
	text "Un @"
	text_ram wEnemyMonNick
	text_start
	line "sauvage apparaît!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "veut se battre!"
	prompt

BattleText_WildFled:
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "sauvage s'enfuit!"
	prompt

BattleText_EnemyFled:
	text "Le @"
	text_ram wEnemyMonNick
	text_start
	line "ennemi s'enfuit!"
	prompt

HurtByPoisonText:
	text "<USER>"
	line "souffre du poison!"
	prompt

HurtByBurnText:
	text "<USER>'s"
	line "brûle!"
	prompt

LeechSeedSapsText:
	text "Vampigraine draine"
	line "<USER>!"
	prompt

HasANightmareText:
	text "<USER>"
	line "fait un cauchemar!"
	prompt

HurtByCurseText:
	text "<USER>'s"
	line "est Maudit!"
	prompt

SandstormHitsText:
	text "La Tempêtesable"
	line "touche <USER>!"
	prompt

HailBuffetsText:
	text "La Grêle touche"
	line "<USER>!"
	prompt

PerishCountText:
	text "Compte Requiem de"
	line "<USER>"
	line "est de @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

BattleText_TargetRecoveredWithItem:
	text "<TARGET>"
	line "récupère avec"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "récupère des PP"
	cont "avec @"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_TargetWasHitByFutureSight:
	text "<TARGET>"
	line "est touché par la"
	cont "Prescience!"
	prompt

BattleText_SafeguardFaded:
	text "Rune Protect de"
	line "<USER>"
	cont "s'évanouit!"
	prompt

BattleText_MonsLightScreenFell:
	text "Mur Lumière de"
	line "#mon @"
	text_ram wStringBuffer1
	text_start
	cont "s'évanouit!"
	prompt

BattleText_MonsReflectFaded:
	text "Protection de"
	line "@"
	text_ram wStringBuffer1
	text " #mon"
	cont "s'évanouit!"
	prompt

BattleText_RainContinuesToFall:
	text "La pluie continue"
	line "de tomber."
	prompt

BattleText_TheSunlightIsStrong:
	text "Les rayons sont"
	line "puissants."
	prompt

BattleText_TheSandstormRages:
	text "La Tempêtesable"
	line "fait rage."
	prompt

BattleText_HailContinues:
	text "La Grêle fait"
	line "rage."
	prompt

BattleText_TheRainStopped:
	text "Les pluie s'est"
	line "arrêtée."
	prompt

BattleText_TheSunlightFaded:
	text "Les rayons"
	line "disparaissent."
	prompt

BattleText_TheSandstormSubsided:
	text "La Tempêtesable"
	line "se calme."
	prompt

BattleText_HailEnds:
	text "La Grêle se calme."
	prompt

BattleText_EnemyMonFainted:
	text "Le @"
	text_ram wEnemyMonNick
	text_start
	line "ennemi est K.O!"
	prompt

GotMoneyForWinningText:
	text "<PLAYER> remporte"
	line "@"
	text_decimal wBattleReward, 3, 6
	text_start
	line "¥!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "a perdu!"
	prompt

TiedAgainstText:
	text "Egalité avec"
	line "<ENEMY>!"
	prompt

SentSomeToMomText:
	text "<PLAYER> remporte@"
	text_decimal wBattleReward, 3, 6
	text_start
	line "¥!"
	cont "envoyée à Maman!"
	prompt

SentHalfToMomText:
	text "La moitié est"
	line "envoyée à Maman!"
	prompt

SentAllToMomText:
	text "Tout est envoyé"
	line "à Maman!"
	prompt

BattleText_0x80a4f:
	text "<RIVAL>: Huh? I"
	line "should've chosen"
	cont "your #mon!"
	prompt

BattleText_MonFainted:
	text_ram wBattleMonNick
	text_start
	line "est KO!!"
	prompt

BattleText_UseNextMon:
	text "Utiliser le"
	line "#mon suivant?"
	done

BattleText_0x80a93:
	text "<RIVAL>: Yes!"
	line "I guess I chose a"
	cont "good #mon!"
	prompt

LostAgainstText:
	text "<ENEMY>"
	line "vous a vaincu!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerChangeMon:
	text "<ENEMY>"
	line "va utiliser"
	cont "@"
	text_ram wEnemyMonNick
	text "."

	para "Voulez-vous"
	line "changer de #mon?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "envoie"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	done

BattleText_TheresNoWillToBattle:
	text "Il ne veut pas"
	line "se battre!"
	prompt

BattleText_AnEGGCantBattle:
	text "Un Oeuf ne se bat"
	line "pas, voyons!"
	prompt

BattleText_CantEscape2:
	text "Fuite impossible!"
	prompt

BattleText_TheresNoEscapeFromTrainerBattle:
	text "On ne s'enfuit pas"
	line "d'un combat contre"
	cont "un dresseur!"
	prompt

BattleText_GotAwaySafely:
	text "Vous prenex la"
	line "fuite!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "<USER>"
	line "fuit en utillisant"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_CantEscape:
	text "Fuite impossible!"
	prompt

BattleText_UserHurtBySpikes:
	text "Picots frappent"
	line "<USER>!"
	prompt

RecoveredUsingText:
	text "<TARGET>"
	line "récupère avec"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text_ram wStringBuffer1
	text " de"
	line "<USER>:"
	cont "activé!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Objets"
	line "inutilisables ici."
	prompt

BattleText_MonIsAlreadyOut:
	text_ram wBattleMonNick
	text " est"
	line "déjà au combat."
	prompt

BattleText_MonCantBeRecalled:
	text_ram wBattleMonNick
	text " ne"
	line "peut être rappelé!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "Plus de PP pour"
	line "cette capacité!"
	prompt

BattleText_TheMoveIsDisabled:
	text "La capacité est"
	line "Entravee!"
	prompt

BattleText_MonHasNoMovesLeft:
	text_ram wBattleMonNick
	text " n'a"
	line "plus de capacités!"
	done

BattleText_TargetsEncoreEnded:
	text "Encore de"
	line "<TARGET>"
	line "achevé!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text_ram wStringBuffer1
	text " monte"
	line "au niveau @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	text_end

	text_end ; unused

BattleText_WildMonIsEating:
	text "Le @"
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
	line "dort!"
	prompt

WokeUpText:
	text "<USER>"
	line "se réveille!"
	prompt

FrozenSolidText:
	text "<USER>"
	line "est gelé!"
	prompt

FlinchedText:
	text "<USER>"
	line "a la trouille!"
	prompt

MustRechargeText:
	text "<USER>"
	line "est à plat!"
	prompt

DisabledNoMoreText:
	text "<USER>'s"
	line "n'est plus"
	cont "entravé!"
	prompt

IsConfusedText:
	text "<USER>"
	line "est confus!"
	prompt

HurtItselfText:
	text "Sa folie lui in-"
	line "flige des dégâts!"
	prompt

ConfusedNoMoreText:
	text "<USER>'s"
	line "n'est plus confus!"
	prompt

BecameConfusedText:
	text "<TARGET>"
	line "devient confus!"
	prompt

BattleText_ItemHealedConfusion:
	text_ram wStringBuffer1
	text_start
	line "dissipe la folie"
	cont "de"
	cont "<TARGET>"
	prompt

AlreadyConfusedText:
	text "<TARGET>"
	line "est déjà confus!"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text "<USER>"
	line "est blessé par"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "<USER>"
	line "est libéré de:"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

UsedBindText:
	text "<USER>"
	line "lance Étreinte sur"
	cont "<TARGET>!"
	prompt

WhirlpoolTrapText:
	text "<TARGET>"
	line "est piégé!"
	prompt

FireSpinTrapText:
	text "<TARGET>"
	line "est piégé!"
	prompt

WrappedByText:
	text "<TARGET>"
	line "est Ligote par"
	cont "<USER>!"
	prompt

ClampedByText:
	text "<TARGET>"
	line "dans Claquoir de"
	cont "<USER>!"
	prompt

StoringEnergyText:
	text "<USER>"
	line "se concentre!"
	prompt

UnleashedEnergyText:
	text "<USER>"
	line "envoie la sauce!"
	prompt

HungOnText:
	text "<TARGET>"
	line "protégé par"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "<TARGET>"
	line "est Ténace face au"
	cont "coup!"
	prompt

InLoveWithText:
	text "<USER>"
	line "est amoureux de"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "L'amour de"
	line "<USER>"
	cont "le paralyse!"
	prompt

DisabledMoveText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer1
	text " is"
	cont "est sous Entrave!"
	prompt

LoafingAroundText:
	text_ram wBattleMonNick
	text_start
	line "se promène."
	prompt

BeganToNapText:
	text_ram wBattleMonNick
	text_start
	line "fait la sieste!"
	prompt

WontObeyText:
	text_ram wBattleMonNick
	text_start
	line "n'obéit pas!"
	prompt

TurnedAwayText:
	text_ram wBattleMonNick
	text_start
	line "tourne le dos!"
	prompt

IgnoredOrdersText:
	text_ram wBattleMonNick
	text_start
	line "vous ignore!"
	prompt

IgnoredSleepingText:
	text_ram wBattleMonNick
	text " vous"
	line "ignore et pionce!"
	prompt

NoPPLeftText:
	text "Plus de PP pour"
	line "cette capacité!"
	prompt

HasNoPPLeftText:
	text "<USER>"
	line "n'a plus de PP"
	cont "pour @"
	text_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText:
	text "<USER>"
	line "s'endort!"
	done

RestedText:
	text "<USER>"
	line "s'endort et récu-"
	cont "père son énergie!"
	done

RegainedHealthText:
	text "<USER>"
	line "récupère son"
	cont "énergie!"
	prompt

AttackMissedText:
	text "<USER>'s"
	line "rate son attaque!"
	prompt

AttackMissed2Text:
	text "<USER>"
	line "rate son attaque!"
	prompt

AvoidStatusText:
	text "<TARGET>"
	line "évité l'attaque!"
	prompt

CrashedText:
	text "<USER>"
	line "s'éclate au sol!"
	cont "crashed!"
	prompt

UnaffectedText:
	text "<TARGET>'s"
	line "n'est pas affecté!"
	prompt

DoesntAffectText:
	text "Aucun effet sur"
	line "<TARGET>!"
	prompt

CriticalHitText:
	text "Coup critique!"
	prompt

OneHitKOText:
	text "K.O. en un coup!"
	prompt

SuperEffectiveText:
	text "C'est super"
	line "efficace!"
	prompt

NotVeryEffectiveText:
	text "Ce n'est pas très"
	line "efficace…"
	prompt

TookDownWithItText:
	text "<TARGET>"
	line "emmène au tapis"
	cont "<USER>!"
	prompt

RageBuildingText:
	text "La Frénésie de"
	line "<USER>"
	cont "augemente!"
	prompt

GotAnEncoreText:
	text "<TARGET>"
	line "en a Encore!"
	prompt

SharedPainText:
	text "Les adversaires"
	line "partagent les"
	cont "dégâts!"
	prompt

TookAimText:
	text "<USER>"
	line "vise!"
	prompt

SketchedText:
	text "<USER>"
	line "Gribouille"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

DestinyBondEffectText:
	text "<USER>"
	line "veut emmener son"
	cont "ennemi au tapis!"
	prompt

SpiteEffectText:
	text_ram wStringBuffer1
	text " de"
	line "<TARGET>"
	cont "baisse de @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

BellChimedText:
	text "Une cloche sonne!"
	line ""
	prompt

FellAsleepText:
	text "<TARGET>"
	line "s'endort!"
	prompt

AlreadyAsleepText:
	text "<TARGET>'s"
	line "dort déjà!"
	prompt

WasPoisonedText:
	text "<TARGET>"
	line "est empoisonné!"
	prompt

BadlyPoisonedText:
	text "<TARGET>'s"
	line "est gravement!"
	cont "empoisonné!"
	prompt

AlreadyPoisonedText:
	text "<TARGET>'s"
	line "est déjà"
	cont "empoisonné!"
	prompt

SuckedHealthText:
	text "L'énergie de"
	line "<TARGET>"
	cont "est aspirée!"
	prompt

DreamEatenText:
	text "Le rêve de"
	line "<TARGET"
	cont "est dévoré!"
	prompt

WasBurnedText:
	text "<TARGET>"
	line "brûle!"
	prompt

DefrostedOpponentText:
	text "<TARGET>"
	line "est dégelé!"
	prompt

WasFrozenText:
	text "<TARGET>"
	line "est gelé!"
	prompt

WontRiseAnymoreText:
	text_ram wStringBuffer2
	text " de"
	line "<USER>"
	cont "n'augemente plus!"
	prompt

WontDropAnymoreText:
	text_ram wStringBuffer2
	text " de"
	cont "ne diminue plue"
	prompt

FledFromBattleText::
	text "<USER>"
	line "s'enfuit!"
	prompt

FledInFearText:
	text "<TARGET>"
	line "a peur et fuit!"
	prompt

BlownAwayText:
	text "<TARGET>"
	line "est soufflé!"
	prompt

PlayerHitTimesText:
	text "Touché @"
	text_decimal wPlayerDamageTaken, 1, 1
	text " fois!"
	prompt

EnemyHitTimesText:
	text "Touché @"
	text_decimal wEnemyDamageTaken, 1, 1
	text " fois!"
	prompt

MistText:
	text "<USER>"
	line "s'entoure d'une"
	cont "Brume!"
	prompt

ProtectedByMistText:
	text "<TARGET>"
	line "est protégé par"
	cont "la Brume!"
	prompt

GettingPumpedText:
	text_pause
	text "<USER>"
	line "se concentre!"
	prompt

RecoilText:
	text "<USER>"
	line "se blesse en"
	cont "frappant!"
	prompt

MadeSubstituteText:
	text "<USER>"
	line "crée un Clone!"
	prompt

HasSubstituteText:
	text "<USER>"
	line "a un Clone!"
	prompt

TooWeakSubText:
	text "Trop faible pour"
	line "crée un Clone!"
	prompt

SubTookDamageText:
	text "Le Clone prend"
	line "les dégâts pour"
	cont "<TARGET>!"
	prompt

SubFadedText:
	text "Le Clone de"
	line "<TARGET>"
	cont "s'évanouit!"
	prompt

LearnedMoveText:
	text "<USER>"
	line "apprend"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

WasSeededText:
	text "<TARGET>"
	line "est infecté!"
	prompt

EvadedText:
	text "<TARGET>"
	line "évité l'attaque!"
	prompt

WasDisabledText:
	text_ram wStringBuffer1
	text " de"
	line "<TARGET>"
	cont "est sous Entrave!"
	prompt

CoinsScatteredText:
	text "Une pluie de"
	line "pièces!"
	prompt

TransformedTypeText:
	text "<USER>"
	line "se change en type"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

EliminatedStatsText:
	text "Tout changement de"
	line "statut éliminé!"
	prompt

TransformedText:
	text "<USER>"
	line "se transforme en"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

LightScreenEffectText:
	text "La Def.Spe. de"
	line "<USER>"
	line "augmente!"
	prompt

ReflectEffectText:
	text "La Defense de"
	line "<USER>"
	cont "augmente!"
	prompt

NothingHappenedText:
	text "Mais rien ne se"
	line "passe."
	prompt

ButItFailedText:
	text "Mais cela échoue!"
	prompt

ItFailedText:
	text "Ca ne marche pas!"
	prompt

DidntAffect1Text:
	text "Ca n'affecte pas"
	line "<TARGET>!"
	prompt

DidntAffect2Text:
	text "Ca n'affecte pas"
	line "<TARGET>!"
	prompt

HPIsFullText:
	text "Points de Vie de"
	line "<USER>"
	cont "au max!"
	prompt

DraggedOutText:
	text "<USER>"
	line "est traîné de"
	cont "force au combat!"
	prompt

ParalyzedText:
	text "<TARGET>"
	line "paralysé! Il peut"
	cont "ne pas attaquer!"
	prompt

FullyParalyzedText:
	text "<USER>"
	line "est totalement"
	cont "paralysé!"
	prompt

AlreadyParalyzedText:
	text "<TARGET>"
	line "est déjà paralysé!"
	prompt

ProtectedByText:
	text "<TARGET>"
	line "est protégé par"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

MirrorMoveFailedText:
	text "La Mimique a"
	next "échoué!"
	prompt

StoleText:
	text "<USER>"
	line "vole @"
	text_ram wStringBuffer1
	text_start
	cont "à son ennemi!"
	prompt

CantEscapeNowText:
	text "<TARGET>"
	line "ne peut pas"
	cont "s'échapper!"
	prompt

StartedNightmareText:
	text "<TARGET>"
	line "commence à"
	cont "CAUCHEMARDER!"
	prompt

WasDefrostedText:
	text "<USER>"
	line "est dégelé!"
	prompt

PutACurseText:
	text "<USER>"
	line "sacrifie ses PV..."

	para "...et Maudit"
	line "<TARGET>!"
	prompt

ProtectedItselfText:
	text "<USER>"
	line "se met à l'Abri!"
	prompt

ProtectingItselfText:
	text "<TARGET>"
	line "s'Abrite!"
	done

SpikesText:
	text "Des Picots s'épar-"
	line "pillent autour de"
	cont "<TARGET>!"
	prompt

IdentifiedText:
	text "<USER>"
	line "identifie"
	cont "<TARGET>!"
	prompt

StartPerishText:
	text "Les deux #mon"
	line "sont K.O. dans..."
	cont "3 tours!!!"
	prompt

SandstormBrewedText:
	text "Une Tempêtesable"
	line "se prépare!"
	prompt

HailStartsText:
	text "Une Grêle se"
	line "prépare!"
	prompt

BracedItselfText:
	text "<USER>"
	line "rassemble ses"
	cont "forces!"
	prompt

FellInLoveText:
	text "<TARGET>"
	line "est amoureux!"
	prompt

CoveredByVeilText:
	text "<USER>"
	line "est sous un voile!"
	prompt

SafeguardProtectText:
	text "<TARGET>"
	line "est protégé par"
	cont "Rune Protect!"
	prompt

MagnitudeText:
	text "Ampleur @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

ReleasedByText:
	text "<USER>"
	line "est relâché par"
	cont "<TARGET>!"
	prompt

ShedLeechSeedText:
	text "<USER>"
	line "lance Vampigraine!"
	prompt

BlewSpikesText:
	text "<USER>"
	line "lance les Picots!"
	prompt

BrokeReflectText:
	text "<USER>"
	line "fauché Protection!"
	prompt

BrokeLightScreenText:
	text "<USER> fauché"
	line "Mur Lumière!"
	prompt

DownpourText:
	text "Une forte pluie"
	line "commence!"
	prompt

SunGotBrightText:
	text "Le soleil brille!"
	prompt

BellyDrumText:
	text "<USER>"
	line "sacrifie ses PV et"
	cont "monte son Attaque"
	cont "au max!"
	prompt

CopiedStatsText:
	text "<USER>"
	line "copie les change-"

	para "ments de statut de"
	line "<TARGET>!"
	prompt

ForesawAttackText:
	text "<USER>"
	line "prévoit une"
	cont "attaque!"
	prompt

BeatUpAttackText:
	text "Attaque de"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

RefusedGiftText:
	text "<TARGET>"
	line "ne veut pas"
	cont "le cadeau!"
	prompt

IgnoredOrders2Text:
	text "<USER>"
	line "ignore les ordres!"
	prompt

BattleText_LinkErrorBattleCanceled:
	text "Erreur Link..."

	para "Le combat est"
	line "annulé..."
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
	done

RecoveredWithSomethingText:
	text "<USER>"
	line "récupère avec"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

AlreadyBurnedText:
	text "<TARGET>'s"
	line "est déjà brûle!"
	prompt

AlreadyFrozenText:
	text "<TARGET>'s"
	line "est déjà gelé!"
	prompt

KnockedOffItemText:
	text "<USER>"
	line "enlevé"
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
	line "retourné à"
	cont "<PLAYER>!"
	prompt

UTurnOutEnemyText:
	text "<USER>"
	line "retourné à"
	cont "<ENEMY>!"
	prompt

TeleportInText:
	text "<USER>"
	line "took its place!"
	prompt
