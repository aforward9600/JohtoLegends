Drumkits:
	dw Drumkit0
	dw Drumkit1
	dw Drumkit2
	dw Drumkit3
	dw Drumkit4
	dw Drumkit5
	dw Drumkit0S
	dw Drumkit1S
	dw Drumkit_Empty
	dw Drumkit3S

Drumkit0:
	dw Drum00    ; rest
	dw Snare1    ; c
	dw Snare2    ; c#
	dw Snare3    ; d
	dw Snare4    ; d#
	dw Drum05    ; e
	dw Triangle1 ; f
	dw Triangle2 ; f#
	dw HiHat1    ; g
	dw Snare5    ; g#
	dw Snare6    ; a
	dw Snare7    ; a#
	dw HiHat2    ; b
Drumkit1:
	dw Drum00
	dw HiHat1
	dw Snare5
	dw Snare6
	dw Snare7
	dw HiHat2
	dw HiHat3
	dw Snare8
	dw Triangle3
	dw Triangle4
	dw Snare9
	dw Snare10
	dw Snare11
Drumkit2:
	dw Drum00
	dw Snare1
	dw Snare9
	dw Snare10
	dw Snare11
	dw Drum05
	dw Triangle1
	dw Triangle2
	dw HiHat1
	dw Snare5
	dw Snare6
	dw Snare7
	dw HiHat2
Drumkit3:
	dw Drum21
	dw Snare12
	dw Snare13
	dw Snare14
	dw Kick1
	dw Triangle5
	dw Drum20
	dw Drum27
	dw Drum28
	dw Drum29
	dw Drum21
	dw Kick2
	dw Crash2
Drumkit4:
	dw Drum21
	dw Drum20
	dw Snare13
	dw Snare14
	dw Kick1
	dw Drum33
	dw Triangle5
	dw Drum35
	dw Drum31
	dw Drum32
	dw Drum36
	dw Kick2
	dw Crash1
Drumkit5:
	dw Drum00
	dw Snare9
	dw Snare10
	dw Snare11
	dw Drum27
	dw Drum28
	dw Drum29
	dw Drum05
	dw Triangle1
	dw Crash1
	dw Snare14
	dw Snare13
	dw Kick2

Drum00:
; unused
	noise C#,  1, $11, $00
	endchannel

Snare1:
	noise C#,  1, $c1, $33
	endchannel

Snare2:
	noise C#,  1, $b1, $33
	endchannel

Snare3:
	noise C#,  1, $a1, $33
	endchannel

Snare4:
	noise C#,  1, $81, $33
	endchannel

Drum05:
	noise C#,  8, $84, $37
	noise C#,  7, $84, $36
	noise C#,  6, $83, $35
	noise C#,  5, $83, $34
	noise C#,  4, $82, $33
	noise C#,  3, $81, $32
	endchannel

Triangle1:
	noise C#,  1, $51, $2a
	endchannel

Triangle2:
	noise C#,  2, $41, $2b
	noise C#,  1, $61, $2a
	endchannel

HiHat1:
	noise C#,  1, $81, $10
	endchannel

Snare5:
	noise C#,  1, $82, $23
	endchannel

Snare6:
	noise C#,  1, $82, $25
	endchannel

Snare7:
	noise C#,  1, $82, $26
	endchannel

HiHat2:
	noise C#,  1, $a1, $10
	endchannel

HiHat3:
	noise C#,  1, $a2, $11
	endchannel

Snare8:
	noise C#,  1, $a2, $50
	endchannel

Triangle3:
	noise C#,  1, $a1, $18
	noise C#,  1, $31, $33
	endchannel

Triangle4:
	noise C#,  3, $91, $28
	noise C#,  1, $71, $18
	endchannel

Snare9:
	noise C#,  1, $91, $22
	endchannel

Snare10:
	noise C#,  1, $71, $22
	endchannel

Snare11:
	noise C#,  1, $61, $22
	endchannel

Drum20:
	noise C#,  1, $11, $11
	endchannel

Drum21:
	endchannel

Snare12:
	noise C#,  1, $91, $33
	endchannel

Snare13:
	noise C#,  1, $51, $32
	endchannel

Snare14:
	noise C#,  1, $81, $31
	endchannel

Kick1:
	noise C#,  1, $88, $6b
	noise C#,  1, $71, $00
	endchannel

Triangle5:
	noise D_,  1, $91, $18
	endchannel

Drum27:
	noise C#,  8, $92, $10
	endchannel

Drum28:
	noise D_,  4, $91, $00
	noise D_,  4, $11, $00
	endchannel

Drum29:
	noise D_,  4, $91, $11
	noise D_,  4, $11, $00
	endchannel

Crash1:
	noise D_,  4, $88, $15
	noise C#,  1, $65, $12
	endchannel

Drum31:
	noise D_,  4, $51, $21
	noise D_,  4, $11, $11
	endchannel

Drum32:
	noise D_,  4, $51, $50
	noise D_,  4, $11, $11
	endchannel

Drum33:
	noise C#,  1, $a1, $31
	endchannel

Crash2:
	noise C#,  1, $84, $12
	endchannel

Drum35:
	noise D_,  4, $81, $00
	noise D_,  4, $11, $00
	endchannel

Drum36:
	noise D_,  4, $81, $21
	noise D_,  4, $11, $11
	endchannel

Kick2:
	noise C#,  1, $a8, $6b
	noise C#,  1, $71, $00
	endchannel

Drumkit0S: ;6
	dw Drum00   
	dw Snare2
	dw Snare3   
	dw Snare4 
	dw Snare4_Soft 
	dw Drum05  
	dw Triangle1_Soft
	dw Triangle2_Soft
	dw HiHat1_Soft
	dw Snare5_Soft
	dw Snare6_Soft
	dw Snare7_Soft
	dw HiHat1
Drumkit1S: ;7
	dw Drum00
	dw HiHat1_Soft
	dw Snare5_Soft
	dw Snare6_Soft
	dw Snare7_Soft
	dw HiHat2_Soft
	dw HiHat3_Soft
	dw Snare8_Soft
	dw Triangle3_Soft
	dw Triangle4_Soft
	dw Snare9_Soft
	dw Snare10_Soft
	dw Snare11_Soft
Drumkit_Empty: ;8
Drumkit3S: ; 9
	dw Drum00
	dw Snare12_Soft
	dw Snare13_Soft
	dw Snare14_Soft
	dw Kick1_Soft
	dw Triangle5_Soft
	dw Snare5_Soft
	dw Drum27_Soft
	dw Drum28_Soft
	dw Drum29_Soft
	dw Snare9_Soft
	dw Kick2_Soft
	dw Crash2_Soft

;Softer Noise Notes

Snare12_Soft:
	noise C#,  1, $81, $33
	endchannel

Snare13_Soft:
	noise C#,  1, $41, $32
	endchannel

Snare14_Soft:
	noise C#,  1, $71, $31
	endchannel

Kick1_Soft:
	noise C#,  1, $78, $6b
	noise C#,  1, $61, $00
	endchannel

Triangle5_Soft:
	noise D_,  1, $81, $18
	endchannel

Drum27_Soft:
	noise C#,  8, $82, $10
	endchannel

Drum28_Soft:
	noise D_,  4, $81, $00
	noise D_,  4, $11, $00
	endchannel

Drum29_Soft:
	noise D_,  4, $81, $11
	noise D_,  4, $11, $00
	endchannel

Snare4_Soft:
	noise C#,  1, $71, $33
	endchannel

Snare5_Soft:
	noise C#,  1, $72, $23
	endchannel

Snare6_Soft:
	noise C#,  1, $72, $25
	endchannel

Snare7_Soft:
	noise C#,  1, $72, $26
	endchannel

Snare8_Soft:
	noise C#,  1, $92, $50
	endchannel

Snare9_Soft:
	noise C#,  1, $81, $22
	endchannel

Snare10_Soft:
	noise C#,  1, $61, $22
	endchannel

Snare11_Soft:
	noise C#,  1, $51, $22
	endchannel

Kick2_Soft:
	noise C#,  1, $98, $6b
	noise C#,  1, $61, $00
	endchannel

Crash2_Soft:
	noise C#,  1, $74, $12
	endchannel

Triangle1_Soft:
	noise C#,  1, $61, $2a
	endchannel

Triangle2_Soft:
	noise C#,  2, $31, $2b
	noise C#,  1, $51, $2a
	endchannel

Triangle3_Soft:
	noise C#,  1, $91, $18
	noise C#,  1, $21, $33
	endchannel

Triangle4_Soft:
	noise C#,  3, $81, $28
	noise C#,  1, $61, $18
	endchannel

HiHat1_Soft:
	noise C#,  1, $71, $10
	endchannel

HiHat2_Soft:
	noise C#,  1, $91, $10
	endchannel

HiHat3_Soft:
	noise C#,  1, $92, $11
	endchannel
