
macro SCDT_GameSpecificAssemblySettings()

	%SetROMToAssembleForHack(SCDT, !ROMID)
endmacro

macro SCDT_LoadGameSpecificMainSNESFiles()
	incsrc ../SPC700/ARAMPtrs_SCDT.asm
	incsrc ../Misc_Defines_SCDT.asm
	incsrc ../RAM_Map_SCDT.asm
	incsrc ../Routine_Macros_SCDT.asm
	incsrc ../SNES_Macros_SCDT.asm
	%LoadExtraRAMFile("SRAM_Map_SCDT.asm", !GameID, SCDT)
endmacro

macro SCDT_LoadGameSpecificMainSPC700Files()
	incsrc ../SPC700/ARAM_Map_SCDT.asm
	incsrc ../Misc_Defines_SCDT.asm
	incsrc ../SPC700/SPC700_Routine_Macros_SCDT.asm
	incsrc ../SPC700/SPC700_Macros_SCDT.asm
endmacro

macro SCDT_LoadGameSpecificMainExtraHardwareFiles()
endmacro

macro SCDT_LoadGameSpecificMSU1Files()
endmacro

macro SCDT_GlobalAssemblySettings()
	!Define_Global_ApplyAsarPatches = !FALSE
	!Define_Global_ApplyDefaultPatches = !TRUE
	!Define_Global_InsertRATSTags = !TRUE
	!Define_Global_IgnoreCodeAlignments = !FALSE
	!Define_Global_IgnoreOriginalFreespace = !FALSE
	!Define_Global_CompatibleControllers = !Controller_StandardJoypad
	!Define_Global_DisableROMMirroring = !FALSE
	!Define_Global_CartridgeHeaderVersion = $00
	!Define_Global_FixIncorrectChecksumHack = !TRUE
	!Define_Global_ROMFrameworkVer = 1
	!Define_Global_ROMFrameworkSubVer = 3
	!Define_Global_ROMFrameworkSubSubVer = 0
	!Define_Global_AsarChecksum = $35EB
	!Define_Global_LicenseeName = "Nintendo"
	!Define_Global_DeveloperName = "Nintendo"
	!Define_Global_ReleaseDate = "January 17th, 2023"
	!Define_Global_BaseROMMD5Hash = "EEEB07F7B388F208179C4F457C92393F"

	!Define_Global_MakerCode = "00"
	!Define_Global_GameCode = "xxxx"
	!Define_Global_ReservedSpace = $00,$00,$00,$00,$00,$00
	!Define_Global_ExpansionFlashSize = !ExpansionMemorySize_0KB
	!Define_Global_ExpansionRAMSize = !ExpansionMemorySize_0KB
	!Define_Global_IsSpecialVersion = $00
	!Define_Global_InternalName = ""
	!Define_Global_ROMLayout = !ROMLayout_LoROM
	!Define_Global_ROMType = !ROMType_ROM_RAM_SRAM
	!Define_Global_CustomChip = !Chip_None
	!Define_Global_ROMSize1 = !ROMSize_512KB
	!Define_Global_ROMSize2 = !ROMSize_0KB
	!Define_Global_SRAMSize = !SRAMSize_2KB
	!Define_Global_Region = !Region_NorthAmerica
	!Define_Global_LicenseeID = $00
	!Define_Global_VersionNumber = $00
	!Define_Global_ChecksumCompliment = $0040
	!Define_Global_Checksum = $0400
	!UnusedNativeModeVector1 = $0000
	!UnusedNativeModeVector2 = $0000
	!NativeModeCOPVector = $0000
	!NativeModeBRKVector = $2B00
	!NativeModeAbortVector = $0000
	!NativeModeNMIVector = CODE_00B134
	!NativeModeResetVector = $0000
	!NativeModeIRQVector = CODE_00B1F5
	!UnusedEmulationModeVector1 = $0000
	!UnusedEmulationModeVector2 = $0000
	!EmulationModeCOPVector = $0000
	!EmulationModeBRKVector = $9000
	!EmulationModeAbortVector = $0000
	!EmulationModeNMIVector = $0010
	!EmulationModeResetVector = CODE_008000
	!EmulationModeIRQVector = $7F40
endmacro

macro SCDT_LoadROMMap()
	%SCDTBank00Macros(!BANK_00, !BANK_00)
	%SCDTBank01Macros(!BANK_01, !BANK_01)
	%SCDTBank02Macros(!BANK_02, !BANK_02)
	%SCDTBank03Macros(!BANK_03, !BANK_03)
	%SCDTBank04Macros(!BANK_04, !BANK_04)
	%SCDTBank05Macros(!BANK_05, !BANK_05)
	%SCDTBank06Macros(!BANK_06, !BANK_06)
	%SCDTBank07Macros(!BANK_07, !BANK_07)
	%SCDTBank08Macros(!BANK_08, !BANK_08)
	%SCDTBank09Macros(!BANK_09, !BANK_09)
	%SCDTBank0AMacros(!BANK_0A, !BANK_0A)
	%SCDTBank0BMacros(!BANK_0B, !BANK_0B)
	%SCDTBank0CMacros(!BANK_0C, !BANK_0C)
	%SCDTBank0DMacros(!BANK_0D, !BANK_0D)
	%SCDTBank0EMacros(!BANK_0E, !BANK_0E)
	%SCDTBank0FMacros(!BANK_0F, !BANK_0F)
endmacro

;#############################################################################################################
;#############################################################################################################

macro SCDT_LoadSPC700ROMMap()
%SPC700RoutinePointer(SCDT_GlobalSampleBank_Ptrs, SCDT_SPC700Block0Start, SCDT_SPC700Block0End)
%SPC700RoutinePointer(SCDT_GlobalSampleBank_Main, SCDT_SPC700Block1Start, SCDT_SPC700Block1End)
%SPC700RoutinePointer(SCDT_DATA_3E00, SCDT_SPC700Block2Start, SCDT_SPC700Block2End)
%SPC700RoutinePointer(SCDT_SPC700Engine_Main, SCDT_SPC700Block3Start, SCDT_SPC700Block3End)
%SPC700RoutinePointer(SCDT_SPC700Engine_DATA_3F00, SCDT_SPC700Block4Start, SCDT_SPC700Block4End)

SCDT_SPC700Block0Start:
	%SPC700_RT00_SCDT_GlobalSampleBank(!SourceDirectoryOffset_3C00)
SCDT_SPC700Block0End:
SCDT_SPC700Block1Start:
	%SPC700_RT01_SCDT_GlobalSampleBank($4000)
SCDT_SPC700Block1End:
SCDT_SPC700Block2Start:
	%SPC700_SCDT_DATA_3E00($3E00)
SCDT_SPC700Block2End:
SCDT_SPC700Block3Start:
	%SPC700_RT01_SCDT_SPC700Engine($3F00)
SCDT_SPC700Block3End:
SCDT_SPC700Block4Start:
	%SPC700_RT00_SCDT_SPC700Engine($0800)
SCDT_SPC700Block4End:
endmacro

;#############################################################################################################
;#############################################################################################################

macro SCDT_LoadSuperFXROMMap()
endmacro

;#############################################################################################################
;#############################################################################################################

macro SCDT_LoadMSU1ROMMap()
endmacro

;#############################################################################################################
;#############################################################################################################
