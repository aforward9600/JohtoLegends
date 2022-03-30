MonMenuOptions:
; category, item, value; actions are in PokemonActionSubmenu (see engine/pokemon/mon_menu.asm)
; moves
	dbbw MONMENU_FIELD_MOVE, MONMENUITEM_CUT,        CUT
	dbbw MONMENU_FIELD_MOVE, MONMENUITEM_DIG,        DIG
	dbbw MONMENU_FIELD_MOVE, MONMENUITEM_TELEPORT,   TELEPORT
	dbbw MONMENU_FIELD_MOVE, MONMENUITEM_SOFTBOILED, SOFTBOILED
	dbbw MONMENU_FIELD_MOVE, MONMENUITEM_MILKDRINK,  MILK_DRINK
	dbbw MONMENU_FIELD_MOVE, MONMENUITEM_SWEETSCENT, SWEET_SCENT
; options
	dbbw MONMENU_MENUOPTION, MONMENUITEM_STATS,      .stats
	dbbw MONMENU_MENUOPTION, MONMENUITEM_SWITCH,     .switch
	dbbw MONMENU_MENUOPTION, MONMENUITEM_ITEM,       .item
	dbbw MONMENU_MENUOPTION, MONMENUITEM_CANCEL,     .cancel
	dbbw MONMENU_MENUOPTION, MONMENUITEM_MOVE,       .move
	dbbw MONMENU_MENUOPTION, MONMENUITEM_MAIL,       .mail
	dbbw MONMENU_MENUOPTION, MONMENUITEM_ERROR,      .error
	db -1

.stats:  db "Stats@"
.switch: db "Switch@"
.item:   db "Item@"
.cancel: db "Cancel@"
.move:   db "Move@"
.mail:   db "Mail@"
.error:  db "ERROR!@"
