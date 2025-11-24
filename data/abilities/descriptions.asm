AbilityDescriptions:
	dw NoAbilityDesc
	dw OvergrowDesc
	dw BlazeDesc
	dw TorrentDesc
	dw ThickFatDesc
	dw RecklessDesc
	dw SolarPowerDesc
	dw DampDesc
	dw SwiftSwimDesc
	dw KeenEyeDesc
	dw SkillLinkDesc
	dw SheerForceDesc
	dw VitalSpiritDesc
	dw RunAwayDesc
	dw IntimidateDesc
	dw ScrappyDesc
	dw LimberDesc
	dw UnburdenDesc
	dw PranksterDesc
	dw SturdyDesc
	dw WeakArmorDesc
	dw SandForceDesc
	dw SandRushDesc
	dw MoldBreakerDesc
	dw GutsDesc
	dw IronFistDesc
	dw SwarmDesc
	dw ChlorophyllDesc
	dw OvercoatDesc
	dw PoisonPointDesc
	dw SpeedBoostDesc
	dw InfiltratorDesc
	dw TintedLensDesc
	dw AdaptabilityDesc
	dw RockHeadDesc
	dw RattledDesc
	dw MoxieDesc
	dw WaterAbsorbDesc
	dw LiquidOozeDesc
	dw WaterVeilDesc
	dw SolidRockDesc
	dw ArenaTrapDesc
	dw RefrigerateDesc
	dw RoughSkinDesc
	dw CuteCharmDesc
	dw TechnicianDesc
	dw MagicGuardDesc
	dw RegeneratorDesc
	dw LevitateDesc
	dw IceBodyDesc
	dw SnowWarningDesc
	dw DrizzleDesc
	dw DroughtDesc
	dw SandstreamDesc
	dw ShellArmorDesc
	dw NoGuardDesc
	dw EffectSporeDesc
	dw CursedBodyDesc
	dw MoodyDesc
	dw CompoundEyesDesc
	dw ClearBodyDesc
	dw SynchronizeDesc
	dw AnalyticDesc
	dw FlashFireDesc
	dw FlameBodyDesc
	dw RivalryDesc
	dw HydrationDesc
	dw StickyHoldDesc
	dw StaticDesc
	dw InnerFocusDesc
	dw PerishBodyDesc
	dw PressureDesc
	dw DefiantDesc
	dw HustleDesc
	dw JustifiedDesc
	dw VoltAbsorbDesc
	dw MagnetPullDesc
	dw ObliviousDesc
	dw OwnTempoDesc
	dw SteadfastDesc
	dw EarlyBirdDesc
	dw TangledFeetDesc
	dw GluttonyDesc
	dw AftermathDesc
	dw PoisonTouchDesc
	dw HyperCutterDesc
	dw VitalSpiritDesc
	dw SoundproofDesc
	dw LightningRodDesc
	dw ShellArmorDesc
	dw CloudNineDesc
	dw NeutralGasDesc
	dw StenchDesc
	dw SereneGraceDesc
	dw NaturalCureDesc
	dw SniperDesc
	dw FilterDesc
	dw ScreenCleanDesc
	dw SharpnessDesc
	dw MotorDriveDesc
	dw AngerPointDesc
	dw QuickFeetDesc
	dw SnowCloakDesc
	dw LeafGuardDesc
	dw TraceDesc
	dw DownloadDesc
	dw ShedSkinDesc
	dw RainDishDesc
	dw MagicBounceDesc
	dw PickUpDesc
	dw ShieldDustDesc
	dw BigPecksDesc
	dw UnnerveDesc
	dw SandVeilDesc
	dw UnawareDesc
	dw CompetitiveDesc
	dw FriskDesc
	dw DrySkinDesc
	dw WonderSkinDesc
	dw ArenaTrapDesc
	dw IlluminateDesc
	dw ImposterDesc
	dw PixilateDesc
	dw ImmunityDesc
	dw MarvelScaleDesc
	dw MultiscaleDesc
	dw SuperLuckDesc
	dw HugePowerDesc
	dw SapSipperDesc
	dw ArmorTailDesc
	dw PoisonHealDesc
	dw ContraryDesc
	dw PickpocketDesc
	dw BulletproofDesc
	dw MagmaArmorDesc
	dw SuctionCupsDesc
	dw HeatProofDesc
	dw MegaLauncherDesc
	dw StrongJawDesc
	dw ToughClawsDesc
	dw SlowStartDesc
	dw DragonsMawDesc
	dw TransistorDesc
	dw TriageDesc
	dw SlushRushDesc
	dw TanglingHairDesc
	dw FurCoatDesc
	dw SteelySpiritDesc
	dw GalvanizeDesc
	dw QuickDrawDesc
	dw AlchemyPowerDesc
	dw BerserkDesc

NoAbilityDesc:
	db    "No ability."
	next1 "@"

OvergrowDesc:
	db    "Powers up Grass"
	next1 "moves in a pinch.@"

BlazeDesc:
	db    "Powers up Fire"
	next1 "moves in a pinch.@"

ThickFatDesc:
	db    "Reduces Fire and"
	next1 "Ice move damage.@"

RecklessDesc:
	db    "Powers up recoil"
	next1 "damage moves.@"

TorrentDesc:
	db    "Powers up Water"
	next1 "moves in a pinch.@"

DampDesc:
	db    "Prevents self-"
	next1 "destruction moves.@"

SwiftSwimDesc:
	db    "Increases Speed"
	next1 "in rain.@"

KeenEyeDesc:
	db    "Prevents loss of"
	next1 "accuracy.@"

SkillLinkDesc:
	db    "Multistrike moves"
	next1 "hit 5 times.@"

SheerForceDesc:
	db    "Remove move effect"
	next1 "for stronger move.@"

VitalSpiritDesc:
	db    "Prevents #mon"
	next1 "from sleeping.@"

RunAwayDesc:
	db    "Easier to run"
	next1 "away from battles.@"

IntimidateDesc:
	db    "Lowers foe's"
	next1 "Attack stat.@"

ScrappyDesc:
	db    "Ignores immunity"
	next1 "of Ghost types.@"

LimberDesc:
	db    "Prevents"
	next1 "paralysis.@"

UnburdenDesc:
	db    "Increases Speed if"
	next1 "held item is used.@"

PranksterDesc:
	db    "Increases priority"
	next1 "of status moves.@"

SturdyDesc:
	db    "Prevents 1-hit"
	next1 "KO moves.@"

WeakArmorDesc:
	db    "Attacks lower Def"
	next1 "and raise Speed.@"

SandForceDesc:
	db    "Certain moves"
	next1 "power up in sand.@"

SandRushDesc:
	db    "Speed is raised"
	next1 "in sand.@"

MoldBreakerDesc:
	db    "Ignores opponent's"
	next1 "ability.@"

GutsDesc:
	db    "Status problems"
	next1 "increase Attack.@"

IronFistDesc:
	db    "Increase power of"
	next1 "punching moves.@"

SwarmDesc:
	db    "Powers up Bug"
	next1 "moves in a pinch.@"

ChlorophyllDesc:
	db    "Raises Speed in"
	next1 "sunlight.@"

OvercoatDesc:
	db    "Protects from sand"
	next1 "and powders.@"

PoisonPointDesc:
	db    "Contact moves can"
	next1 "poison the user.@"

SpeedBoostDesc:
	db    "Speed is increased"
	next1 "each turn.@"

InfiltratorDesc:
	db    "Ignores foe's"
	next1 "barriers.@"

TintedLensDesc:
	db    "Powers up not-very"
	next1 "effective moves.@"

AdaptabilityDesc:
	db    "Powers up moves of"
	next1 "the same type.@"

RockHeadDesc:
	db    "Prevents recoil"
	next1 "damage.@"

RattledDesc:
	db    "Dark, Bug, & Ghost"
	next1 "moves raise Speed.@"

MoxieDesc:
	db    "Raises Attack with"
	next1 "each fainted for.@"

WaterAbsorbDesc:
	db    "Water type moves"
	next1 "restore HP.@"

SolidRockDesc:
	db    "Reduces super-"
	next1 "effective damage.@"

CuteCharmDesc:
	db    "Infatuates upon"
	next1 "contact.@"

TechnicianDesc:
	db    "Weaker moves are"
	next1 "powered up.@"

MagicGuardDesc:
	db    "Only takes damage"
	next1 "from attacks.@"

RegeneratorDesc:
	db    "Restores 1/3 HP"
	next1 "upon retreating.@"

LevitateDesc:
	db    "Cannot be hit by"
	next1 "Ground type moves.@"

IceBodyDesc:
	db    "Restores HP during"
	next1 "Hail.@"

SnowWarningDesc:
	db    "Sets up Hail when"
	next1 "entering battle.@"

DrizzleDesc:
	db    "Sets up rain when"
	next1 "entering battle.@"

DroughtDesc:
	db    "Sets up Sun when"
	next1 "entering battle.@"

SandstreamDesc:
	db    "Sets up Sand when"
	next1 "entering battle.@"

ShellArmorDesc:
	db    "Blocks critical"
	next1 "hits.@"

NoGuardDesc:
	db    "Moves can't miss,"
	next1 "for or against.@"

EffectSporeDesc:
	db    "Contact causes"
	next1 "status conditions.@"

CursedBodyDesc:
	db    "Contact disables"
	next1 "last move used.@"

CompoundEyesDesc:
	db    "Increases the"
	next1 "accuracy of moves.@"

ClearBodyDesc:
	db    "Prevents stats"
	next1 "from lowering.@"

SynchronizeDesc:
	db    "Passes on status"
	next1 "conditions.@"

AnalyticDesc:
	db    "Boosts power if"
	next1 "user moves last.@"

FlashFireDesc:
	db    "Fire moves boost"
	next1 "Special Attack.@"

FlameBodyDesc:
	db    "Contact moves"
	next1 "cause burns.@"

RivalryDesc:
	db    "Raises Attack with"
	next1 "same gender foe.@"

HydrationDesc:
	db    "Rain heals status"
	next1 "problems.@"

StickyHoldDesc:
	db    "Prevents theft of"
	next1 "items.@"

StaticDesc:
	db    "Contact move"
	next1 "cause paralysis.@"

InnerFocusDesc:
	db    "Prevents"
	next1 "flinching.@"

PressureDesc:
	db    "Foe's moves use"
	next1 "2 PP.@"

DefiantDesc:
	db    "Attack rises when"
	next1 "stats are lowered.@"

HustleDesc:
	db    "Attack raise while"
	next1 "accuracy lowers.@"

JustifiedDesc:
	db    "Raises Attack when"
	next1 "hit by Dark moves.@"

VoltAbsorbDesc:
	db    "Electric type"
	next1 "moves restore HP.@"

MagnetPullDesc:
	db    "Traps Steel type"
	next1 "#mon.@"

ObliviousDesc:
	db    "Can't be"
	next1 "infatuated.@"

OwnTempoDesc:
	db    "Can't be confused."
	next1 "@"

SteadfastDesc:
	db    "Flinching raises"
	next1 "Speed.@"

EarlyBirdDesc:
	db    "Wakes up early"
	next1 "from sleeping.@"

TangledFeetDesc:
	db    "Raises evasion"
	next1 "when confused.@"

PoisonTouchDesc:
	db    "Contacting foe"
	next1 "can poison.@"

HyperCutterDesc:
	db    "Prevents Attack"
	next1 "from lowering.@"

SoundproofDesc:
	db    "Ignores sound-"
	next1 "based moves.@"

LightningRodDesc:
	db    "Electric moves"
	next1 "increase Sp.Atk.@"

CloudNineDesc:
	db    "Eliminates weather"
	next1 "effects.@"

NeutralGasDesc:
	db    "Neutralizes"
	next1 "abilities.@"

StenchDesc:
	db    "May cause foe to"
	next1 "flinch.@"

SereneGraceDesc:
	db    "Promotes moves'"
	next1 "added effects.@"

NaturalCureDesc:
	db    "Switching heals"
	next1 "status conditions.@"

SniperDesc:
	db    "Powers up"
	next1 "critical hits.@"

FilterDesc:
	db    "Reduces super-"
	next1 "effective damage.@"

ScreenCleanDesc:
	db    "Removes screens"
	next1 "upon entering.@"

SharpnessDesc:
	db    "Powers up slashing"
	next1 "moves.@"

MotorDriveDesc:
	db    "Electric moves"
	next1 "raise Speed.@"

AngerPointDesc:
	db    "Critical hits"
	next1 "raise Attack.@"

QuickFeetDesc:
	db    "Status conditions"
	next1 "raise Speed.@"

SnowCloakDesc:
	db    "Raises evasion in"
	next1 "Hail.@"

LeafGuardDesc:
	db    "Prevents status in"
	next1 "Sunlight.@"

TraceDesc:
	db    "Copies foe's"
	next1 "ability.@"

DownloadDesc:
	db    "Raises Special"
	next1 "Attack.@"

ImposterDesc:
	db    "Transforms upon"
	next1 "entering battle.@"

ShedSkinDesc:
	db    "Status conditions"
	next1 "heal as turn ends.@"

RainDishDesc:
	db    "Heals HP in rain."
	next1 "@"

MagicBounceDesc:
	db    "Status moves are"
	next1 "reflected.@"

SuperLuckDesc:
	db    "Increases chances"
	next1 "of a critical hit.@"

UnnerveDesc:
	db    "Foe cannot eat"
	next1 "berries.@"

PickUpDesc:
	db    "#mon can pick"
	next1 "up items.@"

PixilateDesc:
	db    "Normal type moves"
	next1 "become Fairy type.@"

SapSipperDesc:
	db    "Grass type moves"
	next1 "will boost Attack.@"

HugePowerDesc:
	db    "Doubles user's"
	next1 "Attack stat.@"

SandVeilDesc:
	db    "Raises evasion in"
	next1 "sand.@"

ArmorTailDesc:
	db    "Prevents foe's"
	next1 "priority moves.@"

HeatProofDesc:
	db    "Reduces damage"
	next1 "from Fire moves.@"

UnawareDesc:
	db    "#mon ignores"
	next1 "foe's stat changes.@"

DrySkinDesc:
	db    "Sun deals damage."
	next1 "Rain heals HP.@"

ShieldDustDesc:
	db    "Stops additional"
	next1 "effects.@"

FriskDesc:
	db    "Shows the foe's"
	next1 "held item.@"

AftermathDesc:
	db    "Foe is damaged as"
	next1 "the user faints.@"

RefrigerateDesc:
	db    "Normal type moves"
	next1 "become Ice type.@"

ImmunityDesc:
	db    "Immune to being"
	next1 "poisoned.@"

PoisonHealDesc:
	db    "Poison restores HP"
	next1 "instead of damage.@"

RoughSkinDesc:
	db    "Contact moves deal"
	next1 "damage.@"

SuctionCupsDesc:
	db    "Cannot be forced"
	next1 "from battle.@"

MarvelScaleDesc:
	db    "Status problems"
	next1 "increase Defense.@"

MultiscaleDesc:
	db    "Reduces damage at"
	next1 "full HP.@"

WaterVeilDesc:
	db    "Prevents the burn"
	next1 "status.@"

PerishBodyDesc:
	db    "Perish count for"
	next1 "both #mon.@"

ArenaTrapDesc:
	db    "Prevents foes from"
	next1 "fleeing.@"

SolarPowerDesc:
	db    "Boosts Sp.Atk in"
	next1 "Sun, lowers HP.@"

MagmaArmorDesc:
	db    "Prevents freezing."
	next1 "@"

LiquidOozeDesc:
	db    "Draining moves"
	next1 "damage user.@"

BigPecksDesc:
	db    "Prevents lowering"
	next1 "defense.@"

ContraryDesc:
	db    "Stat raises/drops"
	next1 "are reversed.@"

GluttonyDesc:
	db    "Berries are eaten"
	next1 "sooner.@"

MoodyDesc:
	db    "Raises a stat and"
	next1 "drops one.@"

PickpocketDesc:
	db    "Steals an item"
	next1 "when hit.@"

IlluminateDesc:
	db    "Prevents accuracy"
	next1 "from lowering.@"

BulletproofDesc:
	db    "Protects from ball"
	next1 "and bomb moves.@"

CompetitiveDesc:
	db    "Raises Sp.Atk when"
	next1 "a stat is lowered.@"

WonderSkinDesc:
	db    "Status moves are"
	next1 "likely to miss.@"

MegaLauncherDesc:
	db    "Powers up aura &"
	next1 "pulse moves.@"

StrongJawDesc:
	db    "Powers up biting"
	next1 "moves.@"

ToughClawsDesc:
	db    "Powers up claw"
	next1 "moves.@"

SlowStartDesc:
	db    "Lower stats for"
	next1 "first 5 turns.@"

DragonsMawDesc:
	db    "Raise power by"
	next1 "50 percent.@"

TransistorDesc:
	db    "Raise power by"
	next1 "30 percent.@"

TriageDesc:
	db    "Healing moves"
	next1 "gain priority.@"

SlushRushDesc:
	db    "Speed is raised"
	next1 "in hail.@"

TanglingHairDesc:
	db    "Contact lowers"
	next1 "foe's Speed.@"

FurCoatDesc:
	db    "Halves damage from"
	next1 "physical moves.@"

SteelySpiritDesc:
	db    "Raises power of"
	next1 "Steel-type moves.@"

GalvanizeDesc:
	db    "Normal moves are"
	next1 "Electric type.@"

QuickDrawDesc:
	db    "User sometimes"
	next1 "moves first.@"

AlchemyPowerDesc:
	db    "Gains ability of"
	next1 "defeated foe.@"

BerserkDesc:
	db    "Sp.Atk boosted"
	next1 "when HP is low.@"
