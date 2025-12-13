_ReturnToBattle_UseBall:
	call ClearBGPalettes
	call ClearTileMap
	farcall SetEnemyBufferForm
	farcall GetEnemyMonFrontpic
	farcall GetBattleMonBackpic
	farcall _LoadBattleFontsHPBar
	call GetMemSGBLayout
	call CloseWindow
	call LoadStandardMenuHeader
	call WaitBGMap
	jp SetPalettes
