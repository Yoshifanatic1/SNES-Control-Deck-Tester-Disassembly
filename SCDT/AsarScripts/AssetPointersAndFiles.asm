; Note: This file is used by the ExtractAssets.bat batch script to define where each file is, how large they are, and their filenames.

lorom
;!ROMVer = $0000						; Note: This is set within the batch script
!SCDT_USA = $0001

org $008000
MainPointerTableStart:
	dl MainPointerTableStart,MainPointerTableEnd-MainPointerTableStart
	dl UncompressedGFXPointersStart,(UncompressedGFXPointersEnd-UncompressedGFXPointersStart)/$0C
	dl TilemapsPointersStart,(TilemapsPointersEnd-TilemapsPointersStart)/$0C
	dl PalettesPointersStart,(PalettesPointersEnd-PalettesPointersStart)/$0C
	dl GarbageDataPointersStart,(GarbageDataPointersEnd-GarbageDataPointersStart)/$0C
	dl MusicPointersStart,(MusicPointersEnd-MusicPointersStart)/$0C
	dl BRRPointersStart,(BRRPointersEnd-BRRPointersStart)/$0C
MainPointerTableEnd:

;--------------------------------------------------------------------

UncompressedGFXPointersStart:
	;dl $018000,$019000,GFX_Layer1_RainbowSNESLogoScreen,GFX_Layer1_RainbowSNESLogoScreenEnd
	;dl $019000,$01B000,GFX_Layer2_RainbowSNESLogoScreen,GFX_Layer2_RainbowSNESLogoScreenEnd
	;dl $028000,$02A000,GFX_2BPPFont,GFX_2BPPFontEnd
	;dl $02A000,$02C000,GFX_4BPPFont,GFX_4BPPFontEnd
	;dl $02C000,$038000,GFX_Sprite_BetaSMWGFX,GFX_Sprite_BetaSMWGFXEnd
	;dl $038000,$03B000,GFX_BG_WindowEffectTestScreen,GFX_BG_WindowEffectTestScreenEnd
	dl $048000,$04E000,GFX_BG_BetaSMWGFX,GFX_BG_BetaSMWGFXEnd
	dl $04E000,$04E200,GFX_Layer3_BetaSMWGFX,GFX_Layer3_BetaSMWGFXEnd
	dl $04E200,$058000,GFX_Sprite_SMB3Platform,GFX_Sprite_SMB3PlatformEnd
	;dl $068000,$078000,GFX_Layer1_8BPPLadyScreen,GFX_Layer1_8BPPLadyScreenEnd
	;dl $078000,$079000,GFX_8BPPLadyScreen_BlankGFXFile,GFX_8BPPLadyScreen_BlankGFXFileEnd
	;dl $079000,$07C000,GFX_Layer2_8BPPLadyScreen,GFX_Layer2_8BPPLadyScreenEnd
	;dl $088000,$098000,GFX_Mode7_Mario3BoxArtScreen,GFX_Mode7_Mario3BoxArtScreenEnd
	;dl $0A8000,$0AC000,GFX_Mode7_NintendoLogoScreen,GFX_Mode7_NintendoLogoScreenEnd
	;dl $0D9000,$0DD000,GFX_BG_DrMarioScreen,GFX_BG_DrMarioScreenEnd
UncompressedGFXPointersEnd:

;--------------------------------------------------------------------

TilemapsPointersStart:
	;dl $01B000,$01C000,TM_Layer1_RainbowSNESLogoScreen,TM_Layer1_RainbowSNESLogoScreenEnd
	;dl $01C000,$01E000,TM_Layer2_RainbowSNESLogoScreen,TM_Layer2_RainbowSNESLogoScreenEnd
	;dl $01F000,$028000,TM_DiagonalStripeScreen,TM_DiagonalStripeScreenEnd
	;dl $03B000,$03B800,TM_Layer1_WindowEffectTestScreen,TM_Layer1_WindowEffectTestScreenEnd
	;dl $03B800,$03C000,TM_Layer2_WindowEffectTestScreen,TM_Layer2_WindowEffectTestScreenEnd
	;dl $058000,$059000,TM_Layer1_BetaSMWLevelScreen,TM_Layer1_BetaSMWLevelScreenEnd
	;dl $059000,$05A000,TM_Layer2_BetaSMWLevelScreen,TM_Layer2_BetaSMWLevelScreenEnd
	;dl $05A000,$05B000,TM_Layer3_BetaSMWLevelScreen,TM_Layer3_BetaSMWLevelScreenEnd
	;dl $07C000,$07C800,TM_Layer1_8BPPLadyScreen,TM_Layer1_8BPPLadyScreenEnd
	;dl $07E000,$07F000,TM_Layer2_8BPPLadyScreen,TM_Layer2_8BPPLadyScreenEnd
	;dl $07F000,$07F800,TM_8BPPLadyScreen_UnusedTilemap,TM_8BPPLadyScreen_UnusedTilemapEnd
	;dl $098000,$098700,TM_Mode7_Mario3BoxArtScreen,TM_Mode7_Mario3BoxArtScreenEnd
	dl $098A00,$099200,TM_Mode7_NintendoLogoScreen,TM_Mode7_NintendoLogoScreenEnd
	;dl $09A000,$09A800,TM_Layer1_CheckerboardPatternScreen,TM_Layer1_CheckerboardPatternScreenEnd
	;dl $09A800,$09B000,TM_Layer2_CheckerboardPatternScreen,TM_Layer2_CheckerboardPatternScreenEnd
	;dl $09B000,$09B800,TM_Layer3_CheckerboardPatternScreen,TM_Layer3_CheckerboardPatternScreenEnd
	;dl $09B800,$09C000,TM_Layer4_CheckerboardPatternScreen,TM_Layer4_CheckerboardPatternScreenEnd
	;dl $0E8000,$0EA000,TM_Layer1_DrMarioScreen,TM_Layer1_DrMarioScreenEnd
	;dl $0EA000,$0EC000,TM_Layer2_DrMarioScreen,TM_Layer2_DrMarioScreenEnd
	;dl $0EC000,$0EE000,TM_Layer3_DrMarioScreen,TM_Layer3_DrMarioScreenEnd
	;dl $0EE000,$0F8000,TM_Layer4_DrMarioScreen,TM_Layer4_DrMarioScreenEnd
TilemapsPointersEnd:

;--------------------------------------------------------------------

PalettesPointersStart:
	;dl $00B06A,$00B0EA,PAL_SNESTestScreens,PAL_SNESTestScreensEnd
	;dl $01E000,$01E200,PAL_RainbowSNESLogoScreen,PAL_RainbowSNESLogoScreenEnd
	;dl $03C000,$03C200,PAL_WindowEffectTestScreen,PAL_WindowEffectTestScreenEnd
	;dl $05B000,$05B200,PAL_BetaSMWLevelScreen,PAL_BetaSMWLevelScreenEnd
	;dl $07C800,$07CA00,PAL_8BPPLadyScreen,PAL_8BPPLadyScreenEnd
	;dl $098800,$098A00,PAL_Mario3BoxArtScreen,PAL_Mario3BoxArtScreenEnd
	;dl $099200,$099400,PAL_NintendoLogoScreen,PAL_NintendoLogoScreenEnd
	dl $0DD000,$0DD100,PAL_BG_DrMarioScreen,PAL_BG_DrMarioScreenEnd
PalettesPointersEnd:

;--------------------------------------------------------------------

GarbageDataPointersStart:
	;dl $00D457,$00FFC0,UNK_00D457,UNK_00D457End
	;dl $01E200,$01F000,UNK_01E200,UNK_01E200End
	;dl $03C200,$048000,UNK_03C200,UNK_03C200End
	;dl $05B200,$068000,UNK_05B200,UNK_05B200End
	;dl $07CA00,$07E000,UNK_07CA00,UNK_07CA00End
	;dl $07F800,$088000,UNK_07F800,UNK_07F800End
	;dl $099400,$09A000,UNK_099400,UNK_099400End
	;dl $09C000,$0A8000,UNK_09C000,UNK_09C000End
	;dl $0AC000,$0B8000,UNK_0AC000,UNK_0AC000End
	;dl $0B8000,$0C8000,UNK_0B8000,UNK_0B8000End
	;dl $0C8000,$0D8000,UNK_0C8000,UNK_0C8000End
	;dl $0D8000,$0D9000,UNK_0D8000,UNK_0D8000End
	dl $0DD100,$0E8000,UNK_0DD100,UNK_0DD100End
	;dl $0FA309,$108000,UNK_0FA309,UNK_0FA309End
GarbageDataPointersEnd:

;--------------------------------------------------------------------

MusicPointersStart:
	;dl $0F950C,$0F9691,Music_DrMarioScreen1,Music_DrMarioScreen1End
	;dl $0F9691,$0F9794,Music_CheckerboardPatternScreen,Music_CheckerboardPatternScreenEnd
	;dl $0F9794,$0F98A5,Music_DrMarioScreen2,Music_DrMarioScreen2End
	;dl $0F98A5,$0F9925,Music_WindowEffectTestScreen,Music_WindowEffectTestScreenEnd
	;dl $0F9925,$0F9A49,Music_RainbowSNESLogoScreen,Music_RainbowSNESLogoScreenEnd
	;dl $0F9A49,$0FA256,Music_8BPPLadyScreen,Music_8BPPLadyScreenEnd
	;dl $0FA256,$0FA299,Music_UnknownData1,Music_UnknownData1End
	;dl $0FA299,$0FA2BF,Music_UnknownData2,Music_UnknownData2End
	;dl $0FA2BF,$0FA2E2,Music_UnknownData3,Music_UnknownData3End
	;dl $0FA2E2,$0FA305,Music_UnknownData4,Music_UnknownData4End
MusicPointersEnd:

;--------------------------------------------------------------------

BRRPointersStart:
	;dl $0F8048,$0F8075,BRRFile00,BRRFile00End
	;dl $0F8075,$0F80B4,BRRFile01,BRRFile01End
	;dl $0F80B4,$0F8117,BRRFile02,BRRFile02End
	;dl $0F8117,$0F8156,BRRFile03,BRRFile03End
	;dl $0F8156,$0F81CB,BRRFile04,BRRFile04End
	;dl $0F81CB,$0F822E,BRRFile05,BRRFile05End
	;dl $0F822E,$0F825B,BRRFile06,BRRFile06End
	;dl $0F825B,$0F85A0,BRRFile07,BRRFile07End
	;dl $0F85A0,$0F8603,BRRFile08,BRRFile08End
	;dl $0F8603,$0F86D8,BRRFile09,BRRFile09End
BRRPointersEnd:

;--------------------------------------------------------------------

GFX_Layer1_RainbowSNESLogoScreen:
	db "GFX_Layer1_RainbowSNESLogoScreen.bin"
GFX_Layer1_RainbowSNESLogoScreenEnd:
GFX_Layer2_RainbowSNESLogoScreen:
	db "GFX_Layer2_RainbowSNESLogoScreen.bin"
GFX_Layer2_RainbowSNESLogoScreenEnd:
GFX_2BPPFont:
	db "GFX_2BPPFont.bin"
GFX_2BPPFontEnd:
GFX_4BPPFont:
	db "GFX_4BPPFont.bin"
GFX_4BPPFontEnd:
GFX_Sprite_BetaSMWGFX:
	db "GFX_Sprite_BetaSMWGFX.bin"
GFX_Sprite_BetaSMWGFXEnd:
GFX_BG_WindowEffectTestScreen:
	db "GFX_BG_WindowEffectTestScreen.bin"
GFX_BG_WindowEffectTestScreenEnd:
GFX_BG_BetaSMWGFX:
	db "GFX_BG_BetaSMWGFX.bin"
GFX_BG_BetaSMWGFXEnd:
GFX_Layer3_BetaSMWGFX:
	db "GFX_Layer3_BetaSMWGFX.bin"
GFX_Layer3_BetaSMWGFXEnd:
GFX_Sprite_SMB3Platform:
	db "GFX_Sprite_SMB3Platform.bin"
GFX_Sprite_SMB3PlatformEnd:
GFX_Layer1_8BPPLadyScreen:
	db "GFX_Layer1_8BPPLadyScreen.bin"
GFX_Layer1_8BPPLadyScreenEnd:
GFX_8BPPLadyScreen_BlankGFXFile:
	db "GFX_8BPPLadyScreen_BlankGFXFile.bin"
GFX_8BPPLadyScreen_BlankGFXFileEnd:
GFX_Layer2_8BPPLadyScreen:
	db "GFX_Layer2_8BPPLadyScreen.bin"
GFX_Layer2_8BPPLadyScreenEnd:
GFX_Mode7_Mario3BoxArtScreen:
	db "GFX_Mode7_Mario3BoxArtScreen.bin"
GFX_Mode7_Mario3BoxArtScreenEnd:
GFX_Mode7_NintendoLogoScreen:
	db "GFX_Mode7_NintendoLogoScreen.bin"
GFX_Mode7_NintendoLogoScreenEnd:
GFX_BG_DrMarioScreen:
	db "GFX_BG_DrMarioScreen.bin"
GFX_BG_DrMarioScreenEnd:

;--------------------------------------------------------------------

TM_Layer1_RainbowSNESLogoScreen:
	db "Layer1_RainbowSNESLogoScreen.bin"
TM_Layer1_RainbowSNESLogoScreenEnd:
TM_Layer2_RainbowSNESLogoScreen:
	db "Layer2_RainbowSNESLogoScreen.bin"
TM_Layer2_RainbowSNESLogoScreenEnd:
TM_DiagonalStripeScreen:
	db "DiagonalStripeScreen.bin"
TM_DiagonalStripeScreenEnd:
TM_Layer1_WindowEffectTestScreen:
	db "Layer1_WindowEffectTestScreen.bin"
TM_Layer1_WindowEffectTestScreenEnd:
TM_Layer2_WindowEffectTestScreen:
	db "Layer2_WindowEffectTestScreen.bin"
TM_Layer2_WindowEffectTestScreenEnd:
TM_Layer1_BetaSMWLevelScreen:
	db "Layer1_BetaSMWLevelScreen.bin"
TM_Layer1_BetaSMWLevelScreenEnd:
TM_Layer2_BetaSMWLevelScreen:
	db "Layer2_BetaSMWLevelScreen.bin"
TM_Layer2_BetaSMWLevelScreenEnd:
TM_Layer3_BetaSMWLevelScreen:
	db "Layer3_BetaSMWLevelScreen.bin"
TM_Layer3_BetaSMWLevelScreenEnd:
TM_Layer1_8BPPLadyScreen:
	db "Layer1_8BPPLadyScreen.bin"
TM_Layer1_8BPPLadyScreenEnd:
TM_Layer2_8BPPLadyScreen:
	db "Layer2_8BPPLadyScreen.bin"
TM_Layer2_8BPPLadyScreenEnd:
TM_8BPPLadyScreen_UnusedTilemap:
	db "8BPPLadyScreen_UnusedTilemap.bin"
TM_8BPPLadyScreen_UnusedTilemapEnd:
TM_Mode7_Mario3BoxArtScreen:
	db "Mode7_Mario3BoxArtScreen.bin"
TM_Mode7_Mario3BoxArtScreenEnd:
TM_Mode7_NintendoLogoScreen:
	db "Mode7_NintendoLogoScreen.bin"
TM_Mode7_NintendoLogoScreenEnd:
TM_Layer1_CheckerboardPatternScreen:
	db "Layer1_CheckerboardPatternScreen.bin"
TM_Layer1_CheckerboardPatternScreenEnd:
TM_Layer2_CheckerboardPatternScreen:
	db "Layer2_CheckerboardPatternScreen.bin"
TM_Layer2_CheckerboardPatternScreenEnd:
TM_Layer3_CheckerboardPatternScreen:
	db "Layer3_CheckerboardPatternScreen.bin"
TM_Layer3_CheckerboardPatternScreenEnd:
TM_Layer4_CheckerboardPatternScreen:
	db "Layer4_CheckerboardPatternScreen.bin"
TM_Layer4_CheckerboardPatternScreenEnd:
TM_Layer1_DrMarioScreen:
	db "Layer1_DrMarioScreen.bin"
TM_Layer1_DrMarioScreenEnd:
TM_Layer2_DrMarioScreen:
	db "Layer2_DrMarioScreen.bin"
TM_Layer2_DrMarioScreenEnd:
TM_Layer3_DrMarioScreen:
	db "Layer3_DrMarioScreen.bin"
TM_Layer3_DrMarioScreenEnd:
TM_Layer4_DrMarioScreen:
	db "Layer4_DrMarioScreen.bin"
TM_Layer4_DrMarioScreenEnd:

;--------------------------------------------------------------------

PAL_SNESTestScreens:
	db "SNESTestScreens.bin"
PAL_SNESTestScreensEnd:
PAL_RainbowSNESLogoScreen:
	db "RainbowSNESLogoScreen.bin"
PAL_RainbowSNESLogoScreenEnd:
PAL_WindowEffectTestScreen:
	db "WindowEffectTestScreen.bin"
PAL_WindowEffectTestScreenEnd:
PAL_BetaSMWLevelScreen:
	db "BetaSMWLevelScreen.bin"
PAL_BetaSMWLevelScreenEnd:
PAL_8BPPLadyScreen:
	db "8BPPLadyScreen.bin"
PAL_8BPPLadyScreenEnd:
PAL_Mario3BoxArtScreen:
	db "Mario3BoxArtScreen.bin"
PAL_Mario3BoxArtScreenEnd:
PAL_NintendoLogoScreen:
	db "NintendoLogoScreen.bin"
PAL_NintendoLogoScreenEnd:
PAL_BG_DrMarioScreen:
	db "BG_DrMarioScreen.bin"
PAL_BG_DrMarioScreenEnd:

;--------------------------------------------------------------------

UNK_00D457:
	db "UNK_00D457.bin"
UNK_00D457End:
UNK_01E200:
	db "UNK_01E200.bin"
UNK_01E200End:
UNK_03C200:
	db "UNK_03C200.bin"
UNK_03C200End:
UNK_05B200:
	db "UNK_05B200.bin"
UNK_05B200End:
UNK_07CA00:
	db "UNK_07CA00.bin"
UNK_07CA00End:
UNK_07F800:
	db "UNK_07F800.bin"
UNK_07F800End:
UNK_099400:
	db "UNK_099400.bin"
UNK_099400End:
UNK_09C000:
	db "UNK_09C000.bin"
UNK_09C000End:
UNK_0AC000:
	db "UNK_0AC000.bin"
UNK_0AC000End:
UNK_0B8000:
	db "UNK_0B8000.bin"
UNK_0B8000End:
UNK_0C8000:
	db "UNK_0C8000.bin"
UNK_0C8000End:
UNK_0D8000:
	db "UNK_0D8000.bin"
UNK_0D8000End:
UNK_0DD100:
	db "UNK_0DD100.bin"
UNK_0DD100End:
UNK_0FA309:
	db "UNK_0FA309.bin"
UNK_0FA309End:

;--------------------------------------------------------------------

Music_DrMarioScreen1:
	db "DrMarioScreen1.bin"
Music_DrMarioScreen1End:
Music_CheckerboardPatternScreen:
	db "CheckerboardPatternScreen.bin"
Music_CheckerboardPatternScreenEnd:
Music_DrMarioScreen2:
	db "DrMarioScreen2.bin"
Music_DrMarioScreen2End:
Music_WindowEffectTestScreen:
	db "WindowEffectTestScreen.bin"
Music_WindowEffectTestScreenEnd:
Music_RainbowSNESLogoScreen:
	db "RainbowSNESLogoScreen.bin"
Music_RainbowSNESLogoScreenEnd:
Music_8BPPLadyScreen:
	db "8BPPLadyScreen.bin"
Music_8BPPLadyScreenEnd:
Music_UnknownData1:
	db "UnknownData1.bin"
Music_UnknownData1End:
Music_UnknownData2:
	db "UnknownData2.bin"
Music_UnknownData2End:
Music_UnknownData3:
	db "UnknownData3.bin"
Music_UnknownData3End:
Music_UnknownData4:
	db "UnknownData4.bin"
Music_UnknownData4End:

;--------------------------------------------------------------------

BRRFile00:
	db "00.brr"
BRRFile00End:
BRRFile01:
	db "01.brr"
BRRFile01End:
BRRFile02:
	db "02.brr"
BRRFile02End:
BRRFile03:
	db "03.brr"
BRRFile03End:
BRRFile04:
	db "04.brr"
BRRFile04End:
BRRFile05:
	db "05.brr"
BRRFile05End:
BRRFile06:
	db "06.brr"
BRRFile06End:
BRRFile07:
	db "07.brr"
BRRFile07End:
BRRFile08:
	db "08.brr"
BRRFile08End:
BRRFile09:
	db "09.brr"
BRRFile09End:

;--------------------------------------------------------------------
