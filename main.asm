INCLUDE "constants.asm"

SECTION "bank1", ROMX

INCLUDE "engine/link/place_waiting_text.asm"
INCLUDE "engine/gfx/load_push_oam.asm"
INCLUDE "engine/overworld/map_objects.asm"
INCLUDE "engine/menus/intro_menu.asm"
INCLUDE "engine/overworld/init_map.asm"
INCLUDE "engine/pokemon/learn.asm"
INCLUDE "engine/pokemon/correct_nick_errors.asm"
INCLUDE "engine/math/math.asm"
INCLUDE "data/items/attributes.asm"
INCLUDE "engine/overworld/npc_movement.asm"
INCLUDE "engine/events/happiness_egg.asm"
INCLUDE "engine/events/shuckle.asm"
INCLUDE "engine/events/haircut.asm"


SECTION "bank2", ROMX

INCLUDE "engine/overworld/player_object.asm"
INCLUDE "engine/math/sine.asm"
INCLUDE "engine/predef.asm"

SECTION "Color", ROMX

INCLUDE "engine/gfx/color.asm"


SECTION "bank3", ROMX

INCLUDE "engine/events/checktime.asm"
INCLUDE "engine/events/specials.asm"
INCLUDE "engine/math/print_num.asm"
INCLUDE "engine/pokemon/health.asm"
INCLUDE "engine/events/overworld.asm"
INCLUDE "engine/items/items.asm"
INCLUDE "engine/overworld/player_step.asm"
INCLUDE "engine/battle/anim_hp_bar.asm"
INCLUDE "engine/pokemon/move_mon.asm"
INCLUDE "engine/pokemon/bills_pc_top.asm"
INCLUDE "engine/pokemon/breedmon_level_growth.asm"
INCLUDE "engine/events/bug_contest/caught_mon.asm"
INCLUDE "engine/items/item_effects.asm"
INCLUDE "engine/battle_anims/pokeball_wobble.asm"
INCLUDE "engine/pokemon/knows_move.asm"


SECTION "bank4", ROMX

INCLUDE "engine/items/pack.asm"
INCLUDE "engine/overworld/time.asm"
INCLUDE "engine/items/tmhm2.asm"
INCLUDE "engine/menus/naming_screen.asm"
INCLUDE "engine/events/misc_scripts.asm"
INCLUDE "engine/events/heal_machine_anim.asm"
INCLUDE "engine/events/whiteout.asm"
INCLUDE "engine/events/forced_movement.asm"
INCLUDE "engine/events/itemfinder.asm"
INCLUDE "engine/menus/start_menu.asm"
INCLUDE "engine/pokemon/mon_menu.asm"
INCLUDE "engine/overworld/select_menu.asm"
INCLUDE "engine/events/elevator.asm"
INCLUDE "engine/events/bug_contest/contest.asm"
INCLUDE "engine/events/misc_scripts_2.asm"
INCLUDE "engine/events/std_collision.asm"
INCLUDE "engine/events/pokerus/apply_pokerus_tick.asm"

SECTION "Bug Contest", ROMX

INCLUDE "engine/events/bug_contest/contest_2.asm"


SECTION "bank5", ROMX

INCLUDE "engine/rtc/rtc.asm"
INCLUDE "engine/overworld/overworld.asm"
INCLUDE "engine/overworld/tile_events.asm"
INCLUDE "engine/menus/save.asm"
INCLUDE "engine/overworld/spawn_points.asm"
INCLUDE "engine/overworld/map_setup.asm"
INCLUDE "engine/events/pokecenter_pc.asm"
INCLUDE "engine/items/mart.asm"
INCLUDE "engine/events/money.asm"
INCLUDE "data/items/marts.asm"
INCLUDE "engine/events/mom.asm"
INCLUDE "engine/events/daycare.asm"
INCLUDE "engine/events/print_unown.asm"
INCLUDE "engine/events/print_photo.asm"
INCLUDE "engine/pokemon/breeding.asm"
INCLUDE "gfx/tilesets.asm"


SECTION "Roofs", ROMX

INCLUDE "engine/tilesets/mapgroup_roofs.asm"
INCLUDE "engine/events/celebi.asm"


SECTION "Clock Reset", ROMX

INCLUDE "engine/rtc/restart_clock.asm"


SECTION "bank9", ROMX

INCLUDE "engine/menus/menu.asm"
INCLUDE "engine/items/update_item_description.asm"
INCLUDE "engine/events/pokepic.asm"
INCLUDE "engine/overworld/map_objects_2.asm"
INCLUDE "engine/menus/scrolling_menu.asm"
INCLUDE "engine/items/switch_items.asm"
INCLUDE "engine/menus/menu_2.asm"
INCLUDE "engine/pokemon/mon_submenu.asm"
INCLUDE "engine/battle/menu.asm"
INCLUDE "engine/items/buy_sell_toss.asm"
INCLUDE "engine/events/prof_oaks_pc.asm"
INCLUDE "engine/overworld/decorations.asm"
INCLUDE "engine/pokemon/level_up_happiness.asm"
INCLUDE "engine/battle/read_trainer_dvs.asm"
INCLUDE "engine/battle/returntobattle_useball.asm"
INCLUDE "engine/battle/consume_held_item.asm"
INCLUDE "data/moves/effects.asm"

SECTION "Kurt Event", ROMX

INCLUDE "engine/events/kurt_selectquantity_interpretjoypad.asm"
INCLUDE "data/text_buffers.asm"
INCLUDE "engine/menus/trainer_card.asm"


SECTION "bankA", ROMX

INCLUDE "engine/overworld/wildmons.asm"
INCLUDE "engine/events/pokerus/pokerus.asm"

ChrisBackpic:
INCBIN "gfx/player/chris_back.2bpp.lz"

DudeBackpic:
INCBIN "gfx/battle/dude.2bpp.lz"


SECTION "bankB", ROMX

INCLUDE "engine/battle/trainer_huds.asm"
INCLUDE "engine/battle/ai/redundant.asm"
INCLUDE "engine/events/move_deleter.asm"
INCLUDE "engine/items/tmhm.asm"
INCLUDE "engine/pokemon/print_move_description.asm"
if DEF(_FRENCH)
INCLUDE "data/moves/description_french.asm"
else
INCLUDE "data/moves/descriptions.asm"
endc
INCLUDE "engine/battle/start_battle.asm"

SECTION "Enemy Trainers", ROMX

INCLUDE "engine/battle/ai/items.asm"
INCLUDE "engine/battle/read_trainer_attributes.asm"
INCLUDE "engine/battle/read_trainer_party.asm"


SECTION "Mystery Gift", ROMX

INCLUDE "engine/link/mystery_gift_2.asm"

SECTION "Battle Core", ROMX

INCLUDE "engine/battle/core.asm"


SECTION "Battle Core 2", ROMX

INCLUDE "data/battle/effect_command_pointers.asm"


SECTION "Battle Core 4", ROMX

INCLUDE "engine/battle/core2.asm"

SECTION "bank10", ROMX

INCLUDE "data/moves/moves.asm"
INCLUDE "engine/pokemon/evolve.asm"


SECTION "bank11", ROMX

INCLUDE "engine/events/fruit_trees.asm"
INCLUDE "engine/battle/ai/move.asm"
INCLUDE "engine/pokedex/pokedex.asm"
INCLUDE "engine/pokedex/pokedex_2.asm"
INCLUDE "engine/pokemon/mail.asm"
INCLUDE "engine/gfx/place_graphic.asm"
INCLUDE "engine/events/buena_menu.asm"
INCLUDE "engine/menus/main_menu.asm"
INCLUDE "data/trainers/class_names.asm"


SECTION "Crystal Features 1", ROMX

INCLUDE "engine/menus/init_gender.asm"
INCLUDE "engine/items/pack_kris.asm"


SECTION "Crystal Layouts", ROMX

INCLUDE "engine/gfx/crystal_layouts.asm"


SECTION "Tileset Palettes", ROMX

INCLUDE "engine/events/move_tutor.asm"

SECTION "bank13", ROMX

INCLUDE "data/collision_permissions.asm"
INCLUDE "engine/menus/empty_sram.asm"
INCLUDE "engine/menus/savemenu_copytilemapatonce.asm"
INCLUDE "engine/events/checksave.asm"
INCLUDE "data/maps/scenes.asm"
INCLUDE "engine/overworld/load_map_part.asm"
INCLUDE "engine/phone/phonering_copytilemapatonce.asm"

Shrink1Pic:
INCBIN "gfx/new_game/shrink1.2bpp.lz"

Shrink2Pic:
INCBIN "gfx/new_game/shrink2.2bpp.lz"

INCLUDE "engine/link/link_2.asm"
INCLUDE "engine/rtc/reset_password.asm"
INCLUDE "engine/menus/delete_save.asm"
INCLUDE "data/tilesets.asm"
INCLUDE "engine/smallflag.asm"
INCLUDE "engine/gfx/trademon_frontpic.asm"
INCLUDE "engine/events/pokerus/check_pokerus.asm"
INCLUDE "engine/events/lucky_number.asm"
INCLUDE "engine/pokemon/caught_data.asm"
INCLUDE "engine/pokemon/search2.asm"
INCLUDE "engine/pokemon/stats_screen.asm"
INCLUDE "engine/movie/evolution_animation.asm"
INCLUDE "engine/movie/init_hof_credits.asm"
INCLUDE "engine/events/battle_tower/get_trainer_class.asm"
INCLUDE "engine/battle/sliding_intro.asm"
INCLUDE "engine/battle/check_battle_scene.asm"
INCLUDE "engine/movie/gbc_only.asm"
INCLUDE "engine/events/poke_seer.asm"


SECTION "bank14", ROMX

INCLUDE "engine/pokemon/party_menu.asm"
INCLUDE "engine/pokemon/tempmon.asm"
INCLUDE "engine/pokemon/types.asm"
INCLUDE "engine/pokemon/categories.asm"
INCLUDE "engine/pokemon/mon_stats.asm"
INCLUDE "engine/pokemon/experience.asm"
INCLUDE "engine/pokemon/switchpartymons.asm"
INCLUDE "engine/gfx/load_pics.asm"
INCLUDE "engine/pokemon/move_mon_wo_mail.asm"
INCLUDE "data/pokemon/base_stats.asm"
if DEF(_FRENCH)
INCLUDE "data/pokemon/names_french.asm"
else
INCLUDE "data/pokemon/names.asm"
endc

UnknownEggPic::
; Another egg pic. This is shifted up a few pixels.
INCBIN "gfx/unknown/unknown_egg.2bpp.lz"


SECTION "Crystal Phone Text", ROMX

INCLUDE "engine/events/squirtbottle.asm"
INCLUDE "engine/events/card_key.asm"


SECTION "bank20", ROMX

INCLUDE "engine/overworld/player_movement.asm"
INCLUDE "engine/events/engine_flags.asm"
INCLUDE "engine/overworld/variables.asm"
if DEF(_FRENCH)
INCLUDE "data/text/battle_french.asm"
else
INCLUDE "data/text/battle.asm"
endc


SECTION "bank21", ROMX

INCLUDE "engine/printer/printer_serial.asm"
INCLUDE "engine/printer/printer.asm"
INCLUDE "gfx/battle_anims.asm"
INCLUDE "engine/events/halloffame.asm"


SECTION "Crystal Features 2", ROMX

INCLUDE "engine/events/kurt.asm"
INCLUDE "engine/gfx/player_gfx.asm"
INCLUDE "engine/events/unown_walls.asm"
INCLUDE "engine/events/buena.asm"
INCLUDE "engine/events/dratini.asm"
INCLUDE "engine/events/battle_tower/rules.asm"


SECTION "bank23", ROMX

INCLUDE "engine/tilesets/timeofday_pals.asm"
INCLUDE "engine/battle/battle_transition.asm"
INCLUDE "engine/battle/battlestart_copytilemapatonce.asm"
INCLUDE "engine/gfx/sprites.asm"
INCLUDE "engine/gfx/mon_icons.asm"


SECTION "bank24", ROMX

INCLUDE "engine/phone/phone.asm"
INCLUDE "engine/rtc/timeset.asm"
INCLUDE "engine/pokegear/pokegear.asm"

SECTION "bank24-2",ROMX

INCLUDE "engine/events/fish.asm"
INCLUDE "engine/games/slot_machine.asm"
INCLUDE "data/pokemon/previous_stages.asm"


SECTION "Phone Scripts 1", ROMX

INCLUDE "engine/phone/scripts/generic_caller.asm"
INCLUDE "engine/phone/scripts/hangups.asm"
INCLUDE "engine/phone/scripts/reminders.asm"
INCLUDE "engine/phone/scripts/hangups_2.asm"
INCLUDE "engine/phone/scripts/reminders_2.asm"
INCLUDE "engine/phone/scripts/bike_shop.asm"


SECTION "Phone Text", ROMX

INCLUDE "engine/phone/scripts/buena.asm"

SECTION "bank2E", ROMX

INCLUDE "engine/events/map_name_sign.asm"
INCLUDE "engine/events/checkforhiddenitems.asm"
INCLUDE "engine/events/treemons.asm"
INCLUDE "engine/events/fishing_gfx.asm"
INCLUDE "engine/pokegear/radio.asm"
INCLUDE "engine/pokemon/mail_2.asm"


SECTION "Phone Scripts 2", ROMX

INCLUDE "engine/events/std_scripts.asm"
INCLUDE "engine/phone/scripts/unused.asm"
INCLUDE "engine/phone/scripts/mom.asm"
INCLUDE "engine/phone/scripts/bill.asm"
INCLUDE "engine/phone/scripts/elm.asm"
INCLUDE "engine/phone/scripts/generic_callee.asm"
INCLUDE "engine/events/trainer_scripts.asm"


SECTION "bank32", ROMX

TheEndGFX::
INCBIN "gfx/credits/theend.2bpp"


SECTION "Move Animations", ROMX

INCLUDE "engine/battle_anims/anim_commands.asm"
INCLUDE "engine/battle_anims/core.asm"
INCLUDE "engine/battle_anims/functions.asm"
INCLUDE "engine/battle_anims/helpers.asm"
INCLUDE "data/battle_anims/framesets.asm"
INCLUDE "data/battle_anims/oam.asm"
INCLUDE "data/battle_anims/object_gfx.asm"


SECTION "Move Animations 2", ROMX

INCLUDE "engine/battle_anims/core_2.asm"


SECTION "Pic Animations 1", ROMX

INCLUDE "engine/gfx/pic_animation.asm"
INCLUDE "gfx/pokemon/anim_pointers.asm"
INCLUDE "gfx/pokemon/anims.asm"
INCLUDE "gfx/pokemon/idle_pointers.asm"
INCLUDE "gfx/pokemon/idles.asm"
INCLUDE "gfx/pokemon/unown_anim_pointers.asm"
INCLUDE "gfx/pokemon/unown_anims.asm"
INCLUDE "gfx/pokemon/unown_idle_pointers.asm"
INCLUDE "gfx/pokemon/unown_idles.asm"


SECTION "Pic Animations 2", ROMX

INCLUDE "gfx/pokemon/frame_pointers.asm"
INCLUDE "gfx/pokemon/kanto_frames.asm"


SECTION "Font Inversed", ROMX

FontInversed:
INCBIN "gfx/font/font_inversed.1bpp"


SECTION "Pic Animations 3", ROMX

INCLUDE "gfx/pokemon/johto_frames.asm"


SECTION "Unown Animations", ROMX

INCLUDE "gfx/pokemon/unown_frame_pointers.asm"
INCLUDE "gfx/pokemon/unown_frames.asm"
INCLUDE "gfx/pokemon/unown_bitmask_pointers.asm"
INCLUDE "gfx/pokemon/unown_bitmasks.asm"


SECTION "Pic Animations 4", ROMX

INCLUDE "gfx/pokemon/bitmask_pointers.asm"
INCLUDE "gfx/pokemon/bitmasks.asm"

SECTION "bank38", ROMX

INCLUDE "engine/events/print_unown_2.asm"
INCLUDE "engine/games/card_flip.asm"
INCLUDE "engine/games/unown_puzzle.asm"
INCLUDE "engine/games/dummy_game.asm"
INCLUDE "engine/pokemon/bills_pc.asm"


SECTION "bank39", ROMX

CopyrightGFX::
INCBIN "gfx/splash/copyright.2bpp"

INCLUDE "engine/movie/crystal_intro.asm"

SECTION "BG Effects", ROMX

INCLUDE "engine/battle_anims/bg_effects.asm"


SECTION "Options Menu", ROMX
INCLUDE "engine/menus/options_menu.asm"

SECTION "bank3E", ROMX

INCLUDE "engine/gfx/load_font.asm"
INCLUDE "engine/events/play_slow_cry.asm"
INCLUDE "engine/pokedex/new_pokedex_entry.asm"
INCLUDE "engine/battle/hidden_power.asm"
INCLUDE "engine/battle/misc.asm"

SECTION "Unown Dex", ROMX

INCLUDE "engine/pokedex/unown_dex.asm"

SECTION "Time Capsule 2", ROMX

INCLUDE "engine/link/time_capsule_2.asm"

SECTION "Magikarp Event", ROMX

INCLUDE "engine/events/magikarp.asm"
INCLUDE "engine/events/hidden_power_change.asm"


SECTION "bank3F", ROMX

INCLUDE "engine/tilesets/tileset_anims.asm"
INCLUDE "engine/events/npc_trade.asm"
INCLUDE "engine/events/mom_phone.asm"


SECTION "bank41", ROMX

INCLUDE "engine/gfx/dma_transfer.asm"
INCLUDE "gfx/emotes.asm"
INCLUDE "engine/overworld/warp_connection.asm"
INCLUDE "engine/link/mystery_gift.asm"
INCLUDE "engine/battle/used_move_text.asm"
INCLUDE "mobile/mobile_41.asm"
INCLUDE "engine/gfx/load_overworld_font.asm"
INCLUDE "engine/link/init_list.asm"


SECTION "Intro Logo", ROMX

IntroLogoGFX:
INCBIN "gfx/intro/logo.2bpp.lz"


SECTION "Title", ROMX

INCLUDE "engine/movie/title.asm"


INCLUDE "mobile/mobile_45.asm"


INCLUDE "mobile/mobile_46.asm"


SECTION "Battle Tower", ROMX

INCLUDE "engine/events/battle_tower/trainer_text.asm"


SECTION "bank5B", ROMX

INCLUDE "engine/link/link_trade.asm"
INCLUDE "engine/link/link.asm"
INCLUDE "engine/battle/link_result.asm"


SECTION "Mobile 5C", ROMX

INCLUDE "mobile/mobile_5c.asm"


SECTION "Crystal Phone Text 2", ROMX

INCLUDE "data/phone/text/bike_shop.asm"


SECTION "UpdateBattleHUDs", ROMX

INCLUDE "engine/battle/update_battle_huds.asm"


SECTION "Mobile 5F", ROMX

INCLUDE "mobile/mobile_5f.asm"


SECTION "Phone Text 2", ROMX

INCLUDE "data/text/std_text.asm"


SECTION "Special Phone Text", ROMX

INCLUDE "data/phone/text/mom.asm"
INCLUDE "data/phone/text/bill.asm"
INCLUDE "data/phone/text/elm.asm"
INCLUDE "data/phone/text/unused.asm"


SECTION "Miscellaneous Text", ROMX

if DEF(_FRENCH)
INCLUDE "data/items/names_french.asm"
else
INCLUDE "data/items/names.asm"
endc
INCLUDE "engine/items/print_item_description.asm"
if DEF(_FRENCH)
INCLUDE "data/moves/names_french.asm"
else
INCLUDE "data/moves/names.asm"
endc
INCLUDE "engine/overworld/landmarks.asm"


SECTION "bank77", ROMX

UnownFont:
INCBIN "gfx/font/unown_font.2bpp"

INCLUDE "engine/printer/print_party.asm"
INCLUDE "engine/pokemon/search.asm"
INCLUDE "engine/events/poisonstep.asm"
INCLUDE "engine/events/sweet_scent.asm"
INCLUDE "engine/events/sacred_ash.asm"


SECTION "bank77_2", ROMX

INCLUDE "engine/rtc/print_hours_mins.asm"
INCLUDE "engine/events/diploma.asm"
INCLUDE "engine/pokedex/pokedex_3.asm"
INCLUDE "engine/pokegear/townmap_convertlinebreakcharacters.asm"
INCLUDE "engine/pokemon/european_mail.asm"


SECTION "Battle Tower Text", ROMX

INCLUDE "data/battle_tower/trainer_text.asm"


SECTION "Battle Tower Trainer Data", ROMX

INCLUDE "data/battle_tower/unknown.asm"
INCLUDE "engine/battle/ai/scoring.asm"
INCLUDE "engine/events/field_moves.asm"

SECTION "Mobile News Data", ROMX

INCLUDE "engine/events/magnet_train.asm"


SECTION "Crystal Events", ROMX

INCLUDE "engine/events/battle_tower/load_trainer.asm"
INCLUDE "engine/events/odd_egg.asm"


SECTION "16-bit ID stuff", ROMX

INCLUDE "engine/16/table_functions.asm"
INCLUDE "data/pokemon/dex_numbers.asm"

; own section
INCLUDE "data/trainers/parties.asm"

SECTION "New Base Stats", ROMX

INCLUDE "data/pokemon/base_stats_2.asm"

SECTION "Battle Weather Images", ROMX

INCLUDE "gfx/weather_images.asm"
INCLUDE "engine/events/poisonstep_pals.asm"
INCLUDE "engine/link/time_capsule.asm"
INCLUDE "engine/battle/shiny_swarm.asm"
INCLUDE "engine/events/move_relearner.asm"
INCLUDE "engine/events/hidden_power_guru.asm"
INCLUDE "engine/events/bug_contest/display_stats.asm"
INCLUDE "engine/events/name_rater.asm"

SECTION "Move Animation 2", ROMX

INCLUDE "data/moves/animations.asm"

SECTION "Battle Core 3", ROMX

INCLUDE "engine/battle/effect_command_files.asm"

SECTION "Abilities", ROMX

INCLUDE "engine/abilities/ability_prints.asm"
INCLUDE "engine/abilities/battle_abilities.asm"
INCLUDE "data/moves/sound_moves.asm"
INCLUDE "engine/abilities/unaware_calc.asm"
