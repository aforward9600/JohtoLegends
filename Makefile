roms := johtolegendsv0.1.gbc johtolegendsfaithful.gbc johtolegendschallenge.gbc johtolegendsnopss.gbc johtolegendsfr.gbc johtolegendsfaithfulfr.gbc johtolegendschallengefr.gbc

crystal_obj := \
audio.o \
home.o \
main.o \
wram.o \
data/text/common.o \
data/maps/map_data.o \
data/pokemon/dex_entries.o \
data/pokemon/egg_moves.o \
data/pokemon/evos_attacks.o \
engine/movie/credits.o \
engine/overworld/events.o \
gfx/pics.o \
gfx/sprites.o \
lib/mobile/main.o

johtolegendsfaithful_obj := $(crystal_obj:.o=faithful.o)
johtolegendschallenge_obj := $(crystal_obj:.o=challenge.o)
johtolegendsnopss_obj := $(crystal_obj:.o=nopss.o)
johtolegendsfr_obj := $(crystal_obj:.o=french.o)
johtolegendsfaithfulfr_obj := $(crystal_obj:.o=faithfulfr.o)
johtolegendschallengefr_obj := $(crystal_obj:.o=challengefr.o)

### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.PHONY: all faithful challenge french faithfulfrench challengefrench clean tidy tools
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: johtolegendsv0.1.gbc
faithful: johtolegendsfaithful.gbc
challenge: johtolegendschallenge.gbc
nopss: johtolegendsnopss.gbc
french: johtolegendsfr.gbc
faithfulfrench: johtolegendsfaithfulfr.gbc
challengefrench: johtolegendschallengefr.gbc

clean: tidy
	find gfx \( -name "*.[12]bpp" -o -name "*.lz" -o -name "*.gbcpal" \) -delete
	find gfx/pokemon -mindepth 1 ! -path "gfx/pokemon/unown/*" \( -name "bitmask.asm" -o -name "frames.asm" -o -name "front.animated.tilemap" -o -name "front.dimensions" \) -delete
	$(MAKE) clean -C tools/

tidy:
	rm -f $(roms) $(crystal_obj) $(johtolegendsfaithful_obj) $(johtolegendschallenge_obj) $(johtolegendsfr_obj) $(johtolegendsfaithfulfr_obj) $(johtolegendschallengefr_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)
	$(MAKE) clean -C tools/

compare: $(roms)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


$(crystal_obj): RGBASMFLAGS = -D _NORMAL
$(johtolegendsfaithful_obj): RGBASMFLAGS = -D _FAITHFUL
$(johtolegendschallenge_obj): RGBASMFLAGS = -D _CHALLENGE
$(johtolegendsnopss_obj): RGBASMFLAGS = -D_NOPSS
$(johtolegendsfr_obj): RGBASMFLAGS = -D _FRENCH
$(johtolegendsfaithfulfr_obj): RGBASMFLAGS = -D _FAITHFULFRENCH -D _FAITHFUL -D _FRENCH
$(johtolegendschallengefr_obj): RGBASMFLAGS = -D _CHALLENGEFRENCH -D _CHALLENGE -D _FRENCH

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell tools/scan_includes $2)
	$$(RGBASM) $$(RGBASMFLAGS) -L -o $$@ $$<
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

$(foreach obj, $(johtolegendsfaithful_obj), $(eval $(call DEP,$(obj),$(obj:faithful.o=.asm))))
$(foreach obj, $(johtolegendschallenge_obj), $(eval $(call DEP,$(obj),$(obj:challenge.o=.asm))))
$(foreach obj, $(johtolegendsnopss_obj), $(eval $(call DEP,$(obj),$(obj:nopss.o=.asm))))
$(foreach obj, $(johtolegendsfr_obj), $(eval $(call DEP,$(obj),$(obj:french.o=.asm))))
$(foreach obj, $(johtolegendsfaithfulfr_obj), $(eval $(call DEP,$(obj),$(obj:faithfulfr.o=.asm))))
$(foreach obj, $(johtolegendschallengefr_obj), $(eval $(call DEP,$(obj),$(obj:challengefr.o=.asm))))
$(foreach obj, $(crystal_obj), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))

endif


johtolegendsv0.1.gbc: $(crystal_obj) pokecrystal.link
	$(RGBLINK) -n johtolegendsv0.1.sym -m johtolegendsv0.1.map -l pokecrystal.link -o $@ $(crystal_obj)
	$(RGBFIX) -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	tools/sort_symfile.sh johtolegendsv0.1.sym

johtolegendsfaithful.gbc: $(johtolegendsfaithful_obj) pokecrystal.link
	$(RGBLINK) -n johtolegendsfaithful.sym -m johtolegendsfaithful.map -l pokecrystal.link -o $@ $(johtolegendsfaithful_obj)
	$(RGBFIX) -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	tools/sort_symfile.sh johtolegendsfaithful.sym

johtolegendschallenge.gbc: $(johtolegendschallenge_obj) pokecrystal.link
	$(RGBLINK) -n johtolegendschallenge.sym -m johtolegendschallenge.map -l pokecrystal.link -o $@ $(johtolegendschallenge_obj)
	$(RGBFIX) -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	tools/sort_symfile.sh johtolegendschallenge.sym

johtolegendsnopss.gbc: $(johtolegendsnopss_obj) pokecrystal.link
	$(RGBLINK) -n johtolegendsnopss.sym -m johtolegendsnopss.map -l pokecrystal.link -o $@ $(johtolegendsnopss_obj)
	$(RGBFIX) -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	tools/sort_symfile.sh johtolegendsnopss.sym

johtolegendsfr.gbc: $(johtolegendsfr_obj) pokecrystal.link
	$(RGBLINK) -n johtolegendsfr.sym -m johtolegendsfr.map -l pokecrystal.link -o $@ $(johtolegendsfr_obj)
	$(RGBFIX) -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	tools/sort_symfile.sh johtolegendsfr.sym

johtolegendsfaithfulfr.gbc: $(johtolegendsfaithfulfr_obj) pokecrystal.link
	$(RGBLINK) -n johtolegendsfaithfulfr.sym -m johtolegendsfaithfulfr.map -l pokecrystal.link -o $@ $(johtolegendsfaithfulfr_obj)
	$(RGBFIX) -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	tools/sort_symfile.sh johtolegendsfaithfulfr.sym

johtolegendschallengefr.gbc: $(johtolegendschallengefr_obj) pokecrystal.link
	$(RGBLINK) -n johtolegendschallengefr.sym -m johtolegendschallengefr.map -l pokecrystal.link -o $@ $(johtolegendschallengefr_obj)
	$(RGBFIX) -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	tools/sort_symfile.sh johtolegendschallengefr.sym

%.lz: hash = $(shell tools/md5 $(*D)/$(*F) | sed "s/\(.\{8\}\).*/\1/")
%.lz: %
	$(eval filename := $@.$(hash))
	$(if $(wildcard $(filename)),\
		cp $(filename) $@,\
		tools/lzcomp -- $< $@)


### Pokemon pic animation rules

gfx/pokemon/%/front.animated.2bpp: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions
	tools/pokemon_animation_graphics -o $@ $^
gfx/pokemon/%/front.animated.tilemap: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions
	tools/pokemon_animation_graphics -t $@ $^
gfx/pokemon/%/bitmask.asm: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions
	tools/pokemon_animation -b $^ > $@
gfx/pokemon/%/frames.asm: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions
	tools/pokemon_animation -f $^ > $@


### Misc file-specific graphics rules

gfx/pokemon/%/back.2bpp: rgbgfx += -h

gfx/trainers/%.2bpp: rgbgfx += -h

gfx/new_game/shrink1.2bpp: rgbgfx += -h
gfx/new_game/shrink2.2bpp: rgbgfx += -h

gfx/mail/dragonite.1bpp: tools/gfx += --remove-whitespace
gfx/mail/large_note.1bpp: tools/gfx += --remove-whitespace
gfx/mail/surf_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/flower_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/litebluemail_border.1bpp: tools/gfx += --remove-whitespace

gfx/pokedex/pokedex.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/sgb.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/slowpoke.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/question_mark.2bpp: rgbgfx += -h

gfx/pokegear/pokegear_sprites.2bpp: tools/gfx += --trim-whitespace

gfx/mystery_gift/mystery_gift.2bpp: tools/gfx += --trim-whitespace

gfx/title/crystal.2bpp: tools/gfx += --interleave --png=$<
gfx/title/old_fg.2bpp: tools/gfx += --interleave --png=$<
gfx/title/logo.2bpp: rgbgfx += -x 4

gfx/trade/ball.2bpp: tools/gfx += --remove-whitespace
gfx/trade/game_boy_n64.2bpp: tools/gfx += --trim-whitespace

gfx/slots/slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/slots_2.2bpp: tools/gfx += --interleave --png=$<
gfx/slots/slots_3.2bpp: tools/gfx += --interleave --png=$< --remove-duplicates --keep-whitespace --remove-xflip

gfx/card_flip/card_flip_2.2bpp: tools/gfx += --remove-whitespace

gfx/battle_anims/angels.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/beam.2bpp: tools/gfx += --remove-xflip --remove-yflip --remove-whitespace
gfx/battle_anims/bubble.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/charge.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/egg.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/explosion.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/hit.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/horn.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/lightning.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/misc.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/battle_anims/noise.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/objects.2bpp: tools/gfx += --remove-whitespace --remove-xflip
gfx/battle_anims/reflect.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/rocks.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/skyattack.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/status.2bpp: tools/gfx += --remove-whitespace

gfx/battle_balls/background.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_balls/poke_ball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_balls/great_ball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_balls/ultra_ball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_balls/master_ball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_balls/level_ball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_balls/lure_ball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_balls/moon_ball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_balls/friend_ball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_balls/fast_ball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_balls/heavy_ball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_balls/love_ball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_balls/park_ball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_balls/dusk_ball.2bpp: tools/gfx += --remove-xflip --keep-whitespace

gfx/player/chris.2bpp: rgbgfx += -h
gfx/player/chris_back.2bpp: rgbgfx += -h
gfx/player/kris.2bpp: rgbgfx += -h
gfx/player/kris_back.2bpp: rgbgfx += -h

gfx/trainer_card/chris_card.2bpp: rgbgfx += -h
gfx/trainer_card/kris_card.2bpp: rgbgfx += -h
gfx/trainer_card/leaders.2bpp: tools/gfx += --trim-whitespace

gfx/overworld/chris_fish.2bpp: tools/gfx += --trim-whitespace
gfx/overworld/kris_fish.2bpp: tools/gfx += --trim-whitespace

gfx/battle/dude.2bpp: rgbgfx += -h

gfx/font/unused_bold_font.1bpp: tools/gfx += --trim-whitespace

gfx/sgb/sgb_border.2bpp: tools/gfx += --trim-whitespace

gfx/mobile/ascii_font.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/electro_ball.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/electro_ball_nonmatching.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/mobile/mobile_adapter.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/mobile_splash.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/mobile/pichu_animated.2bpp: tools/gfx += --trim-whitespace

gfx/unknown/unknown_egg.2bpp: rgbgfx += -h

### Misc from Gold/Silver
gfx/intro/fire1.2bpp: gfx/intro/charizard1.2bpp gfx/intro/charizard2_top.2bpp gfx/intro/space.2bpp ; cat $^ > $@
gfx/intro/fire2.2bpp: gfx/intro/charizard2_bottom.2bpp gfx/intro/charizard3.2bpp ; cat $^ > $@
gfx/intro/fire3.2bpp: gfx/intro/fire.2bpp gfx/intro/unused_blastoise_venusaur.2bpp ; cat $^ > $@

### Catch-all graphics rules

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)

%.gbcpal: %.png
	$(RGBGFX) -p $@ $<

%.dimensions: %.png
	tools/png_dimensions $< $@
