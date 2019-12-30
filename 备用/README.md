* 在助手的 "\GWToolbox\GWToolbox\" 文件夹内 运行"字条提取.au3"文本，并把结果重命名为：allStringsA.txt
* 在助手的 "\GWToolbox\GWToolbox\Windows\" 文件夹内 运行"字条提取.au3"文本，并把结果重命名为：allStringsW.txt
* 用 notepad++ 内 TextFX Tools 的 排序功能 (附加三选项 case sensitive, ascending, unique)把 allStringsA.txt 和 allStringsW.txt 内的重复内容及空行擦去 (上万行内容会减少至两千行以下)
* 手动擦去此二文件内不适合翻译的字条
* 用 "以字条生成(含百科译文的)词典.au3" 文本 把 allStringsA.txt 和 allStringsW.txt 的内容变为词典模式
* 手动改写 allStringsA.txt 或 allStringsW.txt 并生成所需的 "替换All.au3" 或 "替换Windows.au3" 文本
* 用相关的 "替换_____.au3"文本 把 相应文件夹内的.cpp和.h代码自动汉化，即：
* 放 "替换All.au3"文本 入 "\GWToolbox\GWToolbox\" 文件夹，并运行文本
* 放 "替换Windows.au3"文本 入 "\GWToolbox\GWToolbox\Windows\" 文件夹，并运行文本
<hr>
试着令c++版助手显示代码中的文字
