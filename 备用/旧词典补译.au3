#include-once
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <Array.au3>
#include <File.au3>
#include <WinAPI.au3>

#cs

操作办法： 

1. 把 新词典 (即，某"替换X.au3"文件) 的 $ConversionTable 复制于下
2. 把 旧词典 (即，需要更新的"替换Y.au3"文件) 放入 本文的 文件夹 内
3. 运行本文

注：

此 文本 不会在 旧词典 内 添加 新条目 或 删除 旧条目 (如需增减条目，可借由 https://www.diffchecker.com/ 的对比 手动 完成 任何 所需的 增减)

此 文本 只会 对 旧词典内 尚未翻译的条目 进行 翻译

#ce

Local $ConversionTable[X1][X2] = [ _

]

Local $fileNames=_FileListToArray(@ScriptDir, "*.au3")

for $i=1 to $fileNames[0]

    if $fileNames[$i] == "补译旧词典.au3" then continueloop
    
	Local $rFileOpen = FileOpen($fileNames[$i])
	Local $fileRead =FileRead($rFileOpen)
	FileClose($rFileOpen)

	$fileRead = Convert($fileRead)

	Local $wFileOpen = FileOpen($fileNames[$i], 130)
	FileWrite ($wFileOpen, $fileRead)
	FileClose($wFileOpen)
Next

msgbox(0,"提示", "补译完毕")

Func Convert($lData)

	Local $original = $lData
    
	For $i = 0 To Ubound($ConversionTable) - 1
    
        if $ConversionTable[$i][0] <> $ConversionTable[$i][1] then            
            
            ;因$lData包括文件全文，所以，需(?m)才能用$
            $lData = StringRegExpReplace($lData, '(?m), "' & $ConversionTable[$i][0] & '"\], _ .*?$', ', "' & $ConversionTable[$i][1] & '"\], _ ' )
            
        endif            
	Next

	return $lData
    
EndFunc