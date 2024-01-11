landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark 132,  44, BlackthornCityName
	landmark 132,  36, DragonsDenName
	landmark 132,  64, Route45Name
	landmark 112,  72, DarkCaveName
	landmark 130,  38, IcePathName
	landmark 120,  44, Route44Name
	landmark 108,  44, MahoganyTownName
	landmark 109,  45, UnknownName
	landmark 108,  36, Route43Name
	landmark 108,  28, LakeOfRageName
	landmark  92,  44, Route42Name
	landmark  84,  44, MtMortarName
	landmark  68,  44, EcruteakCityName
	landmark  69,  42, BellchimePathName
	landmark  70,  42, TinTowerName
	landmark  66,  42, BurnedTowerName
	landmark  52,  44, Route38Name
	landmark  36,  48, Route39Name
	landmark  36,  60, OlivineCityName
	landmark  38,  62, LighthouseName
	landmark  28,  56, BattleTowerName
	landmark  28,  64, Route40Name
	landmark  28,  92, WhirlIslandsName
	landmark  28, 100, Route41Name
	landmark  20, 100, CianwoodCityName
	landmark  20,  99, CliffsEdgeGateName
	landmark  12, 100, Route47Name
	landmark  11, 100, CliffCaveName
	landmark   4,  92, Route48Name
	landmark   4,  84, WildAreaName
	landmark  68,  52, Route37Name
	landmark  64,  60, Route36Name
	landmark  52,  60, NationalParkName
	landmark  52,  76, Route35Name
	landmark  52,  92, GoldenrodCityName
	landmark  50,  92, RadioTowerName
	landmark  52, 112, Route34Name
	landmark  52, 120, IlexForestName
	landmark  68, 124, AzaleaTownName
	landmark  70, 122, SlowpokeWellName
	landmark  82, 124, Route33Name
	landmark  84, 124, UnionCaveName
	landmark  84,  92, Route32Name
	landmark  76,  76, RuinsOfAlphName
	landmark  84,  60, VioletCityName
	landmark  85,  58, SproutTowerName
	landmark  96,  60, Route31Name
	landmark 100,  80, Route30Name
	landmark 100, 100, CherrygroveCityName
	landmark 128, 100, Route29Name
	landmark 140, 100, NewBarkTownName
	landmark 124,  88, Route46Name
	landmark 148,  68, SilverCaveName
	landmark  52, 108, PalletTownName
	landmark  52,  92, Route1Name
	landmark  52,  76, ViridianCityName
	landmark  52,  65, Route2Name
	landmark  52,  60, ViridianForestName
	landmark  52,  52, PewterCityName
	landmark  64,  52, Route3Name
	landmark  76,  52, MtMoonName
	landmark  88,  52, Route4Name
	landmark 100,  52, CeruleanCityName
	landmark  92,  44, CeruleanCaveName
	landmark 100,  44, Route24Name
	landmark 108,  36, Route25Name
	landmark 100,  60, Route5Name
	landmark 108,  76, UndergroundName
	landmark 100,  76, Route6Name
	landmark 100,  84, VermilionCityName
	landmark  88,  60, DiglettsCaveName
	landmark  88,  68, Route7Name
	landmark 116,  68, Route8Name
	landmark 116,  52, Route9Name
	landmark 132,  52, RockTunnelName
	landmark 132,  56, Route10Name
	landmark 132,  60, PowerPlantName
	landmark 132,  68, LavenderTownName
	landmark 140,  68, LavRadioTowerName
	landmark  76,  68, CeladonCityName
	landmark 100,  68, SaffronCityName
	landmark 116,  84, Route11Name
	landmark 132,  80, Route12Name
	landmark 124, 100, Route13Name
	landmark 116, 112, Route14Name
	landmark 104, 116, Route15Name
	landmark  68,  68, Route16Name
	landmark  68,  92, Route17Name
	landmark  80, 116, Route18Name
	landmark  92, 116, FuchsiaCityName
	landmark  92, 128, Route19Name
	landmark  76, 132, Route20Name
	landmark  68, 132, SeafoamIslandsName
	landmark  52, 132, CinnabarIslandName
	landmark  51, 131, PokemonMansionName
	landmark  51, 132, CinnabarVolcanoName
	landmark  52, 132, UnknownName2
	landmark  52, 120, Route21Name
	landmark  36,  68, Route22Name
	landmark  28,  52, VictoryRoadName
	landmark  28,  44, Route23Name
	landmark  28,  36, IndigoPlateauName
	landmark  28,  92, Route26Name
	landmark  20, 100, Route27Name
	landmark  12, 100, TohjoFallsName
	landmark  20,  68, Route28Name
	landmark 140, 116, FastShipName

NewBarkTownName:     db "New Bark¯Town@"
CherrygroveCityName: db "Cherrygrove¯City@"
VioletCityName:      db "Violet City@"
AzaleaTownName:      db "Azalea Town@"
GoldenrodCityName:   db "Goldenrod¯City@"
EcruteakCityName:    db "Ecruteak¯City@"
OlivineCityName:     db "Olivine¯City@"
CianwoodCityName:    db "Cianwood¯City@"
CliffsEdgeGateName:  db "Cliff's Edge¯Gate@"
MahoganyTownName:    db "Mahogany¯Town@"
UnknownName:         db "???@"
BlackthornCityName:  db "Blackthorn¯City@"
LakeOfRageName:      db "Lake Of¯Rage@"
SilverCaveName:      db "Silver Cave@"
SproutTowerName:     db "Sprout¯Tower@"
RuinsOfAlphName:     db "Ruins¯Of Alph@"
UnionCaveName:       db "Union Cave@"
SlowpokeWellName:    db "Slowpoke¯Well@"
RadioTowerName:      db "Goldenrod¯Tower@"
PowerPlantName:      db "Power Plant@"
NationalParkName:    db "National¯Forest@"
BellchimePathName:   db "Bellchime¯Path@"
TinTowerName:        db "Bell Tower@"
LighthouseName:      db "Lighthouse@"
WhirlIslandsName:    db "Whirl¯Islands@"
MtMortarName:        db "Mt.Mortar@"
DragonsDenName:      db "Dragon's¯Den@"
IcePathName:         db "Ice Path@"
NotApplicableName:   db "N/A@" ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
PalletTownName:      db "Pallet Town@"
ViridianCityName:    db "Viridian¯City@"
PewterCityName:      db "Pewter City@"
CeruleanCityName:    db "Cerulean¯City@"
LavenderTownName:    db "Lavender¯Town@"
VermilionCityName:   db "Vermilion¯City@"
CeladonCityName:     db "Celadon¯City@"
SaffronCityName:     db "Saffron¯City@"
FuchsiaCityName:     db "Fuchsia¯City@"
CinnabarIslandName:  db "Cinnabar¯Island@"
IndigoPlateauName:   db "Indigo¯Plateau@"
VictoryRoadName:     db "Victory¯Road@"
MtMoonName:          db "Mt.Moon@"
RockTunnelName:      db "Rock Tunnel@"
LavRadioTowerName:   db "#mon¯Tower@"
SilphCoName:         db "Silph Co.@"
SafariZoneName:      db "Safari Zone@"
SeafoamIslandsName:  db "Seafoam¯Islands@"
PokemonMansionName:  db "#mon¯Mansion@"
CeruleanCaveName:    db "Cerulean¯Cave@"
Route1Name:          db "Route 1@"
Route2Name:          db "Route 2@"
Route3Name:          db "Route 3@"
Route4Name:          db "Route 4@"
Route5Name:          db "Route 5@"
Route6Name:          db "Route 6@"
Route7Name:          db "Route 7@"
Route8Name:          db "Route 8@"
Route9Name:          db "Route 9@"
Route10Name:         db "Route 10@"
Route11Name:         db "Route 11@"
Route12Name:         db "Route 12@"
Route13Name:         db "Route 13@"
Route14Name:         db "Route 14@"
Route15Name:         db "Route 15@"
Route16Name:         db "Route 16@"
Route17Name:         db "Route 17@"
Route18Name:         db "Route 18@"
Route19Name:         db "Route 19@"
Route20Name:         db "Route 20@"
Route21Name:         db "Route 21@"
Route22Name:         db "Route 22@"
Route23Name:         db "Route 23@"
Route24Name:         db "Route 24@"
Route25Name:         db "Route 25@"
Route26Name:         db "Route 26@"
Route27Name:         db "Route 27@"
Route28Name:         db "Route 28@"
Route29Name:         db "Route 29@"
Route30Name:         db "Route 30@"
Route31Name:         db "Route 31@"
Route32Name:         db "Route 32@"
Route33Name:         db "Route 33@"
Route34Name:         db "Route 34@"
Route35Name:         db "Route 35@"
Route36Name:         db "Route 36@"
Route37Name:         db "Route 37@"
Route38Name:         db "Route 38@"
Route39Name:         db "Route 39@"
Route40Name:         db "Route 40@"
Route41Name:         db "Route 41@"
Route42Name:         db "Route 42@"
Route43Name:         db "Route 43@"
Route44Name:         db "Route 44@"
Route45Name:         db "Route 45@"
Route46Name:         db "Route 46@"
DarkCaveName:        db "Dark Cave@"
IlexForestName:      db "Ilex¯Forest@"
BurnedTowerName:     db "Burned¯Tower@"
FastShipName:        db "Fast Ship@"
ViridianForestName:  db "Viridian¯Forest@"
DiglettsCaveName:    db "Diglett's¯Cave@"
TohjoFallsName:      db "Tohjo Falls@"
UndergroundName:     db "Underground@"
BattleTowerName:     db "Battle¯Tower@"
SpecialMapName:      db "Special@"
WildAreaName:        db "Wild Area@"
Route47Name:         db "Route 47@"
Route48Name:         db "Route 48@"
CliffCaveName:       db "Cliff Cave@"
CinnabarVolcanoName: db "Cinnabar¯Volcano@"
UnknownName2:        db "???@"
