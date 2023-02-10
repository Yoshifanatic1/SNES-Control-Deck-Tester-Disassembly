@echo off

set PATH="../../Global"
set Input1=
set ROMName=
set ROMName0=SCDT.sfc
set MemMap=lorom

setlocal EnableDelayedExpansion

echo To fully extract all files for supported ROMs, you'll need one of the following ROMs in each group:
echo - Graphics: (Japan)
echo - Samples: (Japan)
echo - Music: (Japan)
echo.

:Start
echo Place a headerless GAMEX ROM with one of the following names in this folder, then type the number representing what ROM to extract from.
echo 0 = "%ROMName0%" (Japan)

:Mode
set /p Input1=""

if "%Input1%" equ "0" goto :Japan

echo %Input1% is not a valid mode.
goto :Mode

:ROMNotFound
echo %ROMName% is not in the folder or is not named correctly^^!
goto :Mode

:Japan
set ROMName=%ROMName0%
if not exist %ROMName0% goto :ROMNotFound

set UGFXLoc="../Graphics"
set TilemapLoc="../Tilemaps"
set PaletteLoc="../Palettes"
set GarbageDatLoc="../GarbageData"
set MusicLoc="../SPC700/Music"
set BrrLoc="../SPC700/Samples"
set ROMBit=$0001
goto :BeginExtract

:BeginExtract
set i=0
set PointerSet=0

echo Generating temporary ROM
asar --fix-checksum=off --no-title-check --define ROMVer="%ROMBit%" "AssetPointersAndFiles.asm" TEMP.sfc

CALL :GetLoopIndex
set MaxFileTypes=%Length%
set PointerSet=6

:GetNewLoopIndex
CALL :GetLoopIndex

:ExtractLoop
if %i% equ %Length% goto :NewFileType

CALL :GetGFXFileName
CALL :ExtractFile
set /a i = %i%+1
if exist TEMP1.asm del TEMP1.asm
if exist TEMP2.asm del TEMP2.asm
if exist TEMP3.txt del TEMP3.txt
goto :ExtractLoop

:NewFileType
echo Moving extracted files to appropriate locations
if %PointerSet% equ 6 goto :MoveUGFX
if %PointerSet% equ 12 goto :MoveTilemap
if %PointerSet% equ 18 goto :MovePalette
if %PointerSet% equ 24 goto :MoveGarbageData
if %PointerSet% equ 30 goto :MoveMusic
if %PointerSet% equ 36 goto :MoveBRR
goto :MoveNothing

:MoveUGFX
move "*.bin" %UGFXLoc%
goto :MoveNothing

:MoveTilemap
move "*.bin" %TilemapLoc%
goto :MoveNothing

:MovePalette
move "*.bin" %PaletteLoc%
goto :MoveNothing

:MoveGarbageData
move "*.bin" %GarbageDatLoc%
goto :MoveNothing

:MoveMusic
move "*.bin" %MusicLoc%
goto :MoveNothing

:MoveBRR
move "*.brr" %BrrLoc%
goto :MoveNothing

:MoveNothing
set i=0
set /a PointerSet = %PointerSet%+6
if %PointerSet% neq %MaxFileTypes% goto :GetNewLoopIndex
if exist TEMP.sfc del TEMP.sfc

echo Done^^!
goto :Start

EXIT /B %ERRORLEVEL% 

:ExtractFile
echo:%MemMap% >> TEMP1.asm
echo:org $008000 >> TEMP1.asm
echo:Main: >> TEMP1.asm
echo:check bankcross off >> TEMP1.asm
echo:^^!ExtractionType #= readfile3("TEMP.sfc", snestopc(readfile3("TEMP.sfc", snestopc($008000+%PointerSet%))+$00+(%i%*$0C))) >> TEMP1.asm
echo:if ^^!ExtractionType == $000000 >> TEMP1.asm
echo:^^!ExtractionDataPointer #= snestopc(readfile3("TEMP.sfc", snestopc(readfile3("TEMP.sfc", snestopc($008000+%PointerSet%))+$03+(%i%*$0C)))) >> TEMP1.asm
echo:^^!FilesToCombine #= readfile1("TEMP.sfc", ^^!ExtractionDataPointer) >> TEMP1.asm
echo:^^!LoopCounter #= 0 >> TEMP1.asm
echo:while ^^!LoopCounter ^^!= ^^!FilesToCombine >> TEMP1.asm
echo:^^!OffsetStart #= snestopc(readfile3("TEMP.sfc", ^^!ExtractionDataPointer+$03+(^^!LoopCounter*$06))) >> TEMP1.asm
echo:^^!OffsetEnd #= snestopc(readfile3("TEMP.sfc", ^^!ExtractionDataPointer+$06+(^^!LoopCounter*$06))) >> TEMP1.asm
echo:incbin %ROMName%:(^^!OffsetStart)-(^^!OffsetEnd) >> TEMP1.asm
echo:^^!LoopCounter #= ^^!LoopCounter+$01 >> TEMP1.asm
echo:endif >> TEMP1.asm
echo:elseif ^^!ExtractionType == $000001 >> TEMP1.asm
echo:^^!ExtractionDataPointer #= snestopc(readfile3("TEMP.sfc", snestopc(readfile3("TEMP.sfc", snestopc($008000+%PointerSet%))+$03+(%i%*$0C)))) >> TEMP1.asm
echo:^^!FilesToCombine #= readfile1("TEMP.sfc", ^^!ExtractionDataPointer) >> TEMP1.asm
echo:^^!FileType #= readfile2("TEMP.sfc", ^^!ExtractionDataPointer+$01) >> TEMP1.asm
echo:^^!LoopCounter #= 0 >> TEMP1.asm
echo:dd snestopc(DataPointers) : dw ^^!FilesToCombine : dw ^^!FileType : db "SCDT    " : db "RDC V1.0.0" >> TEMP1.asm
echo:db $00,$00,$00,$00,$00,$00 >> TEMP1.asm
echo:db "Unknown File" >> TEMP1.asm
echo:DataPointers: >> TEMP1.asm
echo:^^!CurrentFilePtr #= (^^!FilesToCombine*$10)+datasize(Main) >> TEMP1.asm
echo:while ^^!LoopCounter ^^!= ^^!FilesToCombine >> TEMP1.asm
echo:^^!OffsetStart #= readfile3("TEMP.sfc", ^^!ExtractionDataPointer+$03+(^^!LoopCounter*$06)) >> TEMP1.asm
echo:^^!OffsetEnd #= readfile3("TEMP.sfc", ^^!ExtractionDataPointer+$06+(^^!LoopCounter*$06)) >> TEMP1.asm
echo:^^!FileSize #= ^^!OffsetEnd-^^!OffsetStart >> TEMP1.asm
echo:dd $00000000,$00000000,^^!CurrentFilePtr,^^!FileSize >> TEMP1.asm
echo:^^!LoopCounter #= ^^!LoopCounter+$01 >> TEMP1.asm
echo:^^!CurrentFilePtr #= ^^!CurrentFilePtr+^^!FileSize >> TEMP1.asm
echo:endif >> TEMP1.asm
echo:^^!LoopCounter #= 0 >> TEMP1.asm
echo:while ^^!LoopCounter ^^!= ^^!FilesToCombine >> TEMP1.asm
echo:^^!OffsetStart #= snestopc(readfile3("TEMP.sfc", ^^!ExtractionDataPointer+$03+(^^!LoopCounter*$06))) >> TEMP1.asm
echo:^^!OffsetEnd #= snestopc(readfile3("TEMP.sfc", ^^!ExtractionDataPointer+$06+(^^!LoopCounter*$06))) >> TEMP1.asm
echo:incbin %ROMName%:(^^!OffsetStart)-(^^!OffsetEnd) >> TEMP1.asm
echo:^^!LoopCounter #= ^^!LoopCounter+$01 >> TEMP1.asm
echo:endif >> TEMP1.asm
echo:else >> TEMP1.asm
echo:^^!OffsetStart #= snestopc(readfile3("TEMP.sfc", snestopc(readfile3("TEMP.sfc", snestopc($008000+%PointerSet%))+$00+(%i%*$0C)))) >> TEMP1.asm
echo:^^!OffsetEnd #= snestopc(readfile3("TEMP.sfc", snestopc(readfile3("TEMP.sfc", snestopc($008000+%PointerSet%))+$03+(%i%*$0C)))) >> TEMP1.asm
echo:incbin %ROMName%:(^^!OffsetStart)-(^^!OffsetEnd) >> TEMP1.asm
echo:endif >> TEMP1.asm

echo Extracting %FileName%
asar --fix-checksum=off --no-title-check "TEMP1.asm" %FileName%
EXIT /B 0

:GetGFXFileName
echo:%MemMap% >> TEMP2.asm
echo:org $008000 >> TEMP2.asm
echo:^^!FileNameStart #= snestopc(readfile3("TEMP.sfc", snestopc(readfile3("TEMP.sfc", snestopc($008000+%PointerSet%))+$06+(%i%*$0C)))) >> TEMP2.asm
echo:^^!FileNameEnd #= snestopc(readfile3("TEMP.sfc", snestopc(readfile3("TEMP.sfc", snestopc($008000+%PointerSet%))+$09+(%i%*$0C)))) >> TEMP2.asm
echo:incbin TEMP.sfc:(^^!FileNameStart)-(^^!FileNameEnd) >> TEMP2.asm
asar --fix-checksum=off --no-title-check "TEMP2.asm" TEMP3.txt

for /f "delims=" %%x in (TEMP3.txt) do set FileName=%%x

EXIT /B 0

:GetLoopIndex
echo:%MemMap% >> TEMP4.asm
echo:org $008000 >> TEMP4.asm
echo:^^!OnesDigit = 0 >> TEMP4.asm
echo:^^!TensDigit = 0 >> TEMP4.asm
echo:^^!HundredsDigit = 0 >> TEMP4.asm
echo:^^!ThousandsDigit = 0 >> TEMP4.asm
echo:^^!TensDigitSet = 0 >> TEMP4.asm
echo:^^!HundredsDigitSet = 0 >> TEMP4.asm
echo:^^!ThousandsDigitSet = 0 >> TEMP4.asm
echo:^^!Offset #= readfile3("TEMP.sfc", snestopc($008000+%PointerSet%+$03)) >> TEMP4.asm
echo:while ^^!Offset ^> 0 >> TEMP4.asm
::echo:print hex(^^!Offset) >> TEMP4.asm
echo:^^!OnesDigit #= ^^!OnesDigit+1 >> TEMP4.asm
echo:if ^^!OnesDigit == 10 >> TEMP4.asm
echo:^^!OnesDigit #= 0 >> TEMP4.asm
echo:^^!TensDigit #= ^^!TensDigit+1 >> TEMP4.asm
echo:^^!TensDigitSet #= 1 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:if ^^!TensDigit == 10 >> TEMP4.asm
echo:^^!TensDigit #= 0 >> TEMP4.asm
echo:^^!HundredsDigit #= ^^!HundredsDigit+1 >> TEMP4.asm
echo:^^!HundredsDigitSet #= 1 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:if ^^!HundredsDigit == 10 >> TEMP4.asm
echo:^^!HundredsDigit #= 0 >> TEMP4.asm
echo:^^!ThousandsDigit #= ^^!ThousandsDigit+1 >> TEMP4.asm
echo:^^!ThousandsDigitSet #= 1 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:^^!Offset #= ^^!Offset-1 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:if ^^!ThousandsDigitSet == 1 >> TEMP4.asm
echo:db ^^!ThousandsDigit+$30 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:if ^^!HundredsDigitSet == 1 >> TEMP4.asm
echo:db ^^!HundredsDigit+$30 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:if ^^!TensDigitSet == 1 >> TEMP4.asm
echo:db ^^!TensDigit+$30 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:db ^^!OnesDigit+$30 >> TEMP4.asm
asar --fix-checksum=off --no-title-check "TEMP4.asm" TEMP5.txt

for /f "delims=" %%x in (TEMP5.txt) do set Length=%%x

if exist TEMP4.asm del TEMP4.asm
if exist TEMP5.txt del TEMP5.txt

EXIT /B 0