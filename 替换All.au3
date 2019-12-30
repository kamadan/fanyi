#include-once
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <Array.au3>
#include <File.au3>
#include <WinAPI.au3>

Local $ConversionTable[1866][2] = [ _
[" (%s ago)", " (%s 前)"], _ 
[" Whisper", " Whisper"], _ ;未译
[" duration: %d", " duration: %d"], _ ;未译
[" to specify an hexadecimal number", " 指定一16位进制的数字"], _ 
["! All", "! 地区频道"], _ 
["# Group", "# 队伍频道"], _ 
["$ Trade", "$ 交易频道"], _ 
["% Alliance", "% 同盟频道"], _ 
["%.0f milliseconds", "%.0f 毫秒"], _ 
["%.1f k", "%.1f 千"], _ 
["%.2f k", "%.2f 千"], _ 
["%.2f m", "%.2f 百万"], _ 
["%S (%S) has just logged out.", "%S (%S) 刚下游戏."], _ 
["%S's Health is %d of %d. (%.0f %%)", "%S的体力是 %d of %d. (%.0f %%)"], _ ;未译
["%d %s ago", "%d %s 前"], _ 
["%d Soul Tormentors", "%d 魂拷问者"], _ 
["%d foes in casting range", "施法范围内有 %d 名敌人"], _ 
["%d foes in compass range", "雷达范围内有 %d 名敌人"], _ 
["%d foes in spirit range", "灵距内有 %d 名敌人"], _ 
["%s - %s###header%d", "%s - %s###header%d"], _ ;未译
["%s [%s]###header%u", "%s [%s]###header%u"], _ ;未译
["%s not found!", "%s 失寻!"], _ 
["%s###build%d", "%s###build%d"], _ ;未译
["%s###herobuild%d", "%s###herobuild%d"], _ ;未译
["%s_active", "%s_active"], _ ;未译
["%s_color_message", "%s_color_message"], _ ;未译
["%s_color_sender", "%s_color_sender"], _ ;未译
["%s_threshold", "%s_threshold"], _ ;未译
["%s_visible", "%s_visible"], _ ;未译
["'/age2' prints the instance time to chat.", "'/age2' prints the instance time to chat."], _ ;未译
["'/borderless [on|off]' toggles, enables or disables borderless window.", "'/borderless [on|off]' toggles, enables or disables borderless window."], _ ;未译
["'/cam unlock' options", "'/cam unlock' options"], _ ;未译
["'/camera (lock|unlock)' to lock or unlock the camera.", "'/camera (lock|unlock)' to lock or unlock the camera."], _ ;未译
["'/camera fog (on|off)' sets game fog effect on or off.", "'/camera fog (on|off)' sets game fog effect on or off."], _ ;未译
["'/camera fov <value>' sets the field of view. '/camera fov' resets to default.", "'/camera fov <value>' sets the field of view. '/camera fov' resets to default."], _ ;未译
["'/camera speed <value>' sets the unlocked camera speed.", "'/camera speed <value>' sets the unlocked camera speed."], _ ;未译
["'/chest' opens xunlai in outposts and locked chests in explorables.", "'/chest' opens xunlai in outposts and locked chests in explorables."], _ ;未译
["'/damage <number>' sends the damage of a party member (e.g. '/damage 3').\n", "'/damage <number>' sends the damage of a party member (e.g. '/damage 3').\n"], _ ;未译
["'/damage me' sends your own damage only.\n", "'/damage me' sends your own damage only.\n"], _ ;未译
["'/damage reset' resets the damage in party window.", "'/damage reset' resets the damage in party window."], _ ;未译
["'/damage' or '/dmg' to print party damage to chat.\n", "'/damage' or '/dmg' to print party damage to chat.\n"], _ ;未译
["'/dialog <id>' sends a dialog.", "'/dialog <id>' sends a dialog."], _ ;未译
["'/flag <number> clear' to clear flag for a hero.", "'/flag <number> clear' to clear flag for a hero."], _ ;未译
["'/flag [all|<number>] [x] [y]' to flag a hero to coordinates [x],[y].", "'/flag [all|<number>] [x] [y]' to flag a hero to coordinates [x],[y]."], _ ;未译
["'/flag [all|clear|<number>]' to flag a hero in the minimap (same as using the buttons by the minimap).", "'/flag [all|clear|<number>]' to flag a hero in the minimap (same as using the buttons by the minimap)."], _ ;未译
["'/hide <name>' closes the window or widget titled <name>.", "'/hide <name>' closes the window or widget titled <name>."], _ ;未译
["'/load [build template|build name] [Hero index]' loads a build. The build name must be between quotes if it contains spaces. First Hero index is 1, last is 7. Leave out for player", "'/load [build template|build name] [Hero index]' loads a build. The build name must be between quotes if it contains spaces. First Hero index is 1, last is 7. Leave out for player"], _ ;未译
["'/pcons [on|off]' toggles, enables or disables pcons.", "'/pcons [on|off]' toggles, enables or disables pcons."], _ ;未译
["'/show <name>' opens the window or widget titled <name>.", "'/show <name>' opens the window or widget titled <name>."], _ ;未译
["'/target closest' to target the closest agent to you.", "'/target closest' to target the closest agent to you."], _ ;未译
["'/tb <name>' toggles the window or widget titled <name>.", "'/tb <name>' toggles the window or widget titled <name>."], _ ;未译
["'/tb quit' or '/tb exit' completely closes toolbox and all its windows.", "'/tb quit' or '/tb exit' completely closes toolbox and all its windows."], _ ;未译
["'/tb reset' moves Toolbox and Settings window to the top-left corner.", "'/tb reset' moves Toolbox and Settings window to the top-left corner."], _ ;未译
["'/travel <town> [dis]', '/tp <town> [dis]' or '/to <town> [dis]' to travel to a destination. \n", "'/travel <town> [dis]', '/tp <town> [dis]' or '/to <town> [dis]' to travel to a destination. \n"], _ ;未译
["'/useskill <skill>' starts using the skill on recharge. ", "'/useskill <skill>' starts using the skill on recharge. "], _ ;未译
["'/zoom <value>' to change the maximum zoom to the value. ", "'/zoom <value>' to change the maximum zoom to the value. "], _ ;未译
["'Allies' meaning the ones that show in party window, such as summoning stones", "'Allies' meaning the ones that show in party window, such as summoning stones"], _ ;未译
["'LoadLibraryW' failed on '%S' (%lu)", "'LoadLibraryW' failed on '%S' (%lu)"], _ ;未译
["'No one hears you...'", "'No one hears you...'"], _ ;未译
["'Player x has achieved title...'", "'Player x has achieved title...'"], _ ;未译
["'Player x might not reply because his/her status is set to away'", "'Player x might not reply because his/her status is set to away'"], _ ;未译
["'You have been playing for...'", "'You have been playing for...'"], _ ;未译
["('Rare' stands for Gold item, Ecto or Obby shard)", "('Rare' stands for Gold item, Ecto or Obby shard)"], _ ;未译
["(Each in a separate line)", "(Each in a separate line)"], _ ;未译
["(Each in a separate line. Not case sensitive)", "(Each in a separate line. Not case sensitive)"], _ ;未译
["(Each line is a separate keyword. Not case sensitive.)", "(Each line is a separate keyword. Not case sensitive.)"], _ ;未译
["(Left-click on a color to edit it)", "(Left-click on a color to edit it)"], _ ;未译
["(Not implemented)", "(Not implemented)"], _ ;未译
["(Up to date)", "(Up to date)"], _ ;未译
["(a|b) denotes a mandatory argument, in this case 'a' or 'b'.\n", "(a|b) denotes a mandatory argument, in this case 'a' or 'b'.\n"], _ ;未译
["*Unknown item*", "*Unknown item*"], _ ;未译
[", &marker.pos.x, 1.0f, 0.0f, 0.0f, ", ", &marker.pos.x, 1.0f, 0.0f, 0.0f, "], _ ;未译
[", &marker.pos.y, 1.0f, 0.0f, 0.0f, ", ", &marker.pos.y, 1.0f, 0.0f, 0.0f, "], _ ;未译
[", guild ", ", guild "], _ ;未译
["- CTRL+A or double-click to select all\n", "- CTRL+A or double-click to select all\n"], _ ;未译
["- CTRL+Left/Right to word jump\n", "- CTRL+Left/Right to word jump\n"], _ ;未译
["- CTRL+X,CTRL+C,CTRL+V clipboard\n", "- CTRL+X,CTRL+C,CTRL+V clipboard\n"], _ ;未译
["- CTRL+Z,CTRL+Y undo/redo\n", "- CTRL+Z,CTRL+Y undo/redo\n"], _ ;未译
["- ESCAPE to revert\n", "- ESCAPE to revert\n"], _ ;未译
["- Hold SHIFT or use mouse to select text\n", "- Hold SHIFT or use mouse to select text\n"], _ ;未译
["- You can apply arithmetic operators +,*,/ on numerical values. Use +- to subtract.\n", "- You can apply arithmetic operators +,*,/ on numerical values. Use +- to subtract.\n"], _ ;未译
["/ Commands", "/ Commands"], _ ;未译
["/GUILD WARS/Templates/Skills/", "/GUILD WARS/Templates/Skills/"], _ ;未译
["/afk message", "/afk message"], _ ;未译
["/flag 5 -2913.41 3004.78", "/flag 5 -2913.41 3004.78"], _ ;未译
["/flag 5 clear", "/flag 5 clear"], _ ;未译
["/flag 5", "/flag 5"], _ ;未译
["/flag all -2913.41 3004.78", "/flag all -2913.41 3004.78"], _ ;未译
["/flag all", "/flag all"], _ ;未译
["/flag clear", "/flag clear"], _ ;未译
["/flag", "/flag"], _ ;未译
["10 Bolts of Cloth", "10 布料"], _
["10 Bones", "10 骨头"], _
["10 Chitin Fragments", "10 外壳"], _
["10 Feathers", "10 羽毛"], _
["10 Granite Slabs", "10 花岗岩石板"], _
["10 Iron Ingots", "10 铁矿石"], _
["10 Piles of Glittering Dust", "10 闪烁之土"], _
["10 Plant Fibers", "10 植物纤维"], _
["10 Scales", "10 鳞片"], _
["10 Tanned Hide Squares", "10 褐色兽皮"], _
["10 Wood Planks", "10 木材"], _
["2.29", "2.29"], _ ;未译
["4...Itchy...Tasty...", "4...Itchy...Tasty..."], _ ;未译
["9 Rings messages", "九环猜谜 提示语"], _ 
["<A Hero>", "<A Hero>"], _ ;未译
["<None>", "<None>"], _ ;未译
["<a=1>%S</a> (%S) has just logged in.</c>", "<a=1>%S</a> (%S) has just logged in.</c>"], _ ;未译
["<a=1>%s</a>: <c=#f96677><quote>%s", "<a=1>%s</a>: <c=#f96677><quote>%s"], _ ;未译
["<c=#00ccff>GWToolbox++</c>: %s", "<c=#00ccff>GWToolbox++</c>: %s"], _ ;未译
["<name>", "<name>"], _ ;未译
["<not found>", "<not found>"], _ ;未译
["<town> can be any of: doa, kamadan/kama, embark, vlox, gadds, urgoz, deep, gtob, fav1, fav2, fav3.\n", "<town> can be any of: doa, kamadan/kama, embark, vlox, gadds, urgoz, deep, gtob, fav1, fav2, fav3.\n"], _ ;未译
["@ Guild", "@ 公会频道"], _ 
["A common item drops for an ally", "A common item drops for an ally"], _ ;未译
["A common item drops for you", "A common item drops for you"], _ ;未译
["A name to help you remember what this is. Optional.", "A name to help you remember what this is. Optional."], _ ;未译
["A rare item drops for an ally", "A rare item drops for an ally"], _ ;未译
["A rare item drops for you", "A rare item drops for you"], _ ;未译
["A simple in-game text editor", "一简易的嵌入式便笺"], _ 
["A:%3.0f", "A:%3.0f"], _ ;未译
["AS modifier", "AS modifier"], _ ;未译
["AS of Weapon", "AS of Weapon"], _ ;未译
["Abaddon will feast on your eyes!", "Abaddon will feast on your eyes!"], _ ;未译
["Abaddon's Gate", "亚霸顿之门"], _
["Abaddon's Mouth", "地狱隘口"], _
["Abaddon's sword has been drawn. He sends me back to you with tokens of renewed power!", "Abaddon's sword has been drawn. He sends me back to you with tokens of renewed power!"], _ ;未译
["Accept quest reward", "接受任务奖励"], _ 
["Acolyte Jin", "侍从静"], _
["Acolyte Sousuke", "侍从萨苏克"], _
["Action", "Action"], _ ;未译
["Action###combo", "Action###combo"], _ ;未译
["ActionID", "ActionID"], _ ;未译
["Activity update failed with error %d\n", "Activity update failed with error %d\n"], _ ;未译
["Add Agent Custom Color", "Add Agent Custom Color"], _ ;未译
["Add Build", "Add Build"], _ ;未译
["Add Line", "Add Line"], _ ;未译
["Add Marker", "Add Marker"], _ ;未译
["Add Teambuild", "Add Teambuild"], _ ;未译
["Add another player build row", "Add another player build row"], _ ;未译
["Additional pings on the same agents will increase the duration of the existing ping, rather than create a new one.", "Additional pings on the same agents will increase the duration of the existing ping, rather than create a new one."], _ ;未译
["Addr", "内存地址"], _ 
["Advanced##target", "Advanced##target"], _ ;未译
["Afk message must be under 80 characters. (Yours is %zu)", "Afk message must be under 80 characters. (Yours is %zu)"], _ ;未译
["Afk message set to \", "Afk message set to \"], _ ;未译
["After this amount of time, each player recent damage (blue bar) will be reset", "After this amount of time, each player recent damage (blue bar) will be reset"], _ ;未译
["After using a pcon, toolbox will not use it again for this amount of time.\n", "After using a pcon, toolbox will not use it again for this amount of time.\n"], _ ;未译
["Agent Colors", "Agent Colors"], _ ;未译
["Agent ID is unique for each agent in the instance,\nIt's generated on spawn and will change in different instances.", "Agent ID is unique for each agent in the instance,\nIt's generated on spawn and will change in different instances."], _ ;未译
["Agent ID##player", "Agent ID##player"], _ ;未译
["Agent ID##target", "Agent ID##target"], _ ;未译
["Agent Sizes", "Agent Sizes"], _ ;未译
["Agent damaged modifier", "Agent damaged modifier"], _ ;未译
["Agent modifier", "Agent modifier"], _ ;未译
["AgentRenderer Lock() error: %d\n", "AgentRenderer Lock() error: %d\n"], _ ;未译
["AgentRenderer initialize error: %d\n", "AgentRenderer initialize error: %d\n"], _ ;未译
["Aggro range", "Aggro range"], _ ;未译
["Alcohol", "Alcohol"], _ ;未译
["Alerts", "Alerts"], _ ;未译
["Alignment", "Alignment"], _ ;未译
["All is well. I'm not insane.", "All is well. I'm not insane."], _ ;未译
["Allegiance", "Allegiance"], _ ;未译
["Alliance", "Alliance"], _ ;未译
["Allow mouse click-through in outposts", "Allow mouse click-through in outposts"], _ ;未译
["Allow mouse click-through", "Allow mouse click-through"], _ ;未译
["Allow window restore", "Allow window restore"], _ ;未译
["Ally (NPC)", "Ally (NPC)"], _ ;未译
["Ally (dead)", "Ally (dead)"], _ ;未译
["Ally (minion)", "Ally (minion)"], _ ;未译
["Ally (player)", "Ally (player)"], _ ;未译
["Ally (spirit)", "Ally (spirit)"], _ ;未译
["Alpha channel (0 - 255)\n0 is transparent, 255 is solid color", "Alpha channel (0 - 255)\n0 is transparent, 255 is solid color"], _ ;未译
["Alt + ", "Alt + "], _ ;未译
["Alt + Click on minimap to move", "Alt + Click on minimap to move"], _ ;未译
["Altrumm Ruins", "奥楚兰废墟"], _
["Amatz Basin", "亚马兹盆地"], _
["Amber Chunk", "琥珀"], _
["Ambiguous prefix because of %s", "Ambiguous prefix because of %s"], _ ;未译
["America", "America"], _ ;未译
["American District 1", "北美一区"], _ 
["American", "北美洲"], _ 
["Amnoon Oasis, The", "安奴绿洲"], _
["An ally picks up a common item", "An ally picks up a common item"], _ ;未译
["An ally picks up a rare item", "An ally picks up a rare item"], _ ;未译
["An alternative to the default compass", "An alternative to the default compass"], _ ;未译
["And messages matching regular expressions:", "And messages matching regular expressions:"], _ ;未译
["And this is where I met the Lich. He told me to burn things.", "And this is where I met the Lich. He told me to burn things."], _ ;未译
["Announcements", "Announcements"], _ ;未译
["Anton", "安托"], _
["Applications", "Applications"], _ ;未译
["Arborstone", "亭石"], _
["Are you sure?\nThis operation cannot be undone.\n\n", "Are you sure?\nThis operation cannot be undone.\n\n"], _ ;未译
["Are you sure?\nThis operation cannot be undone\n\n", "Are you sure?\nThis operation cannot be undone\n\n"], _ ;未译
["Are you sure?\nThis will reset all agent colors to the default values.\nThis operation cannot be undone.\n\n", "Are you sure?\nThis will reset all agent colors to the default values.\nThis operation cannot be undone.\n\n"], _ ;未译
["Are you the Keymaster?", "Are you the Keymaster?"], _ ;未译
["Armor of Salvation", "救赎防具"], _ 
["Armor of Salvation\nIron and Bones", "Armor of Salvation\nIron and 骨头"], _
["As a boy I spent much time in these lands.", "As a boy I spent much time in these lands."], _ ;未译
["Ascalon City", "阿斯卡隆城"], _
["Ascalon", "Ascalon"], _ ;未译
["Ashford Abbey", "灰色浅滩修道院"], _
["Asia Chinese", "亚洲 中文"], _ 
["Asia Japan", "Asia Japan"], _ ;未译
["Asia Japanese", "亚洲 日文"], _ 
["Asia Korea", "Asia Korea"], _ ;未译
["Asian Korean", "亚洲 朝文"], _ 
["Aspenwood Gate (Kurzick)", "杨木大门 (库兹柯)"], _
["Aspenwood Gate (Luxon)", "杨木大门 (勒克森)"], _
["Assassin", "Assassin"], _ ;未译
["Astralarium, The", "亚斯特拉利姆"], _
["Attach to minimap", "Attach to minimap"], _ ;未译
["Attn", "Attn"], _ ;未译
["Augury Rock", "占卜之石"], _
["Aurios Mines, The", "奥里欧斯矿坑"], _
["Aurora Glade", "欧若拉林地"], _
["Automatic message: \", "Automatic message: \"], _ ;未译
["Automatically change urls into build templates.", "Automatically change urls into build templates."], _ ;未译
["Automatically manage gold", "Automatically manage gold"], _ ;未译
["Automatically set 'Away' after ", "Automatically set 'Away' after "], _ ;未译
["Automatically set 'Online' after an input to Guild Wars", "Automatically set 'Online' after an input to Guild Wars"], _ ;未译
["Automatically skip cinematics", "Automatically skip cinematics"], _ ;未译
["B:%3.0f", "B:%3.0f"], _ ;未译
["BE GONE!", "BE GONE!"], _ ;未译
["Background", "Background"], _ ;未译
["Backspace", "Backspace"], _ ;未译
["Bad hero index '%d' for build '%s'", "Bad hero index '%d' for build '%s'"], _ ;未译
["Bai Paasu Reach", "拜巴苏区域"], _
["Bars towards the left", "Bars towards the left"], _ ;未译
["Basalt Grotto", "玄武岩石穴"], _
["Battle Isles", "Battle Isles"], _ ;未译
["Battle of Jahai", "Battle of Jahai"], _ ;未译
["Beacon's Perch", "毕肯高地"], _
["Beetletun", "甲虫镇"], _
["Beknur Harbor", "别克诺港"], _
["Below, <xyz> denotes an argument, use an appropriate value without the quotes.\n", "Below, <xyz> denotes an argument, use an appropriate value without the quotes.\n"], _ ;未译
["Bergen Hot Springs", "卑尔根温泉"], _
["Big Circle", "Big Circle"], _ ;未译
["Birthday Cupcake", "生日杯子蛋糕"], _ 
["Blacktide Den", "黑潮之穴"], _
["Bloodstone Fen", "血石沼泽"], _
["Blue Rock Candy", "蓝冰糖"], _ 
["Blue channel (0 - 255)", "Blue channel (0 - 255)"], _ ;未译
["Bolt of Damask", "缎布"], _
["Bolt of Linen", "亚麻布"], _
["Bolt of Silk", "丝绸"], _
["Bond order is based on your build. Check this to flip them left <-> right", "Bond order is based on your build. Check this to flip them left <-> right"], _ ;未译
["Bonds", "Bonds"], _ ;未译
["Bone Palace", "白骨宫殿"], _
["Boreal Station", "北极驻地"], _
["Boreas Seabed", "风神海床"], _
["Borlis Pass", "柏里斯通道"], _
["Boss Size", "Boss Size"], _ ;未译
["Bowl of Skalefin Soup", "鳞怪鳍汤"], _ 
["Brauer Academy", "巴尔学院"], _
["Breaker Hollow", "断崖谷"], _
["Browser Back", "Browser Back"], _ ;未译
["Browser Favorites", "Browser Favorites"], _ ;未译
["Browser Forward", "Browser Forward"], _ ;未译
["Browser Home", "Browser Home"], _ ;未译
["Browser Refresh", "Browser Refresh"], _ ;未译
["Browser Search", "Browser Search"], _ ;未译
["Browser Stop", "Browser Stop"], _ ;未译
["Buffer size too small, file size is %d", "Buffer size too small, file size is %d"], _ ;未译
["Build Name", "样本名"], _ 
["Build", "样本"], _ 
["BuildIndex", "样本索引号"], _ 
["Builds", "样本"], _ 
["Burning Forest", "孟席斯的奴隶们"], _ 
["Button Text Align", "Button Text Align"], _ ;未译
["ButtonTextAlignX", "ButtonTextAlignX"], _ ;未译
["ButtonTextAlignY", "ButtonTextAlignY"], _ ;未译
["Buttons in the main window.", "Buttons in the main window."], _ ;未译
["Buy##armor", "买##armor"], _ 
["Buy##common", "买##common"], _ 
["Buy##essence", "买##essence"], _ 
["Buy##grail", "买##grail"], _ 
["Buy##pstone", "买##pstone"], _ 
["Buy##rare", "买##rare"], _ 
["Buy##resscroll", "买##resscroll"], _ 
["Bye!", "Bye!"], _ ;未译
["CONOUT$", "CONOUT$"], _ ;未译
["CTRL+Click or Double Click on a slider or drag box to input text.", "CTRL+Click or Double Click on a slider or drag box to input text."], _ ;未译
["CTRL+Mouse Wheel to zoom window contents.", "CTRL+Mouse Wheel to zoom window contents."], _ ;未译
["Camera speed is now %f", "Camera speed is now %f"], _ ;未译
["Camera speed", "Camera speed"], _ ;未译
["Camp Hojanu", "何加努营地"], _
["Camp Rankor", "蓝口营地"], _
["Cancel the current queue of operations", "Cancel the current queue of operations"], _ ;未译
["Cancel", "取消"], _ 
["Cancelled", "已取消"], _ 
["Candy Apple", "糖苹果"], _ 
["Candy Corn", "粟米糖"], _ 
["Cannot find %s", "%s 失寻"], _ 
["Cannot find %s, please refill or disable", "%s 失寻, please refill or disable"], _ 
["Cannot find window '%ls'", "Cannot find window '%ls'"], _ ;未译
["Cannot load font!", "Cannot load font!"], _ ;未译
["Cannot parse regular expression '%s'", "Cannot parse regular expression '%s'"], _ ;未译
["Caps Lock", "Caps Lock"], _ ;未译
["Cast range", "Cast range"], _ ;未译
["Cavalon", "卡瓦隆"], _
["Central Transfer Chamber", "中央转送室"], _
["Chahbek Village", "夏贝克村庄"], _
["Chamber", "Chamber"], _ ;未译
["Champion's Dawn", "勇士曙光"], _
["Changes:", "Changes:"], _ ;未译
["Channel", "频道"], _ 
["Chantry of Secrets", "隐秘教堂"], _
["Charr Homelands", "Charr Homelands"], _ ;未译
["Chat Colors", "Chat Colors"], _ ;未译
["Chat Command", "Chat Command"], _ ;未译
["Chat Commands", "对话框指令"], _ 
["Chat Filter", "Chat Filter"], _ ;未译
["Chat command '/hide <name>' to hide a window or widget.", "对话框指令 '/hide <相关部件名>': 收起 窗口 或 配件."], _ 
["Chat command '/show <name>' to show a window or widget.", "对话框指令 '/show <相关部件名>': 展开 窗口 或 配件."], _ 
["Chat command '/tb <name>' to toggle a window or widget.", "对话框指令 '/tb <相关部件名>': 收展 窗口 或 配件."], _ 
["Check and ask before updating", "Check and ask before updating"], _ ;未译
["Check and automatically update", "Check and automatically update"], _ ;未译
["Check and display a message", "Check and display a message"], _ ;未译
["Checkboxes in the Info window.", "Checkboxes in the Info window."], _ ;未译
["Checkboxes on the right of each setting header below.", "Checkboxes on the right of each setting header below."], _ ;未译
["Choose Hero", "选择英雄"], _ 
["Circle", "Circle"], _ ;未译
["City speedboost", "城内加速品"], _ 
["City", "City"], _ ;未译
["Clear", "Clear"], _ ;未译
["Click and drag on any empty space to move a window.", "Click and drag on any empty space to move a window."], _ ;未译
["Click and drag on the lower right corner to resize a window.", "Click and drag on the lower right corner to resize a window."], _ ;未译
["Click to cancel bond", "Click to cancel bond"], _ ;未译
["Click to cast bond", "Click to cast bond"], _ ;未译
["Click to change hotkey", "击此以重配快键"], _ 
["Click to load builds to heroes and player", "击此以替英雄及角色装填技能样本"], _ 
["Click to reconnect", "击此以重新连网"], _ 
["Click to send teambuild to chat", "击此以发送整团的技能样本"], _ 
["Clicker is %s", "Clicker is %s"], _ ;未译
["Clicker", "Clicker"], _ ;未译
["Clicking on template that has a URL as name will open that URL in your browser", "Clicking on template that has a URL as name will open that URL in your browser"], _ ;未译
["Clock", "Clock"], _ ;未译
["Close on travel", "Close on travel"], _ ;未译
["Close other windows when opening a new one", "Close other windows when opening a new one"], _ ;未译
["Close this window", "关闭此窗口"], _ 
["Close", "关闭"], _ 
["Closed - %d", "Closed - %d"], _ ;未译
["Closing log/console, bye!\n", "Closing log/console, bye!\n"], _ ;未译
["Codex Arena", "Codex 竞技场"], _
["Coin Drop", "Coin Drop"], _ ;未译
["Coin dropper is %s", "Coin dropper is %s"], _ ;未译
["Color", "Color"], _ ;未译
["Color:", "Color:"], _ ;未译
["Color:\n0x%02X%02X%02X%02X", "Color:\n0x%02X%02X%02X%02X"], _ ;未译
["Colors", "Colors"], _ ;未译
["Common 4", "Common 4"], _ ;未译
["Compass range", "Compass range"], _ ;未译
["Connect", "Connect"], _ ;未译
["Connected (not resigned)", "Connected (not resigned)"], _ ;未译
["Connected", "Connected"], _ ;未译
["Connecting...", "正在连接..."], _ 
["Consulate Docks", "领事馆码头"], _
["Control + ", "Control + "], _ ;未译
["Control", "Control"], _ ;未译
["Control-break", "Control-break"], _ ;未译
["Copperhammer Mines", "铜锤矿坑"], _
["Couldn't connect to the host '%s'", "Couldn't connect to the host '%s'"], _ ;未译
["CrSel", "CrSel"], _ ;未译
["Craft fow armor", "(灾难内)打造黑曜石盔甲"], _ 
["Create Hotkey", "添加快键"], _ 
["Create Hotkey...", "指定快键..."], _ 
["CreateMutexW failed (%lu)", "CreateMutexW failed (%lu)"], _ ;未译
["Creating Modules\n", "Creating Modules\n"], _ ;未译
["Creating Toolbox\n", "Creating Toolbox\n"], _ ;未译
["Creating toolbox thread\n", "Creating toolbox thread\n"], _ ;未译
["Cross over, children. All are welcome. All welcome. Go into the light. There is peace and serenity in the light.", "Cross over, children. All are welcome. All welcome. Go into the light. There is peace and serenity in the light."], _ ;未译
["Crystal Desert", "Crystal Desert"], _ ;未译
["Ctrl+Click to print target health", "Ctrl+Click to print target health"], _ ;未译
["Ctrl+Click to print time", "Ctrl+Click to print time"], _ ;未译
["Ctrl+click doesn't work with birthday presents yet", "Ctrl+click doesn't work with birthday presents yet"], _ ;未译
["Current District", "现有区域"], _ 
["Current drunk level: %d", "现醉酒程度: %d 级"], _ 
["Cursor Fix not installed, message devs about this!", "Cursor Fix not installed, message devs about this!"], _ ;未译
["Custom Agents", "Custom Agents"], _ ;未译
["Custom Markers", "Custom Markers"], _ ;未译
["Custom", "Custom"], _ ;未译
["D'Alessio Seaboard", "达雷西海滨"], _
["DISCORD_INSTANCE_ID", "DISCORD_INSTANCE_ID"], _ ;未译
["Dajkah Inlet", "达卡港"], _
["Damage", "Damage"], _ ;未译
["Dasha Vestibule", "达沙走廊"], _
["Decimal", "Decimal"], _ ;未译
["Decrease the value if you have good ping and you die a lot.", "Decrease the value if you have good ping and you die a lot."], _ ;未译
["Deep", "深处"], _ 
["Deep, The", "深处"], _
["Default Size", "Default Size"], _ ;未译
["Defend", "保护战争圣殿"], _ 
["Deldrimor Steel Ingot", "戴尔狄摩钢铁矿石"], _
["Deldrimor War Camp", "戴尔狄摩兵营"], _
["Delete Color?", "Delete Color?"], _ ;未译
["Delete Hotkey?", "Delete Hotkey?"], _ ;未译
["Delete Teambuild?", "Delete Teambuild?"], _ ;未译
["Delete build", "Delete build"], _ ;未译
["Delete the color", "Delete the color"], _ ;未译
["Delete the hotkey", "删除快键"], _ 
["Delete the teambuild", "Delete the teambuild"], _ ;未译
["Delete", "删除"], _ 
["Demon Assassin", "恶魔暗杀者"], _
["Depletion: %d", "Depletion: %d"], _ ;未译
["Dervish", "Dervish"], _ ;未译
["Destiny's Gorge", "命运峡谷"], _
["Destroying API\n", "Destroying API\n"], _ ;未译
["Dev Region", "Dev Region"], _ ;未译
["Dhuum", "多姆"], _ 
["Dialog #%d", "Dialog #%d"], _ ;未译
["Dialog %s", "Dialog %s"], _ ;未译
["Dialog ID", "Dialog ID"], _ ;未译
["Dialog Name", "Dialog Name"], _ ;未译
["Dialog", "Dialog"], _ ;未译
["DialogID", "DialogID"], _ ;未译
["DialogName", "DialogName"], _ ;未译
["Dialogs", "令码"], _ 
["Diamond", "金刚石"], _
["Disable Gold/Green items confirmation", "Disable Gold/Green items confirmation"], _ ;未译
["Disable the confirmation request when\n", "Disable the confirmation request when\n"], _ ;未译
["Disable when not found", "失寻时关闭"], _ 
["Disabled###pconstoggle", "已关闭###pconstoggle"], _ 
["Disconnect", "Disconnect"], _ ;未译
["Discord Integration", "Discord Integration"], _ ;未译
["Discord Log Level %d: '%s'\n", "Discord Log Level %d: '%s'\n"], _ ;未译
["Discord connection already owned by an other GWToolboxpp", "Discord connection already owned by an other GWToolboxpp"], _ ;未译
["DiscordCreate", "DiscordCreate"], _ ;未译
["Displays the distance to your target.\n1010 = Earshot / Aggro\n1248 = Cast range\n2500 = Spirit range\n5000 = Radar range", "Displays the distance to your target.\n1010 = Earshot / Aggro\n1248 = Cast range\n2500 = Spirit range\n5000 = Radar range"], _ ;未译
["Displays the health of the target.\nMax health is only computed and refreshed when you directly damage or heal your target", "Displays the health of the target.\nMax health is only computed and refreshed when you directly damage or heal your target"], _ ;未译
["Displays the system time (hour : minutes)", "Displays the system time (hour : minutes)"], _ ;未译
["Distance", "距离"], _ 
["Divide", "Divide"], _ ;未译
["Divinity Coast", "神圣海岸"], _
["Do not check for updates", "Do not check for updates"], _ ;未译
["Do you like my fish balloon? Can you hear it singing to you...?", "Do you like my fish balloon? Can you hear it singing to you...?"], _ ;未译
["Do you want to update?", "Do you want to update?"], _ ;未译
["DoA - City", "四门 - 托加之城"], _ 
["DoA - Foundry 1: Foundry Of Failed Creations", "四门 - 铸造厂 1: 失败事物铸造厂"], _ 
["DoA - Foundry 2: Foundry Breakout", "四门 - 铸造厂 2: 逃出铸造厂"], _
["DoA - Gloom 1: Deathbringer Company", "四门 - 夺心暗域 1: 死亡召唤大队"], _
["DoA - Gloom 2: The Rifts Between Us", "四门 - 夺心暗域 2: 异世界的裂缝"], _
["DoA - Gloom 3: To The Rescue!", "四门 - 夺心暗域 3: 前往救援!"], _ 
["DoA - Veil 1: Breaching Stygian Veil", "四门 - 冥狱之幕 1: 突破冥狱之幕"], _
["DoA - Veil 2: Brood Wars", "四门 - 冥狱之幕 2: 一网打尽"], _
["Docks -> Kaineng @ Mhenlo", "领事馆码头 -> 凯宁中心 @ 涵洛"], _ 
["Docks -> LA Gate @ Mhenlo", "领事馆码头 -> 狮门 @ 涵洛"], _ 
["Don't change", "Don't change"], _ ;未译
["Doomlore Shrine", "末日传说神殿"], _
["Double-click on the title bar to collapse a window.", "Double-click on the title bar to collapse a window."], _ ;未译
["Down", "Down"], _ ;未译
["Downloading %s\n", "Downloading %s\n"], _ ;未译
["Downloading update...", "正在下载更新..."], _ 
["Dragon's Lair, The", "龙穴"], _
["Dragon's Throat", "龙喉"], _
["Drake Kabob", "烤龙兽肉"], _ 
["Drawings", "Drawings"], _ ;未译
["Droknar's Forge", "卓克纳熔炉"], _
["Drop Gold Coin", "Drop Gold Coin"], _ ;未译
["Drop or Use Buff", "Drop or Use Buff"], _ ;未译
["Drop/Use %s", "Drop/Use %s"], _ ;未译
["DropUseBuff", "DropUseBuff"], _ ;未译
["Drops", "Drops"], _ ;未译
["Druid's Overlook", "德鲁伊高地"], _
["Dunes of Despair", "绝望沙丘"], _
["Dunkoro", "唐克罗"], _
["Durheim Archives", "杜汉姆卷藏室"], _
["Dzagonur Bastion", "萨岗诺棱堡"], _
["Each agent has this value removed on the border and added at the center\nZero makes agents have solid color, while a high number makes them appear more shaded.", "Each agent has this value removed on the border and added at the center\nZero makes agents have solid color, while a high number makes them appear more shaded."], _ ;未译
["Each hostile agent has this value subtracted from it when under 90% HP.", "Each hostile agent has this value subtracted from it when under 90% HP."], _ ;未译
["Each symbol has this value removed on the border and added at the center\nZero makes them have solid color, while a high number makes them appear more shaded.", "Each symbol has this value removed on the border and added at the center\nZero makes them have solid color, while a high number makes them appear more shaded."], _ ;未译
["Earning skill points", "Earning skill points"], _ ;未译
["Edit", "修改"], _ 
["Effects", "Effects"], _ ;未译
["Effects##player", "Effects##player"], _ ;未译
["Elementalist", "Elementalist"], _ ;未译
["Elona Reach", "伊洛那流域"], _
["Elonian Leather Square", "伊洛那皮革"], _
["Embark Beach", "Embark Beach"], _ ;未译
["Embark", "Embark"], _ ;未译
["Ember Light Camp", "残火营地"], _
["Enable the following features:", "Enable the following features:"], _ ;未译
["Enable/Disable button", "启动/关闭 按钮"], _ 
["Enabled###pconstoggle", "已启动###pconstoggle"], _ 
["Enabled-Background", "Enabled-Background"], _ ;未译
["Enabling or disabling pcons will also Tick or Untick in party list", "Enabling or disabling pcons will also Tick or Untick in party list"], _ ;未译
["Enemy count", "(敌)个数统计"], _ 
["English", "English"], _ ;未译
["Enter Challenge", "进入挑战任务"], _ 
["Enter DoA, FoW, or UW to begin", "启动前提： 角色已入悲难之门(四门)，灾难裂痕，或地下世界."], _ 
["Enter", "Enter"], _ ;未译
["Erase EOF", "Erase EOF"], _ ;未译
["Eredon Terrace", "尔雷登平地"], _
["Error checking for updates", "Error checking for updates"], _ ;未译
["Error creating the dump file\n", "Error creating the dump file\n"], _ ;未译
["Error downloading %s\n", "Error downloading %s\n"], _ ;未译
["Error setting up CustomRenderer vertex buffer: %d\n", "Error setting up CustomRenderer vertex buffer: %d\n"], _ ;未译
["Error setting up PingsLinesRenderer vertex buffer: %d\n", "Error setting up PingsLinesRenderer vertex buffer: %d\n"], _ ;未译
["Error writing file %s - Error is %lu", "Error writing file %s - Error is %lu"], _ ;未译
["Error", "Error"], _ ;未译
["Escort", "Escort"], _ ;未译
["Essence of Celerity", "敏捷精华"], _ 
["Essence of Celerity\nFeathers and Dust", "Essence of Celerity\n羽毛 and Dust"], _
["Eternal Grove, The", "永恒之林"], _
["Europe English", "欧洲 英语"], _ 
["Europe French", "欧洲 法语"], _ 
["Europe German", "欧洲 德语"], _ 
["Europe Italian", "欧洲 意大利语"], _ 
["Europe Polish", "欧洲 波兰语"], _ 
["Europe Russian", "欧洲 俄罗斯语"], _ 
["Europe Spanish", "欧洲 西班牙语"], _ 
["Europe", "欧洲"], _ 
["ExSel", "ExSel"], _ ;未译
["Execute a single task such as opening chests\nor reapplying lightbringer title", "Execute a single task such as opening chests\nor reapplying lightbringer title"], _ ;未译
["Execute the hotkey now", "即刻触发快键"], _ 
["Execute", "Execute"], _ ;未译
["Execute...", "执行..."], _ 
["Exhaustion: %d", "Exhaustion: %d"], _ ;未译
["Explorable", "探索区域"], _ 
["ExtraType", "ExtraType"], _ ;未译
["Eye of the North", "极地之眼"], _
["Faction mission outpost", "二章任务城"], _ 
["Failed openning file '%S'", "Failed openning file '%S'"], _ ;未译
["Failed to create discord connection", "Failed to create discord connection"], _ ;未译
["Failed to find address for DiscordCreate", "Failed to find address for DiscordCreate"], _ ;未译
["Failed to find and download the file 'discord_game_sdk.dll'. To try again, please restart GWToolbox", "Failed to find and download the file 'discord_game_sdk.dll'. To try again, please restart GWToolbox"], _ ;未译
["Far Shiverpeaks", "Far Shiverpeaks"], _ ;未译
["Fav%d", "Fav%d"], _ ;未译
["Favor of the Gods announcements", "Favor of the Gods announcements"], _ ;未译
["Favorites", "Favorites"], _ ;未译
["FillCircle", "FillCircle"], _ ;未译
["Fire Jet: %d", "Fire Jet: %d"], _ ;未译
["Fire Spout: %d", "Fire Spout: %d"], _ ;未译
["Fire Trap: %d", "Fire Trap: %d"], _ ;未译
["First item in inventory", "背包左上格内之物"], _ 
["Fishermen's Haven", "渔人避风港"], _
["Fissure of Woe", "灾难裂痕"], _ 
["Fix height when moving forward", "Fix height when moving forward"], _ ;未译
["Flash Guild Wars taskbar icon when:", "Flash Guild Wars taskbar icon when:"], _ ;未译
["Flip bond order (left/right)", "Flip bond order (left/right)"], _ ;未译
["FoW - Army Of Darkness", "灾难 - 黑暗的军队"], _
["FoW - Defend", "灾难 - 保护战争圣殿"], _ 
["FoW - Forgemaster", "灾难 - 永生的锻造大师"], _ 
["FoW - Griffons", "灾难 - 狮鹫兽礼物"], _ 
["FoW - Hunt", "灾难 - 猎杀碎片狼"], _ 
["FoW - Khobay", "灾难 - 背叛者库贝"], _ 
["FoW - Restore", "灾难 - 恢复圣殿"], _ 
["FoW - Slaves", "灾难 - 孟席斯的奴隶们"], _ 
["FoW - Toc", "灾难 - 勇气之塔"], _ 
["FoW - Tos", "灾难 - 力量之塔"], _ 
["FoW - WailingLord", "灾难 - 悲鸣领主"], _ 
["Foible's Fair", "佛伊伯市集"], _
["FontGlobalScale", "FontGlobalScale"], _ ;未译
["Forge", "永生的锻造大师"], _ 
["Fort Aspenwood (Kurzick)", "杨木要塞 (库兹柯)"], _
["Fort Aspenwood (Luxon)", "杨木要塞 (勒克森)"], _
["Fort Ranik", "瑞尼克要塞"], _
["Foundry Reward", "铸造厂奖励2"], _ 
["Foundry", "Foundry"], _ ;未译
["Four Horseman", "多姆四骑士"], _ 
["Frame Padding", "Frame Padding"], _ ;未译
["Frame Rounding", "Frame Rounding"], _ ;未译
["FramePaddingX", "FramePaddingX"], _ ;未译
["FramePaddingY", "FramePaddingY"], _ ;未译
["FrameRounding", "FrameRounding"], _ ;未译
["French", "French"], _ ;未译
["Frontier Gate", "边境关所"], _
["Frost Gate, The", "寒霜之门"], _
["Full Conset Price: %g k", "三件套总价: %g k"], _ 
["Full Conset Price: (Material not available)", "Full Conset Price: (Material not available)"], _ ;未译
["Full Conset Price: -", "三件套总价: -"], _ 
["Functionality:", "功能:"], _ 
["Fur Square", "毛皮"], _
["G:%3.0f", "G:%3.0f"], _ ;未译
["GWTB++ Debug Console", "GWTB++ Debug Console"], _ ;未译
["GWToolbox crashed, oops\n\n", "GWToolbox crashed, oops\n\n"], _ ;未译
["GWToolbox++ - Clientside Error Detected", "GWToolbox++ - Clientside Error Detected"], _ ;未译
["GWToolbox++ API Error", "GWToolbox++ API Error"], _ ;未译
["GWToolbox++ Crash!", "GWToolbox++ Crash!"], _ ;未译
["GWToolbox++ version %s by Has and KAOS", "GWToolbox++ version %s by Has and KAOS"], _ ;未译
["GWToolbox++ version %s is available! You have %s", "GWToolbox++ version %s is available! You have %s"], _ ;未译
["GWToolbox++ version %s is available! You have %s%s", "GWToolbox++ version %s is available! You have %s%s"], _ ;未译
["GWToolbox++ version %s is available! You have %s%s.", "GWToolbox++ version %s is available! You have %s%s."], _ ;未译
["GWToolboxpp", "GWToolboxpp"], _ ;未译
["GWToolboxpp-Mutex-DiscordIntegration", "GWToolboxpp-Mutex-DiscordIntegration"], _ ;未译
["Gadd's Encampment", "盖德营地"], _
["Gadd's", "Gadd's"], _ ;未译
["Game Settings", "Game Settings"], _ ;未译
["Gate of Anguish", "悲难之门"], _
["Gate of Desolation", "荒芜之地入口"], _
["Gate of Fear", "恐惧之门"], _
["Gate of Madness", "疯狂之门"], _
["Gate of Pain", "惩罚之门"], _
["Gate of Secrets", "奥秘之门"], _
["Gate of Torment", "苦痛之门"], _
["Gate of the Nightfallen Lands", "夜蚀暗殒领地之门"], _
["Gates of Kryta", "科瑞塔关所"], _
["General Interface", "General 界面"], _ 
["General Morgahn", "摩根将军"], _
["General", "General"], _ ;未译
["General:", "General:"], _ ;未译
["German", "German"], _ ;未译
["Get away from my baby!", "Get away from my baby!"], _ ;未译
["GetClipCursor", "GetClipCursor"], _ ;未译
["Glob of Ectoplasm", "心灵之玉"], _
["Global Alpha", "Global Alpha"], _ ;未译
["Global Font Scale", "Global Font Scale"], _ ;未译
["GlobalAlpha", "GlobalAlpha"], _ ;未译
["Gloom", "Gloom"], _ ;未译
["Go, banana!", "Go, banana!"], _ ;未译
["Golden Egg", "金鸡蛋"], _ 
["Goren", "高恩"], _
["Grab MinSize", "Grab MinSize"], _ ;未译
["Grab Rounding", "Grab Rounding"], _ ;未译
["GrabMinSize", "GrabMinSize"], _ ;未译
["GrabRounding", "GrabRounding"], _ ;未译
["Gracious me, was I raving? Please forgive me. I'm mad.", "Gracious me, was I raving? Please forgive me. I'm mad."], _ ;未译
["Grail of Might", "力量圣杯"], _ 
["Grail of Might\nIron and Dust", "Grail of Might\nIron and Dust"], _ ;未译
["Grand Court of Sebelkeh", "希贝克大公廷"], _
["Granite Citadel, The", "花岗岩堡垒"], _
["Great Northern Wall, The", "北方长城"], _
["Great Temple of Balthazar", "巴萨泽圣殿"], _
["Green Rock Candy", "绿冰糖"], _ 
["Green channel (0 - 255)", "Green channel (0 - 255)"], _ ;未译
["Grendich Courthouse", "葛兰迪法院"], _
["Griffons", "狮鹫兽礼物"], _ 
["Guild", "Guild"], _ ;未译
["Gunnar's Hold", "甘拿的占领地"], _
["Gwen", "关"], _
["Gyala Hatchery", "盖拉孵化所"], _
["H#%d", "H#%d"], _ ;未译
["Hall of Heroes winners", "Hall of Heroes winners"], _ ;未译
["Hard Mode", "困难模式"], _ 
["Harvest Temple", "丰收神殿"], _
["Hayda", "海妲"], _
["Health", "体力"], _ 
["Height of each row, leave 0 for default", "Height of each row, leave 0 for default"], _ ;未译
["Height", "高度"], _ 
["Hell's Precipice", "地狱悬崖"], _
["Hello %ls!", "Hello %ls!"], _ ;未译
["Help", "说明"], _ 
["Henge of Denravi", "丹拉维圣地"], _
["Hero Build Name", "Hero Build Name"], _ ;未译
["Hero Builds", "英雄技能样本"], _ 
["Hero Controls", "Hero Controls"], _ ;未译
["Hero flagging", "Hero flagging"], _ ;未译
["HeroTeamBuild", "HeroTeamBuild"], _ ;未译
["Heroes' Ascent", "英雄之路"], _
["Heroes' Audience", "英雄之痕"], _
["Hide Spiritual Possession and Lucky Aura", "Hide Spiritual Possession and Lucky Aura"], _ ;未译
["Hide any messages containing:", "Hide any messages containing:"], _ ;未译
["Hide any messages from: ", "Hide any messages from: "], _ ;未译
["Hide in-game info when appearing offline", "Hide in-game info when appearing offline"], _ ;未译
["Hide the following messages:", "Hide the following messages:"], _ ;未译
["Hide", "Hide"], _ ;未译
["His blood has returned me to my mortal body.", "His blood has returned me to my mortal body."], _ ;未译
["HoS range", "HoS range"], _ ;未译
["Holy Veil", "神圣遮罩"], _ 
["Home", "Home"], _ ;未译
["Honur Hill", "霍奴尔丘陵"], _
["Hooks Enabled!\n", "Hooks Enabled!\n"], _ ;未译
["Hostile (>90%%)", "Hostile (>90%%)"], _ ;未译
["Hostile (dead)", "Hostile (dead)"], _ ;未译
["Hotkey: %s", "快键: %s"], _ 
["Hotkeys", "快键"], _ 
["House zu Heltzer", "凤荷议院"], _
["Human sacrifice. Dogs and cats living together. Mass hysteria!", "Human sacrifice. Dogs and cats living together. Mass hysteria!"], _ ;未译
["I don't really know what to do, sorry, contact the developers.\n", "I don't really know what to do, sorry, contact the developers.\n"], _ ;未译
["I have returned!", "I have returned!"], _ ;未译
["I like how they've decorated this place. The talking lights are a nice touch.", "I like how they've decorated this place. The talking lights are a nice touch."], _ ;未译
["I see dead people.", "I see dead people."], _ ;未译
["ID: 0x%X", "ID: 0x%X"], _ ;未译
["IME Accept", "IME Accept"], _ ;未译
["IME Convert", "IME Convert"], _ ;未译
["IME Final", "IME Final"], _ ;未译
["IME Hanja/Kanji", "IME Hanja/Kanji"], _ ;未译
["IME Junja", "IME Junja"], _ ;未译
["IME Mode change", "IME Mode change"], _ ;未译
["IME Nonconvert", "IME Nonconvert"], _ ;未译
["IME Process", "IME Process"], _ ;未译
["Ice Caves of Sorrow", "悲伤冰谷"], _
["Ice Jet: %d", "Ice Jet: %d"], _ ;未译
["Ice Spout: %d", "Ice Spout: %d"], _ ;未译
["Ice Tooth Cave", "冰牙洞穴"], _
["If disabled, you can move/resize the window with 'Unlock Move All'.", "If disabled, you can move/resize the window with 'Unlock Move All'."], _ ;未译
["If this custom agent is active", "If this custom agent is active"], _ ;未译
["If unchecked, the default color will be used", "If unchecked, the default color will be used"], _ ;未译
["If unchecked, the default shape will be used", "If unchecked, the default shape will be used"], _ ;未译
["If unchecked, the default size will be used", "If unchecked, the default size will be used"], _ ;未译
["If unchecked, they will expand to the right", "If unchecked, they will expand to the right"], _ ;未译
["Imperial Sanctum", "帝国圣所"], _
["Important:\n", "Important:\n"], _ ;未译
["In Explorable", "In Explorable"], _ ;未译
["In Guild Hall", "In Guild Hall"], _ ;未译
["In the commands above, <name> is the title of the window as shown in the title bar. For example, try '/hide settings' and '/show settings'.", "In the commands above, <name> is the title of the window as shown in the title bar. For example, try '/hide settings' and '/show settings'."], _ ;未译
["Indent Spacing", "Indent Spacing"], _ ;未译
["IndentSpacing", "IndentSpacing"], _ ;未译
["Info", "数据"], _ 
["Initialize Failed at finding all addresses, contact Developers about this.", "Initialize Failed at finding all addresses, contact Developers about this."], _ ;未译
["Initializing API\n", "Initializing API\n"], _ ;未译
["Installed chat hooks\n", "Installed chat hooks\n"], _ ;未译
["Installed dx hooks\n", "Installed dx hooks\n"], _ ;未译
["Installed input event handler, oldwndproc = 0x%X\n", "Installed input event handler, oldwndproc = 0x%X\n"], _ ;未译
["Installing Cursor Fix\n", "Installing Cursor Fix\n"], _ ;未译
["Installing dx hooks\n", "Installing dx hooks\n"], _ ;未译
["Interface:", "Interface:"], _ ;未译
["International %d", "International %d"], _ ;未译
["International", "国际区"], _ 
["Invalid argument '%ls', please use /pcons [|on|off]", "Invalid argument '%ls', please use /pcons [|on|off]"], _ ;未译
["Invalid argument '%ls', please use a float value", "Invalid argument '%ls', please use a float value"], _ ;未译
["Invalid argument '%ls', please use a positive integer value", "Invalid argument '%ls', please use a positive integer value"], _ ;未译
["Invalid argument '%ls', please use an integer or hex value", "Invalid argument '%ls', please use an integer or hex value"], _ ;未译
["Invalid argument '%ls', please use an integer value", "Invalid argument '%ls', please use an integer value"], _ ;未译
["Invalid argument.", "Invalid argument."], _ ;未译
["Invalid dialog number '%s'", "无效令码 '%s'"], _ 
["Invalid district '%ls'", "Invalid district '%ls'"], _ ;未译
["Invalid hero number", "Invalid hero number"], _ ;未译
["Iron Mines of Moladune", "莫拉登矿山"], _
["Istan", "Istan"], _ ;未译
["It is needed to prevent toolbox from using a pcon twice, before it activates.\n", "It is needed to prevent toolbox from using a pcon twice, before it activates.\n"], _ ;未译
["It will automaticly withdraw and deposit gold while buying materials", "It will automaticly withdraw and deposit gold while buying materials"], _ ;未译
["It's a trick. Get an axe.", "It's a trick. Get an axe."], _ ;未译
["It's possible to use more than one skill on recharge. ", "It's possible to use more than one skill on recharge. "], _ ;未译
["Italian", "Italian"], _ ;未译
["Item #%d not found!", "Item #%d not found!"], _ ;未译
["Item ID", "Item ID"], _ ;未译
["Item InnerSpacing", "Item InnerSpacing"], _ ;未译
["Item Name", "Item Name"], _ ;未译
["Item Size", "Item Size"], _ ;未译
["Item Spacing", "Item Spacing"], _ ;未译
["Item", "Item"], _ ;未译
["ItemID", "ItemID"], _ ;未译
["ItemId", "ItemId"], _ ;未译
["ItemInnerSpacingX", "ItemInnerSpacingX"], _ ;未译
["ItemInnerSpacingY", "ItemInnerSpacingY"], _ ;未译
["ItemName", "ItemName"], _ ;未译
["ItemSpacingX", "ItemSpacingX"], _ ;未译
["ItemSpacingY", "ItemSpacingY"], _ ;未译
["Items per row", "Items per row"], _ ;未译
["Jade Flats (Kurzick)", "翡翠浅滩 (库兹柯)"], _
["Jade Flats (Luxon)", "翡翠浅滩 (勒克森)"], _
["Jade Quarry (Kurzick), The", "翡翠矿场 (库兹柯)"], _
["Jade Quarry (Luxon), The", "翡翠矿场 (勒克森)"], _
["Jadeite Shard", "硬玉"], _
["Jennur's Horde", "征钠群落"], _
["Jokanur Diggings", "卓坎诺挖掘点"], _
["Jora", "乔拉"], _
["Just used the last %s", "Just used the last %s"], _ ;未译
["Kahmu", "卡慕"], _
["Kaineng Center", "凯宁中心"], _
["Kaineng", "Kaineng"], _ ;未译
["Kama -> Docks @ Hahnna", "卡玛丹 -> 领事馆码头 @ Hahnna"], _ ;未译
["Kamadan", "卡玛丹"], _ 
["Kamadan, Jewel of Istan", "卡玛丹，艾斯坦之钻"], _
["Keep away. The sow is mine.", "Keep away. The sow is mine."], _ ;未译
["Keiran Thackeray", "Keiran Thackeray"], _ ;未译
["Khobay", "Khobay"], _ ;未译
["Klaatu...barada...necktie?", "Klaatu...barada...necktie?"], _ ;未译
["Kodash Bazaar, The", "库丹西市集广场"], _
["Kodlonu Hamlet", "克拓奴，哈姆雷特"], _
["Kodonur Crossroads", "科登诺路口"], _
["Koss", "寇斯"], _
["Kourna", "Kourna"], _ ;未译
["Kryta", "Kryta"], _ ;未译
["Kurzick", "Kurzick"], _ ;未译
["LA Gate -> LA @ Neiro", "狮门 -> 狮子拱门 @ Neiro"], _ ;未译
["Lair of the Forgotten", "被遗忘者的巢穴"], _
["Last Dialog", "前一令码"], _ 
["Later", "Later"], _ ;未译
["Launch Application 1", "Launch Application 1"], _ ;未译
["Launch Application 2", "Launch Application 2"], _ ;未译
["Leather Square", "皮革"], _
["Left Alt", "Left Alt"], _ ;未译
["Left Control", "Left Control"], _ ;未译
["Left Shift", "Left Shift"], _ ;未译
["Left Windows", "Left Windows"], _ ;未译
["Left mouse", "Left mouse"], _ ;未译
["Left", "Left"], _ ;未译
["Level = %d, tint = %d\n", "Level = %d, tint = %d\n"], _ ;未译
["Level", "Level"], _ ;未译
["Leviathan Pits", "利拜亚森矿场"], _
["Line X 1", "Line X 1"], _ ;未译
["Line X 2", "Line X 2"], _ ;未译
["Line Y 1", "Line Y 1"], _ ;未译
["Line Y 2", "Line Y 2"], _ ;未译
["Lion's Arch", "狮子拱门"], _
["Livia", "莉薇亚"], _
["Load Build on Hero", "Load Build on Hero"], _ ;未译
["Load Build on Player", "Load Build on Player"], _ ;未译
["Load Hero Team Build", "Load Hero Team Build"], _ ;未译
["Load Now", "即刻装填"], _ 
["Load Team Hero Build '%s'", "Load Team Hero Build '%s'"], _ ;未译
["Load a team hero build from the Hero Build Panel", "Load a team hero build from the Hero Build Panel"], _ ;未译
["Load build on your character", "为角色装填技能样本"], _ 
["Load", "装填"], _ 
["Loading\0\0\0", "Loading\0\0\0"], _ ;未译
["Local", "Local"], _ ;未译
["Lock Position", "Lock Position"], _ ;未译
["Lock Size", "Lock Size"], _ ;未译
["Log and dump files have been created in the GWToolbox data folder.\n", "Log and dump files have been created in the GWToolbox data folder.\n"], _ ;未译
["LoginNumber", "LoginNumber"], _ ;未译
["Logs in", "Logs in"], _ ;未译
["Logs out", "Logs out"], _ ;未译
["Longeye's Ledge", "长眼岩脉"], _
["Low on %s, please refill or disable", "%s 即将耗尽, please refill or disable"], _ 
["Lump of Charcoal", "结块的木炭"], _
["Lunar Fortunes", "命运锦囊"], _ 
["Lunar fortunes messages", "Lunar fortunes messages"], _ ;未译
["Lunars and Alcohol", "Lunars and Alcohol"], _ ;未译
["Lunars delay", "Lunars delay"], _ ;未译
["Lutgardis Conservatory", "路嘉帝斯温室"], _
["Luxon", "Luxon"], _ ;未译
["Maatu Keep", "麻都堡垒"], _
["Maguuma Stade", "梅古玛丛林"], _
["Maguuma", "Maguuma"], _ ;未译
["Map ID is unique for each area", "每处皆有一独特的地图号"], _ 
["Map ID", "Map ID"], _ ;未译
["Map Rotation", "Map Rotation"], _ ;未译
["Map Type", "Map Type"], _ ;未译
["Map file is unique for each pathing map (e.g. used by minimap).\nMany different maps use the same map file", "Map file is unique for each pathing map (e.g. used by minimap).\nMany different maps use the same map file"], _ ;未译
["Map file", "Map file"], _ ;未译
["Map rotation on (e.g. Compass), or off (e.g. Mission Map).", "Map rotation on (e.g. Compass), or off (e.g. Mission Map)."], _ ;未译
["Map-", "Map-"], _ ;未译
["Margrid The Sly", "狡猾者玛格丽特 (狡诈者玛格丽)"], _
["Marhan's Grotto", "马翰洞穴"], _
["Marker X Position", "Marker X Position"], _ ;未译
["Marker Y Position", "Marker Y Position"], _ ;未译
["Marker: (%.0f, %.0f)", "Marker: (%.0f, %.0f)"], _ ;未译
["Marketplace, The", "市集"], _
["Master Of Whispers", "唤言大师"], _
["Materials", "材料"], _ 
["Max range end", "Max range end"], _ ;未译
["Max range start", "Max range start"], _ ;未译
["Media Select", "Media Select"], _ ;未译
["Media Stop", "Media Stop"], _ ;未译
["Melonni", "梅隆妮"], _
["Menzies", "孟席斯"], _ 
["Mercenary Hero 1", "佣兵 1"], _ 
["Mercenary Hero 2", "佣兵 2"], _ 
["Mercenary Hero 3", "佣兵 3"], _ 
["Mercenary Hero 4", "佣兵 4"], _ 
["Mercenary Hero 5", "佣兵 5"], _ 
["Mercenary Hero 6", "佣兵 6"], _ 
["Mercenary Hero 7", "佣兵 7"], _ 
["Mercenary Hero 8", "佣兵 8"], _ 
["Mesmer", "Mesmer"], _ ;未译
["Message Color:", "Message Color:"], _ ;未译
["Message", "Message"], _ ;未译
["Middle mouse", "Middle mouse"], _ ;未译
["Mihanu Township", "米哈努小镇"], _
["Miku", "Miku"], _ ;未译
["Minimap", "Minimap"], _ ;未译
["Minion Size", "Minion Size"], _ ;未译
["Minister Cho's Estate", "周大臣庄园"], _
["Mnts", "Mnts"], _ ;未译
["Moddok Crevice", "摩多克裂缝"], _
["Mode", "Mode"], _ ;未译
["Model ID is unique for each kind of agent.\nIt is static and shared by the same agents.\nWhen targeting players, this is Player ID instead, unique for each player in the instance.\nFor the purpose of targeting hotkeys and commands, use this value", "Model ID is unique for each kind of agent.\nIt is static and shared by the same agents.\nWhen targeting players, this is Player ID instead, unique for each player in the instance.\nFor the purpose of targeting hotkeys and commands, use this value"], _ ;未译
["Model ID", "Model ID"], _ ;未译
["Model ID##target", "Model ID##target"], _ ;未译
["ModelID", "ModelID"], _ ;未译
["ModelState", "ModelState"], _ ;未译
["Mommy? Where are you? I can't find you. I can't. I'm afraid of the light, mommy. I'm afraid of the light.", "Mommy? Where are you? I can't find you. I can't. I'm afraid of the light, mommy. I'm afraid of the light."], _ ;未译
["Monk", "Monk"], _ ;未译
["Monstrous Claw", "巨大的爪"], _
["Monstrous Eye", "巨大的眼"], _
["Monstrous Fang", "巨大尖牙"], _
["Mountains", "双头龙山"], _ 
["Mouse Wheel to scroll.", "Mouse Wheel to scroll."], _ ;未译
["Mouth of Torment, The", "苦痛之地隘口"], _
["Move Down", "Move Down"], _ ;未译
["Move Up", "Move Up"], _ ;未译
["Move items from/to storage with Control+Click", "Move items from/to storage with Control+Click"], _ ;未译
["Move the color down in the list", "Move the color down in the list"], _ ;未译
["Move the color up in the list", "Move the color up in the list"], _ ;未译
["Move the hotkey down in the list", "Move the hotkey down in the list"], _ ;未译
["Move the hotkey up in the list", "Move the hotkey up in the list"], _ ;未译
["Move the teambuild down in the list", "Move the teambuild down in the list"], _ ;未译
["Move the teambuild up in the list", "Move the teambuild up in the list"], _ ;未译
["Move to %s", "前往 %s"], _ 
["Move to (%.0f, %.0f)", "Move to (%.0f, %.0f)"], _ ;未译
["Move to a specific (x,y) coordinate", "Move to a specific (x,y) coordinate"], _ ;未译
["Move to", "前往"], _ 
["Move", "Move"], _ ;未译
["Moving to %s", "正在前往 %s"], _ 
["Moving to (%.0f, %.0f)", "Moving to (%.0f, %.0f)"], _ ;未译
["Multiply", "Multiply"], _ ;未译
["My cat's breath smells like cat food.", "My cat's breath smells like cat food."], _ ;未译
["My cat's name is Mittens.", "My cat's name is Mittens."], _ ;未译
["Nahpui Quarter", "纳普区"], _
["Name", "Name"], _ ;未译
["NameProperties", "NameProperties"], _ ;未译
["Necromancer", "Necromancer"], _ ;未译
["Neutral", "Neutral"], _ ;未译
["Next Track", "Next Track"], _ ;未译
["Nightfall mission outpost", "三章任务城"], _ 
["No Hero", "No Hero"], _ ;未译
["No Profession", "No Profession"], _ ;未译
["No map were found with the prefix '%S'", "No map were found with the prefix '%S'"], _ ;未译
["No one can stop me, let alone you puny mortals!", "No one can stop me, let alone you puny mortals!"], _ ;未译
["No target selected!", "No target selected!"], _ ;未译
["Nolani Academy", "若拉尼学院"], _
["Noname", "Noname"], _ ;未译
["None", "None"], _ ;未译
["Norgu", "诺古"], _
["Normal Mode", "普通模式"], _ 
["North Marker", "North Marker"], _ ;未译
["Not connected", "已失联/已断网"], _ 
["Note: custom markers are stored in 'Markers.ini' in settings folder. You can share the file with other players or paste other people's markers into it.", "Note: custom markers are stored in 'Markers.ini' in settings folder. You can share the file with other players or paste other people's markers into it."], _ ;未译
["Note: only visible in Hard Mode explorable areas.", "Note: only visible in Hard Mode explorable areas."], _ ;未译
["Note: only visible in explorable areas.", "Note: only visible in explorable areas."], _ ;未译
["Note: the names of the widgets without a visible title bar are the same as in the setting headers below.", "Note: the names of the 配件 without a visible title bar are the same as in the setting headers below."], _ 
["Note: theme is stored in 'Theme.ini' in settings folder. You can share the file or parts of it with other people.", "Note: theme is stored in 'Theme.ini' in settings folder. You can share the file or parts of it with other people."], _ ;未译
["Notepad", "便笺"], _ 
["Num Lock", "Num Lock"], _ ;未译
["Number of favorites", "Number of favorites"], _ ;未译
["Numpad 0", "Numpad 0"], _ ;未译
["Numpad 1", "Numpad 1"], _ ;未译
["Numpad 2", "Numpad 2"], _ ;未译
["Numpad 3", "Numpad 3"], _ ;未译
["Numpad 4", "Numpad 4"], _ ;未译
["Numpad 5", "Numpad 5"], _ ;未译
["Numpad 6", "Numpad 6"], _ ;未译
["Numpad 7", "Numpad 7"], _ ;未译
["Numpad 8", "Numpad 8"], _ ;未译
["Numpad 9", "Numpad 9"], _ ;未译
["Nundu Bay", "纳度湾"], _
["Objective Timer", "Objective Timer"], _ ;未译
["Obsidian Shard", "黑曜石碎片"], _
["Oem 1", "Oem 1"], _ ;未译
["Oem 10", "Oem 10"], _ ;未译
["Oem 2", "Oem 2"], _ ;未译
["Oem 3", "Oem 3"], _ ;未译
["Oem 4", "Oem 4"], _ ;未译
["Oem 5", "Oem 5"], _ ;未译
["Oem 6", "Oem 6"], _ ;未译
["Oem 7", "Oem 7"], _ ;未译
["Oem 8", "Oem 8"], _ ;未译
["Ogden", "Ogden"], _ ;未译
["Oh boy, sleep! That's where I'm a Luxon.", "Oh boy, sleep! That's where I'm a Luxon."], _ ;未译
["Olafstead", "欧拉夫之地"], _
["Olias", "奥里亚斯"], _
["Only affects windows (with a title bar), not widgets", "Only affects windows (with a title bar), not widgets"], _ ;未译
["Only if you were 'Away'", "Only if you were 'Away'"], _ ;未译
["Only if you were 'Online'", "Only if you were 'Online'"], _ ;未译
["Only in Domain of Anguish, within 1400 range", "Only in 悲难领地, within 1400 range"], _
["Only show messages containing:", "Only show messages containing:"], _ ;未译
["Only show non learned skills when using a tome", "Only show non learned skills when using a tome"], _ ;未译
["Only triggers when Guild Wars is not the active window", "Only triggers when Guild Wars is not the active window"], _ ;未译
["Onyx Gemstone", "玛瑙宝石"], _
["Open - %d", "Open - %d"], _ ;未译
["Open GWToolbox++ Website", "Open GWToolbox++ Website"], _ ;未译
["Open Locked Chest", "打开锁住的宝箱"], _ 
["Open Settings Folder", "打开设置夹"], _ 
["Open Xunlai Chest", "打开桑莱保险箱"], _ 
["Open it by typing running %LOCALAPPDATA% and looking for GWToolboxpp folder\n", "Open it by typing running %LOCALAPPDATA% and looking for GWToolboxpp folder\n"], _ ;未译
["Open web links from templates", "Open web links from templates"], _ ;未译
["Opening and closing windows", "Opening and closing windows"], _ ;未译
["Opening ini file\n", "Opening ini file\n"], _ ;未译
["Others", "Others"], _ ;未译
["Outpost\0\0\0", "Outpost\0\0\0"], _ ;未译
["Owner", "Owner"], _ ;未译
["P081: agent_id %d, unk1 %d, unk2 ", "P081: agent_id %d, unk1 %d, unk2 "], _ ;未译
["P081: id %d, name ", "P081: id %d, name "], _ ;未译
["P082: id %d, type %d\n", "P082: id %d, type %d\n"], _ ;未译
["P085: id %d, type %d\n", "P085: id %d, type %d\n"], _ ;未译
["Packet", "Packet"], _ ;未译
["Page Down", "Page Down"], _ ;未译
["Page Up", "Page Up"], _ ;未译
["Pahnai Salad", "伊波枷沙拉"], _ 
["Paragon", "Paragon"], _ ;未译
["Pause", "Pause"], _ ;未译
["Pcon Size", "Pcon Size"], _ ;未译
["Pcons %s", "Pcons %s"], _ ;未译
["Pcons delay", "Pcons delay"], _ ;未译
["Pcons", "补品"], _ 
["Piken Square", "派肯广场"], _
["Ping Build", "Ping Build"], _ ;未译
["Ping a build from the Build Panel", "Ping a build from the Build Panel"], _ ;未译
["Ping build '%s'", "Ping build '%s'"], _ ;未译
["PingBuild", "PingBuild"], _ ;未译
["Pings and drawings", "Pings and drawings"], _ ;未译
["Pings", "Pings"], _ ;未译
["PingsLinesRenderer Lock() error: %d\n", "PingsLinesRenderer Lock() error: %d\n"], _ ;未译
["Pits", "骷髅墓穴"], _ 
["Planes", "混沌平原"], _ 
["Play", "Play"], _ ;未译
["Play/Pause", "Play/Pause"], _ ;未译
["Player (alive)", "Player (alive)"], _ ;未译
["Player (dead)", "Player (dead)"], _ ;未译
["Player ID is unique for each human player in the instance.", "Player ID is unique for each human player in the instance."], _ ;未译
["Player ID##player", "Player ID##player"], _ ;未译
["Player Size", "Player Size"], _ ;未译
["Player", "Player"], _ ;未译
["PlayerNumber", "PlayerNumber"], _ ;未译
["Please provide an integer or hex argument", "Please provide an integer or hex argument"], _ ;未译
["Please provide command in format /flag [hero number] [x] [y]", "Please provide command in format /flag [hero number] [x] [y]"], _ ;未译
["Please provide command in format /flag all [x] [y]", "Please provide command in format /flag all [x] [y]"], _ ;未译
["Please send the files to the GWToolbox++ developers.\n", "Please send the files to the GWToolbox++ developers.\n"], _ ;未译
["Pogahn Passage", "波甘驿站"], _
["Poison Jet: %d", "Poison Jet: %d"], _ ;未译
["Poison Spout: %d", "Poison Spout: %d"], _ ;未译
["Poison Trap: %d", "Poison Trap: %d"], _ ;未译
["Polish", "Polish"], _ ;未译
["Pools", "孵化池"], _ 
["Port Sledge", "雪橇港"], _
["Position", "Position"], _ ;未译
["Powered by https://kamadan.decltype.org", "广告网 https://kamadan.github.io"], _ 
["Powerstone of Courage\nGranite and Dust", "勇气粉石\n花岗岩石板 及 闪烁之土"], _ 
["Presearing", "Presearing"], _ ;未译
["Press key", "按键"], _ 
["Prev Track", "Prev Track"], _ ;未译
["Price Check##armor", "估价##armor"], _ 
["Price Check##essence", "估价##essence"], _ 
["Price Check##grail", "估价##grail"], _ 
["Price Check##pstone", "估价##pstone"], _ 
["Price Check##resscroll", "估价##resscroll"], _ 
["Price:  -", "Price:  -"], _ ;未译
["Price: %g k", "Price: %g k"], _ ;未译
["Price: (Material not available)", "Price: (Material not available)"], _ ;未译
["Price: Computing (in queue)", "Price: Computing (in queue)"], _ ;未译
["Price: Computing (request sent)", "Price: Computing (request sent)"], _ ;未译
["Primary Prof", "主职业"], _ 
["Print", "Print"], _ ;未译
["PrintScreen", "PrintScreen"], _ ;未译
["Prof Change - Assassin", "职业更换 - 暗杀"], _ 
["Prof Change - Dervish", "职业更换 - 神唤"], _ 
["Prof Change - Elementalist", "职业更换 - 元素"], _ 
["Prof Change - Mesmer", "职业更换 - 幻术"], _ 
["Prof Change - Monk", "职业更换 - 僧侣"], _ 
["Prof Change - Necro", "职业更换 - 死灵"], _ 
["Prof Change - Paragon", "职业更换 - 圣言"], _ 
["Prof Change - Ranger", "职业更换 - 游侠"], _ 
["Prof Change - Ritualist", "职业更换 - 祭祀"], _ 
["Prof Change - Warrior", "职业更换 - 战士"], _ 
["PvP messages", "PvP messages"], _ ;未译
["Pyre Fierceshot", "烈之击炎焰"], _
["Quarrel Falls", "怨言瀑布"], _
["Quest Marker", "Quest Marker"], _ ;未译
["Quest", "Quest"], _ ;未译
["Quest%d", "Quest%d"], _ ;未译
["R:%3.0f", "R:%3.0f"], _ ;未译
["Raisu Palace", "莱苏皇宫"], _
["Ran Musu Gardens", "岚穆苏花园"], _
["Random Arenas", "随机竞技场"], _
["Range", "Range"], _ ;未译
["Ranger", "Ranger"], _ ;未译
["Ranges", "Ranges"], _ ;未译
["Rata Sum", "洛达顶点"], _
["Razah", "雷萨"], _
["ReadFile failed ! (%u)", "ReadFile failed ! (%u)"], _ ;未译
["Ready", "Ready"], _ ;未译
["Realm of Torment", "Realm of Torment"], _ ;未译
["Reapply appropriate Title", "重新展示相关头衔"], _ 
["Recall", "回归"], _ 
["Recall\0Unyielding Aura\0Holy Veil\0Other", "回归\0坚毅灵气\0神圣遮罩\0其他"], _ 
["Received price %d for %d (item %d)\n", "Received price %d for %d (item %d)\n"], _ ;未译
["Receiving a party invite", "Receiving a party invite"], _ ;未译
["Receiving a private message", "Receiving a private message"], _ ;未译
["Recent", "Recent"], _ ;未译
["Red Rock Candy", "红冰糖"], _ 
["Red channel (0 - 255)", "Red channel (0 - 255)"], _ ;未译
["Reduce agent ping spam", "Reduce agent ping spam"], _ ;未译
["Region: %s", "Region: %s"], _ ;未译
["Regular expressions allow you to specify wildcards and express more.\nThe syntax is described at www.cplusplus.com/reference/regex/ECMAScript\nNote that the whole message needs to be matched, so for example you might want .* at the end.", "Regular expressions allow you to specify wildcards and express more.\nThe syntax is described at www.cplusplus.com/reference/regex/ECMAScript\nNote that the whole message needs to be matched, so for example you might want .* at the end."], _ ;未译
["Release the ownership of the Discord integration", "Release the ownership of the Discord integration"], _ ;未译
["Remains of Sahlahja", "萨拉迦遗址"], _
["Removing Cursor Fix\n", "Removing Cursor Fix\n"], _ ;未译
["Reset", "Reset"], _ ;未译
["Resign Log", "退出令统计"], _ 
["Resigned", "已发退出令"], _ 
["Resources", "Resources"], _ ;未译
["Restore Default", "Restore Default"], _ ;未译
["Restore Defaults", "Restore Defaults"], _ ;未译
["Restore Defaults?", "Restore Defaults?"], _ ;未译
["Restore", "Restore"], _ ;未译
["Restoring input hook\n", "Restoring input hook\n"], _ ;未译
["Revert", "Revert"], _ ;未译
["Reward", "奖励"], _ 
["Right Alt", "Right Alt"], _ ;未译
["Right Control", "Right Control"], _ ;未译
["Right Shift", "Right Shift"], _ ;未译
["Right Windows", "Right Windows"], _ ;未译
["Right mouse", "Right mouse"], _ ;未译
["Right", "Right"], _ ;未译
["Rilohn Refuge", "里欧恩难民营"], _
["Ring of Fire", "火环群岛"], _
["Ritualist", "Ritualist"], _ ;未译
["Riverside Province", "河畔地带"], _
["Roll of Parchment", "羊皮纸卷"], _
["Roll of Vellum", "牛皮纸卷"], _
["Rotation", "面向"], _ 
["Row Height", "Row Height"], _ ;未译
["Ruby", "红宝石"], _
["Ruins of Morah", "摩拉废墟"], _
["Ruins of Surmia", "苏米亚废墟"], _
["Russian", "Russian"], _ ;未译
["SafeThreadEntry __except body\n", "SafeThreadEntry __except body\n"], _ ;未译
["Saint Anjeka's Shrine", "圣者安捷卡的祭坛"], _
["Sanctum Cay", "神圣沙滩"], _
["Sapphire", "蓝宝石"], _
["Sardelac Sanitarium", "萨德拉克疗养院"], _
["Save Location Data", "Save Location Data"], _ ;未译
["Save Now", "即刻存档"], _ 
["Scale", "Scale"], _ ;未译
["Scorpion: %d", "Scorpion: %d"], _ ;未译
["Scroll Lock", "Scroll Lock"], _ ;未译
["Scroll of Resurrection\nFibers and Bones", "复活卷\植物纤维 及 骨头"], _
["Scrollbar Rounding", "Scrollbar Rounding"], _ ;未译
["Scrollbar Size", "Scrollbar Size"], _ ;未译
["ScrollbarRounding", "ScrollbarRounding"], _ ;未译
["ScrollbarSize", "ScrollbarSize"], _ ;未译
["Seafarer's Rest", "航海者休憩处"], _
["Search", "Search"], _ ;未译
["Secondary Prof", "副职业"], _ 
["Seeker's Passage", "探索者通道"], _
["Seitung Harbor", "青函港"], _
["Select Hotkey", "选择快键"], _ 
["Select a favorite", "Select a favorite"], _ ;未译
["Select", "Select"], _ ;未译
["Sell##common", "卖##common"], _ 
["Sell##rare", "卖##rare"], _ 
["Send Chat hotkey to enter one of the commands above.", "Send Chat hotkey to enter one of the commands above."], _ ;未译
["Send Chat", "Send Chat"], _ ;未译
["Send Kamadan ad1 trade chat to your trade chat", "把卡玛丹1区的广告导入角色的交易频道"], _ 
["Send a Dialog", "发送暗码"], _ 
["Send a message or command to chat", "Send a message or command to chat"], _ ;未译
["Send chat '%c%s'", "Send chat '%c%s'"], _ ;未译
["Send to team chat", "往队伍频道发送"], _ 
["Send", "发送"], _ 
["Send##1", "发送##1"], _ 
["Send##2", "发送##2"], _ 
["SendChat", "SendChat"], _ ;未译
["Sender Color:", "Sender Color:"], _ ;未译
["Sender", "Sender"], _ ;未译
["Senji's Corner", "山吉之街"], _
["Sent Dialog 0x%X", "Sent Dialog 0x%X"], _ ;未译
["Sent dialog %s (%d)", "Sent dialog %s (%d)"], _ ;未译
["Separator", "Separator"], _ ;未译
["Serenity Temple", "宁静神殿"], _
["Setting your status to offline in friend list hides your info from Discord", "Setting your status to offline in friend list hides your info from Discord"], _ ;未译
["Settings", "设置"], _ 
["Shadow Nexus, The", "阴郁核心"], _
["Shadow", "Shadow"], _ ;未译
["Shadowstep Line (Max range)", "Shadowstep Line (Max range)"], _ ;未译
["Shadowstep Line", "Shadowstep Line"], _ ;未译
["Shadowstep Marker", "Shadowstep Marker"], _ ;未译
["Shape", "Shape"], _ ;未译
["Shift + ", "Shift + "], _ ;未译
["Shift", "Shift"], _ ;未译
["Shing Jea Arena", "星岬竞技场"], _
["Shing Jea Monastery", "星岬寺"], _
["Shing Jea", "Shing Jea"], _ ;未译
["Shiverpeak Mountains", "Shiverpeak Mountains"], _ ;未译
["Show 'Active' checkbox in header", "Show 'Active' checkbox in header"], _ ;未译
["Show 'End' column", "Show 'End' column"], _ ;未译
["Show 'Open Xunlai Chest' button", "Show 'Open Xunlai Chest' button"], _ ;未译
["Show 'Run' button in header", "Show 'Run' button in header"], _ ;未译
["Show 'Start' column", "Show 'Start' column"], _ ;未译
["Show 'Time' column", "Show 'Time' column"], _ ;未译
["Show Dialog", "Show Dialog"], _ ;未译
["Show Enemy Count", "Show Enemy Count"], _ ;未译
["Show Item", "Show Item"], _ ;未译
["Show Map", "Show Map"], _ ;未译
["Show Player", "Show Player"], _ ;未译
["Show Quest", "Show Quest"], _ ;未译
["Show Resign Log", "Show 退出令统计"], _ 
["Show Target", "Show Target"], _ ;未译
["Show a message when a friend:", "Show a message when a friend:"], _ ;未译
["Show bonds for Allies", "Show bonds for Allies"], _ ;未译
["Show chat messages timestamp. Color:", "Show chat messages timestamp. Color:"], _ ;未译
["Show close button", "Show close button"], _ ;未译
["Show extra timers", "Show extra timers"], _ ;未译
["Show hero flag controls", "Show hero flag controls"], _ ;未译
["Show numbers", "Show numbers"], _ ;未译
["Show second decimal", "Show second decimal"], _ ;未译
["Show the bonds maintained by you.\nOnly works on human players", "Show the bonds maintained by you.\nOnly works on human players"], _ ;未译
["Show the damage done by each player in your party.\nOnly works on the damage done within your radar range.", "Show the damage done by each player in your party.\nOnly works on the damage done within your radar range."], _ ;未译
["Show the following in the main window:", "Show the following in the main window:"], _ ;未译
["Show timestamps in message history.", "Show timestamps in message history."], _ ;未译
["Show widget toggles", "Show 配件开关"], _ 
["Show:", "Show:"], _ ;未译
["Shows a countdown timer for alcohol", "Shows a countdown timer for alcohol"], _ ;未译
["Sifhalla", "袭哈拉"], _
["Signpost Size", "Signpost Size"], _ ;未译
["Signpost", "Signpost"], _ ;未译
["Size of each Pcon icon in the interface", "Size of each Pcon icon in the interface"], _ ;未译
["Size", "Size"], _ ;未译
["Sizes", "Sizes"], _ ;未译
["Skill ID", "Skill ID"], _ ;未译
["Skill", "Skill"], _ ;未译
["Skill#%d", "Skill#%d"], _ ;未译
["SkillID", "技能号"], _ 
["Sleep", "Sleep"], _ ;未译
["Slice of Pumpkin Pie", "南瓜派"], _ 
["Soon you will all be crushed.", "Soon you will all be crushed."], _ ;未译
["Space", "Space"], _ ;未译
["Spanish", "Spanish"], _ ;未译
["Speed##player", "Speed##player"], _ ;未译
["Speed##target", "Speed##target"], _ ;未译
["Spirit range", "Spirit range"], _ ;未译
["Spiritwood Plank", "心灵之板"], _
["Square", "Square"], _ ;未译
["Start Mail", "Start Mail"], _ ;未译
["Start", "开始"], _ 
["Steel Ingot", "钢铁矿石"], _ 
["Subtract", "Subtract"], _ ;未译
["Such as 'A skill was updated for pvp!'", "Such as 'A skill was updated for pvp!'"], _ ;未译
["Such as Deep aspects", "Such as Deep aspects"], _ ;未译
["Such fools to think you can attack me here. Come closer so you can see the face of your doom!", "Such fools to think you can attack me here. Come closer so you can see the face of your doom!"], _ ;未译
["Sunjiang District", "孙江行政区"], _
["Sunspear Arena", "日戟竞技场"], _
["Sunspear Great Hall", "日戟大会堂"], _
["Sunspear Sanctuary", "日戟避难所"], _
["Suppress drunk emotes", "Suppress drunk emotes"], _ ;未译
["Suppress lunar and drunk post-processing effects", "Suppress lunar and drunk post-processing effects"], _ ;未译
["Suppress lunar and drunk text", "Suppress lunar and drunk text"], _ ;未译
["Swat", "Swat"], _ ;未译
["Symbol Modifier", "Symbol Modifier"], _ ;未译
["Symbols", "Symbols"], _ ;未译
["TAB or SHIFT+TAB to cycle through keyboard editable fields.", "TAB or SHIFT+TAB to cycle through keyboard editable fields."], _ ;未译
["Tahlkora", "塔蔻菈"], _
["Tahnnakai Temple", "谭纳凯神殿"], _
["Take me now, subcreature.", "Take me now, subcreature."], _ ;未译
["Take quest in Mountains", "接双头龙山的任务"], _ 
["Take quest in Planes", "接混沌平原的任务"], _ 
["Take quest", "接任务"], _ 
["Take", "接"], _ 
["Tanglewood Copse", "谭格梧树林"], _
["Target #%d", "Target #%d"], _ ;未译
["Target %s", "Target %s"], _ ;未译
["Target ID", "Target ID"], _ ;未译
["Target a game entity by its ID", "Target a game entity by its ID"], _ ;未译
["Target coordinates are (%f, %f)", "Target coordinates are (%f, %f)"], _ ;未译
["Target model id (PlayerNumber) is %d", "Target model id (PlayerNumber) is %d"], _ ;未译
["Target", "Target"], _ ;未译
["TargetID", "TargetID"], _ ;未译
["TargetName", "TargetName"], _ ;未译
["Tarnished Haven", "灰暗避难所"], _
["Team", "Team"], _ ;未译
["TeamId", "TeamId"], _ ;未译
["Tear", "Tear"], _ ;未译
["Teleport Lab", "传送至 地下世界 迷宫"], _ 
["Teleport Mountains\nThis is NOT the mountains quest", "传送至 地下世界 双头龙山\n此 [非] 龙山 任务"], _ 
["Teleport Pits", "传送至 地下世界 骷髅墓穴"], _ 
["Teleport Planes", "传送至 地下世界 混沌平原"], _ 
["Teleport Pools", "传送至 地下世界 孵化池"], _ 
["Teleport Vale", "传送至 地下世界 遗忘谷"], _ 
["Telport Wastes", "传送至 地下世界 荒凉冰地"], _ 
["Tempered Glass Vial", "调合后的玻璃瓶"], _
["Template", "Template"], _ ;未译
["Temple of the Ages", "世纪神殿"], _
["Terrain", "Terrain"], _ ;未译
["Thank you and sorry for the inconvenience.", "Thank you and sorry for the inconvenience."], _ ;未译
["The Agent to which this custom attributes will be applied. Required.", "The Agent to which this custom attributes will be applied. Required."], _ ;未译
["The Barradin Estate", "巴拉丁庄园"], _
["The Depths of Tyria", "The Depths of Tyria"], _ ;未译
["The Desolation", "The Desolation"], _ ;未译
["The Flight North", "The Flight North"], _ ;未译
["The Hunt", "猎杀碎片狼"], _
["The Rise of The White Mantle", "The Rise of The White Mantle"], _ ;未译
["The Tarnished Coast", "The Tarnished Coast"], _ ;未译
["The Tengu Accords", "The Tengu Accords"], _ ;未译
["The connection to kamadan.decltype.com has timed out.", "The connection to kamadan.github.io has timed out."], _ ;未译
["The custom color for this agent.", "The custom color for this agent."], _ ;未译
["The hotkey can trigger only when selected", "The hotkey can trigger only when selected"], _ ;未译
["The hotkey will only trigger in this map.\nUse 0 for any map.", "The hotkey will only trigger in this map.\nUse 0 for any map."], _ ;未译
["The hotkey will only trigger within this range.\nUse 0 for no limit.", "The hotkey will only trigger within this range.\nUse 0 for no limit."], _ ;未译
["The map where it will be applied. Optional. Leave 0 for any map", "The map where it will be applied. Optional. Leave 0 for any map"], _ ;未译
["The shape of this agent.", "The shape of this agent."], _ ;未译
["The size for this agent.", "The size for this agent."], _ ;未译
["The syntax is /resize width height", "The syntax is /resize width height"], _ ;未译
["Theme", "Theme"], _ ;未译
["Then the healer told me that BOTH my eyes were lazy. And that's why it was the best summer ever!", "Then the healer told me that BOTH my eyes were lazy. And that's why it was the best summer ever!"], _ ;未译
["There are several ways to open and close toolbox windows and widgets:", "There are several ways to open and close 助手窗口及配件:"], _ 
["There's a reason there's a festival ticket in my ear. I'm trying to lure the evil spirits out of my head.", "There's a reason there's a festival ticket in my ear. I'm trying to lure the evil spirits out of my head."], _ ;未译
["Thirsty River", "干枯河流"], _
["This feature is experimental and might crash your game.\n", "This feature is experimental and might crash your game.\n"], _ ;未译
["This house has many hearts.", "This house has many hearts."], _ ;未译
["This house is clean.", "This house is clean."], _ ;未译
["This is the color at the edge, the color in the middle is the same, with alpha-50", "This is the color at the edge, the color in the middle is the same, with alpha-50"], _ ;未译
["This will prevent kneel, bored, moan, flex, fistshake and roar.\n", "This will prevent kneel, bored, moan, flex, fistshake and roar.\n"], _ ;未译
["Thresholds", "Thresholds"], _ ;未译
["Thunderhead Keep", "雷云要塞"], _
["Tick is a toggle", "Tick is a toggle"], _ ;未译
["Tick with pcons", "Tick with pcons"], _ ;未译
["Ticking in party window will work as a toggle instead of opening the menu", "Ticking in party window will work as a toggle instead of opening the menu"], _ ;未译
["Tihark Orchard", "提亚克林地"], _
["Time the instance has been active", "Time the instance has been active"], _ ;未译
["Time", "Time"], _ ;未译
["Time=", "Time="], _ ;未译
["Timeout", "Timeout"], _ ;未译
["Timer", "Timer"], _ ;未译
["Toggle %s", "Toggle %s"], _ ;未译
["Toggle a GWToolbox++ functionality such as clicker", "Toggle a GWToolbox++ functionality such as clicker"], _ ;未译
["Toggle", "Toggle"], _ ;未译
["Toggle###combo", "Toggle###combo"], _ ;未译
["Toggle...", "Toggle..."], _ ;未译
["ToggleID", "ToggleID"], _ ;未译
["Tomb of the Primeval Kings", "先王之墓"], _
["Toolbox Settings", "助手设置"], _ 
["Toolbox Update!", "助手更新!"], _ 
["Toolbox minimap will not capture mouse events when in an outpost", "Toolbox minimap will not capture mouse events when in an outpost"], _ ;未译
["Toolbox minimap will not capture mouse events", "Toolbox minimap will not capture mouse events"], _ ;未译
["Toolbox normally loads settings on launch.\nClick to re-load from disk now.", "Toolbox normally loads settings on launch.\nClick to re-load from disk now."], _ ;未译
["Toolbox normally saves settings on exit.\nClick to save to disk now.", "Toolbox normally saves settings on exit.\nClick to save to disk now."], _ ;未译
["Toolbox will disable a pcon if it is not found in the inventory", "Toolbox will disable a pcon if it is not found in the inventory"], _ ;未译
["Toolbox will save your location every second in a file in Settings Folder.", "Toolbox will save your location every second in a file in Settings Folder."], _ ;未译
["Toolbox", "Toolbox"], _ ;未译
["Total ~ 100 % ~ ", "Total ~ 100 % ~ "], _ ;未译
["Tower of Strength", "力量之塔"], _
["Trade Alerts", "买卖提示"], _ 
["Trade", "Trade"], _ ;未译
["Travel To...", "前往..."], _ 
["Travel", "直达"], _ 
["Try to use the current process for Discord integration", "Try to use the current process for Discord integration"], _ ;未译
["Tsumei Village", "苏梅村"], _
["Type", "Type"], _ ;未译
["UW - Chamber", "地下 - 清除密室的障碍"], _ 
["UW - Escort", "地下 - 护送灵魂"], _ 
["UW - Mnt", "地下 - 恶魔暗杀者"], _ 
["UW - Pits", "地下 - 被拘禁的亡魂"], _ 
["UW - Planes", "地下 - 多姆四骑士"], _ 
["UW - Pools", "地下 - 恐惧蛛化精灵女王"], _ 
["UW - Restore", "地下 - 恢复古兰斯圣像"], _ 
["UW - UWG", "地下 - 不速之客"], _ 
["UW - Vale", "地下 - 愤怒的灵魂"], _ 
["UW - Wastes", "地下 - 古兰斯的使者"], _ 
["UW Teles", "地下传送"], _ 
["Umbral Grotto", "阴影石穴"], _
["Unknown map", "Unknown map"], _ ;未译
["Unknown", "不明"], _ 
["Unlock Move All", "Unlock Move All"], _ ;未译
["Unticking will completely disable a feature from initializing and running. Requires Toolbox restart.", "Unticking will completely disable a feature from initializing and running. Requires Toolbox restart."], _ ;未译
["Unwaking Waters (Kurzick)", "沉睡之水 (库兹柯)"], _
["Unwaking Waters (Luxon)", "沉睡之水 (勒克森)"], _
["Update mode:", "Update mode:"], _ ;未译
["Update successful, please restart toolbox.", "Update successful, please restart toolbox."], _ ;未译
["Updated error - cannot download GWToolbox.dll", "Updated error - cannot download GWToolbox.dll"], _ ;未译
["Updater error - cannot find GWToolbox.dll path", "Updater error - cannot find GWToolbox.dll path"], _ ;未译
["Updater", "Updater"], _ ;未译
["Urgoz", "尔果"], _ 
["Urgoz's Warren", "尔果的养殖场"], _
["Use #%d", "Use #%d"], _ ;未译
["Use %s", "Use %s"], _ ;未译
["Use '/useskill <skill>' to stop the skill.", "Use '/useskill <skill>' to stop the skill."], _ ;未译
["Use 24h clock", "Use 24h clock"], _ ;未译
["Use Item", "Use Item"], _ ;未译
["Use Q/E, A/D, W/S, X/Z, R and arrows for camera movement", "Use Q/E, A/D, W/S, X/Z, R and arrows for camera movement"], _ ;未译
["Use an item from your inventory", "Use an item from your inventory"], _ ;未译
["Use empty '/useskill' or '/useskill stop' to stop all. ", "Use empty '/useskill' or '/useskill stop' to stop all. "], _ ;未译
["Use or cancel a skill such as Recall or UA", "Use or cancel a skill such as Recall or UA"], _ ;未译
["Use the skill number instead of <skill> (e.g. '/useskill 5'). ", "Use the skill number instead of <skill> (e.g. '/useskill 5'). "], _ ;未译
["UseItem", "UseItem"], _ ;未译
["Using level 1 alcohol instead of this is recommended for preventing drunk emotes.\n", "Using level 1 alcohol instead of this is recommended for preventing drunk emotes.\n"], _ ;未译
["Vabbi", "Vabbi"], _ ;未译
["Lab", "迷宫"], _ 
["Vale", "遗忘谷"], _ 
["Vanquish counter", "Vanquish counter"], _ ;未译
["Vanquish", "Vanquish"], _ ;未译
["Vanquished", "Vanquished"], _ ;未译
["Vasburg Armory", "维思伯兵营"], _
["Veil", "Veil"], _ ;未译
["Vekk", "维克"], _
["Venta Cemetery", "凡特墓地"], _
["Ventari's Refuge", "凡特里庇护所"], _
["Version %s is available!", "%s 版助手已发行!"], _ 
["Vial of Ink", "小瓶墨水"], _ 
["Visibility", "Visibility"], _ ;未译
["Visible", "Visible"], _ ;未译
["Vizunah Square (Foreign)", "薇茹广场 (外地)"], _
["Vizunah Square (Local)", "薇茹广场 (本地)"], _
["Vlox's Falls", "弗洛克斯瀑布"], _
["Vlox's", "Vlox's"], _ ;未译
["Volume Down", "Volume Down"], _ ;未译
["Volume Mute", "Volume Mute"], _ ;未译
["Volume Up", "Volume Up"], _ ;未译
["WSAStartup Failed.\n", "WSAStartup Failed.\n"], _ ;未译
["Wailing Lord", "Wailing Lord"], _ ;未译
["Waiting for logged character\n", "Waiting for logged character\n"], _ ;未译
["War Supplies", "战承物资"], _ 
["Warning", "Warning"], _ ;未译
["Warrior", "Warrior"], _ ;未译
["Waste", "Waste"], _ ;未译
["Wastes", "荒凉冰地"], _ 
["We can't determine if the character is ingame.\nContact the developpers.", "We can't determine if the character is ingame.\nContact the developpers."], _ ;未译
["We have vanquished %lu %s! %lu %s remaining.", "We have vanquished %lu %s! %lu %s remaining."], _ ;未译
["We must prepare for the coming of Banjo the Clown, God of Puppets.", "We must prepare for the coming of Banjo the Clown, God of Puppets."], _ ;未译
["WeaponType", "WeaponType"], _ ;未译
["Wehhan Terraces", "薇恩平台"], _
["When I grow up, I want to be a principal or a caterpillar.", "When I grow up, I want to be a principal or a caterpillar."], _ ;未译
["When enabled, GWToolbox++ can automatically restore\n", "When enabled, GWToolbox++ can automatically restore\n"], _ ;未译
["When you have less than this amount:\n-The number in the interface becomes yellow.\n-Warning message is displayed when zoning into outpost.", "When you have less than this amount:\n-The number in the interface becomes yellow.\n-Warning message is displayed when zoning into outpost."], _ ;未译
["When you write a message starting with 'http://' or 'https://', it will be converted in template format", "When you write a message starting with 'http://' or 'https://', it will be converted in template format"], _ ;未译
["While editing text:\n", "While editing text:\n"], _ ;未译
["Whisper Target Name,msg", "Whisper Target Name,msg"], _ ;未译
["Whispers", "Whispers"], _ ;未译
["Widgets:", "配件:"], _ 
["Width", "宽度"], _ 
["Wilds, The", "荒原"], _
["Will actually disable any *change*, so make sure you're not drunk already when enabling this!", "Will actually disable any *change*, so make sure you're not drunk already when enabling this!"], _ ;未译
["Will allow movement and resize of all widgets and windows", "Will allow movement and resize of all widgets and windows"], _ ;未译
["Will close the travel window when clicking on a travel destination", "Will close the travel window when clicking on a travel destination"], _ ;未译
["Will hide drunk and lunars messages on top of your and other characters", "Will hide drunk and lunars messages on top of your and other characters"], _ ;未译
["Will hide the skills in your effect monitor", "Will hide the skills in your effect monitor"], _ ;未译
["Window Padding", "Window Padding"], _ ;未译
["Window Rounding", "Window Rounding"], _ ;未译
["Window Title Align", "Window Title Align"], _ ;未译
["WindowPaddingX", "WindowPaddingX"], _ ;未译
["WindowPaddingY", "WindowPaddingY"], _ ;未译
["WindowRounding", "WindowRounding"], _ ;未译
["WindowTitleAlignX", "WindowTitleAlignX"], _ ;未译
["WindowTitleAlignY", "WindowTitleAlignY"], _ ;未译
["Windows:", "Windows:"], _ ;未译
["Winnowing", "Winnowing"], _ ;未译
["Working", "Working"], _ ;未译
["Wrote %lu of %lu bytes for %s", "Wrote %lu of %lu bytes for %s"], _ ;未译
["X pos##player", "X 坐标##player"], _ 
["X pos##target", "X 坐标##target"], _ 
["X1 mouse", "X1 mouse"], _ ;未译
["X2 mouse", "X2 mouse"], _ ;未译
["Xandra", "珊卓亚"], _
["Y pos##player", "Y 坐标##player"], _ 
["Y pos##target", "Y 坐标##target"], _ 
["Yahnur Market", "雅诺尔市集"], _
["Yak's Bend", "牦牛村"], _
["Yohlon Haven", "犹朗避难所"], _
["You are messing with affairs that are beyond your comprehension. Leave now and I may let you live!", "You are messing with affairs that are beyond your comprehension. Leave now and I may let you live!"], _ ;未译
["You are no match for my almighty power.", "You are no match for my almighty power."], _ ;未译
["You can create a 'Send Chat' hotkey to perform any command.", "You can create a 'Send Chat' hotkey to perform any command."], _ ;未译
["You can prefix the number by \", "You can prefix the number by \"], _ ;未译
["You can set the color alpha to 0 to disable any minimap feature.", "You can set the color alpha to 0 to disable any minimap feature."], _ ;未译
["You need to show the widget for this control to work", "You need to show the widget for this control to work"], _ ;未译
["You need to show the window for this control to work", "You need to show the window for this control to work"], _ ;未译
["You're disgusting, but I love you!", "You're disgusting, but I love you!"], _ ;未译
["Zaishen Challenge", "战承挑战赛"], _
["Zaishen Elite", "战承精英"], _
["Zaishen Menagerie", "战承动物园"], _
["Zei Ri", "Zei Ri"], _ ;未译
["Zen Daijun", "祯台郡"], _
["Zenmai", "刃玛伊"], _
["Zhed Shadowhoof", "影爪杰德"], _
["Zin Ku Corridor", "辛库走廊"], _
["Zoning in a new map", "Zoning in a new map"], _ ;未译
["Zoom", "Zoom"], _ ;未译
["Zos Shivros Channel", "佐席洛斯水道"], _
["[%s] ~ Start: %s ~ End: %s ~ Time: %s", "[%s] ~ Start: %s ~ End: %s ~ Time: %s"], _ ;未译
["[Error] Did not recognize guild '%ls'", "[Error] Did not recognize guild '%ls'"], _ ;未译
["[Error] Please provide an argument", "[Error] Please provide an argument"], _ ;未译
["[SCAN] GoldConfirmationPatch = %p\n", "[SCAN] GoldConfirmationPatch = %p\n"], _ ;未译
["[SCAN] StoragePatch = %p\n", "[SCAN] StoragePatch = %p\n"], _ ;未译
["[SCAN] TomePatch = %p\n", "[SCAN] TomePatch = %p\n"], _ ;未译
["[SCAN] is_ingame = %p\n", "[SCAN] is_ingame = %p\n"], _ ;未译
["[a|b] denotes an optional argument, in this case nothing, 'a' or 'b'.", "[a|b] denotes an optional argument, in this case nothing, 'a' or 'b'."], _ ;未译
["[dis] can be any of: ae, ae1, ee, eg, int, etc", "[dis] can be any of: ae, ae1, ee, eg, int, etc"], _ ;未译
["_Release", "_Release"], _ ;未译
["a.m.", "a.m."], _ ;未译
["abaddonsgate", "abaddonsgate"], _ ;未译
["abaddonsmouth", "abaddonsmouth"], _ ;未译
["active", "active"], _ ;未译
["activity.timestamps.start", "activity.timestamps.start"], _ ;未译
["age2", "age2"], _ ;未译
["alcohol", "酒水"], _ 
["alliance", "alliance"], _ ;未译
["altrummruins", "altrummruins"], _ ;未译
["amatzbasin", "amatzbasin"], _ ;未译
["amnoonoasisthe", "amnoonoasisthe"], _ ;未译
["apple", "糖苹果"], _ 
["arborstone", "亭石"], _
["armor", "救赎防具"], _ 
["ascaloncity", "ascaloncity"], _ ;未译
["aspenwoodgatekurzick", "aspenwoodgatekurzick"], _ ;未译
["aspenwoodgateluxon", "aspenwoodgateluxon"], _ ;未译
["assets.large_image", "assets.large_image"], _ ;未译
["astralariumthe", "astralariumthe"], _ ;未译
["auguryrock", "auguryrock"], _ ;未译
["auriosminesthe", "auriosminesthe"], _ ;未译
["auroraglade", "auroraglade"], _ ;未译
["baipaasureach", "baipaasureach"], _ ;未译
["basaltgrotto", "basaltgrotto"], _ ;未译
["beaconsperch", "beaconsperch"], _ ;未译
["beetletun", "甲虫镇"], _
["beknurharbor", "beknurharbor"], _ ;未译
["bergenhotsprings", "bergenhotsprings"], _ ;未译
["blacktideden", "blacktideden"], _ ;未译
["blocked skill %d\n", "blocked skill %d\n"], _ ;未译
["bloodstonefen", "bloodstonefen"], _ ;未译
["bluerock", "蓝冰糖"], _ 
["body", "body"], _ ;未译
["bonepalace", "bonepalace"], _ ;未译
["borealstation", "borealstation"], _ ;未译
["boreasseabed", "boreasseabed"], _ ;未译
["borlispass", "borlispass"], _ ;未译
["braueracademy", "braueracademy"], _ ;未译
["breakerhollow", "breakerhollow"], _ ;未译
["buffer_", "buffer_"], _ ;未译
["buildname", "buildname"], _ ;未译
["builds", "builds"], _ ;未译
["builds%03d", "builds%03d"], _ ;未译
["camera", "camera"], _ ;未译
["camphojanu", "camphojanu"], _ ;未译
["camprankor", "camprankor"], _ ;未译
["cavalon", "卡瓦隆"], _
["centraltransferchamber", "centraltransferchamber"], _ ;未译
["chahbekvillage", "chahbekvillage"], _ ;未译
["championsdawn", "championsdawn"], _ ;未译
["channel", "频道"], _ 
["chantryofsecrets", "chantryofsecrets"], _ ;未译
["chest", "chest"], _ ;未译
["city", "city"], _ ;未译
["clear", "clear"], _ ;未译
["close", "close"], _ ;未译
["closest", "closest"], _ ;未译
["codexarena", "codexarena"], _ ;未译
["color_custom_markers", "color_custom_markers"], _ ;未译
["color_drawings", "color_drawings"], _ ;未译
["color_map", "color_map"], _ ;未译
["color_mapshadow", "color_mapshadow"], _ ;未译
["color_north", "color_north"], _ ;未译
["color_pings", "color_pings"], _ ;未译
["color_quest", "color_quest"], _ ;未译
["color_range_aggro", "color_range_aggro"], _ ;未译
["color_range_cast", "color_range_cast"], _ ;未译
["color_range_compass", "color_range_compass"], _ ;未译
["color_range_hos", "color_range_hos"], _ ;未译
["color_range_spirit", "color_range_spirit"], _ ;未译
["color_shadowstep_line", "color_shadowstep_line"], _ ;未译
["color_shadowstep_line_maxrange", "color_shadowstep_line_maxrange"], _ ;未译
["color_shadowstep_mark", "color_shadowstep_mark"], _ ;未译
["color_symbols_modifier", "color_symbols_modifier"], _ ;未译
["consulatedocks", "领事馆docks"], _
["copperhammermines", "copperhammermines"], _ ;未译
["corn", "粟米糖"], _ 
["count", "个数统计"], _ 
["count_", "count_"], _ ;未译
["cupcake", "生日杯子蛋糕"], _ 
["customagent%03d", "customagent%03d"], _ ;未译
["customline", "customline"], _ ;未译
["customline%03d", "customline%03d"], _ ;未译
["custommarker", "custommarker"], _ ;未译
["custommarker%03d", "custommarker%03d"], _ ;未译
["dajkahinlet", "dajkahinlet"], _ ;未译
["dalessioseaboard", "dalessioseaboard"], _ ;未译
["damage", "damage"], _ ;未译
["dashavestibule", "dashavestibule"], _ ;未译
["days", "天"], _ 
["deep", "deep"], _ ;未译
["deepthe", "deepthe"], _ ;未译
["default", "default"], _ ;未译
["deldrimorwarcamp", "deldrimorwarcamp"], _ ;未译
["destinysgorge", "destinysgorge"], _ ;未译
["dialog", "dialog"], _ ;未译
["disabled", "已关闭"], _ 
["distance", "距离"], _ 
["divinitycoast", "divinitycoast"], _ ;未译
["dll file name is %s\n", "dll file name is %s\n"], _ ;未译
["dllpath", "dllpath"], _ ;未译
["dllversion", "dllversion"], _ ;未译
["doom", "doom"], _ ;未译
["doomlore", "doomlore"], _ ;未译
["doomloreshrine", "doomloreshrine"], _ ;未译
["dragonslairthe", "dragonslairthe"], _ ;未译
["dragonsthroat", "dragonsthroat"], _ ;未译
["droknarsforge", "droknarsforge"], _ ;未译
["druidsoverlook", "druidsoverlook"], _ ;未译
["dunesofdespair", "dunesofdespair"], _ ;未译
["durheimarchives", "durheimarchives"], _ ;未译
["dzagonurbastion", "dzagonurbastion"], _ ;未译
["elonareach", "elonareach"], _ ;未译
["embark", "embark"], _ ;未译
["embarkbeach", "embarkbeach"], _ ;未译
["emberlightcamp", "emberlightcamp"], _ ;未译
["enabled", "已启动"], _ 
["enter-up", "enter-up"], _ ;未译
["eotn", "eotn"], _ ;未译
["eredonterrace", "eredonterrace"], _ ;未译
["error", "error"], _ ;未译
["essence", "敏捷精华"], _ 
["eternalgrovethe", "eternalgrovethe"], _ ;未译
["exit", "exit"], _ ;未译
["eyeofthenorth", "eyeofthenorth"], _ ;未译
["fav_count", "fav_count"], _ ;未译
["fishermenshaven", "fishermenshaven"], _ ;未译
["flag", "flag"], _ ;未译
["foes", "foes"], _ ;未译
["fortaspenwoodkurzick", "fortaspenwoodkurzick"], _ ;未译
["fortaspenwoodluxon", "fortaspenwoodluxon"], _ ;未译
["fortranik", "fortranik"], _ ;未译
["frontiergate", "frontiergate"], _ ;未译
["frostgatethe", "frostgatethe"], _ ;未译
["gadd", "gadd"], _ ;未译
["gadds", "gadds"], _ ;未译
["gaddsencampment", "gaddsencampment"], _ ;未译
["gateofanguish", "gateofanguish"], _ ;未译
["gateofdesolation", "gateofdesolation"], _ ;未译
["gateoffear", "gateoffear"], _ ;未译
["gateofmadness", "gateofmadness"], _ ;未译
["gateofpain", "gateofpain"], _ ;未译
["gateofsecrets", "gateofsecrets"], _ ;未译
["gateofthenightfallenlands", "gateofthenightfallenlands"], _ ;未译
["gateoftorment", "gateoftorment"], _ ;未译
["gatesofkryta", "gatesofkryta"], _ ;未译
["getid", "getid"], _ ;未译
["getpos", "getpos"], _ ;未译
["global_enable", "global_enable"], _ ;未译
["grail", "力量圣杯"], _ 
["grandcourtofsebelkeh", "grandcourtofsebelkeh"], _ ;未译
["granitecitadelthe", "granitecitadelthe"], _ ;未译
["greatnorthernwallthe", "greatnorthernwallthe"], _ ;未译
["greattempleofbalthazar", "greattempleofbalthazar"], _ ;未译
["greenrock", "绿冰糖"], _ 
["grendichcourthouse", "grendichcourthouse"], _ ;未译
["gtob", "gtob"], _ ;未译
["guild", "guild"], _ ;未译
["gunnarshold", "gunnarshold"], _ ;未译
["gyalahatchery", "gyalahatchery"], _ ;未译
["harvesttemple", "harvesttemple"], _ ;未译
["header", "header"], _ ;未译
["health", "health"], _ ;未译
["hellsprecipice", "hellsprecipice"], _ ;未译
["hengeofdenravi", "hengeofdenravi"], _ ;未译
["hero_flag_controls_background", "hero_flag_controls_background"], _ ;未译
["heroesascent", "heroesascent"], _ ;未译
["heroesaudience", "heroesaudience"], _ ;未译
["heroindex%d", "heroindex%d"], _ ;未译
["hide", "hide"], _ ;未译
["honurhill", "honurhill"], _ ;未译
["hotkey-", "hotkey-"], _ ;未译
["hotkey-%03d:%s", "hotkey-%03d:%s"], _ ;未译
["hour", "小时"], _ 
["hours", "小时"], _ 
["housezuheltzer", "housezuheltzer"], _ ;未译
["http://wiki.fbgmguild.com/Main_Page", "http://wiki.fbgmguild.com/Main_Page"], _ ;未译
["http://wiki.fbgmguild.com/index.php?search=", "http://wiki.fbgmguild.com/index.php?search="], _ ;未译
["https://api.github.com/repos/HasKha/GWToolboxpp/releases/tags/", "https://api.github.com/repos/HasKha/GWToolboxpp/releases/tags/"], _ ;未译
["https://github.com/HasKha/GWToolboxpp/releases/download/", "https://github.com/HasKha/GWToolboxpp/releases/download/"], _ ;未译
["https://haskha.github.io/GWToolboxpp/", "https://haskha.github.io/GWToolboxpp/"], _ ;未译
["https://kamadan.decltype.org", "https://kamadan.github.io"], _ 
["icecavesofsorrow", "icecavesofsorrow"], _ ;未译
["icetoothcave", "icetoothcave"], _ ;未译
["id: %d", "id: %d"], _ ;未译
["ignore", "ignore"], _ ;未译
["imperialsanctum", "imperialsanctum"], _ ;未译
["in February 5, 2019 update.", "in February 5, 2019 update."], _ ;未译
["installing event handler\n", "installing event handler\n"], _ ;未译
["instance timer", "instance timer"], _ ;未译
["ironminesofmoladune", "ironminesofmoladune"], _ ;未译
["jadeflatskurzick", "jadeflatskurzick"], _ ;未译
["jadeflatsluxon", "jadeflatsluxon"], _ ;未译
["jadequarrykurzickthe", "jadequarrykurzickthe"], _ ;未译
["jadequarryluxonthe", "jadequarryluxonthe"], _ ;未译
["jennurshorde", "jennurshorde"], _ ;未译
["jokanurdiggings", "jokanurdiggings"], _ ;未译
["kabob", "烤龙兽肉"], _ 
["kaineng", "kaineng"], _ ;未译
["kainengcenter", "kainengcenter"], _ ;未译
["kama", "kama"], _ ;未译
["kamadan", "kamadan"], _ ;未译
["kamadan, Jewel of Istan", "卡玛丹，艾斯坦之钻"], _
["kodashbazaarthe", "kodashbazaarthe"], _ ;未译
["kodlonuhamlet", "kodlonuhamlet"], _ ;未译
["kodonurcrossroads", "kodonurcrossroads"], _ ;未译
["lairoftheforgotten", "lairoftheforgotten"], _ ;未译
["leviathanpits", "leviathanpits"], _ ;未译
["line", "line"], _ ;未译
["line%d", "line%d"], _ ;未译
["lines", "lines"], _ ;未译
["lionsarch", "lionsarch"], _ ;未译
["load", "load"], _ ;未译
["local", "local"], _ ;未译
["location logs", "location logs"], _ ;未译
["lock", "lock"], _ ;未译
["lock_move", "lock_move"], _ ;未译
["longeyesledge", "longeyesledge"], _ ;未译
["lunars", "命运锦囊"], _ 
["lutgardisconservatory", "lutgardisconservatory"], _ ;未译
["maatukeep", "maatukeep"], _ ;未译
["maguumastade", "maguumastade"], _ ;未译
["mapid", "地图号"], _ 
["marhansgrotto", "marhansgrotto"], _ ;未译
["marker", "marker"], _ ;未译
["marker%d", "marker%d"], _ ;未译
["markers", "markers"], _ ;未译
["marketplacethe", "marketplacethe"], _ ;未译
["maxi", "maxi"], _ ;未译
["maximize", "maximize"], _ ;未译
["maxrange_interp_begin", "maxrange_interp_begin"], _ ;未译
["maxrange_interp_end", "maxrange_interp_end"], _ ;未译
["menubuttons", "menubuttons"], _ ;未译
["message", "message"], _ ;未译
["mihanutownship", "mihanutownship"], _ ;未译
["mini", "mini"], _ ;未译
["minimize", "minimize"], _ ;未译
["ministerchosestate", "ministerchosestate"], _ ;未译
["minute", "分钟"], _ 
["minutes of inactivity", "minutes of inactivity"], _ ;未译
["minutes", "分钟"], _ 
["moddokcrevice", "moddokcrevice"], _ ;未译
["mode", "模式"], _ 
["mouthoftormentthe", "mouthoftormentthe"], _ ;未译
["moving to %s\n", "moving to %s\n"], _ ;未译
["nahpuiquarter", "nahpuiquarter"], _ ;未译
["name", "name"], _ ;未译
["name%d", "name%d"], _ ;未译
["nearest", "nearest"], _ ;未译
["nolaniacademy", "nolaniacademy"], _ ;未译
["num_results", "num_results"], _ ;未译
["nundubay", "nundubay"], _ ;未译
["occur, such as entering instances.", "occur, such as entering instances."], _ ;未译
["offset", "差位"], _ 
["olafstead", "欧拉夫之地"], _
["open", "打开"], _ 
["p.m.", "p.m."], _ ;未译
["pcons", "pcons"], _ ;未译
["pconsize", "pconsize"], _ ;未译
["pikensquare", "pikensquare"], _ ;未译
["plane", "plane"], _ ;未译
["pogahnpassage", "pogahnpassage"], _ ;未译
["portsledge", "portsledge"], _ ;未译
["print", "print"], _ ;未译
["profession_%d_512px", "profession_%d_512px"], _ ;未译
["quarrelfalls", "quarrelfalls"], _ ;未译
["query", "query"], _ ;未译
["quit", "quit"], _ ;未译
["raisupalace", "raisupalace"], _ ;未译
["randomarenas", "randomarenas"], _ ;未译
["ranmusugardens", "ranmusugardens"], _ ;未译
["ratasum", "ratasum"], _ ;未译
["redrock", "红冰糖"], _ 
["region_ascalon", "region_ascalon"], _ ;未译
["region_battleisles", "region_battleisles"], _ ;未译
["region_battlejahai", "region_battlejahai"], _ ;未译
["region_charrhomelands", "region_charrhomelands"], _ ;未译
["region_crystaldesert", "region_crystaldesert"], _ ;未译
["region_depths", "region_depths"], _ ;未译
["region_deso", "region_deso"], _ ;未译
["region_farshivs", "region_farshivs"], _ ;未译
["region_flightnorth", "region_flightnorth"], _ ;未译
["region_fow", "region_fow"], _ ;未译
["region_ha", "region_ha"], _ ;未译
["region_istan", "region_istan"], _ ;未译
["region_kaineng", "region_kaineng"], _ ;未译
["region_kourna", "region_kourna"], _ ;未译
["region_kryta", "region_kryta"], _ ;未译
["region_kurz", "region_kurz"], _ ;未译
["region_lux", "region_lux"], _ ;未译
["region_maguuma", "region_maguuma"], _ ;未译
["region_presearing", "region_presearing"], _ ;未译
["region_shingjea", "region_shingjea"], _ ;未译
["region_shiverpeaks", "region_shiverpeaks"], _ ;未译
["region_swat", "region_swat"], _ ;未译
["region_tarnished", "region_tarnished"], _ ;未译
["region_tenguaccords", "region_tenguaccords"], _ ;未译
["region_torment", "region_torment"], _ ;未译
["region_vabbi", "region_vabbi"], _ ;未译
["region_whitemantle", "region_whitemantle"], _ ;未译
["remainsofsahlahja", "remainsofsahlahja"], _ ;未译
["report", "report"], _ ;未译
["reset", "reset"], _ ;未译
["resign", "resign"], _ ;未译
["resignlog", "resignlog"], _ ;未译
["resize", "resize"], _ ;未译
["results", "results"], _ ;未译
["rilohnrefuge", "rilohnrefuge"], _ ;未译
["ringoffire", "ringoffire"], _ ;未译
["riversideprovince", "riversideprovince"], _ ;未译
["round", "round"], _ ;未译
["ruinsofmorah", "ruinsofmorah"], _ ;未译
["ruinsofsurmia", "ruinsofsurmia"], _ ;未译
["saintanjekasshrine", "saintanjekasshrine"], _ ;未译
["salad", "伊波枷沙拉"], _ 
["sanctumcay", "sanctumcay"], _ ;未译
["sardelacsanitarium", "sardelacsanitarium"], _ ;未译
["save", "save"], _ ;未译
["scale must be between [6, 255]", "scale must be between [6, 255]"], _ ;未译
["scwiki", "scwiki"], _ ;未译
["seafarersrest", "seafarersrest"], _ ;未译
["second", "秒"], _ 
["seconds", "秒"], _ 
["seekerspassage", "seekerspassage"], _ ;未译
["seitungharbor", "seitungharbor"], _ ;未译
["selling Gold and Green items introduced\n", "selling Gold and Green items introduced\n"], _ ;未译
["selling", "selling"], _ ;未译
["sending purchase request for %d (price=%d)\n", "sending purchase request for %d (price=%d)\n"], _ ;未译
["sending sell request for %d (price=%d)\n", "sending sell request for %d (price=%d)\n"], _ ;未译
["senjiscorner", "senjiscorner"], _ ;未译
["serenitytemple", "serenitytemple"], _ ;未译
["settings", "settings"], _ ;未译
["shadownexusthe", "shadownexusthe"], _ ;未译
["shape", "shape"], _ ;未译
["shingjeaarena", "shingjeaarena"], _ ;未译
["shingjeamonastery", "shingjeamonastery"], _ ;未译
["show", "show"], _ ;未译
["showNumbers", "showNumbers"], _ ;未译
["show_active_in_header", "show_active_in_header"], _ ;未译
["show_run_in_header", "show_run_in_header"], _ ;未译
["sifhalla", "袭哈拉"], _
["size", "size"], _ ;未译
["soup", "鳞怪鳍汤"], _ 
["speed", "speed"], _ ;未译
["start string", "start string"], _ ;未译
["stop", "stop"], _ ;未译
["sugest", "sugest"], _ ;未译
["suggest", "suggest"], _ ;未译
["sunjiangdistrict", "sunjiangdistrict"], _ ;未译
["sunspeararena", "sunspeararena"], _ ;未译
["sunspeargreathall", "sunspeargreathall"], _ ;未译
["sunspearsanctuary", "sunspearsanctuary"], _ ;未译
["tag_name", "tag_name"], _ ;未译
["tahnnakaitemple", "tahnnakaitemple"], _ ;未译
["tanglewoodcopse", "tanglewoodcopse"], _ ;未译
["target", "target"], _ ;未译
["tarnishedhaven", "tarnishedhaven"], _ ;未译
["team", "team"], _ ;未译
["template%d", "template%d"], _ ;未译
["templeoftheages", "templeoftheages"], _ ;未译
["the window from a minimized state when important events\n", "the window from a minimized state when important events\n"], _ ;未译
["thirstyriver", "thirstyriver"], _ ;未译
["thunderheadkeep", "thunderheadkeep"], _ ;未译
["tiharkorchard", "tiharkorchard"], _ ;未译
["timestamp", "timestamp"], _ ;未译
["title", "title"], _ ;未译
["tomboftheprimevalkings", "tomboftheprimevalkings"], _ ;未译
["trade", "trade"], _ ;未译
["trade_scroll", "trade_scroll"], _ ;未译
["transmo", "transmo"], _ ;未译
["travel", "travel"], _ ;未译
["travelto", "travelto"], _ ;未译
["tsumeivillage", "tsumeivillage"], _ ;未译
["typeMap", "typeMap"], _ ;未译
["type_", "type_"], _ ;未译
["umbralgrotto", "umbralgrotto"], _ ;未译
["unlock", "unlock"], _ ;未译
["unwakingwaterskurzick", "unwakingwaterskurzick"], _ ;未译
["unwakingwatersluxon", "unwakingwatersluxon"], _ ;未译
["update_mode", "update_mode"], _ ;未译
["urgoz", "urgoz"], _ ;未译
["urgozswarren", "urgozswarren"], _ ;未译
["use empty '/zoom' to reset to the default value of 750.", "use empty '/zoom' to reset to the default value of 750."], _ ;未译
["useskill", "useskill"], _ ;未译
["vasburgarmory", "vasburgarmory"], _ ;未译
["ventacemetery", "ventacemetery"], _ ;未译
["ventarisrefuge", "ventarisrefuge"], _ ;未译
["visible", "visible"], _ ;未译
["vizunahsquareforeign", "vizunahsquareforeign"], _ ;未译
["vizunahsquarelocal", "vizunahsquarelocal"], _ ;未译
["vlox", "vlox"], _ ;未译
["vloxs", "vloxs"], _ ;未译
["vloxsfalls", "vloxsfalls"], _ ;未译
["warsupply", "warsupply"], _ ;未译
["wehhanterraces", "wehhanterraces"], _ ;未译
["whispers", "whispers"], _ ;未译
["wildsthe", "wildsthe"], _ ;未译
["x minutes of favor of the gods remaining", "x minutes of favor of the gods remaining"], _ ;未译
["x##delete", "x##delete"], _ ;未译
["xunlai", "xunlai"], _ ;未译
["yahnurmarket", "yahnurmarket"], _ ;未译
["yaksbend", "yaksbend"], _ ;未译
["yohlonhaven", "yohlonhaven"], _ ;未译
["zaishenchallenge", "zaishenchallenge"], _ ;未译
["zaishenelite", "zaishenelite"], _ ;未译
["zaishenmenagerie", "zaishenmenagerie"], _ ;未译
["zendaijun", "zendaijun"], _ ;未译
["zinkucorridor", "zinkucorridor"], _ ;未译
["zoom", "zoom"], _ ;未译
["zosshivroschannel", "zosshivroschannel"] _ ;未译
]

;记录文件夹及其子夹内的所有.cpp文件名
Local $fileNames=_FileListToArrayRec(@ScriptDir, "*.cpp", $FLTAR_FILES,  $FLTAR_RECUR)
;除去记录文件数目的首项
_ArrayDelete($fileNames, 0)

;记录文件夹及其子夹内的所有.h文件名
Local $fileNames1=_FileListToArrayRec(@ScriptDir, "*.h", $FLTAR_FILES,  $FLTAR_RECUR)
;除去记录文件数目的首项
_ArrayDelete($fileNames1, 0)

;拼凑以上结果
_ArrayConcatenate($fileNames, $fileNames1)

;在首部插入统计文件总数的项
_ArrayInsert ($fileNames, 0, UBound($fileNames))

for $i=1 to $fileNames[0]

	Local $rFileOpen = FileOpen($fileNames[$i])
	Local $fileRead =FileRead($rFileOpen)
	FileClose($rFileOpen)

	$fileRead = Convert($fileRead)

	Local $wFileOpen = FileOpen($fileNames[$i], 130)
	FileWrite ($wFileOpen, $fileRead)
	FileClose($wFileOpen)
Next

msgbox(0,"提示", "替换完毕")

Func Convert($lData)

	Local $original = $lData

	For $i = 0 To Ubound($ConversionTable) - 1
        if $ConversionTable[$i][0] <> $ConversionTable[$i][1] then
            $lData = StringReplace($lData, chr(34) & $ConversionTable[$i][0] & chr(34), chr(34) & $ConversionTable[$i][1]  & chr(34), 0, $STR_CASESENSE)
            ;替换过程中，以下指令会罔顾字条两端要有双引号的要求。或该用 stringregexpreplace 并 设定 词界        
            ;$lData = StringReplace($lData, '"' & $ConversionTable[$i][0] & '"', '"' & $ConversionTable[$i][1]  & '"', 0, $STR_CASESENSE)
        endif            
	Next

	return $lData
    
EndFunc