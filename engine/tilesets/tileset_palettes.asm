LoadSpecialMapPalette:
	call GetMapTimeOfDay
	bit IN_DARKNESS_F, a
	jr z, .not_dark
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jr z, .darkness

.not_dark
	ld a, [wMapTileset]
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_BATTLE_TOWER
	jr z, .battle_tower
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_HOUSE
	jr z, .house
;	cp TILESET_RADIO_TOWER
;	jr z, .radio_tower
	cp TILESET_MANSION
	jp z, .mansion_mobile
	cp TILESET_TOWER
	jp z, .tower
	cp TILESET_KANTO
	jp z, .kanto
	cp TILESET_MART
	jp z, .mart
	cp TILESET_CAVE
	jp z, .cave
	cp TILESET_SUMMIT
	jp z, .summit
	cp TILESET_DRACO_SCENE
	jp z, .draco_scene
	cp TILESET_DAHLIA_SCENE
	jp z, .dahlia_scene
	cp TILESET_TOWER_ROOF
	jp z, .tower_roof
	jp .do_nothing

.darkness
	call LoadDarknessPalette
	scf
	ret

.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.battle_tower
	call LoadBattleTowerPalette
	scf
	ret

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jp z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

;.radio_tower
;	call LoadRadioTowerPalette
;	scf
;	ret

.mansion_mobile
	ld a, [wEnvironment]
	and $7
	cp DUNGEON
	jr z, .LoadMansionRoofPalette
	call LoadMansionPalette
	scf
	ret

.LoadMansionRoofPalette
	ld hl, MansionRoofPalette
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	call AddNTimes
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret

.tower
	ld a, [wEnvironment]
	and $7
	cp GATE
	jr z, .LoadTowerPalette
	cp ROUTE
	jr z, .LoadTowerPalette
	and a
	ret

.LoadTowerPalette
	ld a, [wTimeOfDay]
	and $7
	cp NITE_F
	jr z, .LoadTowerNightPalette
	call LoadTowerDayPalette
	scf
	ret

.LoadTowerNightPalette
	call LoadTowerNightPalette
	scf
	ret

.kanto
	ld hl, KantoPalette
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	call AddNTimes
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret

.mart
	ld a, [wEnvironment]
	and $7
	cp DUNGEON
	jr z, .LoadMansionRoofPalette
	and a
	ret

.cave
	ld a, [wEnvironment]
	and $7
	cp CAVE ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.summit:
	ld hl, SummitPalette
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	call AddNTimes
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret

.draco_scene:
	ld hl, DracoScenePalette
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	call AddNTimes
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret

.dahlia_scene:
	ld hl, DahliaScenePalette
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	call AddNTimes
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret

.tower_roof:
	ld hl, TowerRoofPalette
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	call AddNTimes
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret

.do_nothing
	and a
	ret

INCLUDE "gfx/tilesets/kanto.pal"

INCLUDE "gfx/tilesets/mansion_roof.pal"

INCLUDE "gfx/tilesets/summit.pal"

INCLUDE "gfx/tilesets/draco_scene.pal"

INCLUDE "gfx/tilesets/dahlia_scene.pal"

INCLUDE "gfx/tilesets/tower_roof.pal"

LoadCaveRoomPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, CaveRoomPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

CaveRoomPalette:
INCLUDE "gfx/tilesets/cave_room.pal"

LoadDarknessPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, DarknessPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

DarknessPalette:
INCLUDE "gfx/tilesets/darkness.pal"

LoadPokeComPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokeComPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

PokeComPalette:
INCLUDE "gfx/tilesets/pokecom_center.pal"

LoadBattleTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, BattleTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

BattleTowerPalette:
INCLUDE "gfx/tilesets/battle_tower.pal"

LoadIcePathPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

IcePathPalette:
INCLUDE "gfx/tilesets/ice_path.pal"

LoadHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

HousePalette:
INCLUDE "gfx/tilesets/house.pal"

;LoadRadioTowerPalette:
;	ld a, BANK(wBGPals1)
;	ld de, wBGPals1
;	ld hl, RadioTowerPalette
;	ld bc, 8 palettes
;	call FarCopyWRAM
;	ret

;RadioTowerPalette:
;INCLUDE "gfx/tilesets/radio_tower.pal"

MansionPalette1:
INCLUDE "gfx/tilesets/mansion_1.pal"

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette1 palette 6
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 palette 8
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

MansionPalette2:
INCLUDE "gfx/tilesets/mansion_2.pal"

LoadTowerNightPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, TowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

TowerPalette:
INCLUDE "gfx/tilesets/tower_night.pal"

LoadTowerDayPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, TowerDayPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

TowerDayPalette:
INCLUDE "gfx/tilesets/tower_day.pal"

LoadSpecialNPCPalette:
	call GetMapTimeOfDay
	bit IN_DARKNESS_F, a
	jr z, .do_nothing
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jr nz, .do_nothing

;darkness
	call LoadNPCDarknessPalette
	scf
	ret

.do_nothing
	and a
	ret

LoadNPCDarknessPalette:
	ld a, BANK(wOBPals1)
	ld de, wOBPals1
	ld hl, NPCDarknessPalette
	ld bc, 8 palettes
	jp FarCopyWRAM

NPCDarknessPalette:
INCLUDE "gfx/overworld/npc_sprites_darkness.pal"
