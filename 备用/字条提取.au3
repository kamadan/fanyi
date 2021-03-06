﻿#include-once
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <Array.au3>
#include <File.au3>
#include <WinAPI.au3>

#cs

此 文本 会 提取 4个字符 或 4个字符以上 的 字条

如要提取更短的字条，可改变第40行内的相关指令 (即，把 {4,} 改为 {1,}，{2,}，或 {3,})

#ce

Local $fileNames=_FileListToArrayRec(@ScriptDir, "*.cpp", $FLTAR_FILES,  $FLTAR_RECUR)
_ArrayDelete($fileNames, 0)

Local $fileNames1=_FileListToArrayRec(@ScriptDir, "*.h", $FLTAR_FILES,  $FLTAR_RECUR)
_ArrayDelete($fileNames1, 0)

_ArrayConcatenate($fileNames, $fileNames1)

_ArrayInsert ($fileNames, 0, UBound($fileNames))


Local $allStrings = ""
Local $dFileOpen=FileOpen("temp/allStrings.txt", 138)

for $i=1 to $fileNames[0]

	Local $hFileOpen = FileOpen($fileNames[$i], 128)

	Local $readLine = FileReadLine($hFileOpen)

	while @error <> -1

		If $readLine <> "" then
			local $matches = StringRegExp($readLine, '(?i)[\"'&"][^\"&'"'&"]{4,}[\"&'"'&"]", $STR_REGEXPARRAYGLOBALMATCH) ;[\"][^\"]{4,}[\"] ;'(?i)[\"'&"][^\"&'"\'&"']{4,}[\"&'"'&"]"

			if IsArray ($matches) then
				$allStrings &= _ArrayToString($matches, @CRLF) & @CRLF
			endif
		EndIf

		$allStrings = StringRegExpReplace($allStrings, '\"[^\s]+?\.(dmp|ttf|h|ini|txt|dll|png|jpg|hpp)\"', "")
		$readLine = FileReadLine($hFileOpen)

	Wend

	FileClose($hFileOpen)


Next
FileWrite ($dFileOpen, $allStrings)
FileClose($dFileOpen)
msgbox(0,"提示", "提取完毕")