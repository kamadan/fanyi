#include-once
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <Array.au3>
#include <File.au3>
#include <WinAPI.au3>
;已被部分翻译，但未完全翻译的字条不算“未译”
Local $ConversionTable[1889][2] = [ _
["Model ID is unique for each kind of agent.\nIt is static and shared by the same agents.\nWhen targeting players, this is Player ID instead, unique for each player in the instance.\nFor the purpose of targeting hotkeys and commands, use this value", "Model ID is unique for each kind of agent.\nIt is static and shared by the same agents.\nWhen targeting players, this is Player ID instead, unique for each player in the instance.\nFor the purpose of targeting hotkeys and commands, use this value"], _ ;未译
["'/load [build template|build name] [Hero index]' loads a build via Guild Wars builds. The build name must be between quotes if it contains spaces. First Hero index is 1, last is 7. Leave out for player", "'/load [build template|build name] [Hero index]' loads a build via Guild Wars builds. The build name must be between quotes if it contains spaces. First Hero index is 1, last is 7. Leave out for player"], _ ;未译
["'/loadbuild [teambuild] <build name|build code>' loads a build via GWToolbox Builds window. Does a partial search on team build name/build name/build code. Matches current player's profession.", "'/loadbuild [teambuild] <build name|build code>' loads a build via GWToolbox Builds window. Does a partial search on team build name/build name/build code. Matches current player's profession."], _ ;未译
["So, you have passed through the depths of the Jade Sea, and into the nightmare realm. It is too bad that I must send you back from whence you came.", "So, you have passed through the depths of the Jade Sea, and into the nightmare realm. It is too bad that I must send you back from whence you came."], _ ;未译
["What gives you the right to enter my lair? I shall kill you for your audacity, after I destroy your mind with my horrifying visions, of course.", "What gives you the right to enter my lair? I shall kill you for your audacity, after I destroy your mind with my horrifying visions, of course."], _ ;未译
["When you have less than this amount:\n-The number in the interface becomes yellow.\n-Warning message is displayed when zoning into outpost.", "When you have less than this amount:\n-The number in the interface becomes yellow.\n-Warning message is displayed when zoning into outpost."], _ ;未译
["In the commands above, <name> is the title of the window as shown in the title bar. For example, try '/hide settings' and '/show settings'.", "In the commands above, <name> is the title of the window as shown in the title bar. For example, try '/hide settings' and '/show settings'."], _ ;未译
["Only trade alerts will be visible in the trade channel.\nYou can still view all Kamadan trade messages via Trade window.", "Only trade alerts will be visible in the trade channel.\nYou can still view all Kamadan trade messages via Trade window."], _ ;未译
["Agent ID is unique for each agent in the instance,\nIt's generated on spawn and will change in different instances.", "Agent ID is unique for each agent in the instance,\nIt's generated on spawn and will change in different instances."], _ ;未译
["Automatically send a second message after the build template in team chat,\nshowing the pcons that the build uses.", "Automatically send a second message after the build template in team chat,\nshowing the pcons that the build uses."], _ ;未译
["Cross over, children. All are welcome. All welcome. Go into the light. There is peace and serenity in the light.", "Cross over, children. All are welcome. All welcome. Go into the light. There is peace and serenity in the light."], _ ;未译
["As soon as final objective is complete, send /age command to game server to receive server-side completion time.", "As soon as final objective is complete, send /age command to game server to receive server-side completion time."], _ ;未译
["Tick to remember pcon enable/disable per character.\nUntick to enable/disable regardless of current character.", "Tick to remember pcon enable/disable per character.\nUntick to enable/disable regardless of current character."], _ ;未译
["Is it comforting to know the source of your fears? Or do you fear more now that you see them in front of you.", "Is it comforting to know the source of your fears? Or do you fear more now that you see them in front of you."], _ ;未译
["You mortals may be here to defeat me, but acknowledging my presence only makes the nightmare grow stronger.", "You mortals may be here to defeat me, but acknowledging my presence only makes the nightmare grow stronger."], _ ;未译
["Show the damage done by each player in your party.\nOnly works on the damage done within your radar range.", "Show the damage done by each player in your party.\nOnly works on the damage done within your radar range."], _ ;未译
["Map file is unique for each pathing map (e.g. used by minimap).\nMany different maps use the same map file", "Map file is unique for each pathing map (e.g. used by minimap).\nMany different maps use the same map file"], _ ;未译
["There's a reason there's a festival ticket in my ear. I'm trying to lure the evil spirits out of my head.", "There's a reason there's a festival ticket in my ear. I'm trying to lure the evil spirits out of my head."], _ ;未译
["Mommy? Where are you? I can't find you. I can't. I'm afraid of the light, mommy. I'm afraid of the light.", "Mommy? Where are you? I can't find you. I can't. I'm afraid of the light, mommy. I'm afraid of the light."], _ ;未译
["Keep a record or your runs in JSON format on disk, and load past runs from disk when starting GWToolbox.", "Keep a record or your runs in JSON format on disk, and load past runs from disk when starting GWToolbox."], _ ;未译
["Note: the names of the widgets without a visible title bar are the same as in the setting headers below.", "Note: the names of the 配件 without a visible title bar are the same as in the setting headers below."], _
["I will fill your hearts with visions of horror and despair that will haunt you for all of your days.", "I will fill your hearts with visions of horror and despair that will haunt you for all of your days."], _ ;未译
["You are messing with affairs that are beyond your comprehension. Leave now and I may let you live!", "You are messing with affairs that are beyond your comprehension. Leave now and I may let you live!"], _ ;未译
["Then the healer told me that BOTH my eyes were lazy. And that's why it was the best summer ever!", "Then the healer told me that BOTH my eyes were lazy. And that's why it was the best summer ever!"], _ ;未译
["Click on a daily quest to get notified when its coming up. Subscribed quests are highlighted in ", "Click on a daily quest to get notified when its coming up. Subscribed quests are highlighted in "], _ ;未译
["The hotkey can only trigger when player is the selected primary profession (0 = Any profession)", "The hotkey can only trigger when player is the selected primary profession (0 = Any profession)"], _ ;未译
["Displays the distance to your target.\n1010 = Earshot / Aggro\n1248 = Cast range\n2500 = Spirit range\n5000 = Radar range", "展示目标距离.\n1010 = 听距 / 触发圈半径\n1248 = 施法范围\n2500 = 灵距\n5000 = 雷达范围"], _ ;候选词：展现
["Keys and lockpicks drop at four times the usual rate and double Lucky and Unlucky title points", "Keys and lockpicks drop at four times the usual rate and double Lucky and Unlucky title points"], _ ;未译
["Will actually disable any *change*, so make sure you're not drunk already when enabling this!", "Will actually disable any *change*, so make sure you're not drunk already when enabling this!"], _ ;未译
["Such fools to think you can attack me here. Come closer so you can see the face of your doom!", "Such fools to think you can attack me here. Come closer so you can see the face of your doom!"], _ ;未译
["Display a number on the bottom of each pcon icon, showing total quantity in storage.\n", "Display a number on the bottom of each pcon icon, showing total quantity in storage.\n"], _ ;未译
["Abaddon's sword has been drawn. He sends me back to you with tokens of renewed power!", "Abaddon's sword has been drawn. He sends me back to you with tokens of renewed power!"], _ ;未译
["- You can apply arithmetic operators +,*,/ on numerical values. Use +- to subtract.\n", "- You can apply arithmetic operators +,*,/ on numerical values. Use +- to subtract.\n"], _ ;未译
["When triggered, this hotkey will prevent Guild Wars from receiving the keypress event", "When triggered, this hotkey will prevent Guild Wars from receiving the keypress event"], _ ;未译
["Pcons not loaded: %s.\nOnly pcons visible in the Pcons window will be auto enabled.", "Pcons not loaded: %s.\nOnly pcons visible in the Pcons window will be auto enabled."], _ ;未译
["ERROR: Failed to parse incoming trade message in TradeWindow::parse_json_message\n", "ERROR: Failed to parse incoming trade message in TradeWindow::parse_json_message\n"], _ ;未译
["Displays the health of the target.\nMax health is only computed and refreshed when you directly damage or heal your target", "展示目标体力.\n在角色直接进攻或治疗目标时，助手才会重新计算并刷新目标的体力上限"], _
["It is needed to prevent toolbox from using a pcon twice, before it activates.\n", "It is needed to prevent toolbox from using a pcon twice, before it activates.\n"], _ ;未译
["I like how they've decorated this place. The talking lights are a nice touch.", "I like how they've decorated this place. The talking lights are a nice touch."], _ ;未译
["After using a pcon, toolbox will not use it again for this amount of time.\n", "After using a pcon, toolbox will not use it again for this amount of time.\n"], _ ;未译
["'/removefriend <character_name|alias>' Remove character to your friend list.", "'/removefriend <character_name|alias>' Remove character to your friend list."], _ ;未译
["GWToolbox is fetching new trade messages from Trade chat in this outpost", "GWToolbox is fetching new trade messages from Trade chat in this outpost"], _ ;未译
["Click to load builds to heroes and player. Ctrl + Click to send to chat.", "Click to load builds to heroes and player. Ctrl + Click to send to chat."], _ ;未译
["Will hide drunk and lunars messages on top of your and other characters", "Will hide drunk and lunars messages on top of your and other characters"], _ ;未译
["ERROR: Failed to parse res JSON from response in ws_window->dispatch\n", "ERROR: Failed to parse res JSON from response in ws_window->dispatch\n"], _ ;未译
["The hotkey will only trigger within this range.\nUse 0 for no limit.", "The hotkey will only trigger within this range.\nUse 0 for no limit."], _ ;未译
["It will automaticly withdraw and deposit gold while buying materials", "It will automaticly withdraw and deposit gold while buying materials"], _ ;未译
["Will close the travel window when clicking on a travel destination", "Will close the travel window when clicking on a travel destination"], _ ;未译
["We must prepare for the coming of Banjo the Clown, God of Puppets.", "We must prepare for the coming of Banjo the Clown, God of Puppets."], _ ;未译
["Even if you banish me from your sight, I will remain in your mind.", "Even if you banish me from your sight, I will remain in your mind."], _ ;未译
["Double Kurzick and Luxon title track points for exchanging faction", "Double Kurzick and Luxon title track points for exchanging faction"], _ ;未译
["'/busy' or '/dnd' Set your friend list status to 'Do Not Disturb'.", "'/busy' or '/dnd' Set your friend list status to 'Do Not Disturb'."], _ ;未译
["'/addfriend <character_name>' Add a character to your friend list.", "'/addfriend <character_name>' Add a character to your friend list."], _ ;未译
["This will prevent kneel, bored, moan, flex, fistshake and roar.\n", "This will prevent kneel, bored, moan, flex, fistshake and roar.\n"], _ ;未译
["Double Asura, Deldrimor, Ebon Vanguard, or Norn reputation points", "Double Asura, Deldrimor, Ebon Vanguard, or Norn reputation points"], _ ;未译
["Automatically load pcons for a build when loaded onto a character", "Automatically load pcons for a build when loaded onto a character"], _ ;未译
["Double Balthazar and Imperial faction in the Jade Quarry and Fort Aspenwood", "Double Balthazar and Imperial faction in the 翡翠矿场 and 杨木要塞"], _
["Only if your friend's alias is different to their character name", "Only if your friend's alias is different to their character name"], _ ;未译
["I am Kanaxai, creator of nightmares. Let me make yours into reality.", "I am 加奈赛, creator of nightmares. Let me make yours into reality."], _
["Do you like my fish balloon? Can you hear it singing to you...?", "Do you like my fish balloon? Can you hear it singing to you...?"], _ ;未译
["You can still view Kamadan trade chat via the main Trade Window", "You can still view Kamadan trade chat via the main Trade Window"], _ ;未译
["Toolbox normally loads settings on launch.\nClick to re-load from disk now.", "助手通常会在启动时就自动装载设置文件.\n点击以即刻手动重装."], _ ;候选词： 缺 ('重装' 欠佳)
["Show the bonds maintained by you.\nOnly works on human players", "Show the bonds maintained by you.\nOnly works on human players"], _ ;未译
["Human sacrifice. Dogs and cats living together. Mass hysteria!", "Human sacrifice. Dogs and cats living together. Mass hysteria!"], _ ;未译
["Show messages from your Kamadan ae1 Trade Chat in Trade Window", "Show messages from your Kamadan ae1 Trade Chat in Trade Window"], _ ;未译
["m[0] == 0x%X && m[1] == 0x%X && m[2] == 0x%X && m[3] == 0x%X\n", "m[0] == 0x%X && m[1] == 0x%X && m[2] == 0x%X && m[3] == 0x%X\n"], _ ;未译
["Double Balthazar faction and Gladiator title points in Random Arenas", "Double Balthazar faction and Gladiator title points in 随机竞技场"], _
["The hotkey will only trigger in this map.\nUse 0 for any map.", "The hotkey will only trigger in this map.\nUse 0 for any map."], _ ;未译
["Will show a tickbox in the pcons window when in an elite area", "Will show a tickbox in the pcons window when in an elite area"], _ ;未译
["Toolbox will refill pcons from storage if below the threshold", "Toolbox will refill pcons from storage if below the threshold"], _ ;未译
["The hotkey can only trigger in the selected map (0 = Any map)", "The hotkey can only trigger in the selected map (0 = Any map)"], _ ;未译
["ERROR: Failed to parse search results in TradeWindow::fetch\n", "ERROR: Failed to parse search results in TradeWindow::fetch\n"], _ ;未译
["And this is where I met the Lich. He told me to burn things.", "And this is where I met the Lich. He told me to burn things."], _ ;未译
["There are several ways to open and close toolbox windows and widgets:", "There are several ways to open and close 助手窗口及配件:"], _
["TAB or SHIFT+TAB to cycle through keyboard editable fields.", "TAB or SHIFT+TAB to cycle through keyboard editable fields."], _ ;未译
["Decrease the value if you have good ping and you die a lot.", "Decrease the value if you have good ping and you die a lot."], _ ;未译
["You can create a 'Send Chat' hotkey to perform any command.", "You can create a 'Send Chat' hotkey to perform any command."], _ ;未译
["Double Balthazar faction and Codex title points in Codex Arena", "Double Balthazar faction and Codex title points in Codex 竞技场"], _
["When I grow up, I want to be a principal or a caterpillar.", "When I grow up, I want to be a principal or a caterpillar."], _ ;未译
["Player ID is unique for each human player in the instance.", "Player ID is unique for each human player in the instance."], _ ;未译
["Toolbox will disable pcons when leaving an explorable area", "Toolbox will disable pcons when leaving an explorable area"], _ ;未译
["Double copper Zaishen Coin rewards for Zaishen vanquishes", "Double copper Zaishen Coin rewards for Zaishen vanquishes"], _ ;未译
["Double Balthazar faction and Hero title points in Heroes' Ascent", "Double Balthazar faction and Hero title points in 英雄之路"], _
["Double Balthazar faction and Champion title points in GvG", "Double Balthazar faction and Champion title points in GvG"], _ ;未译
["Display from previous days in the Objective Timer window.", "Display from previous days in the Objective Timer window."], _ ;未译
["CTRL+Click or Double Click on a slider or drag box to input text.", "输入字条： 在滑尺上 CTRL+单击 或 双击，或 直接拉动框格."], _ ;候选词： 框格或该成为窗口？栏框
["Disable cons when reaching the final room in Urgoz and Deep", "Disable cons when reaching the final room in 尔果 and Deep"], _
["Double copper Zaishen Coin rewards for Zaishen missions", "Double copper Zaishen Coin rewards for Zaishen missions"], _ ;未译
["Double copper Zaishen Coin rewards for Zaishen bounties", "Double copper Zaishen Coin rewards for Zaishen bounties"], _ ;未译
["Gracious me, was I raving? Please forgive me. I'm mad.", "Gracious me, was I raving? Please forgive me. I'm mad."], _ ;未译
["(Each line is a separate keyword. Not case sensitive.)", "(Each line is a separate keyword. Not case sensitive.)"], _ ;未译
["'/vanguard' prints current pre-searing vanguard quest.", "'/vanguard' prints current pre-searing vanguard quest."], _ ;未译
["Checkboxes on the right of each setting header below.", "Checkboxes on the right of each setting header below."], _ ;未译
["Using level 1 alcohol instead of this is recommended for preventing drunk emotes.\n", "如不愿触发醉酒姿态，可用等级 1 的酒水代之.\n"], _
["Send Chat hotkey to enter one of the commands above.", "Send Chat hotkey to enter one of the commands above."], _ ;未译
["<a=1>%s</a> @ %S %d, %02d:%02d: <c=#f96677><quote>%s", "<a=1>%s</a> @ %S %d, %02d:%02d: <c=#f96677><quote>%s"], _ ;未译
["'/offline' Set your friend list status to 'Offline'.", "'/offline' Set your friend list status to 'Offline'."], _ ;未译
["The Deep and Urgoz's Warren can be entered from Kaineng Center", "The Deep and 尔果的养殖场 can be entered from 凯宁中心"], _
["Show friend aliases when sending/receiving whispers", "Show friend aliases when sending/receiving whispers"], _ ;未译
["Most recently quoted item (buy or sell) from trader", "Most recently quoted item (buy or sell) from trader"], _ ;未译
["Click to view build. Ctrl + Click to send to chat.", "Click to view build. Ctrl + Click to send to chat."], _ ;未译
["Block all other trade messages when in Kamadan ae1", "Block all other trade messages when in Kamadan ae1"], _ ;未译
["'/online' Set your friend list status to 'Online'.", "'/online' Set your friend list status to 'Online'."], _ ;未译
["Toolbox normally saves settings on exit.\nClick to save to disk now.", "助手通常会在关闭时对现有设置自动存档.\n点击以即刻手动存档."], _
["Chat command '/show <name>' to show a window or widget.", "对话框指令 '/show <相关部件名>': 展开 窗口 或 配件."], _ ;候选词： 显示 (欠佳)
["Chat command '/hide <name>' to hide a window or widget.", "对话框指令 '/hide <相关部件名>': 收起 窗口 或 配件."], _ ;候选词： 隐藏 (欠佳)
["Execute a single task such as opening chests\nor reapplying lightbringer title", "执行一项操作，例： 开箱\n或重新展示光明头衔"], _
["Chat command '/tb <name>' to toggle a window or widget.", "对话框指令 '/tb <相关部件名>': 收展 窗口 或 配件."], _ ;候选词： 开关 (欠佳)
["Double Balthazar and Imperial faction in Alliance Battles", "Double Balthazar and Imperial faction in 同盟战"], _
["Suppress lunar and drunk post-processing effects", "Suppress lunar and drunk post-processing effects"], _ ;未译
["Load a team hero build from the Hero Build Panel", "Load a team hero build from the Hero Build Panel"], _ ;未译
["[Error] Your character does not have %s unlocked", "[Error] Your character does not have %s unlocked"], _ ;未译
["Not enough arguments. See Help for chat commands", "Not enough arguments. See Help for chat commands"], _ ;未译
["GWToolbox is fetching new trade messages from %s", "GWToolbox is fetching new trade messages from %s"], _ ;未译
["Fear not the darkness. It is already within you.", "Fear not the darkness. It is already within you."], _ ;未译
["No one can stop me, let alone you puny mortals!", "No one can stop me, let alone you puny mortals!"], _ ;未译
["Click and drag on the lower right corner to resize a window.", "改变框格大小： 点住框格右下角，再随心拉动."], _ ;候选词： 框格或该成为窗口？
["'/tomorrow' prints tomorrow's daily activities.", "'/tomorrow' prints tomorrow's daily activities."], _ ;未译
["Not Connected - Click to travel to Kamadan ae1", "Not Connected - Click to travel to Kamadan ae1"], _ ;未译
["Free passage to the Underworld and the Fissure of Woe", "Free passage to the Underworld and the 灾难裂痕"], _
["Enable in an outpost to refill your inventory.", "Enable in an outpost to refill your inventory."], _ ;未译
["Disable cons when final objective(s) completed", "Disable cons when final objective(s) completed"], _ ;未译
["'/wanted' prints current shining blade bounty.", "'/wanted' prints current shining blade bounty."], _ ;未译
["'/away' Set your friend list status to 'Away'.", "'/away' Set your friend list status to 'Away'."], _ ;未译
["Enabling or disabling pcons will also Tick or Untick in party list", "启动或关闭补品功能之际，助手会改变角色在成员表上的就绪状态"], _
["Toolbox will disable a pcon if it is not found in the inventory", "如某补品从包内?失寻, 助手会关闭该补品的自动服用功能"], _
["'/nicholas' prints current nicholas location.", "'/nicholas' prints current nicholas location."], _ ;未译
["sending purchase request for %d (price=%d)\n", "sending purchase request for %d (price=%d)\n"], _ ;未译
["His blood has returned me to my mortal body.", "His blood has returned me to my mortal body."], _ ;未译
["Trigger hotkey when entering explorable area", "Trigger hotkey when entering explorable area"], _ ;未译
["GWToolbox isn't fetching new trade messages.", "GWToolbox isn't fetching new trade messages."], _ ;未译
["Will hide the skills in your effect monitor", "Will hide the skills in your effect monitor"], _ ;未译
["Click and drag on any empty space to move a window.", "移动框格： 点住框格内何空白位置，再随心拉动."], _ ;候选词： 框格或该成为窗口？
["As a boy I spent much time in these lands.", "As a boy I spent much time in these lands."], _ ;未译
["- Hold SHIFT or use mouse to select text\n", "- Hold SHIFT or use mouse to select text\n"], _ ;未译
["Auto Disable on final objective completion", "Auto Disable on final objective completion"], _ ;未译
["Toggle a GWToolbox++ functionality such as clicker", "Toggle 激战助手++ 功能 such as clicker"], _
["The hotkey can trigger only when selected", "The hotkey can trigger only when selected"], _ ;未译
["Invalid argument '%ls', please use /pcons [|on|off]", "参数无效 '%ls', 正确格式为： /pcons [|on|off]"], _
["Not Connected - Click to re-connect to %s", "Not Connected - Click to re-connect to %s"], _ ;未译
["'/today' prints current daily activities.", "'/today' prints current daily activities."], _ ;未译
["The connection to kamadan.decltype.com has timed out.", "对 kamadan.github.io 广告网的连接请求已超时."], _
["sending sell request for %d (price=%d)\n", "sending sell request for %d (price=%d)\n"], _ ;未译
["Only affects windows (with a title bar), not widgets", "仅对(有标题栏的)窗口有效, 对配件无效"], _ ;候选词：窗口？配件？
["Oh boy, sleep! That's where I'm a Luxon.", "Oh boy, sleep! That's where I'm a Luxon."], _ ;未译
["Hide Spiritual Possession and Lucky Aura", "Hide Spiritual Possession and Lucky Aura"], _ ;未译
["- CTRL+A or double-click to select all\n", "- CTRL+A or double-click to select all\n"], _ ;未译
["You are no match for my almighty power.", "You are no match for my almighty power."], _ ;未译
["Size of each Pcon icon in the interface", "Size of each Pcon icon in the interface"], _ ;未译
["Talk to an NPC to see available dialogs", "Talk to an NPC to see available dialogs"], _ ;未译
["No scroll found in inventory for travel", "No scroll found in inventory for travel"], _ ;未译
["Double Sunspear and Lightbringer points", "Double Sunspear and Lightbringer points"], _ ;未译
["Disable cons when completing a vanquish", "Disable cons when completing a vanquish"], _ ;未译
["Enter DoA, FoW, UW, Deep or Urgoz to begin", "Enter DoA, FoW, UW, Deep or 尔果 to begin"], _
["[Error] You are already in the outpost", "[Error] You are already in the outpost"], _ ;未译
["This only displays when in an outpost.", "This only displays when in an outpost."], _ ;未译
["Quests to show in Daily Quests window:", "Quests to show in Daily Quests window:"], _ ;未译
["ObjectiveTimerRuns_%02d-%02d-%02d.json", "ObjectiveTimerRuns_%02d-%02d-%02d.json"], _ ;未译
["Nicholas the Traveler, %s: %d %s in %s", "Nicholas the Traveler, %s: %d %s in %s"], _ ;未译
["https://wiki.guildwars.com/wiki/Guild:", "https://wiki.guildwars.com/wiki/Guild:"], _ ;未译
["Failed to load ObjectiveSets from json", "Failed to load ObjectiveSets from json"], _ ;未译
["Failed to equip item in bag %d slot %d", "Failed to equip item in bag %d slot %d"], _ ;未译
["Click to load build template and pcons", "Click to load build template and pcons"], _ ;未译
["Block key in Guild Wars when triggered", "Block key in Guild Wars when triggered"], _ ;未译
["'/zv' prints current zaishen vanquish.", "'/zv' prints current zaishen vanquish."], _ ;未译
["'/weekly' prints current weekly bonus.", "'/weekly' prints current weekly bonus."], _ ;未译
["This feature is experimental and might crash your game.\n", "该功能尚在其测试阶段，或会令游戏崩溃.\n"], _
["My cat's breath smells like cat food.", "My cat's breath smells like cat food."], _ ;未译
["Full Conset Price: (Material not available)", "三件套总价: (Material not available)"], _
["An alternative to the default compass", "An alternative to the default compass"], _ ;未译
["Show messages from %s in Trade Window", "Show messages from %s in Trade Window"], _ ;未译
["Friend <name> already added as <name>", "Friend <name> already added as <name>"], _ ;未译
["'/zm' prints current zaishen mission.", "'/zm' prints current zaishen mission."], _ ;未译
["Teleport Mountains\nThis is NOT the mountains quest", "传送至 地下世界 双头龙山\n此 [非] 龙山 任务"], _
["Auto Disable in final room of Urgoz/Deep", "Auto Disable in final room of 尔果/Deep"], _
["Received price %d for %d (item %d)\n", "Received price %d for %d (item %d)\n"], _ ;未译
["Trigger hotkey when entering outpost", "Trigger hotkey when entering outpost"], _ ;未译
["Send this build's Pcons to team chat", "Send this build's Pcons to team chat"], _ ;未译
["No equippable item in bag %d slot %d", "No equippable item in bag %d slot %d"], _ ;未译
["GWToolbox is trying to connect to %s", "GWToolbox is trying to connect to %s"], _ ;未译
["Failed to save ObjectiveSets to json", "Failed to save ObjectiveSets to json"], _ ;未译
["Click to modify pcons for this build", "Click to modify pcons for this build"], _ ;未译
["'/zc' prints current zaishen combat.", "'/zc' prints current zaishen combat."], _ ;未译
["'/zb' prints current zaishen bounty.", "'/zb' prints current zaishen bounty."], _ ;未译
["%s is Wanted by the Shining Blade %s", "%s is Wanted by the Shining Blade %s"], _ ;未译
["Only in Domain of Anguish, within 1400 range", "Only in 悲难领地, within 1400 range"], _
["Double-click on the title bar to collapse a window.", "折闭窗口： 双击标题栏."], _ ;候选词：框格，窗口?
["CTRL+Mouse Wheel to zoom window contents.", "放大框格内容： CTRL+鼠标滑轮."], _ ;候选词： 框格或该成为窗口？
["Shows a countdown timer for alcohol", "Shows a countdown timer for alcohol"], _ ;未译
["Move the teambuild down in the list", "Move the teambuild down in the list"], _ ;未译
["Zaishen Vanquish, %s: <a=1>%s%s</a>", "Zaishen Vanquish, %s: <a=1>%s%s</a>"], _ ;未译
["Weekly Bonus PvP, %s: <a=1>%s%s</a>", "Weekly Bonus PvP, %s: <a=1>%s%s</a>"], _ ;未译
["Weekly Bonus PvE, %s: <a=1>%s%s</a>", "Weekly Bonus PvE, %s: <a=1>%s%s</a>"], _ ;未译
["The connection to %s has timed out.", "The connection to %s has timed out."], _ ;未译
["Show current run in separate window", "Show current run in separate window"], _ ;未译
["Mod Struct (identifier, arg1, arg2)", "Mod Struct (identifier, arg1, arg2)"], _ ;未译
["Hide city Pcons in explorable areas", "Hide city Pcons in explorable areas"], _ ;未译
["Enter a Canthan outpost to see data", "Enter a Canthan outpost to see data"], _ ;未译
["Cons auto-disabled in range of boss", "Cons auto-disabled in range of boss"], _ ;未译
["Auto-Disabling Pcons in elite areas", "Auto-Disabling Pcons in elite areas"], _ ;未译
["Auto Disable on Vanquish completion", "Auto Disable on Vanquish completion"], _ ;未译
["Powered by https://kamadan.decltype.org", "广告网(文字版) https://kamadan.github.io"], _
["You're disgusting, but I love you!", "You're disgusting, but I love you!"], _ ;未译
["Marker: (%.0f, %.0f)", "指向针: (%.0f, %.0f)"], _ ;候选词： 路标，指示牌，指路针 (此处或该有个'相关任务'的概念)
["Bad hero index '%d' for build '%s'", "Bad hero index '%d' for build '%s'"], _ ;未译
["- CTRL+X,CTRL+C,CTRL+V clipboard\n", "- CTRL+X,CTRL+C,CTRL+V clipboard\n"], _ ;未译
["Zaishen Mission, %s: <a=1>%s%s</a>", "Zaishen Mission, %s: <a=1>%s%s</a>"], _ ;未译
["This can be re-enabled in settings", "This can be re-enabled in settings"], _ ;未译
["Show auto disable pcons checkboxes", "Show auto disable pcons checkboxes"], _ ;未译
["Nicholas the Traveler: %d %s in %s", "Nicholas the Traveler: %d %s in %s"], _ ;未译
["Connected to kamadan.gwtoolbox.com", "Connected to kamadan.gwtoolbox.com"], _ ;未译
["%s - %s###ObjectiveTimerCurrentRun", "%s - %s###ObjectiveTimerCurrentRun"], _ ;未译
["Time the instance has been active", "Time the instance has been active"], _ ;未译
["Send a message or command to chat", "Send a message or command to chat"], _ ;未译
["Ping a build from the Build Panel", "Ping a build from the Build Panel"], _ ;未译
["Move the teambuild up in the list", "Move the teambuild up in the list"], _ ;未译
["Close other windows when opening a new one", "打开新框格时关掉其他框格"], _ ;候选词： 框格或该成为窗口？
["<a=1>%s</a>: <c=#f96677><quote>%s", "<a=1>%s</a>: <c=#f96677><quote>%s"], _ ;未译
["Zaishen Combat, %s: <a=1>%s%s</a>", "Zaishen Combat, %s: <a=1>%s%s</a>"], _ ;未译
["Zaishen Bounty, %s: <a=1>%s%s</a>", "Zaishen Bounty, %s: <a=1>%s%s</a>"], _ ;未译
["Vanguard Quest, %s: <a=1>%s%s</a>", "Vanguard Quest, %s: <a=1>%s%s</a>"], _ ;未译
["Equip an item from your inventory", "Equip an item from your inventory"], _ ;未译
["Are you sure?\nThis operation cannot be undone.\n\n", "确定乎?\n该操作不可逆转.\n\n"], _
["[%s] ~ Start: %s ~ End: %s ~ Time: %s", "[%s] ~ 开始: %s ~ 结束: %s ~ 耗时: %s"], _
["Show 'Active' checkbox in header", "Show 'Active' checkbox in header"], _ ;未译
["Move the hotkey down in the list", "Move the hotkey down in the list"], _ ;未译
["Cannot find %s, please refill or disable", "%s 失寻, 可对角色进行补给 或 关闭功能"], _ ;候选词：
["Abaddon will feast on your eyes!", "Abaddon will feast on your eyes!"], _ ;未译
["- CTRL+Left/Right to word jump\n", "- CTRL+Left/Right to word jump\n"], _ ;未译
["Show storage quantity in outpost", "Show storage quantity in outpost"], _ ;未译
["https://wiki.guildwars.com/wiki/", "https://wiki.guildwars.com/wiki/"], _ ;未译
["Failed to load build template %s", "Failed to load build template %s"], _ ;未译
["Display error message on failure", "Display error message on failure"], _ ;未译
["Cons auto-disabled on completion", "Cons auto-disabled on completion"], _ ;未译
["Are you sure?\nThis operation cannot be undone\n\n", "确定乎?\n该操作不可逆转\n\n"], _
["Use or cancel a skill such as Recall or UA", "施展 或 取消 类似 回归 或 坚毅灵气 的技能"], _
["Use an item from your inventory", "Use an item from your inventory"], _ ;未译
["Show 'Open Xunlai Chest' button", "Show 'Open Xunlai Chest' button"], _ ;未译
["Price: Computing (request sent)", "Price: Computing (request sent)"], _ ;未译
["Price: (Material not available)", "Price: (Material not available)"], _ ;未译
["Low on %s, please refill or disable", "%s 即将耗尽,  可对角色进行补给 或 关闭功能"], _ ;候选词：
["Zaishen Vanquish: <a=1>%s%s</a>", "Zaishen Vanquish: <a=1>%s%s</a>"], _ ;未译
["Weekly Bonus PvP: <a=1>%s%s</a>", "Weekly Bonus PvP: <a=1>%s%s</a>"], _ ;未译
["Weekly Bonus PvE: <a=1>%s%s</a>", "Weekly Bonus PvE: <a=1>%s%s</a>"], _ ;未译
["Show daily quests for the next ", "Show daily quests for the next "], _ ;未译
["Send pcons when pinging a build", "Send pcons when pinging a build"], _ ;未译
["You can prefix the number by \", "You can prefix the number by \"], _ ;未译
["Target a game entity by its ID", "Target a game entity by its ID"], _ ;未译
["Send Kamadan ad1 trade chat to your trade chat", "把卡玛丹1区的广告导入角色的交易频道"], _
["Only show messages containing:", "Only show messages containing:"], _ ;未译
["Move the hotkey up in the list", "Move the hotkey up in the list"], _ ;未译
["Checkboxes in the Info window.", "Checkboxes in the Info window."], _ ;未译
["Zaishen Mission: <a=1>%s%s</a>", "Zaishen Mission: <a=1>%s%s</a>"], _ ;未译
["vizunah square foreign quarter", "vizunah square foreign quarter"], _ ;未译
["Invalid profession for %s (%s)", "Invalid profession for %s (%s)"], _ ;未译
["Display message when triggered", "Display message when triggered"], _ ;未译
[", name, cached_time, failed ? ", ", name, cached_time, failed ? "], _ ;未译
["DoA - Foundry 1: Foundry Of Failed Creations", "四门 - 铸造厂 1: 失败事物铸造厂"], _
["Suppress lunar and drunk text", "Suppress lunar and drunk text"], _ ;未译
["Soon you will all be crushed.", "Soon you will all be crushed."], _ ;未译
["Zaishen Combat: <a=1>%s%s</a>", "Zaishen Combat: <a=1>%s%s</a>"], _ ;未译
["Zaishen Bounty: <a=1>%s%s</a>", "Zaishen Bounty: <a=1>%s%s</a>"], _ ;未译
["Widget background hover color", "Widget background hover color"], _ ;未译
["Vanguard Quest: <a=1>%s%s</a>", "Vanguard Quest: <a=1>%s%s</a>"], _ ;未译
["Polling non-gw friends list\n", "Polling non-gw friends list\n"], _ ;未译
["Invalid outpost for scrolling", "Invalid outpost for scrolling"], _ ;未译
["https://kamadan.gwtoolbox.com", "https://kamadan.gwtoolbox.com"], _ ;未译
["%s is the Zaishen Vanquish %s", "%s is the Zaishen Vanquish %s"], _ ;未译
["%s is the Weekly PvP Bonus %s", "%s is the Weekly PvP Bonus %s"], _ ;未译
["%s is the Weekly PvE Bonus %s", "%s is the Weekly PvE Bonus %s"], _ ;未译
["Enter DoA, FoW, or UW to begin", "启动前提： 角色已入悲难之门(四门)，灾难裂痕，或地下世界."], _
["Displays the system time (hour : minutes)", "展示计算机本地时间 (小时 : 分钟)"], _
["All is well. I'm not insane.", "All is well. I'm not insane."], _ ;未译
["Add another player build row", "Add another player build row"], _ ;未译
["vizunah square local quarter", "vizunah square local quarter"], _ ;未译
["Queueing poll friends list\n", "Queueing poll friends list\n"], _ ;未译
["Equip Item in bag %d slot %d", "Equip Item in bag %d slot %d"], _ ;未译
["Click to load build template", "Click to load build template"], _ ;未译
["Automatic /age on completion", "Automatic /age on completion"], _ ;未译
["%s: Loading friends from ini", "%s: Loading friends from ini"], _ ;未译
["%s is the Zaishen Mission %s", "%s is the Zaishen Mission %s"], _ ;未译
["Recall\0Unyielding Aura\0Holy Veil\0Other", "回归\0坚毅灵气\0神圣遮罩\0其他"], _
["This house has many hearts.", "This house has many hearts."], _ ;未译
["Show 'Run' button in header", "Show 'Run' button in header"], _ ;未译
["Price: Computing (in queue)", "Price: Computing (in queue)"], _ ;未译
["Opening and closing windows", "Opening and closing windows"], _ ;未译
["Keep away. The sow is mine.", "Keep away. The sow is mine."], _ ;未译
["GWToolbox++ version %s by Has and KAOS", "Has/KAOS 激战助手++ %s 版"], _
["Buttons in the main window.", "Buttons in the main window."], _ ;未译
["- CTRL+Z,CTRL+Y undo/redo\n", "- CTRL+Z,CTRL+Y undo/redo\n"], _ ;未译
["wss://kamadan.gwtoolbox.com", "wss://kamadan.gwtoolbox.com"], _ ;未译
["Nicholas Sandford, %s: 5 %s", "Nicholas Sandford, %s: 5 %s"], _ ;未译
["Failed to find build for %s", "Failed to find build for %s"], _ ;未译
["%s: Loaded friends from ini", "%s: Loaded friends from ini"], _ ;未译
["%s is the Zaishen Combat %s", "%s is the Zaishen Combat %s"], _ ;未译
["%s is the Zaishen Bounty %s", "%s is the Zaishen Bounty %s"], _ ;未译
["Powerstone of Courage\nGranite and Dust", "勇气粉石\n花岗岩石板 及 闪烁之土"], _
["Klaatu...barada...necktie?", "Klaatu...barada...necktie?"], _ ;未译
["Click to load builds to heroes and player", "击此以替英雄及角色装填技能样本"], _
["Toggle Pcons per character", "Toggle Pcons per character"], _ ;未译
["Player %S is not logged in", "Player %S is not logged in"], _ ;未译
["Failed to decode; invalid.", "Failed to decode; invalid."], _ ;未译
["DisplayDialogue from %ls: ", "DisplayDialogue from %ls: "], _ ;未译
["Click to send to team chat", "Click to send to team chat"], _ ;未译
["Scroll of Resurrection\nFibers and Bones", "复活卷轴\n植物纤维 及 骨头"], _
["DoA - Veil 1: Breaching Stygian Veil", "四门 - 冥狱之幕 1: 突破冥狱之幕"], _
["Room 8-9 | Failure/Shadows", "第 8-9 间 | Failure/Shadows"], _
["Room 13-14 | Decay/Torment", "第 13-14 间 | Decay/Torment"], _
["Take me now, subcreature.", "Take me now, subcreature."], _ ;未译
["My cat's name is Mittens.", "My cat's name is Mittens."], _ ;未译
["Load Team Hero Build '%s'", "Load Team Hero Build '%s'"], _ ;未译
["It's a trick. Get an axe.", "It's a trick. Get an axe."], _ ;未译
["DoA - Gloom 2: The Rifts Between Us", "四门 - 夺心暗域 2: 异世界的裂缝"], _
["DoA - Gloom 1: Deathbringer Company", "四门 - 夺心暗域 1: 死亡召唤大队"], _
["You are not in an outpost", "You are not in an outpost"], _ ;未译
["Wanted, %s: <a=1>%s%s</a>", "Wanted, %s: <a=1>%s%s</a>"], _ ;未译
["ObjectiveTimerRuns_*.json", "ObjectiveTimerRuns_*.json"], _ ;未译
["Daily Quest Chat Commands", "Daily Quest Chat Commands"], _ ;未译
["https://kamadan.decltype.org", "https://kamadan.github.io"], _
["Essence of Celerity\nFeathers and Dust", "敏捷精华\n羽毛 及 闪烁之土"], _
["Show run start date/time", "Show run start date/time"], _ ;未译
["Automatically manage gold", "自动保管白金"], _ ;候选词：不知manage具体功能为何
["Level = %d, tint = %d\n", "Level = %d, tint = %d\n"], _ ;未译
["DoA - Foundry 2: Foundry Breakout", "四门 - 铸造厂 2: 逃出铸造厂"], _
["Wanted by Shining Blade", "Wanted by Shining Blade"], _ ;未译
["unwaking waters kurzick", "沉睡之水 (库兹柯)"], _
["sepulchre of dragrimmar", "爪格林玛坟墓"], _
["not idle nor moving, %d", "not idle nor moving, %d"], _ ;未译
["No results found for %s", "No results found for %s"], _ ;未译
["Nicholas Sandford: 5 %s", "Nicholas Sandford: 5 %s"], _ ;未译
["knocked down or missing", "knocked down or missing"], _ ;未译
["Invalid bag slot %d/%d!", "Invalid bag slot %d/%d!"], _ ;未译
["Failed to parse message", "Failed to parse message"], _ ;未译
["catacombs of kathandrax", "卡山卓司的地下墓穴"], _
["Cancel the current queue of operations", "取消现有或正待命的操作"], _
["Zone 9 | Blood Drinkers", "第 9 区 | Blood Drinkers"], _
["Get away from my baby!", "Get away from my baby!"], _ ;未译
["Armor of Salvation\nIron and Bones", "救赎防具\n铁矿石 及 骨头"], _
["Are you the Keymaster?", "Are you the Keymaster?"], _ ;未译
["Window\0Widget\0Hidden", "Window\0Widget\0Hidden"], _ ;未译
["Skills exported to %ls", "Skills exported to %ls"], _ ;未译
["Save/Load runs to disk", "Save/Load runs to disk"], _ ;未译
["Polling friends list\n", "Polling friends list\n"], _ ;未译
["Order team builds by: ", "Order team builds by: "], _ ;未译
["NpcGeneralStats name: ", "NpcGeneralStats name: "], _ ;未译
["No more %s items found", "No more %s items found"], _ ;未译
["Main Window Visibility", "Main Window Visibility"], _ ;未译
["kamadan jewel of istan", "kamadan jewel of istan"], _ ;未译
["fort aspenwood kurzick", "杨木要塞 (库兹柯)"], _
["e.e. 'You are: Online'", "e.e. 'You are: Online'"], _ ;未译
["Available NPC Dialogs:", "Available NPC Dialogs:"], _ ;未译
["aspenwood gate kurzick", "杨木大门 (库兹柯)"], _
["Agent Enc Name##target", "Agent Enc Name##target"], _ ;未译
["%s%s - %s%s###header%d", "%s%s - %s%s###header%d"], _ ;未译
["%s [%s]%s%s###header%u", "%s [%s]%s%s###header%u"], _ ;未译
["X pos##player", "X 坐标##player"], _ ;候选词： X向/轴 位/方位/定位 横纵
["Price Check##resscroll", "估价##resscroll"], _ ;候选词： 验价，鉴价
["Move to a specific (x,y) coordinate", "前往既定坐标 (x,y)"], _
["Kama -> Docks @ Hahnna", "卡玛丹 -> 领事馆码头 @ Hahnna"], _
["DoA - Gloom 3: To The Rescue!", "四门 - 夺心暗域 3: 前往救援!"], _
["Zone 4 | Bridge Wolves", "第 4 区 | Bridge Wolves"], _
["show_active_in_header", "show_active_in_header"], _ ;未译
["While editing text:\n", "While editing text:\n"], _ ;未译
["Suppress drunk emotes", "Suppress drunk emotes"], _ ;未译
["Couldn't connect to the host '%s'", "无法连接主管站点 '%s'"], _
["Connected (not resigned)", "Connected (尚未发退出令)"], _
["Wanted: <a=1>%s%s</a>", "Wanted: <a=1>%s%s</a>"], _ ;未译
["unwaking waters luxon", "沉睡之水 (勒克森)"], _
["Searching trade for \", "Searching trade for \"], _ ;未译
["No friend '%ls' found", "No friend '%ls' found"], _ ;未译
["NextedStruct(%lu) {\n", "NextedStruct(%lu) {\n"], _ ;未译
["kamadan.gwtoolbox.com", "kamadan.gwtoolbox.com"], _ ;未译
["Guild Wars Skill List", "Guild Wars Skill List"], _ ;未译
["Friends list polled\n", "Friends list polled\n"], _ ;未译
["Fetching map info now", "Fetching map info now"], _ ;未译
["Don't remind me again", "Don't remind me again"], _ ;未译
["Disable on map change", "Disable on map change"], _ ;未译
["%d###ignore_packet_%d", "%d###ignore_packet_%d"], _ ;未译
["###show_as_explorable", "###show_as_explorable"], _ ;未译
["Grail of Might\nIron and Dust", "力量圣杯\n铁矿石 及 闪烁之土"], _
[" to specify an hexadecimal number", " 指定一16位进制的数字"], _
["Zone 6 | Energy Drain", "第 6 区 | Energy Drain"], _
["Y pos##target", "Y 坐标##target"], _ ;候选词： X向/轴 位/方位/定位
["Y pos##player", "Y 坐标##player"], _ ;候选词： X向/轴 位/方位/定位
["X pos##target", "X 坐标##target"], _ ;候选词： X向/轴 位/方位/定位
["This house is clean.", "This house is clean."], _ ;未译
["Load Hero Team Build", "Load Hero Team Build"], _ ;未译
["Load Build on Player", "Load Build on Player"], _ ;未译
["Delete the teambuild", "Delete the teambuild"], _ ;未译
["4...Itchy...Tasty...", "4...Itchy...Tasty..."], _ ;未译
["- ESCAPE to revert\n", "- ESCAPE to revert\n"], _ ;未译
["StoC packet(%lu) {\n", "StoC packet(%lu) {\n"], _ ;未译
["saint anjekas shrine", "圣者安捷卡的祭坛"], _
["No more space for %s", "No more space for %s"], _ ;未译
["minister chos estate", "周大臣庄园_(探索区域)"], _
["Maps exported to %ls", "Maps exported to %ls"], _ ;未译
["Friend List Commands", "Friend List Commands"], _ ;未译
["fort aspenwood luxon", "杨木要塞 (勒克森)"], _
["Failed to add friend", "Failed to add friend"], _ ;未译
["Ebon Vanguard Ritual", "黑檀先锋队仪式"], _
["DialogBody content: ", "DialogBody content: "], _ ;未译
["aspenwood gate luxon", "杨木大门 (勒克森)"], _
["Price Check##essence", "估价##essence"], _ ;候选词： 验价，鉴价
["LA Gate -> LA @ Neiro", "狮门 -> 狮子拱门 @ Neiro"], _
["Docks -> Kaineng @ Mhenlo", "领事馆码头 -> 凯宁中心 @ 涵洛"], _
["Click to send teambuild to chat", "击此以发送整团的技能样本"], _
["Zone 5 | More Wolves", "第 5 区 | More Wolves"], _
["Show second decimal", "Show second decimal"], _ ;未译
["Show 'Start' column", "Show 'Start' column"], _ ;未译
["Number of favorites", "Number of favorites"], _ ;未译
["Zaishen Vanquishing", "Zaishen Vanquishing"], _ ;未译
["Vect3(%f, %f, %f)\n", "Vect3(%f, %f, %f)\n"], _ ;未译
["Refill from storage", "Refill from storage"], _ ;未译
["Player Info##target", "Player Info##target"], _ ;未译
["Missing player name", "Missing player name"], _ ;未译
["Log Message Content", "Log Message Content"], _ ;未译
["Lock size as widget", "Lock size as widget"], _ ;未译
["Lock move as widget", "Lock move as widget"], _ ;未译
["jade quarry kurzick", "jade quarry kurzick"], _ ;未译
["great northern wall", "great northern wall"], _ ;未译
["Faction Leaderboard", "Faction Leaderboard"], _ ;未译
["Competitive Mission", "Competitive Mission"], _ ;未译
["cathedral of flames", "火焰大教堂"], _
["Build Chat Commands", "Build Chat Commands"], _ ;未译
["Price Check##pstone", "估价##pstone"], _ ;候选词： 验价，鉴价
["Moving to (%.0f, %.0f)", "正在前往坐标 (%.0f, %.0f)"], _
["Mouse Wheel to scroll.", "用鼠标滑轮激发卷轴."], _ ;候选词：使用？
["Map ID is unique for each area", "每处皆有一独特的地图号"], _
["Docks -> LA Gate @ Mhenlo", "领事馆码头 -> 狮门 @ 涵洛"], _
["DoA - Veil 2: Brood Wars", "四门 - 冥狱之幕 2: 一网打尽"], _
["Zone 7 | Exhaustion", "第 7 区 | Exhaustion"], _
["Zone 2 | Life Drain", "第 2 区 | Life Drain"], _
["Room 12 | Depletion", "第 12 间 | Depletion"], _
["show_run_in_header", "show_run_in_header"], _ ;未译
["blocked skill %d\n", "blocked skill %d\n"], _ ;未译
["WSAStartup Failed.\n", "WSAStartup 失败.\n"], _
["Show 'Time' column", "Show 'Time' column"], _ ;未译
["Lunars and Alcohol", "Lunars and Alcohol"], _ ;未译
["Load Build on Hero", "Load Build on Hero"], _ ;未译
["I see dead people.", "I see dead people."], _ ;未译
["Execute the hotkey now", "即刻触发快键"], _ ;候选词： 激活，动用
["Enabled-Background", "Enabled-Background"], _ ;未译
["Coin dropper is %s", "Coin dropper is %s"], _ ;未译
["%s [%s]###header%u", "%s [%s]###header%u"], _ ;未译
["%s - %s###header%d", "%s - %s###header%d"], _ ;未译
["} endpacket(%lu)\n", "} endpacket(%lu)\n"], _ ;未译
["Weekly Bonus (PvP)", "Weekly Bonus (PvP)"], _ ;未译
["Weekly Bonus (PvE)", "Weekly Bonus (PvE)"], _ ;未译
["vloxen excavations", "弗洛森古迹"], _
["Trade Window mode:", "Trade Window mode:"], _ ;未译
["Target##cam_target", "Target##cam_target"], _ ;未译
["jade flats kurzick", "翡翠浅滩 (库兹柯)"], _
["In-Game Trade Chat", "In-Game Trade Chat"], _ ;未译
["Guild Info##target", "Guild Info##target"], _ ;未译
["friend_list_scroll", "friend_list_scroll"], _ ;未译
["CtoS packet(%lu)\n", "CtoS packet(%lu)\n"], _ ;未译
["Bag #%d not found!", "Bag #%d not found!"], _ ;未译
["###show_as_outpost", "###show_as_outpost"], _ ;未译
["Price Check##grail", "估价##grail"], _ ;候选词： 验价，鉴价
["Price Check##armor", "估价##armor"], _ ;候选词： 验价，鉴价
["Enemy count", "(敌)个数统计"], _ ;候选词： 敌人总数，敌总数，敌数?统计
["Disabled###pconstoggle", "已关闭###pconstoggle"], _
["Room 7 | Depletion", "第 7 间 | Depletion"], _
["Room 3 | Surrender", "第 3 间 | Surrender"], _
["Room 10 | Scorpion", "第 10 间 | Scorpion"], _
["Show 'End' column", "Show 'End' column"], _ ;未译
["Select a favorite", "Select a favorite"], _ ;未译
["Player ID##player", "Player ID##player"], _ ;未译
["Enabled###pconstoggle", "已启动###pconstoggle"], _
["vanguard tomorrow", "vanguard tomorrow"], _ ;未译
["rragars menagerie", "拉喀的牢笼"], _
["Position##cam_pos", "Position##cam_pos"], _ ;未译
["nicholas tomorrow", "nicholas tomorrow"], _ ;未译
["jade quarry luxon", "jade quarry luxon"], _ ;未译
["frostmaws burrows", "冻霜地道"], _
["Enchantment Spell", "加持魔法"], _
["domain of anguish", "悲难领地"], _
["dalessio seaboard", "达雷西海滨"], _
["Connected Locally", "Connected Locally"], _ ;未译
["Move to (%.0f, %.0f)", "前往坐标 (%.0f, %.0f)"], _
["Load build on your character", "为角色装填技能样本"], _
["Gate of the Nightfallen Lands", "夜蚀暗殒领地之门"], _
["A simple in-game text editor", "一简易的嵌入式便笺"], _
["%d foes in compass range", "雷达范围内有 %d 名敌人"], _
["%d foes in casting range", "施法范围内有 %d 名敌人"], _
["Zone 1 | Weakness", "第 1 区 | Weakness"], _
["Room 6 | Lethargy", "第 6 间 | Lethargy"], _
["Room 4 | Exposure", "第 4 间 | Exposure"], _
["Room 1 | Soothing", "第 1 间 | Soothing"], _
["Show Enemy Count", "Show Enemy Count"], _ ;未译
["Send chat '%c%s'", "Send chat '%c%s'"], _ ;未译
["Open GWToolbox++ Website", "打开 激战助手++ 网站"], _
["Model ID##target", "Model ID##target"], _ ;未译
["Keiran Thackeray", "Keiran Thackeray"], _ ;未译
["Just used the last %s", "刚耗尽 %s"], _ ;候选词：已耗尽
["Jade Quarry (Kurzick), The", "翡翠矿场 (库兹柯)"], _
["I have returned!", "I have returned!"], _ ;未译
["Drop or Use Buff", "Drop or Use Buff"], _ ;未译
["Craft fow armor", "(灾难内)打造黑曜石盔甲"], _ ;候选词： 锻造
["Agent ID##target", "Agent ID##target"], _ ;未译
["Agent ID##player", "Agent ID##player"], _ ;未译
["Advanced##target", "Advanced##target"], _ ;未译
["%s###herobuild%d", "%s###herobuild%d"], _ ;未译
["Zaishen Vanquish", "Zaishen Vanquish"], _ ;未译
["Weekly Bonus PvP", "Weekly Bonus PvP"], _ ;未译
["Weekly Bonus PvE", "Weekly Bonus PvE"], _ ;未译
["Try '/pc <item>'", "Try '/pc <item>'"], _ ;未译
["Toolbox Settings", "Toolbox Settings"], _ ;未译
["Pcons loaded: %s", "Pcons loaded: %s"], _ ;未译
["Northern Support", "Northern Support"], _ ;未译
["mouth of torment", "mouth of torment"], _ ;未译
["jade flats luxon", "翡翠浅滩 (勒克森)"], _
["Go to Guild Hall", "Go to Guild Hall"], _ ;未译
["gadds encampment", "盖德营地"], _
["fishermens haven", "渔人避风港"], _
["Build loaded: %s", "Build loaded: %s"], _ ;未译
["Array32(%lu) {\n", "Array32(%lu) {\n"], _ ;未译
["Array16(%lu) {\n", "Array16(%lu) {\n"], _ ;未译
["Unwaking Waters (Kurzick)", "沉睡之水 (库兹柯)"], _
["Prof Change - Elementalist", "职业更换 - 元素"], _
["Item #%d not found!", "Item #%d 失寻!"], _
["Invalid dialog number '%s'", "令码无效 '%s'"], _
["Buy##resscroll", "买##resscroll"], _ ;候选词： 购买
["Zone 8 | Pillars", "第 8 区 | Pillars"], _
["Zone 10 | Bridge", "第 10 区 | Bridge"], _
["The Hidden City of Ahdashim", "隐藏之城，哈达辛"], _
["Version %s is available!", "%s 版助手已发行!"], _
["Tick with pcons", "Tick with pcons"], _ ;未译
["Ping build '%s'", "Ping build '%s'"], _ ;未译
["Objective Timer", "Objective Timer"], _ ;未译
["Loading\0\0\0", "正在读图\0\0\0"], _ ;候选词： 正在装载
["Jade Quarry (Luxon), The", "翡翠矿场 (勒克森)"], _
["Hero Build Name", "Hero Build Name"], _ ;未译
["Full Conset Price: %g k", "三件套总价: %g k"], _
["Fort Aspenwood (Kurzick)", "杨木要塞 (库兹柯)"], _
["Effects##player", "Effects##player"], _ ;未译
["Current drunk level: %d", "现醉酒程度: %d 级"], _
["Create Hotkey...", "添加快键..."], _ ;候选词： 指定快键
["Close on travel", "Close on travel"], _ ;未译
["Aspenwood Gate (Kurzick)", "杨木大门 (库兹柯)"], _
["10 Piles of Glittering Dust", "10 闪烁之土"], _
["%d foes in spirit range", "灵距内有 %d 名敌人"], _
["[Pcons][%s %d] ", "[Pcons][%s %d] "], _ ;未译
["Zaishen Mission", "Zaishen Mission"], _ ;未译
["wanted tomorrow", "wanted tomorrow"], _ ;未译
["ventaris refuge", "凡特里庇护所"], _
["Vect2(%f, %f)\n", "Vect2(%f, %f)\n"], _ ;未译
["The Floodplain of Mahnkelon", "曼克隆泛滥平原"], _
["seekers passage", "探索者通道"], _
["Off-Hand Attack", "即刻攻击"], _
["NPC ModelFileID", "NPC ModelFileID"], _ ;未译
["Log NPC Dialogs", "Log NPC Dialogs"], _ ;未译
["Ignored Packets", "Ignored Packets"], _ ;未译
["heroes audience", "英雄之痕"], _
["hells precipice", "地狱悬崖"], _
["granite citadel", "granite citadel"], _ ;未译
["Gandara, the Moon Fortress", "弦月要塞，干达拉"], _
["Faction Support", "Faction Support"], _ ;未译
["Export Map Info", "Export Map Info"], _ ;未译
["Encoded string:", "Encoded string:"], _ ;未译
["Elonian Support", "Elonian Support"], _ ;未译
["druids overlook", "德鲁伊高地"], _
["Droajam, Mage of the Sands", "沙之法师 卓加姆"], _
["darkrime delves", "黑霜洞穴"], _
["Characters for ", "Characters for "], _ ;未译
["bogroot growths", "泥塘根源地"], _
["barradin estate", "barradin estate"], _ ;未译
["Auto load pcons", "Auto load pcons"], _ ;未译
["Array8(%lu) {\n", "Array8(%lu) {\n"], _ ;未译
["Alliance Battle", "Alliance Battle"], _ ;未译
["###resscrollqty", "###resscrollqty"], _ ;未译
["###Mod Struct 1", "###Mod Struct 1"], _ ;未译
["Vizunah Square (Foreign)", "薇茹广场 (外地)"], _
["Unwaking Waters (Luxon)", "沉睡之水 (勒克森)"], _
["Reapply appropriate Title", "重新展示相关头衔"], _
["Burning Forest", "孟席斯的奴隶们"], _ ;候选词： 燃烧森林，
["Zone 3 | Levers", "第 3 区 | Levers"], _
["Murakai, Lady of the Night", "夜之女 幕兰凯"], _
["Intricate Grawl Necklaces", "精细的穴居人项链"], _
["hotkey-%03d:%s", "hotkey-%03d:%s"], _ ;未译
["Toggle###combo", "Toggle###combo"], _ ;未译
["Show widget toggles", "Show 配件开关"], _
["Prof Change - Ritualist", "职业更换 - 祭祀"], _
["NameProperties", "NameProperties"], _ ;未译
["Menzies", "黑暗的军队"], _ ;或需复原 ;候选词： 孟席斯的奴隶们
["Kamadan, Jewel of Istan", "卡玛丹，艾斯坦之钻"], _
["Fort Aspenwood (Luxon)", "杨木要塞 (勒克森)"], _
["FoW - Army Of Darkness", "灾难 - 黑暗的军队"], _
["Drop Gold Coin", "Drop Gold Coin"], _ ;未译
["Delete the hotkey", "删除快键"], _ ;候选词： 取消快键
["Aspenwood Gate (Luxon)", "杨木大门 (勒克森)"], _
["Action###combo", "Action###combo"], _ ;未译
["Zaishen Combat", "Zaishen Combat"], _ ;未译
["Zaishen Bounty", "Zaishen Bounty"], _ ;未译
["until %R on %A", "until %R on %A"], _ ;未译
["Trade Settings", "Trade Settings"], _ ;未译
["The Black Beast of Arrgh", "黑色魔兽 阿尔古"], _
["String Decoder", "String Decoder"], _ ;未译
["Ssuns, Blessed of Dwayna", "薇娜的祝福 桑斯"], _
["Show past runs", "Show past runs"], _ ;未译
["Show my status", "Show my status"], _ ;未译
["seafarers rest", "航海者休憩处"], _
["MessageLocal: ", "MessageLocal: "], _ ;未译
["Maximilian the Meticulous", "细心的马希米连"], _
["marhans grotto", "马翰洞穴"], _
["longeyes ledge", "长眼岩脉"], _
["instance_start", "instance_start"], _ ;未译
["Harn and Maxine Coldstone", "冰石哈恩/麦辛"], _
["Feathered Avicara Scalps", "阿比卡拉头皮羽毛"], _
["Factions Elite", "Factions Elite"], _ ;未译
["Export to JSON", "Export to JSON"], _ ;未译
["Enable Logging", "Enable Logging"], _ ;未译
["droknars forge", "卓克纳熔炉"], _
["dragons throat", "龙喉"], _
["Do not disturb", "Do not disturb"], _ ;未译
["destinys gorge", "命运峡谷"], _
["dailies_scroll", "dailies_scroll"], _ ;未译
["champions dawn", "勇士曙光"], _
["Binding Ritual", "缚灵仪式"], _
["AgentId(%lu)\n", "AgentId(%lu)\n"], _ ;未译
["Advanced##item", "Advanced##item"], _ ;未译
["abaddons mouth", "地狱隘口"], _
["###dialoginput", "###dialoginput"], _ ;未译
["###dialogcombo", "###dialogcombo"], _ ;未译
["timestamp", "timestamp"], _ ;未译 ;候选词： 时戳
["Vizunah Square (Local)", "薇茹广场 (本地)"], _
["Take quest in Mountains", "接双头龙山的任务"], _
["Sent dialog %s (%d)", "已发令码 %s (%d)"], _
["Prof Change - Assassin", "职业更换 - 暗杀"], _
["Margrid The Sly", "狡猾者玛格丽特 (狡诈者玛格丽)"], _
["General Interface", "General 界面"], _
["First item in inventory", "背包左上格内之物"], _
["Buy##essence", "买##essence"], _ ;候选词： 购买
["Room 2 | Death", "第 2 间 | Death"], _
["Room 11 | Fear", "第 11 间 | Fear"], _
["Mobrin, Lord of the Marsh", "碎之主 魔兵"], _
["Destor the Truth Seeker", "真实追寻者戴斯特"], _
["img/materials", "img/materials"], _ ;未译
["Tomb of the Primeval Kings", "先王之墓"], _
["Speed##target", "Speed##target"], _ ;未译
["Speed##player", "Speed##player"], _ ;未译
["Prof Change - Warrior", "职业更换 - 战士"], _
["Prof Change - Paragon", "职业更换 - 圣言"], _
["Prof Change - Dervish", "职业更换 - 神唤"], _
["Nightfall mission outpost", "三章任务城"], _
["Jade Flats (Kurzick)", "翡翠浅滩 (库兹柯)"], _
["Items per row", "Items per row"], _ ;未译
["HeroTeamBuild", "HeroTeamBuild"], _ ;未译
["Great Temple of Balthazar", "巴萨泽圣殿"], _
["Current District", "现有区域"], _ ;候选词： 现有区
["Clicker is %s", "Clicker is %s"], _ ;未译
["Add Teambuild", "Add Teambuild"], _ ;未译
[" duration: %d", " duration: %d"], _ ;未译
["urgozs warren", "尔果的养殖场"], _
["String(%lu) \", "String(%lu) \"], _ ;未译
["Singed Gargoyle Skulls", "烧焦的石像鬼头颅"], _
["senjis corner", "山吉之街"], _
["Scythe Attack", "镰刀进攻技能"], _
["Ranged Attack", "区域攻击"], _
["Powered by %s", "Powered by %s"], _ ;未译
["Packet Logger", "Packet Logger"], _ ;未译
["NPC ModelFile", "NPC ModelFile"], _ ;未译
["Nature Ritual", "自然仪式"], _
["model_file_id", "model_file_id"], _ ;未译
["MessageCore: ", "MessageCore: "], _ ;未译
["kodash bazaar", "kodash bazaar"], _ ;未译
["jennurs horde", "征钠群落"], _
["in explorable", "in explorable"], _ ;未译
["heroes ascent", "英雄之路"], _
["Hammer Attack", "锤术攻击技能"], _
["Game Settings", "Game Settings"], _ ;未译
["Forgotten Trinket Boxes", "被遗忘的小箱子"], _
["Feathered Caromi Scalps", "卡洛米羽毛头皮"], _
["eternal grove", "eternal grove"], _ ;未译
["Delete Build?", "Delete Build?"], _ ;未译
["Dagger Attack", "匕首攻击技能"], _
["Copper Crimson Skull Coins", "红颅铜币"], _
["Chat Settings", "Chat Settings"], _ ;未译
["cancel action", "cancel action"], _ ;未译
["Buffs##player", "Buffs##player"], _ ;未译
["Blob(%lu) => ", "Blob(%lu) => "], _ ;未译
["Blazefiend Griefblade", "火焰恶魔 悲伤刀片"], _
["beacons perch", "毕肯高地"], _
["Barthimus the Provident", "算计者巴希穆斯"], _
["Assault on the Stronghold", "袭击根据地"], _
["abaddons gate", "亚霸顿之门"], _
["##commoncombo", "##commoncombo"], _ ;未译
["##alertfilter", "##alertfilter"], _ ;未译
["###essenceqty", "###essenceqty"], _ ;未译
["Show Resign Log", "Show 退出令统计"], _
["Saint Anjeka's Shrine", "圣者安捷卡的祭坛"], _
["Prof Change - Ranger", "职业更换 - 游侠"], _
["Prof Change - Mesmer", "职业更换 - 幻术"], _
["Grand Court of Sebelkeh", "希贝克大公廷"], _
["FoW - Forgemaster", "灾难 - 永生的锻造大师"], _
["Enable/Disable button", "启动/关闭 按钮"], _
["Deldrimor Steel Ingot", "戴尔狄摩钢铁矿石"], _
["Click to change hotkey", "击此以重配快键"], _
["Central Transfer Chamber", "中央转送室"], _
["Buy##pstone", "买##pstone"], _ ;候选词： 购买
["Buy##common", "买##common"], _ ;候选词： 购买
["10 Tanned Hide Squares", "10 褐色兽皮"], _
["Sapphire Djinn Essence", "蓝宝石巨灵精华"], _
["Room 5 | Pain", "第 5 间 | Pain"], _
["Room 15 | Kanaxai", "第 15 间 | 加奈赛"], _
["Myish, Lady of the Lake", "湖之女 蜜希"], _
["Jarimiya the Unmerciful", "残酷 贾米里"], _
["Ilsundur, Lord of Fire", "火之主 音丧多"], _
["Frosted Griffon Wings", "冻结的狮鹫兽翅膀"], _
["Frigid Mandragor Husks", "呆板曼陀罗外壳"], _
["Fibrous Mandragor Roots", "纤维曼陀罗根"], _
["Dessicated Hydra Claws", "干燥的三头龙爪"], _
["trade_scroll", "trade_scroll"], _ ;未译
["start string", "start string"], _ ;未译
["Wailing Lord", "Wailing Lord"], _ ;未译
["Teleport Planes", "传送至 地下世界 混沌平原"], _
["Take quest in Planes", "接混沌平原的任务"], _
["Show numbers", "Show numbers"], _ ;未译
["Prof Change - Necro", "职业更换 - 死灵"], _
["PlayerNumber", "PlayerNumber"], _ ;未译
["Lutgardis Conservatory", "路嘉帝斯温室"], _
["Lunars delay", "Lunars delay"], _ ;未译
["Lair of the Forgotten", "被遗忘者的巢穴"], _
["Jade Flats (Luxon)", "翡翠浅滩 (勒克森)"], _
["Great Northern Wall, The", "北方长城"], _
["Full Conset Price: -", "三件套总价: -"], _
["Faction mission outpost", "二章任务城"], _
["Embark Beach", "Embark Beach"], _ ;未译
["Don't change", "Don't change"], _ ;未译
["Delete build", "Delete build"], _ ;未译
["AS of Weapon", "AS of Weapon"], _ ;未译
["(Up to date)", "(Up to date)"], _ ;未译
["%s_threshold", "%s_threshold"], _ ;未译
["%s###build%d", "%s###build%d"], _ ;未译
["[Pcons][%s] ", "[Pcons][%s] "], _ ;未译
["Weapon Spell", "武装魔法"], _
["Triggered %s", "Triggered %s"], _ ;未译
["The Elusive Golemancer", "乌啦的实验室"], _
["Text spacing", "Text spacing"], _ ;未译
["Sword Attack", "剑术攻击技能"], _
["Superb Charr Carvings", "超级夏尔雕刻品"], _
["Spear Attack", "矛术进攻技能"], _
["shadow nexus", "shadow nexus"], _ ;未译
["Sarnia the Red-Handed", "染血之手萨妮亚"], _
["removefriend", "removefriend"], _ ;未译
["ravens point", "渡鸦岬角"], _
["Melee Attack", "近身攻击技能"], _
["Map District", "Map District"], _ ;未译
["Korshek the Immolated", "宰杀者 科薛克"], _
["is_tb_friend", "is_tb_friend"], _ ;未译
["gunnars hold", "甘拿的占领地"], _
["Greves the Overbearing", "傲慢的葛力斯"], _
["Ghial the Bone Dancer", "骨之舞者 葛西"], _
["Frostmaw the Kinslayer", "冻击 弑族者"], _
["Forest Minotaur Horns", "森林牛头怪的角"], _
["foibles fair", "佛伊伯市集"], _
["Elonian Leather Squares", "伊洛那皮革"], _
["Elementalist", "Elementalist"], _ ;未译
["Dword(%lu)\n", "Dword(%lu)\n"], _ ;未译
["dragons lair", "dragons lair"], _ ;未译
["Door Monitor", "Door Monitor"], _ ;未译
["Deselect All", "Deselect All"], _ ;未译
["deletefriend", "deletefriend"], _ ;未译
["Daily Quests", "Daily Quests"], _ ;未译
["Character(s)", "Character(s)"], _ ;未译
["aurios mines", "aurios mines"], _ ;未译
["Are you sure", "Are you sure"], _ ;未译
["amnoon oasis", "amnoon oasis"], _ ;未译
["Amalek the Unmerciful", "残酷者阿莫列克"], _
["%s###pcon_%s", "%s###pcon_%s"], _ ;未译
["###pstoneqty", "###pstoneqty"], _ ;未译
["Telport Wastes", "传送至 地下世界 荒凉冰地"], _
["Prof Change - Monk", "职业更换 - 僧侣"], _
["Mouth of Torment, The", "苦痛之地隘口"], _
["Iron Mines of Moladune", "莫拉登矿山"], _
["Elonian Leather Square", "伊洛那皮革"], _
["Disable when not found", "失寻时关闭"], _
["Dialogs", "令码"], _ ;候选词： 暗码，关码，通令...
["Delete Teambuild?", "删除整团的技能样本?"], _
["Buy##grail", "买##grail"], _ ;候选词： 购买
["Buy##armor", "买##armor"], _ ;候选词： 购买
["The Great Northern Wall", "北方长城"], _
["Tempered Glass Vials", "调合后的玻璃瓶"], _
["Stone Grawl Necklaces", "石穴居人项链"], _
["Remnant of Antiquities", "残余的断片"], _
["Piles of Elemental Dust", "元素之土"], _
["Nulfastu, Earthbound", "地缚 纳法斯图"], _
["Kepkhet Marrowfeast", "柯博海特 食髓者"], _
["Gold Crimson Skull Coin", "红颅金币"], _
["Flame Temple Corridor", "夏尔火焰神殿"], _
["Diamond Djinn Essence", "钻石巨灵精华"], _
["Curse of the Nornbear", "诺恩熊的诅咒"], _
["Branches of Juni Berries", "柳树枝"], _
["showNumbers", "showNumbers"], _ ;未译
["num_results", "num_results"], _ ;未译
["heroindex%d", "heroindex%d"], _ ;未译
["Tempered Glass Vial", "调合后的玻璃瓶"], _
["Teleport Pools", "传送至 地下世界 孵化池"], _
["Teleport Pits", "传送至 地下世界 骷髅墓穴"], _
["Show Target", "Show Target"], _ ;未译
["Show Player", "Show Player"], _ ;未译
["Show Dialog", "Show Dialog"], _ ;未译
["Sardelac Sanitarium", "萨德拉克疗养院"], _
["Price: %g k", "Price: %g k"], _ ;未译
["Pcons delay", "Pcons delay"], _ ;未译
["Minister Cho's Estate", "周大臣庄园"], _
["LoginNumber", "LoginNumber"], _ ;未译
["Go, banana!", "Go, banana!"], _ ;未译
["FoW - WailingLord", "灾难 - 悲鸣领主"], _
["DropUseBuff", "DropUseBuff"], _ ;未译
["Drop/Use %s", "Drop/Use %s"], _ ;未译
["Dialog Name", "Dialog Name"], _ ;未译
["BuildIndex", "样本索引号"], _ ;候选词： 样本索引
["AS modifier", "AS modifier"], _ ;未译
["<not found>", "<not found>"], _ ;未译
["zv tomorrow", "zv tomorrow"], _ ;未译
["Zone 11 | Urgoz", "第 11 区 | 尔果"], _
["zm tomorrow", "zm tomorrow"], _ ;未译
["zc tomorrow", "zc tomorrow"], _ ;未译
["zb tomorrow", "zb tomorrow"], _ ;未译
["Word(%lu)\n", "Word(%lu)\n"], _ ;未译
["vloxs falls", "弗洛克斯瀑布"], _
["TPS Regulator Golem", "TPS调节高轮"], _
["Touch Skill", "碰触技能"], _
["The Stygian Underlords", "冥狱地王"], _
["Slot (1-25)", "Slot (1-25)"], _ ;未译
["skills.json", "skills.json"], _ ;未译
["Roaring Ether Heart", "苍穹咆哮者之心"], _
["Roaring Ether Claws", "苍穹咆哮者之爪"], _
["Quoted Item", "Quoted Item"], _ ;未译
["Quansong Spiritspeak", "通灵者 魁嵩"], _
["Preparation", "准备技能"], _
["Plague of Destruction", "疫之破坏者"], _
["on %A at %R", "on %A at %R"], _ ;未译
["Necromancer", "Necromancer"], _ ;未译
["marketplace", "marketplace"], _ ;未译
["Lead Attack", "引导攻击"], _
["Interaction", "Interaction"], _ ;未译
["GWToolbox++", "GWToolbox++"], _ ;未译
["Friend List", "Friend List"], _ ;未译
["Float(%f)\n", "Float(%f)\n"], _ ;未译
["First Close", "First Close"], _ ;未译
["Finding the Bloodstone", "寻找血石"], _
["Dual Attack", "双重攻击"], _
["description", "description"], _ ;未译
["Decayed Orr Emblems", "腐烂的欧尔纹章"], _
["Byte(%lu)\n", "Byte(%lu)\n"], _ ;未译
["Bottle of Vabbian Wine", "瓦贝红酒"], _
["Borrguus Blisterbark", "风吼 柏格斯"], _
["astralarium", "astralarium"], _ ;未译
["##rarecombo", "##rarecombo"], _ ;未译
["##commonqty", "##commonqty"], _ ;未译
["###grailqty", "###grailqty"], _ ;未译
["###district", "###district"], _ ;未译
["###armorqty", "###armorqty"], _ ;未译
[" target: %d", " target: %d"], _ ;未译
["active", "active"], _ ;未译 ;候选词： 现行
["Zos Shivros Channel", "佐席洛斯水道"], _
["Teleport Vale", "传送至 地下世界 遗忘谷"], _
["Open Settings Folder", "打开设置夹"], _
["Kodash Bazaar, The", "库丹西市集广场"], _
["Granite Citadel, The", "花岗岩堡垒"], _
["Click to reconnect", "击此以重新连网"], _
["Buy##rare", "买##rare"], _ ;候选词： 购买
["Bowl of Skalefin Soup", "鳞怪鳍汤"], _
["Accept quest reward", "接受任务奖励"], _
["%d Soul Tormentors", "%d 魂拷问者"], _
["Warband of Brothers", "战争军团之友"], _
["The Shattered Ravines", "碎裂沟谷"], _
["Southern Shiverpeaks", "南席娃山脉"], _
["Scroll of Resurrection", "复活卷"], _
["Sandblasted Lodestone", "喷沙磁石"], _
["Ruby Djinn Essence", "红宝石巨灵精华"], _
["Resplendent Makuun", "奢华之城，莫肯"], _
["Powerstone of Courage", "勇气粉石"], _
["Northern Shiverpeaks", "北席娃山脉"], _
["North Kryta Province", "科瑞塔北部"], _
["Mourning Veil Falls", "哀伤之墓瀑布"], _
["Mountain Troll Tusks", "山巨魔獠牙"], _
["Mandragor Root Cake", "曼陀罗根糕点"], _
["Justiciar Kasandra", "判官 卡珊卓拉"], _
["Joffs the Mitigator", "缓和者 卓夫"], _
["Holdings of Chokhin", "舟克辛卷藏室"], _
["Grothmar Wardowns", "古斯玛战争丘陵地"], _
["G.O.L.E.M.", "天才操控而让生活丰富迷人的表现"], _
["Enchanted Lodestones", "附魔磁石s"], _
["Destruction's Depths", "破坏的深渊"], _
["template%d", "template%d"], _ ;未译
["builds%03d", "builds%03d"], _ ;未译
["WeaponType", "WeaponType"], _ ;未译
["Visibility", "Visibility"], _ ;未译
["UW - Restore", "地下 - 恢复古兰斯圣像"], _
["UW - Chamber", "地下 - 清除密室的障碍"], _
["Thresholds", "Thresholds"], _ ;未译
["The Barradin Estate", "巴拉丁庄园"], _
["TargetName", "TargetName"], _ ;未译
["Target #%d", "Target #%d"], _ ;未译
["Sunspear Great Hall", "日戟大会堂"], _
["Show Quest", "Show Quest"], _ ;未译
["Send to team chat", "往队伍频道发送"], _
["Remains of Sahlahja", "萨拉迦遗址"], _
["Ping Build", "Ping Build"], _ ;未译
["Open Xunlai Chest", "打开桑莱保险箱"], _
["Open Locked Chest", "打开锁住的宝箱"], _
["ModelState", "ModelState"], _ ;未译
["Last Dialog", "前一令码"], _ ;候选词： 暂无
["Interface:", "Interface:"], _ ;未译
["Grendich Courthouse", "葛兰迪法院"], _
["Gate of Desolation", "荒芜之地入口"], _
["FoW - Slaves", "灾难 - 孟席斯的奴隶们"], _
["FoW - Griffons", "灾难 - 狮鹫兽礼物"], _
["DialogName", "DialogName"], _ ;未译
["Dialog #%d", "Dialog #%d"], _ ;未译
["Deldrimor War Camp", "戴尔狄摩兵营"], _
["Allegiance", "Allegiance"], _ ;未译
["10 Granite Slabs", "10 花岗岩石板"], _
["10 Chitin Fragments", "10 外壳"], _
["/ Commands", "/ Commands"], _ ;未译
["%s_visible", "%s_visible"], _ ;未译
["%.0f milliseconds", "%.0f 毫秒"], _
["Wilderness of Bahdza", "巴萨荒野"], _
["Well Spell", "涌泉魔法"], _
["week start", "week start"], _ ;未译
["Water Djinn Essence", "水巨灵精华"], _
["Ward Spell", "结界魔法"], _
["War Supply", "War Supply"], _ ;未译
["Vess the Disputant", "争论者 薇丝"], _
["The Sulfurous Wastes", "硫磺荒地"], _
["The Greater Darkness", "巨大暗影"], _
["Tears of the Fallen", "战死者之泪"], _
["Send Pcons", "Send Pcons"], _ ;未译
["Selenas the Blunt", "直言者瑟列娜丝"], _
["Select All", "Select All"], _ ;未译
["Scorched Lodestones", "烧焦的磁石"], _
["Royen Beastkeeper", "野兽看守者罗彦"], _
["Ring of Fire Islands", "火环列岛"], _
["Profession", "Profession"], _ ;未译
["Pet Attack", "宠物攻击"], _
["Off @ boss", "Off @ boss"], _ ;未译
["objectives", "objectives"], _ ;未译
["Map Region", "Map Region"], _ ;未译
["Mandragor Swamproots", "曼陀罗根"], _
["Maguuma Spider Web", "梅古玛蜘蛛丝"], _
["lions arch", "狮子拱门"], _
["Last Close", "Last Close"], _ ;未译
["kathandrax", "kathandrax"], _ ;未译
["Justiciar Thommis", "司法官 汤米兹"], _
["Jungle Troll Tusks", "丛林巨魔獠牙"], _
["jq kurzick", "jq kurzick"], _ ;未译
["Item Spell", "抱持魔法"], _
["in outpost", "in outpost"], _ ;未译
["Grenth's Footprint", "古兰斯的足迹"], _
["Green Rock", "Green Rock"], _ ;未译
["frost gate", "frost gate"], _ ;未译
["First Open", "First Open"], _ ;未译
["First Load", "First Load"], _ ;未译
["fa kurzick", "fa kurzick"], _ ;未译
["Extra Luck", "Extra Luck"], _ ;未译
["Equip Item", "Equip Item"], _ ;未译
["Dreadnought's Drift", "无惧者之丘"], _
["Bow Attack", "弓术攻击技能"], _
["Axe Attack", "斧术攻击技能"], _
["Ancient Kappa Shells", "古河童壳"], _
["A Time for Heroes", "英雄的光采年代"], _
["UW - Pools", "地下 - 恐惧蛛化精灵女王"], _
["Teleport Lab", "传送至 地下世界 迷宫"], _
["Sunspear Sanctuary", "日戟避难所"], _
["Slice of Pumpkin Pie", "南瓜派"], _
["Kodonur Crossroads", "科登诺路口"], _
["Ice Caves of Sorrow", "悲伤冰谷"], _
["FoW - Defend", "灾难 - 保护战争圣殿"], _
["Execute...", "执行..."], _ ;候选词： ?
["Essence of Celerity", "敏捷精华"], _
["D'Alessio Seaboard", "达雷西海滨"], _
["Bergen Hot Springs", "卑尔根温泉"], _
["Aurios Mines, The", "奥里欧斯矿坑"], _
["American District 1", "北美一区"], _
["Zoldark the Unholy", "不洁 咒暗"], _
["Valis the Rampant", "猖獗的瓦里斯"], _
["Twin Serpent Lakes", "双头蛇湖泊"], _
["Talmark Wilderness", "突马克荒地"], _
["Stone Summit Badges", "石峰标志"], _
["Silver Bullion Coins", "银铸币"], _
["Priest of Menzies", "曼席斯的祭司"], _
["Molotov Rocktail", "石尾 摩洛托夫"], _
["Lev the Condemned", "被诅咒的莉芙"], _
["Garden of Seborhin", "希伯欣花园"], _
["Chung, the Attuned", "得道者 村"], _
["Carnak the Hungry", "饥饿者卡纳克"], _
["Ascalonian Noble", "阿斯卡隆 贵族"], _
["Ascalon Foothills", "阿斯卡隆丘陵"], _
["Amphibian Tongues", "双面人的舌头"], _
["warsupply", "warsupply"], _ ;未译
["resignlog", "resignlog"], _ ;未译
["img/pcons", "img/pcons"], _ ;未译
["img/icons", "img/icons"], _ ;未译
["fav_count", "fav_count"], _ ;未译
["buildname", "buildname"], _ ;未译
["Zaishen Menagerie", "战承动物园"], _
["Zaishen Challenge", "战承挑战赛"], _
["Ventari's Refuge", "凡特里庇护所"], _
["UW - Wastes", "地下 - 古兰斯的使者"], _
["Toggle...", "Toggle..."], _ ;未译
["Toggle %s", "Toggle %s"], _ ;未译
["Temple of the Ages", "世纪神殿"], _
["Target ID", "Target ID"], _ ;未译
["Target %s", "Target %s"], _ ;未译
["Sunjiang District", "孙江行政区"], _
["Show Item", "Show Item"], _ ;未译
["Shing Jea Monastery", "星岬寺"], _
["Send Chat", "Send Chat"], _ ;未译
["Riverside Province", "河畔地带"], _
["Price:  -", "Price:  -"], _ ;未译
["PingBuild", "PingBuild"], _ ;未译
["Pcon Size", "Pcon Size"], _ ;未译
["Move Down", "Move Down"], _ ;未译
["Master Of Whispers", "唤言大师"], _
["Kodlonu Hamlet", "克拓奴，哈姆雷特"], _
["Jokanur Diggings", "卓坎诺挖掘点"], _
["Item Name", "Item Name"], _ ;未译
["FoW - Restore", "灾难 - 恢复圣殿"], _
["FoW - Khobay", "灾难 - 背叛者库贝"], _
["Fishermen's Haven", "渔人避风港"], _
["Favorites", "Favorites"], _ ;未译
["ExtraType", "ExtraType"], _ ;未译
["Eternal Grove, The", "永恒之林"], _
["Durheim Archives", "杜汉姆卷藏室"], _
["Dialog ID", "Dialog ID"], _ ;未译
["Dialog %s", "Dialog %s"], _ ;未译
["Copperhammer Mines", "铜锤矿坑"], _
["Connected", "Connected"], _ ;未译
["Coin Drop", "Coin Drop"], _ ;未译
["Close this window", "关闭此窗口"], _
["Chantry of Secrets", "隐秘教堂"], _
["Birthday Cupcake", "生日杯子蛋糕"], _
["Astralarium, The", "亚斯特拉利姆"], _
["Armor of Salvation", "救赎防具"], _
["Add Build", "Add Build"], _ ;未译
["10 Plant Fibers", "10 植物纤维"], _
["10 Bolts of Cloth", "10 布料"], _
["%s_active", "%s_active"], _ ;未译
["yaks bend", "牦牛村"], _
["Witman's Folly", "威特曼的怪异建筑"], _
["utc_start", "utc_start"], _ ;未译
["Turai's Procession", "托雷长廊"], _
["The Ruptured Heart", "破裂之心"], _
["The Mirror of Lyss", "丽之镜湖"], _
["The Four Horsemen", "多姆四骑士"], _
["The Darknesses", "暗影(先王之墓)"], _
["Shiverpeak Manes", "席娃山脉鬃毛"], _
["Sentient Lodestone", "知觉磁石"], _
["Searching", "Searching"], _ ;未译
["Rolls of Parchment", "羊皮纸卷"], _
["Ritualist", "Ritualist"], _ ;未译
["resscroll", "resscroll"], _ ;未译
["Rand Stormweaver", "织暴者 硬皮"], _
["Pywatt the Swift", "迅捷 派维特"], _
["Panjiang Peninsula", "班让半岛"], _
["Off @ end", "Off @ end"], _ ;未译
["NPC Flags", "NPC Flags"], _ ;未译
["Norrhart Domains", "诺恩之心领地"], _
["Mungri Magicbox", "魔法盒 牧格里"], _
["maps.json", "maps.json"], _ ;未译
["Low on %s", "Low on %s"], _ ;未译
["Loggit!\n", "Loggit!\n"], _ ;未译
["loadbuild", "loadbuild"], _ ;未译
["Last Open", "Last Open"], _ ;未译
["Justiciar Amilyn", "判官 亚蜜琳"], _
["Hex Spell", "降咒魔法"], _
["Gruesome Ribcages", "可怕的胸腔"], _
["Gadget ID", "Gadget ID"], _ ;未译
["EquipItem", "EquipItem"], _ ;未译
["continent", "continent"], _ ;未译
["Celestial Essences", "天神质体"], _
["Blue Rock", "Blue Rock"], _ ;未译
["Blood Washes Blood", "血债血偿"], _
["Bag (1-5)", "Bag (1-5)"], _ ;未译
["Arbor Earthcall", "大地之唤 亚伯"], _
["addfriend", "addfriend"], _ ;未译
["##rareqty", "##rareqty"], _ ;未译
["###heroid", "###heroid"], _ ;未译
["###active", "###active"], _ ;未译
[" [Map %d]", " [Map %d]"], _ ;未译
["UW - Planes", "地下 - 多姆四骑士"], _
["Tower of Strength", "力量之塔"], _
["Tanglewood Copse", "谭格梧树林"], _
["Tahnnakai Temple", "谭纳凯神殿"], _
["Shadow Nexus, The", "阴郁核心"], _
["Sell##common", "卖##common"], _
["Seeker's Passage", "探索者通道"], _
["Seafarer's Rest", "航海者休憩处"], _
["Roll of Parchment", "羊皮纸卷"], _
["Ran Musu Gardens", "岚穆苏花园"], _
["Outpost\0\0\0", "城镇\0\0\0"], _
["Lump of Charcoal", "结块的木炭"], _
["Hero Builds", "英雄技能样本"], _
["Henge of Denravi", "丹拉维圣地"], _
["Glob of Ectoplasm", "心灵之玉"], _
["Gadd's Encampment", "盖德营地"], _
["Europe Spanish", "欧洲 西班牙语"], _
["Europe Russian", "欧洲 俄罗斯语"], _
["Europe Italian", "欧洲 意大利语"], _
["Enter Challenge", "进入挑战任务"], _
["Dzagonur Bastion", "萨岗诺棱堡"], _
["Druid's Overlook", "德鲁伊高地"], _
["Doomlore Shrine", "末日传说神殿"], _
["Amnoon Oasis, The", "安奴绿洲"], _
["Zaln the Jaded", "精疲力竭的萨恩"], _
["Watchtower Coast", "瞭望塔海岸"], _
["Unnatural Seeds", "古怪的种子s"], _
["Thorny Carapaces", "多刺的甲壳"], _
["The Stygian Lords", "冥狱霸主"], _
["The Iron Forgeman", "钢铁巨人"], _
["The Eternal Grove", "永恒之林"], _
["The Black Curtain", "黑色帷幕"], _
["Stolen Supplies", "失窃的补给品"], _
["Spiritwood Planks", "心灵之板"], _
["Shadowy Remnants", "阴影残留物"], _
["Rragar Maneater", "拉喀 食人者"], _
["Rot Wallow Tusks", "腐败兽獠牙"], _
["Red Iris Flowers", "红色鸢尾花"], _
["Poisoned Outcrops", "剧毒地表"], _
["Mummy Wrappings", "木乃伊裹尸布"], _
["Melandru's Hope", "梅兰朵的盼望"], _
["Justiciar Sevaan", "判官 席凡"], _
["Justiciar Marron", "判官 马隆"], _
["Jedeh the Mighty", "强者 捷地"], _
["Insatiable Vakar", "强欲者瓦卡"], _
["Guild Versus Guild", "公会战"], _
["Grawl Necklaces", "穴居人项链s"], _
["Gargoyle Skulls", "石像鬼头颅s"], _
["Far Shiverpeaks", "席娃山脉极端"], _
["Enslavement Stones", "奴隶石"], _
["Duncan the Black", "黑色 唐肯"], _
["Drazach Thicket", "德瑞札灌木林"], _
["Diviner's Ascent", "预言者之坡"], _
["Countess Nadya", "伯爵夫人 娜佳"], _
["Commander Wahli", "指挥官 瓦里"], _
["Charged Blackness", "暗黑幽灵"], _
["Baubao Wavewrath", "怒浪 保博"], _
["Alcazia Tangle", "纠结之艾卡滋亚"], _
["Against the Charr", "对抗夏尔"], _
["travelto", "travelto"], _ ;未译
["pconsize", "pconsize"], _ ;未译
["Windows:", "Windows:"], _ ;未译
["Use Item", "Use Item"], _ ;未译
["Urgoz's Warren", "尔果的养殖场"], _
["UW - Pits", "地下 - 被拘禁的亡魂"], _
["UW - Escort", "地下 - 护送灵魂"], _
["ToggleID", "ToggleID"], _ ;未译
["Thunderhead Keep", "雷云要塞"], _
["Template", "Template"], _ ;未译
["Tarnished Haven", "灰暗避难所"], _
["TargetID", "TargetID"], _ ;未译
["Spiritwood Plank", "心灵之板"], _
["Skill#%d", "Skill#%d"], _ ;未译
["Skill ID", "Skill ID"], _ ;未译
["Show Map", "Show Map"], _ ;未译
["Shing Jea Arena", "星岬竞技场"], _
["SendChat", "SendChat"], _ ;未译
["Ruins of Surmia", "苏米亚废墟"], _
["Pyre Fierceshot", "烈之击炎焰"], _
["Pcons %s", "Pcons %s"], _ ;未译
["Not connected", "已失联/已断网"], _
["Mihanu Township", "米哈努小镇"], _
["Mercenary Hero 8", "佣兵 8"], _
["Mercenary Hero 7", "佣兵 7"], _
["Mercenary Hero 6", "佣兵 6"], _
["Mercenary Hero 5", "佣兵 5"], _
["Mercenary Hero 4", "佣兵 4"], _
["Mercenary Hero 3", "佣兵 3"], _
["Mercenary Hero 2", "佣兵 2"], _
["Mercenary Hero 1", "佣兵 1"], _
["Map file", "Map file"], _ ;未译
["Map Type", "Map Type"], _ ;未译
["Leviathan Pits", "利拜亚森矿场"], _
["ItemName", "ItemName"], _ ;未译
["International", "国际区"], _
["Imperial Sanctum", "帝国圣所"], _
["ID: 0x%X", "ID: 0x%X"], _ ;未译
["House zu Heltzer", "凤荷议院"], _
["Heroes' Audience", "英雄之痕"], _
["Hell's Precipice", "地狱悬崖"], _
["General:", "General:"], _ ;未译
["Foundry Reward", "铸造厂奖励2"], _
["FoW - Hunt", "灾难 - 猎杀碎片狼"], _
["Eye of the North", "极地之眼"], _
["Ember Light Camp", "残火营地"], _
["Edit", "修改"], _ ;候选词： 编辑 (欠佳)
["Dunes of Despair", "绝望沙丘"], _
["Droknar's Forge", "卓克纳熔炉"], _
["Dragon's Lair, The", "龙穴"], _
["DialogID", "DialogID"], _ ;未译
["Consulate Docks", "领事馆码头"], _
["Connecting...", "正在连接..."], _
["Common 4", "Common 4"], _ ;未译
["Codex Arena", "Codex 竞技场"], _
["City speedboost", "城内加速品"], _
["Chahbek Village", "夏贝克村庄"], _
["Bai Paasu Reach", "拜巴苏区域"], _
["BE GONE!", "BE GONE!"], _ ;未译
["Ashford Abbey", "灰色浅滩修道院"], _
["ActionID", "ActionID"], _ ;未译
["Acolyte Sousuke", "侍从萨苏克"], _
["10 Iron Ingots", "10 铁矿石"], _
[" Whisper", " Whisper"], _ ;未译
["[Pcons] ", "[Pcons] "], _ ;未译
["You are:", "You are:"], _ ;未译
["Yatendi Canyons", "亚天帝峡谷"], _
["Verdant Cascades", "原野瀑布"], _
["Vehtendi Valley", "巍天帝峡谷"], _
["vanguard", "vanguard"], _ ;未译
["Utini Wupwup", "尤提尼 乌坡乌坡"], _
["timstamp", "timstamp"], _ ;未译
["Success!", "Success!"], _ ;未译
["Shadow's Passage", "阴暗通道"], _
["Scoundrel's Rise", "恶汉山丘"], _
["Red Rock", "Red Rock"], _ ;未译
["Phantom Residue", "幻影残留物"], _
["Pantheon", "Pantheon"], _ ;未译
["ooze pit", "乌兹地窖"], _
["nicholas", "nicholas"], _ ;未译
["Name Enc", "Name Enc"], _ ;未译
["Mossy Mandibles", "生苔下颚骨"], _
["Morostav Trail", "摩洛神秘通道"], _
["Mergoyle Skulls", "石像魔头颅"], _
["Massive Jawbone", "粗大下颚骨"], _
["Margonite Masks", "玛骨奈面具"], _
["Kunvie Firewing", "火翼 坤维"], _
["Kournan Pendants", "高楠垂饰"], _
["Justiciar Kimii", "判官 绮米"], _
["jq luxon", "jq luxon"], _ ;未译
["Inscribed Shards", "铭刻碎片"], _
["Ice Cliff Chasms", "冰崖裂口"], _
["Griffon's Mouth", "狮鹫兽隘口"], _
["Go to %s", "Go to %s"], _ ;未译
["Fronis Irontoe", "铁趾 弗朗尼"], _
["Fozzy Yeoryios", "冻 耀尔伊欧"], _
["Forgotten Seals", "遗忘者图章"], _
["Fetid Carapaces", "恶臭的甲壳"], _
["Farmer Hamnet", "农民 哈姆奈特"], _
["fa luxon", "fa luxon"], _ ;未译
["equip %d", "equip %d"], _ ;未译
["Eldritch Ettin", "怪异双头巨人"], _
["Echovald Forest", "科凡德森林"], _
["Eastern Frontier", "东方边境"], _
["duration", "duration"], _ ;未译
["Dull Carapaces", "阴暗的甲壳s"], _
["Dredge Incisors", "挖掘者之牙"], _
["Diessa Lowlands", "底耶沙低地"], _
["Desc Enc", "Desc Enc"], _ ;未译
["Deldrimor Bowl", "戴尔狄摩盆地"], _
["Crystal Overlook", "水晶高地"], _
["Cliffs of Dohjok", "杜夏悬崖"], _
["City IMS", "City IMS"], _ ;未译
["Chromatic Scale", "染色的麟片"], _
["charname", "charname"], _ ;未译
["campaign", "campaign"], _ ;未译
["Berserker Horns", "狂战士的角"], _
["Bag/Slot", "Bag/Slot"], _ ;未译
["Assassin", "Assassin"], _ ;未译
["A Gate Too Far", "一道过远的门"], _
["##source", "##source"], _ ;未译
["Zin Ku Corridor", "辛库走廊"], _
["Zhed Shadowhoof", "影爪杰德"], _
["Wehhan Terraces", "薇恩平台"], _
["Vasburg Armory", "维思伯兵营"], _
["UW - Vale", "地下 - 愤怒的灵魂"], _
["Tihark Orchard", "提亚克林地"], _
["Sunspear Arena", "日戟竞技场"], _
["Serenity Temple", "宁静神殿"], _
["Rilohn Refuge", "里欧恩难民营"], _
["Obsidian Shard", "黑曜石碎片"], _
["Nolani Academy", "若拉尼学院"], _
["Moving to %s", "正在前往 %s"], _
["Moddok Crevice", "摩多克裂缝"], _
["Marhan's Grotto", "马翰洞穴"], _
["Longeye's Ledge", "长眼岩脉"], _
["Gyala Hatchery", "盖拉孵化所"], _
["Gunnar's Hold", "甘拿的占领地"], _
["Griffons", "狮鹫兽礼物"], _ ;或需复原
["Green Rock Candy", "绿冰糖"], _
["General Morgahn", "摩根将军"], _
["Gates of Kryta", "科瑞塔关所"], _
["Gate of Torment", "苦痛之门"], _
["Gate of Secrets", "奥秘之门"], _
["Gate of Madness", "疯狂之门"], _
["Gate of Anguish", "悲难之门"], _
["Frost Gate, The", "寒霜之门"], _
["Forge", "永生的锻造大师"], _  ;或需复原
["Europe Polish", "欧洲 波兰语"], _
["Europe English", "欧洲 英语"], _
["Eredon Terrace", "尔雷登平地"], _
["DoA - City", "四门 - 托加之城"], _
["Destiny's Gorge", "命运峡谷"], _
["Demon Assassin", "恶魔暗杀者"], _
["Delete Hotkey?", "删除快键?"], _
["Defend", "保护战争圣殿"], _  ;或需复原
["Dasha Vestibule", "达沙走廊"], _
["Champion's Dawn", "勇士曙光"], _
["Cannot find %s", "%s 失寻"], _
["Abaddon's Mouth", "地狱隘口"], _
["Abaddon's Gate", "亚霸顿之门"], _
["10 Wood Planks", "10 木材"], _
["%s not found!", "%s 失寻!"], _
["Vengeful Aatxe", "复仇牛头怪"], _
["Unwaking Waters", "沉睡之水"], _
["The Dragon's Lair", "龙穴"], _
["Tasca's Demise", "塔斯加之死"], _
["Tarnished Coast", "灰暗沿岸"], _
["Sunward Marches", "向阳边境"], _
["Stingray Strand", "魟鱼湖滨"], _
["Sparkfly Swamp", "火星蝇沼泽"], _
["Skeletal Limbs", "骷髅手臂s"], _
["Shriveled Eyes", "干枯的眼睛"], _
["Shing Jea Island", "星岬岛"], _
["Shenzun Tunnels", "申赞通道"], _
["Sentient Spores", "知觉孢子"], _
["Plains of Jarin", "贾林平原"], _
["Pillaged Goods", "掠夺的货品"], _
["Mursaat Tokens", "马赛特记号"], _
["Mohby Windbeak", "莫比 风喙"], _
["Mineral Springs", "矿物泉源"], _
["Majesty's Rest", "王者安息处"], _
["Maguuma Jungle", "梅古玛丛林"], _
["Luminous Stone", "发亮的石头"], _
["Keen Oni Talon", "锐利细鬼爪"], _
["Joh the Hostile", "敌意 舟"], _
["Jade Mandibles", "翡翠下颚骨"], _
["Iron Horse Mine", "铁马矿山"], _
["Insect Carapaces", "甲虫壳"], _
["Havok Soulwail", "霍克 灵叹"], _
["Glowing Hearts", "灼热的心脏"], _
["Frostfire Fangs", "霜火尖牙"], _
["Forum Highlands", "高地广场"], _
["Feathered Scalps", "羽头皮"], _
["Dragon's Gullet", "巨龙峡谷"], _
["Dejarin Estate", "达贾林庄园"], _
["Dalada Uplands", "达拉达山地"], _
["Copper Shillings", "铜先令"], _
["Charr Homelands", "夏尔家园"], _
["Charr Carvings", "夏尔雕刻品"], _
["Bog Skale Fins", "泥鳞怪的鳍"], _
["Barbarous Shore", "野蛮河岸"], _
["Bahdok Caverns", "巴多克洞穴"], _
["Alliance Battles", "同盟战"], _
["Admiral Kantoh", "上将 坎托"], _
["Abnormal Seeds", "畸形的种子"], _
["typeMap", "typeMap"], _ ;未译
["suggest", "suggest"], _ ;未译
["selling", "selling"], _ ;未译
["results", "results"], _ ;未译
["message", "message"], _ ;未译
["hotkey-", "hotkey-"], _ ;未译
["Yahnur Market", "雅诺尔市集"], _
["Working", "Working"], _ ;未译
["Vlox's Falls", "弗洛克斯瀑布"], _
["Venta Cemetery", "凡特墓地"], _
["UseItem", "UseItem"], _ ;未译
["Use #%d", "Use #%d"], _ ;未译
["UW - Mnt", "地下 - 恶魔暗杀者"], _
["Toolbox", "Toolbox"], _ ;未译
["Senji's Corner", "山吉之街"], _
["Ruins of Morah", "摩拉废墟"], _
["Roll of Vellum", "牛皮纸卷"], _
["Restore", "Restore"], _ ;未译
["Random Arenas", "随机竞技场"], _
["Quest%d", "Quest%d"], _ ;未译
["Pogahn Passage", "波甘驿站"], _
["No Hero", "No Hero"], _ ;未译
["Move Up", "Move Up"], _ ;未译
["Monstrous Fang", "巨大尖牙"], _
["Monstrous Claw", "巨大的爪"], _
["ModelID", "ModelID"], _ ;未译
["Minimap", "Minimap"], _ ;未译
["Message", "Message"], _ ;未译
["Marketplace, The", "市集"], _
["Maguuma Stade", "梅古玛丛林"], _
["Lunar Fortunes", "命运锦囊"], _
["Kaineng Center", "凯宁中心"], _
["Jennur's Horde", "征钠群落"], _
["Item ID", "Item ID"], _ ;未译
["Ice Tooth Cave", "冰牙洞穴"], _
["Heroes' Ascent", "英雄之路"], _
["Harvest Temple", "丰收神殿"], _
["Grail of Might", "力量圣杯"], _
["Four Horseman", "多姆四骑士"], _
["Foundry", "Foundry"], _ ;未译
["Foible's Fair", "佛伊伯市集"], _
["FoW - Tos", "灾难 - 力量之塔"], _
["FoW - Toc", "灾难 - 勇气之塔"], _
["Europe German", "欧洲 德语"], _
["Europe French", "欧洲 法语"], _
["Effects", "Effects"], _ ;未译
["Divinity Coast", "神圣海岸"], _
["Clicker", "Clicker"], _ ;未译
["Chat Commands", "对话框指令"], _
["Chamber", "Chamber"], _ ;未译
["Brauer Academy", "巴尔学院"], _
["Boreal Station", "北极驻地"], _
["Blue Rock Candy", "蓝冰糖"], _
["Bloodstone Fen", "血石沼泽"], _
["Beacon's Perch", "毕肯高地"], _
["Basalt Grotto", "玄武岩石穴"], _
["Asia Japanese", "亚洲 日文"], _
["Altrumm Ruins", "奥楚兰废墟"], _
["Alcohol", "Alcohol"], _ ;未译
["Xaquang Skyway", "夏安便道"], _
["Warrior", "Warrior"], _ ;未译
["Vulture Drifts", "秃鹰沙丘"], _
["Vizunah Square", "薇茹广场"], _
["Varajar Fells", "维拉戛阵地"], _
["Traveler's Vale", "旅人谷"], _
["The Frost Gate", "寒霜之门"], _
["The Desolation", "荒芜之地"], _
["The Alkali Pan", "金属镕炉"], _
["Tangled Seeds", "纠结的种子"], _
["Show as", "Show as"], _ ;未译
["Sentient Seeds", "知觉种子"], _
["Saoshang Trail", "绍商小径"], _
["Rhea's Crater", "席亚火山口"], _
["Regent Valley", "统治者之谷"], _
["Quetzal Crests", "长尾冠毛"], _
["Prophet's Path", "先知之路"], _
["Prismatic Ooze", "多彩乌兹"], _
["Pockmark Flats", "麻点平原"], _
["pcons%d", "pcons%d"], _ ;未译
["Paragon", "Paragon"], _ ;未译
["Outpost", "Outpost"], _ ;未译
["Modniir Manes", "莫得米鬃毛"], _
["Minotaur Horns", "牛头怪角"], _
["Mamnoon Lagoon", "玛奴泻湖"], _
["Maishang Hills", "麦尚山丘"], _
["Maguuma Manes", "梅古玛鬃毛"], _
["Lornar's Pass", "洛拿斯通道"], _
["Leathery Claws", "强韧的爪"], _
["Kurzick", "Kurzick"], _ ;未译
["Kinya Province", "欣弥领地"], _
["Jaga Moraine", "亚加 摩瑞音"], _
["Jade Bracelets", "翡翠手镯"], _
["Frigid Hearts", "冰冻的心脏"], _
["Fort Aspenwood", "杨木要塞"], _
["Faction", "Faction"], _ ;未译
["Ettin's Back", "双头怪隐匿地"], _
["Door ID", "Door ID"], _ ;未译
["Dervish", "Dervish"], _ ;未译
["default", "default"], _ ;未译
["dailies", "dailies"], _ ;未译
["Crystal Desert", "水晶沙漠"], _
["Behemoth Hides", "巨兽皮革"], _
["Azure Remains", "湛蓝残留物"], _
["Alerts:", "Alerts:"], _ ;未译
["<[^>]+>", "<[^>]+>"], _ ;未译
["##start", "##start"], _ ;未译
["###name", "###name"], _ ;未译
["###code", "###code"], _ ;未译
["Zaishen Elite", "战承精英"], _
["Yohlon Haven", "犹朗避难所"], _
["Umbral Grotto", "阴影石穴"], _
["UW - UWG", "地下 - 不速之客"], _
["Tsumei Village", "苏梅村"], _
["Travel", "直达"], _ ;候选词： 位移
["Travel To...", "前往..."], _
["Thirsty River", "干枯河流"], _
["Send a Dialog", "发送令码"], _
["Sell##rare", "卖##rare"], _
["Select Hotkey", "选择快键"], _
["Seitung Harbor", "青函港"], _
["Secondary Prof", "副职业"], _
["Red Rock Candy", "红冰糖"], _
["Quarrel Falls", "怨言瀑布"], _
["Pahnai Salad", "伊波枷沙拉"], _
["Onyx Gemstone", "玛瑙宝石"], _
["Nahpui Quarter", "纳普区"], _
["Monstrous Eye", "巨大的眼"], _
["Important:\n", "警告:\n"], _
["Functionality:", "功能:"], _
["Frontier Gate", "边境关所"], _
["Dragon's Throat", "龙喉"], _
["Create Hotkey", "添加快键"], _
["Breaker Hollow", "断崖谷"], _
["Boreas Seabed", "风神海床"], _
["Blacktide Den", "黑潮之穴"], _
["Beknur Harbor", "别克诺港"], _
["Aurora Glade", "欧若拉林地"], _
["Asian Korean", "亚洲 朝文"], _
["Asia Chinese", "亚洲 中文"], _
["Ascalon City", "阿斯卡隆城"], _
["Wajjun Bazaar", "瓦江市场"], _
["Vermin Hides", "寄生虫皮革"], _
["Spiked Crest", "尖刺的颈脊"], _
["Spearhead Peak", "枪尖山"], _
["Skyward Reach", "天际流域"], _
["Saurian Bones", "蜥蜴骨头"], _
["Sacnoth Valley", "圣诺谷"], _
["Random Arena", "随机竞技场"], _
["Pongmei Valley", "朋美谷"], _
["Perdition Rock", "破灭石"], _
["Mehtani Keys", "梅坦尼之钥"], _
["Mantid Pincers", "螳螂镰"], _
["Magus Stones", "玛古斯之石"], _
["Lord Jadoth", "霸王 贾多斯"], _
["Lahtenda Bog", "洛天帝沼泽"], _
["Joko's Domain", "杰格领地"], _
["Icy Lodestones", "冰磁石"], _
["Heket Tongues", "哈克蛙舌"], _
["Guardian Moss", "守护者苔"], _
["Frozen Forest", "冰冻森林"], _
["Footman Tate", "仆从 泰特"], _
["Demonic Relic", "恶魔残片"], _
["Cobalt Talons", "深蓝之爪"], _
["Bukdek Byway", "巴德克小径"], _
["Bolts of Linen", "亚麻布"], _
["Bjora Marches", "碧拉边境"], _
["Arkjok Ward", "阿尔科监禁区"], _
["sugest", "sugest"], _ ;未译
["name%d", "name%d"], _ ;未译
["id: %d", "id: %d"], _ ;未译
["header", "header"], _ ;未译
["builds", "builds"], _ ;未译
["Zei Ri", "Zei Ri"], _ ;未译
["War Supplies", "战承物资"], _
["Vlox's", "Vlox's"], _ ;未译
["Use %s", "Use %s"], _ ;未译
["Trade Alerts", "买卖提示"], _
["Toggle", "Toggle"], _ ;未译
["TeamId", "TeamId"], _ ;未译
["Target", "Target"], _ ;未译
["Search", "Search"], _ ;未译
["Ring of Fire", "火环群岛"], _
["Raisu Palace", "莱苏皇宫"], _
["Player", "Player"], _ ;未译
["Piken Square", "派肯广场"], _
["Map ID", "Map ID"], _ ;未译
["Leather Square", "皮革"], _
["Khobay", "Khobay"], _ ;未译
["ItemId", "ItemId"], _ ;未译
["ItemID", "ItemID"], _ ;未译
["Hotkey: %s", "快键: %s"], _
["Gate of Pain", "惩罚之门"], _
["Gate of Fear", "恐惧之门"], _
["Gadd's", "Gadd's"], _ ;未译
["Escort", "Escort"], _ ;未译
["Embark", "Embark"], _ ;未译
["Elona Reach", "伊洛那流域"], _
["Dialog", "Dialog"], _ ;未译
["Damage", "Damage"], _ ;未译
["Custom", "Custom"], _ ;未译
["Camp Hojanu", "何加努营地"], _
["Borlis Pass", "柏里斯通道"], _
["Bolt of Linen", "亚麻布"], _
["Bolt of Damask", "缎布"], _
["Amatz Basin", "亚马兹盆地"], _
["Alerts", "Alerts"], _ ;未译
["Action", "Action"], _ ;未译
["<None>", "<None>"], _ ;未译
["10 Feathers", "10 羽毛"], _
["%d %s ago", "%d %s 前"], _
["% Alliance", "% 同盟频道"], _
["Zehlon Reach", "列隆流域"], _
["Worn Belts", "破旧的腰带s"], _
["weekly", "weekly"], _ ;未译
["Weaver Legs", "编织者的腿"], _
["Vials of Ink", "小瓶墨水"], _
["Vehjin Mines", "威金矿坑"], _
["Topaz Crest", "黄宝石颈脊"], _
["The Undercity", "地下城"], _
["The Arid Sea", "枯竭之海"], _
["surmia", "surmia"], _ ;未译
["Stone Carving", "石雕品"], _
["status", "status"], _ ;未译
["Stance", "态势"], _
["Signet", "纹章"], _
["Scroll", "Scroll"], _ ;未译
["region", "region"], _ ;未译
["Ranger", "Ranger"], _ ;未译
["Putrid Cysts", "腐败胞囊"], _
["Plague Idols", "瘟疫法器"], _
["Old Ascalon", "旧阿斯卡隆"], _
["NPC ID", "NPC ID"], _ ;未译
["Nebo Terrace", "尼伯山丘"], _
["Mesmer", "Mesmer"], _ ;未译
["Jahai Bluffs", "夏亥峭壁"], _
["Jadeite Shards", "硬玉"], _
["Issnur Isles", "伊斯诺岛"], _
["Hardened Humps", "硬瘤"], _
["Haiju Lagoon", "海幽泻湖"], _
["Gold Doubloon", "金古币"], _
["Flash ", "Flash "], _ ;未译
["Elite ", "Elite "], _ ;未译
["Dwarven Ales", "矮人啤酒"], _
["Decode", "Decode"], _ ;未译
["Cursed Lands", "诅咒之地"], _
["Camera", "Camera"], _ ;未译
["Baked Husks", "烧焦外壳s"], _
["Ancient Eyes", "远古之眼"], _
["Alpine Seeds", "柏木种子"], _
["##time", "##time"], _ ;未译
["Vial of Ink", "小瓶墨水"], _
["Steel Ingot", "钢铁矿石"], _
["Sanctum Cay", "神圣沙滩"], _
["Resign Log", "退出令统计"], _
["Primary Prof", "主职业"], _
["Normal Mode", "普通模式"], _
["Move to %s", "前往 %s"], _
["Lion's Arch", "狮子拱门"], _
["Jadeite Shard", "硬玉"], _
["Honur Hill", "霍奴尔丘陵"], _
["Fort Ranik", "瑞尼克要塞"], _
["Drake Kabob", "烤龙兽肉"], _
["Dajkah Inlet", "达卡港"], _
["Choose Hero", "选择英雄"], _
["Camp Rankor", "蓝口营地"], _
["Bone Palace", "白骨宫殿"], _
["Augury Rock", "占卜之石"], _
["The Jade Sea", "碧玉海"], _
["Tangle Root", "纠结之根"], _
["Talus Chute", "碎石坡道"], _
["Spider Legs", "蜘蛛腿s"], _
["Skree Wings", "鸟妖翅膀"], _
["Silent Surf", "寂静之浪"], _
["Riven Earth", "撕裂大地"], _
["Mount Qinkai", "今凯山"], _
["Marga Coast", "马加海岸"], _
["Lord Khobay", "领主库贝"], _
["Kraken Eyes", "海妖之眼"], _
["Kessex Peak", "凯席斯山"], _
["Kaineng City", "凯宁城"], _
["Jaya Bluffs", "蛇野断崖"], _
["Jade Quarry", "翡翠矿场"], _
["Drakkar Lake", "卓卡湖"], _
["Dragon Lich", "巫妖之龙"], _
["Calamitous", "卡拉米托斯"], _
["Bone Charms", "骨制护符"], _
["Black Pearls", "黑珍珠"], _
["Behemoth Jaw", "巨兽颚"], _
["Azure Crest", "湛蓝羽冠"], _
["title", "头衔"], _
["query", "query"], _ ;未译
["plane", "plane"], _ ;未译
["pcons", "pcons"], _ ;未译
["Waste", "Waste"], _ ;未译
["Trade", "Trade"], _ ;未译
["Timer", "Timer"], _ ;未译
["Skill", "技能"], _
["Show:", "Show:"], _ ;未译
["Ready", "Ready"], _ ;未译
["Range", "Range"], _ ;未译
["Quest", "Quest"], _ ;未译
["Port Sledge", "雪橇港"], _
["Owner", "Owner"], _ ;未译
["Olafstead", "欧拉夫之地"], _
["Ogden", "Ogden"], _ ;未译
["Maatu Keep", "麻都堡垒"], _
["Level", "Level"], _ ;未译
["Gloom", "Gloom"], _ ;未译
["Fav%d", "Fav%d"], _ ;未译
["Explorable", "探索区域"], _
["Clock", "Clock"], _ ;未译
["Clear", "Clear"], _ ;未译
["Candy Apple", "糖苹果"], _
["Bonds", "Bonds"], _ ;未译
["Bolt of Silk", "丝绸"], _
["Acolyte Jin", "侍从静"], _
["10 Scales", "10 鳞片"], _
["Verata", "死灵法师 芙瑞达"], _
["Sunqua Vale", "桑泉谷"], _
["Stormy Eye", "暴风之眼"], _
["Spell", "咒文魔法"], _
["Soul Stones", "灵魂石"], _
["Skull Juju", "头骨土符"], _
["Skelk Claws", "司怪爪"], _
["Skale Fins", "鳞怪鳍s"], _
["Shout", "战嚎"], _
["Sage Lands", "贤者领地"], _
["on %A", "on %A"], _ ;未译
["Naga Skins", "迦纳外皮"], _
["morah", "morah"], _ ;未译
["Mahgo Claw", "码果的爪"], _
["Luxon", "Luxon"], _ ;未译
["Krait Skins", "环蛇皮"], _
["Jotun Pelt", "角顿皮毛"], _
["Index", "Index"], _ ;未译
["Guild", "Guild"], _ ;未译
["Glyph", "符号"], _
["Gloom Seed", "黑暗种子"], _
["Forgewight", "炼冶维特"], _
["flags", "flags"], _ ;未译
["Debug", "Debug"], _ ;未译
["daily", "daily"], _ ;未译
["Chant", "圣歌"], _
["Archipelagos", "群岛"], _
["Amber Chunks", "琥珀"], _
["alias", "alias"], _ ;未译
["##end", "##end"], _ ;未译
[" v%s ", " v%s "], _ ;未译
["cupcake", "生日杯子蛋糕"], _
["Zen Daijun", "祯台郡"], _
["Yak's Bend", "牦牛村"], _
["The Hunt", "猎杀碎片狼"], _
["Take quest", "接任务"], _
["Resigned", "已发退出令"], _
["Mountains", "双头龙山"], _
["Holy Veil", "神圣遮罩"], _
["Hard Mode", "困难模式"], _
["Golden Egg", "金鸡蛋"], _
["Candy Corn", "粟米糖"], _
["Build Name", "样本名"], _
["Amber Chunk", "琥珀"], _
["@ Guild", "@ 公会频道"], _
["10 Bones", "10 骨头"], _
["$ Trade", "$ 交易频道"], _
["# Group", "# 队伍频道"], _
["Z'him Monns", "晶蒙"], _
["Snake Dance", "蛇舞"], _
["Selvetarm", "希维塔姆"], _
["Reed Bog", "芦苇沼泽地"], _
["Naga Hides", "纳迦皮"], _
["Moon Shells", "月贝"], _
["Dragon Root", "龙根"], _
["Charr Hide", "夏尔皮"], _
["Anvil Rock", "铁砧石"], _
["name", "name"], _ ;未译
["greenrock", "绿冰糖"], _
["city", "city"], _ ;未译
["Wilds, The", "荒原"], _
["Veil", "Veil"], _ ;未译
["UW Teles", "地下传送"], _
["Type", "Type"], _ ;未译
["Time", "Time"], _ ;未译
["Send##2", "发送##2"], _
["Send##1", "发送##1"], _
["Save Now", "即刻存档"], _
["Rata Sum", "洛达顶点"], _
["Nundu Bay", "纳度湾"], _
["Name", "Name"], _ ;未译
["Move", "Move"], _ ;未译
["Mode", "Mode"], _ ;未译
["Mnts", "Mnts"], _ ;未译
["Miku", "Miku"], _ ;未译
["Load Now", "即刻装填"], _
["Left", "Left"], _ ;未译
["Item", "Item"], _ ;未译
["H#%d", "H#%d"], _ ;未译
["Fur Square", "毛皮"], _
["Down", "Down"], _ ;未译
["City", "City"], _ ;未译
["Cancelled", "已取消"], _
["Beetletun", "甲虫镇"], _
["Arborstone", "亭石"], _
["Wiki", "Wiki"], _ ;未译
["View", "View"], _ ;未译
["Trap", "陷阱"], _
["The Falls", "陷落区"], _
["The Breach", "缺口"], _
["Slot", "Slot"], _ ;未译
["Silverwood", "银树"], _
["Salt Flats", "盐滩"], _
["runs", "runs"], _ ;未译
["Rotscale", "恶臭骨龙"], _
["Rank", "Rank"], _ ;未译
["Prof", "Prof"], _ ;未译
["Monk", "Monk"], _ ;未译
["Icy Humps", "冰雪瘤"], _
["Form", "形态"], _
["Fendi Nin", "梵蒂宁"], _
["fake", "fake"], _ ;未译
["Echo", "回响"], _
["done", "done"], _ ;未译
["Date", "Date"], _ ;未译
["blue", "blue"], _ ;未译
["Attr", "Attr"], _ ;未译
["Arbor Bay", "安博湾"], _
[") : ", ") : "], _ ;未译
["essence", "敏捷精华"], _
["disabled", "已关闭"], _
["bluerock", "蓝冰糖"], _
["Widgets:", "配件:"], _
["Tahlkora", "塔蔻菈"], _
["Sifhalla", "袭哈拉"], _
["Sapphire", "蓝宝石"], _
["Press key", "按键"], _
["Materials", "材料"], _
["Deep, The", "深处"], _
["American", "北美洲"], _
["! All", "! 地区频道"], _
["Dry Top", "干燥高地"], _
["Ascalon", "阿斯卡隆"], _
["Arachni", "奥拉赫妮"], _
["salad", "伊波枷沙拉"], _
["redrock", "红冰糖"], _
["lunars", "命运锦囊"], _
["enabled", "已启动"], _
["distance", "距离"], _
["Wastes", "荒凉冰地"], _
["SkillID", "技能号"], _
["Settings", "设置"], _
["Rotation", "面向"], _
["Planes", "混沌平原"], _
["Melonni", "梅隆妮"], _
["Kamadan", "卡玛丹"], _
["Dunkoro", "唐克罗"], _
["Distance", "距离"], _
["Diamond", "金刚石"], _
["Cavalon", "卡瓦隆"], _
["Undead", "不死族 "], _
["The Scar", "断崖"], _
["Magmus", "麦格默斯"], _
["Khabuus", "卡布斯"], _
["Kanaxai", "加奈赛"], _
["Ice Floe", "浮冰"], _
["Ferndale", "蕨谷"], _
["minutes", "分钟"], _
["kabob", "烤龙兽肉"], _
["grail", "力量圣杯"], _
["count", "个数统计"], _
["channel", "频道"], _
["armor", "救赎防具"], _
["alcohol", "酒水"], _
["Zenmai", "刃玛伊"], _
["Xandra", "珊卓亚"], _
["Unknown", "不明"], _
["Olias", "奥里亚斯"], _
["Notepad", "便笺"], _
["Move to", "前往"], _
["Hotkeys", "快键"], _
["Channel", "频道"], _
["Truffle", "松露"], _
["Icedome", "冰顶"], _
["Herring", "鲱鱼"], _
["Cerris", "瑟瑞丝"], _
["Bandits", "草寇"], _
["soup", "鳞怪鳍汤"], _
["seconds", "秒"], _
["offset", "差位"], _
["minute", "分钟"], _
["mapid", "地图号"], _
["apple", "糖苹果"], _
["Reward", "奖励"], _
["Recall", "回归"], _
["Pools", "孵化池"], _
["Pits", "骷髅墓穴"], _
["Livia", "莉薇亚"], _
["Height", "高度"], _
["Health", "体力"], _
["Delete", "删除"], _
["Cancel", "取消"], _
["Builds", "样本"], _
["Addr", "内存地址"], _
["Kryta", "科瑞塔"], _
["Kourna", "高楠"], _
["Istan", "艾斯坦"], _
["Fenrir", "芬瑞"], _
["second", "秒"], _
["hours", "小时"], _
["corn", "粟米糖"], _
["Width", "宽度"], _
["Vale", "遗忘谷"], _
["Urgoz", "尔果"], _
["Start", "开始"], _
["Ruby", "红宝石"], _
["Razah", "雷萨"], _
["Pcons", "补品"], _
["Norgu", "诺古"], _
["Kahmu", "卡慕"], _
["Hayda", "海妲"], _
["Goren", "高恩"], _
["Dhuum", "多姆"], _
["Close", "关闭"], _
["Build", "样本"], _
["Anton", "安托"], _
["Vabbi", "瓦贝"], _
["Geode", "晶石"], _
["Charr", "夏尔"], _
["open", "打开"], _
["mode", "模式"], _
["hour", "小时"], _
["Vekk", "维克"], _
["Send", "发送"], _
["Load", "装填"], _
["Koss", "寇斯"], _
["Jora", "乔拉"], _
["Info", "数据"], _
["Help", "说明"], _
["Deep", "深处"], _
["days", "天"], _
["Lab", "迷宫"], _
["Take", "接"], _
["Gwen", "关"] _
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
			$lData = StringReplace($lData, chr(34) & $ConversionTable[$i][0] & chr(34), "u8" & chr(34) & $ConversionTable[$i][1]  & chr(34), 0, $STR_NOCASESENSE)
            ;替换过程中，以下指令会罔顾字条两端要有双引号的要求。或该用 stringregexpreplace 并 设定 词界。---> 但是，或需处理搜索词内的括号 <---
			;---> 词界 \b 被 空格 所替代了 <---
            ;$lData = StringRegExpReplace($lData, "(?)\b" & chr(34) & $ConversionTable[$i][0] & chr(34) & "\b", ' u8' & chr(34) & $ConversionTable[$i][1]  & chr(34) & " ")
        endif
	Next
	return $lData
EndFunc
