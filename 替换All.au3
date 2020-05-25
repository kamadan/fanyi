#include-once
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <Array.au3>
#include <File.au3>
#include <WinAPI.au3>
;已被部分翻译，但未完全翻译的字条不算“未译”
Local $ConversionTable[3347][2] = [ _
["Model ID is unique for each kind of agent.\nIt is static and shared by the same agents.\nWhen targeting players, this is Player ID instead, unique for each player in the instance.\nFor the purpose of targeting hotkeys and commands, use this value", "Model ID is unique for each kind of agent.\nIt is static and shared by the same agents.\nWhen targeting players, this is Player ID instead, unique for each player in the instance.\nFor the purpose of targeting hotkeys and commands, use this value"], _ ;未译
["Regular expressions allow you to specify wildcards and express more.\nThe syntax is described at www.cplusplus.com/reference/regex/ECMAScript\nNote that the whole message needs to be matched, so for example you might want .* at the end.", "Regular expressions allow you to specify wildcards and express more.\nThe syntax is described at www.cplusplus.com/reference/regex/ECMAScript\nNote that the whole message needs to be matched, so for example you might want .* at the end."], _ ;未译
["Salvaging items with lesser salvage kits produce less materials.\nSalvaging items with superior salvage kits can produce rare materials.\n\nCtrl + clicking on a normal Salvage Kit will still allow you to use Salvage All.", "Salvaging items with lesser salvage kits produce less materials.\nSalvaging items with superior salvage kits can produce rare materials.\n\nCtrl + clicking on a normal Salvage Kit will still allow you to use Salvage All."], _ ;未译
["'/load [build template|build name] [Hero index]' loads a build via Guild Wars builds. The build name must be between quotes if it contains spaces. First Hero index is 1, last is 7. Leave out for player", "'/load [build template|build name] [Hero index]' loads a build via Guild Wars builds. The build name must be between quotes if it contains spaces. First Hero index is 1, last is 7. Leave out for player"], _ ;未译
["'/loadbuild [teambuild] <build name|build code>' loads a build via GWToolbox Builds window. Does a partial search on team build name/build name/build code. Matches current player's profession.", "'/loadbuild [teambuild] <build name|build code>' loads a build via GWToolbox Builds window. Does a partial search on team build name/build name/build code. Matches current player's profession."], _ ;未译
["'/load [build template|build name] [Hero index]' loads a build. The build name must be between quotes if it contains spaces. First Hero index is 1, last is 7. Leave out for player", "'/load [build template|build name] [Hero index]' loads a build. The build name must be between quotes if it contains spaces. First Hero index is 1, last is 7. Leave out for player"], _ ;未译
["Failed to load d3dx9_xx.dll; this machine may not have DirectX runtime installed.\nGWToolbox++ needs this installed to continue.\n\nVisit DirectX Redistributable download page?", "Failed to load d3dx9_xx.dll; this machine may not have DirectX runtime installed.\nGWToolbox++ needs this installed to continue.\n\nVisit DirectX Redistributable download page?"], _ ;未译
["This module is responsible for salvaging and identifying functions either by ctrl + clicking on a salvage or identification kit, or by using the command /salvage <type>", "This module is responsible for salvaging and identifying functions either by ctrl + clicking on a salvage or identification kit, or by using the command /salvage <type>"], _ ;未译
["The Twitch username of the person who's channel you want to connect to.\nEnter your own Twitch username here to receive messages from your channel whilst streaming.", "The Twitch username of the person who's channel you want to connect to.\nEnter your own Twitch username here to receive messages from your channel whilst streaming."], _ ;未译
["Each agent has this value removed on the border and added at the center\nZero makes agents have solid color, while a high number makes them appear more shaded.", "Each agent has this value removed on the border and added at the center\nZero makes agents have solid color, while a high number makes them appear more shaded."], _ ;未译
["Each symbol has this value removed on the border and added at the center\nZero makes them have solid color, while a high number makes them appear more shaded.", "Each symbol has this value removed on the border and added at the center\nZero makes them have solid color, while a high number makes them appear more shaded."], _ ;未译
["Note: custom markers are stored in 'Markers.ini' in settings folder. You can share the file with other players or paste other people's markers into it.", "Note: custom markers are stored in 'Markers.ini' in settings folder. You can share the file with other players or paste other people's markers into it."], _ ;未译
["So, you have passed through the depths of the Jade Sea, and into the nightmare realm. It is too bad that I must send you back from whence you came.", "So, you have passed through the depths of the Jade Sea, and into the nightmare realm. It is too bad that I must send you back from whence you came."], _ ;未译
["What gives you the right to enter my lair? I shall kill you for your audacity, after I destroy your mind with my horrifying visions, of course.", "What gives you the right to enter my lair? I shall kill you for your audacity, after I destroy your mind with my horrifying visions, of course."], _ ;未译
["When you have less than this amount:\n-The number in the interface becomes yellow.\n-Warning message is displayed when zoning into outpost.", "When you have less than this amount:\n-The number in the interface becomes yellow.\n-Warning message is displayed when zoning into outpost."], _ ;未译
["In the commands above, <name> is the title of the window as shown in the title bar. For example, try '/hide settings' and '/show settings'.", "In the commands above, <name> is the title of the window as shown in the title bar. For example, try '/hide settings' and '/show settings'."], _ ;未译
["Displays the health of the target.\nMax health is only computed and refreshed when you directly damage or heal your target", "Displays the health of the target.\nMax health is only computed and refreshed when you directly damage or heal your target"], _ ;未译
["Displays the distance to your target.\n1010 = Earshot / Aggro\n1248 = Cast range\n2500 = Spirit range\n5000 = Radar range", "Displays the distance to your target.\n1010 = Earshot / Aggro\n1248 = Cast range\n2500 = Spirit range\n5000 = Radar range"], _ ;未译
["Only trade alerts will be visible in the trade channel.\nYou can still view all Kamadan trade messages via Trade window.", "Only trade alerts will be visible in the trade channel.\nYou can still view all Kamadan trade messages via Trade window."], _ ;未译
["Agent ID is unique for each agent in the instance,\nIt's generated on spawn and will change in different instances.", "Agent ID is unique for each agent in the instance,\nIt's generated on spawn and will change in different instances."], _ ;未译
["Additional pings on the same agents will increase the duration of the existing ping, rather than create a new one.", "Additional pings on the same agents will increase the duration of the existing ping, rather than create a new one."], _ ;未译
["Messages from NPCs that would normally show on-screen and in team chat are instead redirected to the emote channel", "Messages from NPCs that would normally show on-screen and in team chat are instead redirected to the emote channel"], _ ;未译
["Automatically send a second message after the build template in team chat,\nshowing the pcons that the build uses.", "Automatically send a second message after the build template in team chat,\nshowing the pcons that the build uses."], _ ;未译
["Note: theme is stored in 'Theme.ini' in settings folder. You can share the file or parts of it with other people.", "Note: theme is stored in 'Theme.ini' in settings folder. You can share the file or parts of it with other people."], _ ;未译
["Cross over, children. All are welcome. All welcome. Go into the light. There is peace and serenity in the light.", "Cross over, children. All are welcome. All welcome. Go into the light. There is peace and serenity in the light."], _ ;未译
["As soon as final objective is complete, send /age command to game server to receive server-side completion time.", "As soon as final objective is complete, send /age command to game server to receive server-side completion time."], _ ;未译
["Tick to remember pcon enable/disable per character.\nUntick to enable/disable regardless of current character.", "Tick to remember pcon enable/disable per character.\nUntick to enable/disable regardless of current character."], _ ;未译
["Is it comforting to know the source of your fears? Or do you fear more now that you see them in front of you.", "Is it comforting to know the source of your fears? Or do you fear more now that you see them in front of you."], _ ;未译
["Are you sure?\nThis will reset all agent colors to the default values.\nThis operation cannot be undone.\n\n", "Are you sure?\nThis will reset all agent colors to the default values.\nThis operation cannot be undone.\n\n"], _ ;未译
["You mortals may be here to defeat me, but acknowledging my presence only makes the nightmare grow stronger.", "You mortals may be here to defeat me, but acknowledging my presence only makes the nightmare grow stronger."], _ ;未译
["As soon as a vanquish is complete, send /age command to game server to receive server-side completion time.", "As soon as a vanquish is complete, send /age command to game server to receive server-side completion time."], _ ;未译
["Show the damage done by each player in your party.\nOnly works on the damage done within your radar range.", "Show the damage done by each player in your party.\nOnly works on the damage done within your radar range."], _ ;未译
["Map file is unique for each pathing map (e.g. used by minimap).\nMany different maps use the same map file", "Map file is unique for each pathing map (e.g. used by minimap).\nMany different maps use the same map file"], _ ;未译
["There's a reason there's a festival ticket in my ear. I'm trying to lure the evil spirits out of my head.", "There's a reason there's a festival ticket in my ear. I'm trying to lure the evil spirits out of my head."], _ ;未译
["Mommy? Where are you? I can't find you. I can't. I'm afraid of the light, mommy. I'm afraid of the light.", "Mommy? Where are you? I can't find you. I can't. I'm afraid of the light, mommy. I'm afraid of the light."], _ ;未译
["Keep a record or your runs in JSON format on disk, and load past runs from disk when starting GWToolbox.", "Keep a record or your runs in JSON format on disk, and load past runs from disk when starting GWToolbox."], _ ;未译
["When you write a message starting with 'http://' or 'https://', it will be converted in template format", "When you write a message starting with 'http://' or 'https://', it will be converted in template format"], _ ;未译
["'/flag [all|clear|<number>]' to flag a hero in the minimap (same as using the buttons by the minimap).", "'/flag [all|clear|<number>]' to flag a hero in the minimap (same as using the buttons by the minimap)."], _ ;未译
["Unticking will completely disable a feature from initializing and running. Requires Toolbox restart.", "Unticking will completely disable a feature from initializing and running. Requires Toolbox restart."], _ ;未译
["<town> can be any of: doa, kamadan/kama, embark, vlox, gadds, urgoz, deep, gtob, fav1, fav2, fav3.\n", "<town> can be any of: doa, kamadan/kama, embark, vlox, gadds, urgoz, deep, gtob, fav1, fav2, fav3.\n"], _ ;未译
["I will fill your hearts with visions of horror and despair that will haunt you for all of your days.", "I will fill your hearts with visions of horror and despair that will haunt you for all of your days."], _ ;未译
["Note: the names of the widgets without a visible title bar are the same as in the setting headers below.", "Note: the names of the 配件 without a visible title bar are the same as in the setting headers below."], _
["Failed to find and download the file 'discord_game_sdk.dll'. To try again, please restart GWToolbox", "Failed to find and download the file 'discord_game_sdk.dll'. To try again, please restart GWToolbox"], _ ;未译
["Allows other players to join you when in an outpost,\nalso shows current party status e.g. (3 of 8)", "Allows other players to join you when in an outpost,\nalso shows current party status e.g. (3 of 8)"], _ ;未译
["<equipped_item> options: armor, head, chest, legs, boots, gloves, offhand, weapon, weapons, costume", "<equipped_item> options: armor, head, chest, legs, boots, gloves, offhand, weapon, weapons, costume"], _ ;未译
["You are messing with affairs that are beyond your comprehension. Leave now and I may let you live!", "You are messing with affairs that are beyond your comprehension. Leave now and I may let you live!"], _ ;未译
["Then the healer told me that BOTH my eyes were lazy. And that's why it was the best summer ever!", "Then the healer told me that BOTH my eyes were lazy. And that's why it was the best summer ever!"], _ ;未译
["Click on a daily quest to get notified when its coming up. Subscribed quests are highlighted in ", "Click on a daily quest to get notified when its coming up. Subscribed quests are highlighted in "], _ ;未译
["'/travel <town> [dis]', '/tp <town> [dis]' or '/to <town> [dis]' to travel to a destination. \n", "'/travel <town> [dis]', '/tp <town> [dis]' or '/to <town> [dis]' to travel to a destination. \n"], _ ;未译
["The hotkey can only trigger when player is the selected primary profession (0 = Any profession)", "The hotkey can only trigger when player is the selected primary profession (0 = Any profession)"], _ ;未译
["Keys and lockpicks drop at four times the usual rate and double Lucky and Unlucky title points", "Keys and lockpicks drop at four times the usual rate and double Lucky and Unlucky title points"], _ ;未译
["Will actually disable any *change*, so make sure you're not drunk already when enabling this!", "Will actually disable any *change*, so make sure you're not drunk already when enabling this!"], _ ;未译
["Such fools to think you can attack me here. Come closer so you can see the face of your doom!", "Such fools to think you can attack me here. Come closer so you can see the face of your doom!"], _ ;未译
["'/transmotarget <npc_name> [size (6-255)]' to change your target's appearance into an NPC.\n", "'/transmotarget <npc_name> [size (6-255)]' to change your target's appearance into an NPC.\n"], _ ;未译
["'/transmoparty <npc_name> [size (6-255)]' to change your party's appearance into an NPC.\n", "'/transmoparty <npc_name> [size (6-255)]' to change your party's appearance into an NPC.\n"], _ ;未译
["Sending a whisper to this name will send the message to Twitch.\nCannot contain spaces.", "Sending a whisper to this name will send the message to Twitch.\nCannot contain spaces."], _ ;未译
["Only works in an explorable area. Only works on NPCs; not enemies, minions or spirits.", "Only works in an explorable area. Only works on NPCs; not enemies, minions or spirits."], _ ;未译
["Display a number on the bottom of each pcon icon, showing total quantity in storage.\n", "Display a number on the bottom of each pcon icon, showing total quantity in storage.\n"], _ ;未译
["Allows GWToolbox to send & receive messages with Twitch using the in-game chat window.", "Allows GWToolbox to send & receive messages with Twitch using the in-game chat window."], _ ;未译
["Abaddon's sword has been drawn. He sends me back to you with tokens of renewed power!", "Abaddon's sword has been drawn. He sends me back to you with tokens of renewed power!"], _ ;未译
["- You can apply arithmetic operators +,*,/ on numerical values. Use +- to subtract.\n", "- You can apply arithmetic operators +,*,/ on numerical values. Use +- to subtract.\n"], _ ;未译
["When triggered, this hotkey will prevent Guild Wars from receiving the keypress event", "When triggered, this hotkey will prevent Guild Wars from receiving the keypress event"], _ ;未译
["Include a concise description of your equipped weapon when ctrl+clicking a weapon set", "Include a concise description of your equipped weapon when ctrl+clicking a weapon set"], _ ;未译
["Using level 1 alcohol instead of this is recommended for preventing drunk emotes.\n", "Using level 1 alcohol instead of this is recommended for preventing drunk emotes.\n"], _ ;未译
["Show NPCs that aren't usually visible on the minimap\ne.g. minipets, invisible NPCs", "Show NPCs that aren't usually visible on the minimap\ne.g. minipets, invisible NPCs"], _ ;未译
["Pcons not loaded: %s.\nOnly pcons visible in the Pcons window will be auto enabled.", "Pcons not loaded: %s.\nOnly pcons visible in the Pcons window will be auto enabled."], _ ;未译
["The Agent to which this threshold will be applied. Optional. Leave 0 for any agent", "The Agent to which this threshold will be applied. Optional. Leave 0 for any agent"], _ ;未译
["Schools are closed, my kids are driving me mad and I just want to play Guild Wars!", "Schools are closed, my kids are driving me mad and I just want to play Guild Wars!"], _ ;未译
["ERROR: Failed to parse incoming trade message in TradeWindow::parse_json_message\n", "ERROR: Failed to parse incoming trade message in TradeWindow::parse_json_message\n"], _ ;未译
["This is the color at the edge, the color in the middle is the same, with alpha-50", "This is the color at the edge, the color in the middle is the same, with alpha-50"], _ ;未译
["Adds special NPCs to the Allies section of the party window within compass range.", "Adds special NPCs to the Allies section of the party window within compass range."], _ ;未译
["Below, <xyz> denotes an argument, use an appropriate value without the quotes.\n", "Below, <xyz> denotes an argument, use an appropriate value without the quotes.\n"], _ ;未译
["It is needed to prevent toolbox from using a pcon twice, before it activates.\n", "It is needed to prevent toolbox from using a pcon twice, before it activates.\n"], _ ;未译
["Enabled: Using Control+Click on an item in inventory with storage chest open,\n", "Enabled: Using Control+Click on an item in inventory with storage chest open,\n"], _ ;未译
["Execute a single task such as opening chests\nor reapplying lightbringer title", "Execute a single task such as opening chests\nor reapplying lightbringer title"], _ ;未译
["Clicking on template that has a URL as name will open that URL in your browser", "Clicking on template that has a URL as name will open that URL in your browser"], _ ;未译
["'/camera fov <value>' sets the field of view. '/camera fov' resets to default.", "'/camera fov <value>' sets the field of view. '/camera fov' resets to default."], _ ;未译
["Open it by typing running %LOCALAPPDATA% and looking for GWToolboxpp folder\n", "Open it by typing running %LOCALAPPDATA% and looking for GWToolboxpp folder\n"], _ ;未译
["I like how they've decorated this place. The talking lights are a nice touch.", "I like how they've decorated this place. The talking lights are a nice touch."], _ ;未译
["After this amount of time, each player recent damage (blue bar) will be reset", "After this amount of time, each player recent damage (blue bar) will be reset"], _ ;未译
["'Allies' meaning the ones that show in party window, such as summoning stones", "'Allies' meaning the ones that show in party window, such as summoning stones"], _ ;未译
["'/transmo <npc_name> [size (6-255)]' to change your appearance into an NPC.\n", "'/transmo <npc_name> [size (6-255)]' to change your appearance into an NPC.\n"], _ ;未译
["After using a pcon, toolbox will not use it again for this amount of time.\n", "After using a pcon, toolbox will not use it again for this amount of time.\n"], _ ;未译
["Receive a message in the chat window when a viewer leaves the Twitch Channel", "Receive a message in the chat window when a viewer leaves the Twitch Channel"], _ ;未译
["'Working from home' is just a good excuse to play video games during the day", "'Working from home' is just a good excuse to play video games during the day"], _ ;未译
["'/removefriend <character_name|alias>' Remove character to your friend list.", "'/removefriend <character_name|alias>' Remove character to your friend list."], _ ;未译
["Toolbox normally loads settings on launch.\nClick to re-load from disk now.", "Toolbox normally loads settings on launch.\nClick to re-load from disk now."], _ ;未译
["'/damage <number>' sends the damage of a party member (e.g. '/damage 3').\n", "'/damage <number>' sends the damage of a party member (e.g. '/damage 3').\n"], _ ;未译
["Untick to skip salvagable rare materials when checking for salvagable items", "Untick to skip salvagable rare materials when checking for salvagable items"], _ ;未译
["Receive a message in the chat window when a viewer joins the Twitch Channel", "Receive a message in the chat window when a viewer joins the Twitch Channel"], _ ;未译
["GWToolbox will save and maintain the FOV setting used with /cam fov <value>", "GWToolbox will save and maintain the FOV setting used with /cam fov <value>"], _ ;未译
["Failed to load discord_game_sdk.dll. To try again, please restart GWToolbox", "Failed to load discord_game_sdk.dll. To try again, please restart GWToolbox"], _ ;未译
["Toolbox will save your location every second in a file in Settings Folder.", "Toolbox will save your location every second in a file in Settings Folder."], _ ;未译
["Setting your status to offline in friend list hides your info from Discord", "Setting your status to offline in friend list hides your info from Discord"], _ ;未译
["Initialize Failed at finding all addresses, contact Developers about this.", "Initialize Failed at finding all addresses, contact Developers about this."], _ ;未译
["Ticking in party window will work as a toggle instead of opening the menu", "Ticking in party window will work as a toggle instead of opening the menu"], _ ;未译
["Bond order is based on your build. Check this to flip them left <-> right", "Bond order is based on your build. Check this to flip them left <-> right"], _ ;未译
["Speech bubbles from NPCs and Heroes will appear as emote messages in chat", "Speech bubbles from NPCs and Heroes will appear as emote messages in chat"], _ ;未译
["Only apply if this skill is on your bar. Optional. Leave 0 for any skills", "Only apply if this skill is on your bar. Optional. Leave 0 for any skills"], _ ;未译
["Knew I should have put shares into the paracetamol stock market this year", "Knew I should have put shares into the paracetamol stock market this year"], _ ;未译
["Disabled: Item will be stored into any available stack/slot in the chest.", "Disabled: Item will be stored into any available stack/slot in the chest."], _ ;未译
["We can't determine if the character is ingame.\nContact the developpers.", "We can't determine if the character is ingame.\nContact the developpers."], _ ;未译
["GWToolbox is fetching new trade messages from Trade chat in this outpost", "GWToolbox is fetching new trade messages from Trade chat in this outpost"], _ ;未译
["Click to load builds to heroes and player. Ctrl + Click to send to chat.", "Click to load builds to heroes and player. Ctrl + Click to send to chat."], _ ;未译
["Automatically return party to outpost on party wipe if player is leading", "Automatically return party to outpost on party wipe if player is leading"], _ ;未译
["Will hide drunk and lunars messages on top of your and other characters", "Will hide drunk and lunars messages on top of your and other characters"], _ ;未译
["Each hostile agent has this value subtracted from it when under 90% HP.", "Each hostile agent has this value subtracted from it when under 90% HP."], _ ;未译
["'/tb quit' or '/tb exit' completely closes toolbox and all its windows.", "'/tb quit' or '/tb exit' completely closes toolbox and all its windows."], _ ;未译
["'/borderless [on|off]' toggles, enables or disables borderless window.", "'/borderless [on|off]' toggles, enables or disables borderless window."], _ ;未译
["ERROR: Failed to parse res JSON from response in ws_window->dispatch\n", "ERROR: Failed to parse res JSON from response in ws_window->dispatch\n"], _ ;未译
["[a|b] denotes an optional argument, in this case nothing, 'a' or 'b'.", "[a|b] denotes an optional argument, in this case nothing, 'a' or 'b'."], _ ;未译
["'/tb reset' moves Toolbox and Settings window to the top-left corner.", "'/tb reset' moves Toolbox and Settings window to the top-left corner."], _ ;未译
["'/flag [all|<number>] [x] [y]' to flag a hero to coordinates [x],[y].", "'/flag [all|<number>] [x] [y]' to flag a hero to coordinates [x],[y]."], _ ;未译
["Used to connect to Twitch.\ne.g. oauth:3fplxiscsq1550zdkf8z2kh1jk7mqs", "Used to connect to Twitch.\ne.g. oauth:3fplxiscsq1550zdkf8z2kh1jk7mqs"], _ ;未译
["Use chat command /deep24h to toggle this module on or off at any time", "Use chat command /deep24h to toggle this module on or off at any time"], _ ;未译
["Toolbox normally saves settings on exit.\nClick to save to disk now.", "Toolbox normally saves settings on exit.\nClick to save to disk now."], _ ;未译
["The hotkey will only trigger within this range.\nUse 0 for no limit.", "The hotkey will only trigger within this range.\nUse 0 for no limit."], _ ;未译
["The Agent to which this custom attributes will be applied. Required.", "The Agent to which this custom attributes will be applied. Required."], _ ;未译
["Log and dump files have been created in the GWToolbox data folder.\n", "Log and dump files have been created in the GWToolbox data folder.\n"], _ ;未译
["It will automaticly withdraw and deposit gold while buying materials", "It will automaticly withdraw and deposit gold while buying materials"], _ ;未译
["'/transmoparty' to change your party's appearance into target NPC.\n", "'/transmoparty' to change your party's appearance into target NPC.\n"], _ ;未译
["If disabled, you can move/resize the window with 'Unlock Move All'.", "If disabled, you can move/resize the window with 'Unlock Move All'."], _ ;未译
["'/chest' opens xunlai in outposts and locked chests in explorables.", "'/chest' opens xunlai in outposts and locked chests in explorables."], _ ;未译
["<npc_name> options: eye, zhu, kuunavang, beetle, polar, celepig, \n", "<npc_name> options: eye, zhu, kuunavang, beetle, polar, celepig, \n"], _ ;未译
["Will close the travel window when clicking on a travel destination", "Will close the travel window when clicking on a travel destination"], _ ;未译
["We must prepare for the coming of Banjo the Clown, God of Puppets.", "We must prepare for the coming of Banjo the Clown, God of Puppets."], _ ;未译
["Enabling or disabling pcons will also Tick or Untick in party list", "Enabling or disabling pcons will also Tick or Untick in party list"], _ ;未译
["Nothing like a global pandemic to bring people togeth-- nevermind.", "Nothing like a global pandemic to bring people togeth-- nevermind."], _ ;未译
["Even if you banish me from your sight, I will remain in your mind.", "Even if you banish me from your sight, I will remain in your mind."], _ ;未译
["Double Kurzick and Luxon title track points for exchanging faction", "Double Kurzick and Luxon title track points for exchanging faction"], _ ;未译
["'/busy' or '/dnd' Set your friend list status to 'Do Not Disturb'.", "'/busy' or '/dnd' Set your friend list status to 'Do Not Disturb'."], _ ;未译
["'/addfriend <character_name>' Add a character to your friend list.", "'/addfriend <character_name>' Add a character to your friend list."], _ ;未译
["This will prevent kneel, bored, moan, flex, fistshake and roar.\n", "This will prevent kneel, bored, moan, flex, fistshake and roar.\n"], _ ;未译
["CTRL+Click or Double Click on a slider or drag box to input text.", "CTRL+Click or Double Click on a slider or drag box to input text."], _ ;未译
["Double Asura, Deldrimor, Ebon Vanguard, or Norn reputation points", "Double Asura, Deldrimor, Ebon Vanguard, or Norn reputation points"], _ ;未译
["Automatically load pcons for a build when loaded onto a character", "Automatically load pcons for a build when loaded onto a character"], _ ;未译
["Double Balthazar and Imperial faction in the Jade Quarry and Fort Aspenwood", "Double Balthazar and Imperial faction in the 翡翠矿场 and 杨木要塞"], _
["You can set the color alpha to 0 to disable any minimap feature.", "You can set the color alpha to 0 to disable any minimap feature."], _ ;未译
["Toolbox minimap will not capture mouse events when in an outpost", "Toolbox minimap will not capture mouse events when in an outpost"], _ ;未译
["I don't really know what to do, sorry, contact the developers.\n", "I don't really know what to do, sorry, contact the developers.\n"], _ ;未译
["'Player x might not reply because his/her status is set to away'", "'Player x might not reply because his/her status is set to away'"], _ ;未译
["try to deposit item into the currently displayed storage pane.\n", "try to deposit item into the currently displayed storage pane.\n"], _ ;未译
["Salvage flagged as complete, but item still exists in slot %d/%d", "Salvage flagged as complete, but item still exists in slot %d/%d"], _ ;未译
["Only if your friend's alias is different to their character name", "Only if your friend's alias is different to their character name"], _ ;未译
["I am Kanaxai, creator of nightmares. Let me make yours into reality.", "I am 加奈赛, creator of nightmares. Let me make yours into reality."], _
["Toolbox will disable a pcon if it is not found in the inventory", "Toolbox will disable a pcon if it is not found in the inventory"], _ ;未译
["The map where it will be applied. Optional. Leave 0 for any map", "The map where it will be applied. Optional. Leave 0 for any map"], _ ;未译
["Do you like my fish balloon? Can you hear it singing to you...?", "Do you like my fish balloon? Can you hear it singing to you...?"], _ ;未译
["You can still view Kamadan trade chat via the main Trade Window", "You can still view Kamadan trade chat via the main Trade Window"], _ ;未译
["https://api.github.com/repos/HasKha/GWToolboxpp/releases/tags/", "https://api.github.com/repos/HasKha/GWToolboxpp/releases/tags/"], _ ;未译
["Use the skill number instead of <skill> (e.g. '/useskill 5'). ", "Use the skill number instead of <skill> (e.g. '/useskill 5'). "], _ ;未译
["Show the bonds maintained by you.\nOnly works on human players", "Show the bonds maintained by you.\nOnly works on human players"], _ ;未译
["Human sacrifice. Dogs and cats living together. Mass hysteria!", "Human sacrifice. Dogs and cats living together. Mass hysteria!"], _ ;未译
["(a|b) denotes a mandatory argument, in this case 'a' or 'b'.\n", "(a|b) denotes a mandatory argument, in this case 'a' or 'b'.\n"], _ ;未译
["Show messages from your Kamadan ae1 Trade Chat in Trade Window", "Show messages from your Kamadan ae1 Trade Chat in Trade Window"], _ ;未译
["Note: Salvage All will only salvage items that are identified.", "Note: Salvage All will only salvage items that are identified."], _ ;未译
["Double Balthazar faction and Gladiator title points in Random Arenas", "Double Balthazar faction and Gladiator title points in 随机竞技场"], _
["  destroyer, koss, bonedragon, smite, kanaxai, skeletonic, moa", "  destroyer, koss, bonedragon, smite, kanaxai, skeletonic, moa"], _ ;未译
["The hotkey will only trigger in this map.\nUse 0 for any map.", "The hotkey will only trigger in this map.\nUse 0 for any map."], _ ;未译
["Alpha channel (0 - 255)\n0 is transparent, 255 is solid color", "Alpha channel (0 - 255)\n0 is transparent, 255 is solid color"], _ ;未译
["Will show a tickbox in the pcons window when in an elite area", "Will show a tickbox in the pcons window when in an elite area"], _ ;未译
["Toolbox will refill pcons from storage if below the threshold", "Toolbox will refill pcons from storage if below the threshold"], _ ;未译
["The hotkey can only trigger in the selected map (0 = Any map)", "The hotkey can only trigger in the selected map (0 = Any map)"], _ ;未译
["Stay away from crowded places? You mean like Kamadan? No way!", "Stay away from crowded places? You mean like Kamadan? No way!"], _ ;未译
["https://www.microsoft.com/en-us/download/details.aspx?id=8109", "https://www.microsoft.com/en-us/download/details.aspx?id=8109"], _ ;未译
["ERROR: Failed to parse search results in TradeWindow::fetch\n", "ERROR: Failed to parse search results in TradeWindow::fetch\n"], _ ;未译
["Displays when in a challenge mission or elite mission outpost", "Displays when in a challenge mission or elite mission outpost"], _ ;未译
["'/pingitem <equipped_item>' to ping your equipment in chat.\n", "'/pingitem <equipped_item>' to ping your equipment in chat.\n"], _ ;未译
["Please provide command in format /flag [hero number] [x] [y]", "Please provide command in format /flag [hero number] [x] [y]"], _ ;未译
["Click and drag on the lower right corner to resize a window.", "Click and drag on the lower right corner to resize a window."], _ ;未译
["And this is where I met the Lich. He told me to burn things.", "And this is where I met the Lich. He told me to burn things."], _ ;未译
["GWToolbox++ will show /age2 time after /age is shown in chat", "GWToolbox++ will show /age2 time after /age is shown in chat"], _ ;未译
["Displays current server IP Address and location if available", "Displays current server IP Address and location if available"], _ ;未译
["You can create a 'Send Chat' hotkey to perform any command.", "You can create a 'Send Chat' hotkey to perform any command."], _ ;未译
["TAB or SHIFT+TAB to cycle through keyboard editable fields.", "TAB or SHIFT+TAB to cycle through keyboard editable fields."], _ ;未译
["Invalid argument '%ls', please use a positive integer value", "Invalid argument '%ls', please use a positive integer value"], _ ;未译
["Decrease the value if you have good ping and you die a lot.", "Decrease the value if you have good ping and you die a lot."], _ ;未译
["Shouldn't need to change this.\nDefault: irc.chat.twitch.tv", "Shouldn't need to change this.\nDefault: irc.chat.twitch.tv"], _ ;未译
["Double Balthazar faction and Codex title points in Codex Arena", "Double Balthazar faction and Codex title points in Codex 竞技场"], _
["When I grow up, I want to be a principal or a caterpillar.", "When I grow up, I want to be a principal or a caterpillar."], _ ;未译
["Player ID is unique for each human player in the instance.", "Player ID is unique for each human player in the instance."], _ ;未译
["Map rotation on (e.g. Compass), or off (e.g. Mission Map).", "Map rotation on (e.g. Compass), or off (e.g. Mission Map)."], _ ;未译
["Invalid argument '%ls', please use an integer or hex value", "Invalid argument '%ls', please use an integer or hex value"], _ ;未译
["Toolbox will disable pcons when leaving an explorable area", "Toolbox will disable pcons when leaving an explorable area"], _ ;未译
["Set Guild Wars window title as current logged-in character", "Set Guild Wars window title as current logged-in character"], _ ;未译
["April Fools 2020 enabled. Type '/aprilfools' to disable it", "April Fools 2020 enabled. Type '/aprilfools' to disable it"], _ ;未译
["April Fools 2020 disabled. Type '/aprilfools' to enable it", "April Fools 2020 disabled. Type '/aprilfools' to enable it"], _ ;未译
["the window from a minimized state when important events\n", "the window from a minimized state when important events\n"], _ ;未译
["Will allow movement and resize of all widgets and windows", "Will allow movement and resize of all widgets and windows"], _ ;未译
["This feature is experimental and might crash your game.\n", "This feature is experimental and might crash your game.\n"], _ ;未译
["There are several ways to open and close toolbox windows and widgets:", "There are several ways to open and close 助手窗口及配件:"], _
["'/zoom <value>' to change the maximum zoom to the value. ", "'/zoom <value>' to change the maximum zoom to the value. "], _ ;未译
["'/hide <name>' closes the window or widget titled <name>.", "'/hide <name>' closes the window or widget titled <name>."], _ ;未译
["Double copper Zaishen Coin rewards for Zaishen vanquishes", "Double copper Zaishen Coin rewards for Zaishen vanquishes"], _ ;未译
["Double Balthazar faction and Hero title points in Heroes' Ascent", "Double Balthazar faction and Hero title points in 英雄之路"], _
["Double Balthazar faction and Champion title points in GvG", "Double Balthazar faction and Champion title points in GvG"], _ ;未译
["Display from previous days in the Objective Timer window.", "Display from previous days in the Objective Timer window."], _ ;未译
["'/transmotarget reset' to reset your target's appearance.", "'/transmotarget reset' to reset your target's appearance."], _ ;未译
["https://github.com/HasKha/GWToolboxpp/releases/download/", "https://github.com/HasKha/GWToolboxpp/releases/download/"], _ ;未译
["Use Q/E, A/D, W/S, X/Z, R and arrows for camera movement", "Use Q/E, A/D, W/S, X/Z, R and arrows for camera movement"], _ ;未译
["Discord connection already owned by an other GWToolboxpp", "Discord connection already owned by an other GWToolboxpp"], _ ;未译
["'/useskill <skill>' starts using the skill on recharge. ", "'/useskill <skill>' starts using the skill on recharge. "], _ ;未译
["'/tb <name>' toggles the window or widget titled <name>.", "'/tb <name>' toggles the window or widget titled <name>."], _ ;未译
["'/show <name>' opens the window or widget titled <name>.", "'/show <name>' opens the window or widget titled <name>."], _ ;未译
["https://api.github.com/repos/HasKha/GWToolboxpp/releases", "https://api.github.com/repos/HasKha/GWToolboxpp/releases"], _ ;未译
["Disable cons when reaching the final room in Urgoz and Deep", "Disable cons when reaching the final room in 尔果 and Deep"], _
["use empty '/zoom' to reset to the default value of 750.", "use empty '/zoom' to reset to the default value of 750."], _ ;未译
["Use empty '/useskill' or '/useskill stop' to stop all. ", "Use empty '/useskill' or '/useskill stop' to stop all. "], _ ;未译
["Error setting up PingsLinesRenderer vertex buffer: %d\n", "Error setting up PingsLinesRenderer vertex buffer: %d\n"], _ ;未译
["Automatically set 'Online' after an input to Guild Wars", "Automatically set 'Online' after an input to Guild Wars"], _ ;未译
["Afk message must be under 80 characters. (Yours is %zu)", "Afk message must be under 80 characters. (Yours is %zu)"], _ ;未译
["'/camera speed <value>' sets the unlocked camera speed.", "'/camera speed <value>' sets the unlocked camera speed."], _ ;未译
["Leaves your outpost###notify_when_players_leave_outpost", "Leaves your outpost###notify_when_players_leave_outpost"], _ ;未译
["Leaves your outpost###notify_when_friends_leave_outpost", "Leaves your outpost###notify_when_friends_leave_outpost"], _ ;未译
["Double copper Zaishen Coin rewards for Zaishen missions", "Double copper Zaishen Coin rewards for Zaishen missions"], _ ;未译
["Double copper Zaishen Coin rewards for Zaishen bounties", "Double copper Zaishen Coin rewards for Zaishen bounties"], _ ;未译
["Allows GWToolbox to send in-game information to Discord", "Allows GWToolbox to send in-game information to Discord"], _ ;未译
["'/transmoparty reset' to reset your party's appearance.", "'/transmoparty reset' to reset your party's appearance."], _ ;未译
["'/transmo' to change your appearance into target NPC.\n", "'/transmo' to change your appearance into target NPC.\n"], _ ;未译
["'/target closest' to target the closest agent to you.\n", "'/target closest' to target the closest agent to you.\n"], _ ;未译
["Try to use the current process for Discord integration", "Try to use the current process for Discord integration"], _ ;未译
["Please send the files to the GWToolbox++ developers.\n", "Please send the files to the GWToolbox++ developers.\n"], _ ;未译
["Only triggers when Guild Wars is not the active window", "Only triggers when Guild Wars is not the active window"], _ ;未译
["It's possible to use more than one skill on recharge. ", "It's possible to use more than one skill on recharge. "], _ ;未译
["Gracious me, was I raving? Please forgive me. I'm mad.", "Gracious me, was I raving? Please forgive me. I'm mad."], _ ;未译
["(Each line is a separate keyword. Not case sensitive.)", "(Each line is a separate keyword. Not case sensitive.)"], _ ;未译
["'/camera fog (on|off)' sets game fog effect on or off.", "'/camera fog (on|off)' sets game fog effect on or off."], _ ;未译
["Please send this file to the GWToolbox++ developers.\n", "Please send this file to the GWToolbox++ developers.\n"], _ ;未译
["Necromancer Munne sometimes gives these to me in trade", "Necromancer Munne sometimes gives these to me in trade"], _ ;未译
["Hell of a commute this morning from my bed to my PC...", "Hell of a commute this morning from my bed to my PC..."], _ ;未译
["Get ready for the baby boom after all this blows over!", "Get ready for the baby boom after all this blows over!"], _ ;未译
["A player starts trade with you###focus_window_on_trade", "A player starts trade with you###focus_window_on_trade"], _ ;未译
["A player starts trade with you###flash_window_on_trade", "A player starts trade with you###flash_window_on_trade"], _ ;未译
["'/vanguard' prints current pre-searing vanguard quest.", "'/vanguard' prints current pre-searing vanguard quest."], _ ;未译
["When enabled, GWToolbox++ can automatically restore\n", "When enabled, GWToolbox++ can automatically restore\n"], _ ;未译
["Checkboxes on the right of each setting header below.", "Checkboxes on the right of each setting header below."], _ ;未译
["'/target closest' to target the closest agent to you.", "'/target closest' to target the closest agent to you."], _ ;未译
["'/pcons [on|off]' toggles, enables or disables pcons.", "'/pcons [on|off]' toggles, enables or disables pcons."], _ ;未译
["'/camera (lock|unlock)' to lock or unlock the camera.", "'/camera (lock|unlock)' to lock or unlock the camera."], _ ;未译
["Syntax: /%ls blue, /%ls purple, /%ls gold or /%ls all", "Syntax: /%ls blue, /%ls purple, /%ls gold or /%ls all"], _ ;未译
["Only ticked bags will be checked for salvagable items", "Only ticked bags will be checked for salvagable items"], _ ;未译
["Joins your outpost###notify_when_players_join_outpost", "Joins your outpost###notify_when_players_join_outpost"], _ ;未译
["Joins your outpost###notify_when_friends_join_outpost", "Joins your outpost###notify_when_friends_join_outpost"], _ ;未译
["Join request received from %s; automatically accept\n", "Join request received from %s; automatically accept\n"], _ ;未译
["I swear thats the last time I eat Canthan food again!", "I swear thats the last time I eat Canthan food again!"], _ ;未译
["%ls not found. Add this file to load special chars.\n", "%ls not found. Add this file to load special chars.\n"], _ ;未译
["You need to show the window for this control to work", "You need to show the window for this control to work"], _ ;未译
["You need to show the widget for this control to work", "You need to show the widget for this control to work"], _ ;未译
["Send Chat hotkey to enter one of the commands above.", "Send Chat hotkey to enter one of the commands above."], _ ;未译
["Only affects windows (with a title bar), not widgets", "Only affects windows (with a title bar), not widgets"], _ ;未译
["'/damage' or '/dmg' to print party damage to chat.\n", "'/damage' or '/dmg' to print party damage to chat.\n"], _ ;未译
["Updater error - failed to extract dll name from path", "Updater error - failed to extract dll name from path"], _ ;未译
["Only use Superior Salvage Kits with /salvage command", "Only use Superior Salvage Kits with /salvage command"], _ ;未译
["Automatically accept party join requests when ticked", "Automatically accept party join requests when ticked"], _ ;未译
["'/offline' Set your friend list status to 'Offline'.", "'/offline' Set your friend list status to 'Offline'."], _ ;未译
["The connection to kamadan.decltype.com has timed out.", "The connection to kamadan.github.io has timed out."], _
["Invalid argument '%ls', please use an integer value", "Invalid argument '%ls', please use an integer value"], _ ;未译
["Invalid argument '%ls', please use /pcons [|on|off]", "Invalid argument '%ls', please use /pcons [|on|off]"], _ ;未译
["GWToolbox++ version %s is available! You have %s%s.", "GWToolbox++ version %s is available! You have %s%s."], _ ;未译
["Error setting up CustomRenderer vertex buffer: %d\n", "Error setting up CustomRenderer vertex buffer: %d\n"], _ ;未译
["Double-click on the title bar to collapse a window.", "Double-click on the title bar to collapse a window."], _ ;未译
["Click and drag on any empty space to move a window.", "Click and drag on any empty space to move a window."], _ ;未译
["Are you sure?\nThis operation cannot be undone.\n\n", "Are you sure?\nThis operation cannot be undone.\n\n"], _ ;未译
["A name to help you remember what this is. Optional.", "A name to help you remember what this is. Optional."], _ ;未译
["The Deep and Urgoz's Warren can be entered from Kaineng Center", "The Deep and 尔果的养殖场 can be entered from 凯宁中心"], _
["Show friend aliases when sending/receiving whispers", "Show friend aliases when sending/receiving whispers"], _ ;未译
["Re-connect after making changes to use updated info", "Re-connect after making changes to use updated info"], _ ;未译
["Most recently quoted item (buy or sell) from trader", "Most recently quoted item (buy or sell) from trader"], _ ;未译
["Toggle a GWToolbox++ functionality such as clicker", "Toggle a GWToolbox++ functionality such as clicker"], _ ;未译
["Please provide command in format /flag all [x] [y]", "Please provide command in format /flag all [x] [y]"], _ ;未译
["Installed input event handler, oldwndproc = 0x%X\n", "Installed input event handler, oldwndproc = 0x%X\n"], _ ;未译
["GWToolbox++ version %s is available! You have %s%s", "GWToolbox++ version %s is available! You have %s%s"], _ ;未译
["Cursor Fix not installed, message devs about this!", "Cursor Fix not installed, message devs about this!"], _ ;未译
["Ctrl+click doesn't work with birthday presents yet", "Ctrl+click doesn't work with birthday presents yet"], _ ;未译
["Are you sure?\nThis operation cannot be undone\n\n", "Are you sure?\nThis operation cannot be undone\n\n"], _ ;未译
["'/damage reset' resets the damage in party window.", "'/damage reset' resets the damage in party window."], _ ;未译
["Click to view build. Ctrl + Click to send to chat.", "Click to view build. Ctrl + Click to send to chat."], _ ;未译
["Block all other trade messages when in Kamadan ae1", "Block all other trade messages when in Kamadan ae1"], _ ;未译
["Automatically accept party invitations when ticked", "Automatically accept party invitations when ticked"], _ ;未译
["'/online' Set your friend list status to 'Online'.", "'/online' Set your friend list status to 'Online'."], _ ;未译
["Note: only visible in Hard Mode explorable areas.", "Note: only visible in Hard Mode explorable areas."], _ ;未译
["('Rare' stands for Gold item, Ecto or Obby shard)", "('Rare' stands for Gold item, Ecto or Obby shard)"], _ ;未译
["Special NPC %s is already defined for model_id %d", "Special NPC %s is already defined for model_id %d"], _ ;未译
["Kanaxai makes you and your team stunningly attractive", "加奈赛 makes you and your team stunningly attractive"], _
["Double Balthazar and Imperial faction in Alliance Battles", "Double Balthazar and Imperial faction in 同盟战"], _
["Suppress lunar and drunk post-processing effects", "Suppress lunar and drunk post-processing effects"], _ ;未译
["Release the ownership of the Discord integration", "Release the ownership of the Discord integration"], _ ;未译
["Load a team hero build from the Hero Build Panel", "Load a team hero build from the Hero Build Panel"], _ ;未译
["Invalid argument '%ls', please use a float value", "Invalid argument '%ls', please use a float value"], _ ;未译
["GWToolbox++ version %s is available! You have %s", "GWToolbox++ version %s is available! You have %s"], _ ;未译
["'/flag <number> clear' to clear flag for a hero.", "'/flag <number> clear' to clear flag for a hero."], _ ;未译
["[Error] Your character does not have %s unlocked", "[Error] Your character does not have %s unlocked"], _ ;未译
["You need to show the %s for this control to work", "You need to show the %s for this control to work"], _ ;未译
["Percentage below which this color should be used", "Percentage below which this color should be used"], _ ;未译
["Not enough arguments. See Help for chat commands", "Not enough arguments. See Help for chat commands"], _ ;未译
["GWToolbox is fetching new trade messages from %s", "GWToolbox is fetching new trade messages from %s"], _ ;未译
["Fear not the darkness. It is already within you.", "Fear not the darkness. It is already within you."], _ ;未译
["'/target ee' to target best ebon escape agent.\n", "'/target ee' to target best ebon escape agent.\n"], _ ;未译
["No one can stop me, let alone you puny mortals!", "No one can stop me, let alone you puny mortals!"], _ ;未译
["Automatically change urls into build templates.", "Automatically change urls into build templates."], _ ;未译
["When you're invited to join someone elses party", "When you're invited to join someone elses party"], _ ;未译
["When a player wants to join your existing party", "When a player wants to join your existing party"], _ ;未译
["Skip character name input when donating faction", "Skip character name input when donating faction"], _ ;未译
["Move item to current open storage pane on click", "Move item to current open storage pane on click"], _ ;未译
["'/tomorrow' prints tomorrow's daily activities.", "'/tomorrow' prints tomorrow's daily activities."], _ ;未译
["[dis] can be any of: ae, ae1, ee, eg, int, etc", "[dis] can be any of: ae, ae1, ee, eg, int, etc"], _ ;未译
["Updater error - cannot find GWToolbox.dll path", "Updater error - cannot find GWToolbox.dll path"], _ ;未译
["Only show non learned skills when using a tome", "Only show non learned skills when using a tome"], _ ;未译
["Twitch Failed to connect - Invalid Oauth token", "Twitch Failed to connect - Invalid Oauth token"], _ ;未译
["Not Connected - Click to travel to Kamadan ae1", "Not Connected - Click to travel to Kamadan ae1"], _ ;未译
["Free passage to the Underworld and the Fissure of Woe", "Free passage to the Underworld and the 灾难裂痕"], _
["Enable in an outpost to refill your inventory.", "Enable in an outpost to refill your inventory."], _ ;未译
["Disable cons when final objective(s) completed", "Disable cons when final objective(s) completed"], _ ;未译
["'/wanted' prints current shining blade bounty.", "'/wanted' prints current shining blade bounty."], _ ;未译
["'/target hos' to target best vipers/hos agent.", "'/target hos' to target best vipers/hos agent."], _ ;未译
["'/away' Set your friend list status to 'Away'.", "'/away' Set your friend list status to 'Away'."], _ ;未译
["Updated error - cannot download GWToolbox.dll", "Updated error - cannot download GWToolbox.dll"], _ ;未译
["Toolbox minimap will not capture mouse events", "Toolbox minimap will not capture mouse events"], _ ;未译
["Move items from/to storage with Control+Click", "Move items from/to storage with Control+Click"], _ ;未译
["(Each in a separate line. Not case sensitive)", "(Each in a separate line. Not case sensitive)"], _ ;未译
["'/nicholas' prints current nicholas location.", "'/nicholas' prints current nicholas location."], _ ;未译
["sending purchase request for %d (price=%d)\n", "sending purchase request for %d (price=%d)\n"], _ ;未译
["We have vanquished %lu %s! %lu %s remaining.", "We have vanquished %lu %s! %lu %s remaining."], _ ;未译
["If unchecked, the default shape will be used", "If unchecked, the default shape will be used"], _ ;未译
["If unchecked, the default color will be used", "If unchecked, the default color will be used"], _ ;未译
["His blood has returned me to my mortal body.", "His blood has returned me to my mortal body."], _ ;未译
["Zoning in a new map###focus_window_on_zoning", "Zoning in a new map###focus_window_on_zoning"], _ ;未译
["Use /enter fow or /enter uw to trigger entry", "Use /enter fow or /enter uw to trigger entry"], _ ;未译
["Trigger hotkey when entering explorable area", "Trigger hotkey when entering explorable area"], _ ;未译
["Luxon faction earned is greater than Kurzick", "Luxon faction earned is greater than Kurzick"], _ ;未译
["Kurzick faction earned is greater than Luxon", "Kurzick faction earned is greater than Luxon"], _ ;未译
["GWToolbox isn't fetching new trade messages.", "GWToolbox isn't fetching new trade messages."], _ ;未译
["Energy gain on hit 1, Energy regeneration -1", "Energy gain on hit 1, Energy regeneration -1"], _ ;未译
["20% Additional damage during festival events", "20% Additional damage during festival events"], _ ;未译
["http://wiki.fbgmguild.com/index.php?search=", "http://wiki.fbgmguild.com/index.php?search="], _ ;未译
["Will hide the skills in your effect monitor", "Will hide the skills in your effect monitor"], _ ;未译
["If unchecked, they will expand to the right", "If unchecked, they will expand to the right"], _ ;未译
["If unchecked, the default size will be used", "If unchecked, the default size will be used"], _ ;未译
["Full Conset Price: (Material not available)", "Full Conset Price: (Material not available)"], _ ;未译
["Twitch Failed to connect - Invalid Username", "Twitch Failed to connect - Invalid Username"], _ ;未译
["Not in the same map; try to travel there.\n", "Not in the same map; try to travel there.\n"], _ ;未译
["Halves skill recharge of <attribute> spells", "Halves skill recharge of <attribute> spells"], _ ;未译
["Chat command '/show <name>' to show a window or widget.", "对话框指令 '/show <相关部件名>': 展开 窗口 或 配件."], _
["Chat command '/hide <name>' to hide a window or widget.", "对话框指令 '/hide <相关部件名>': 收起 窗口 或 配件."], _
["Use or cancel a skill such as Recall or UA", "Use or cancel a skill such as Recall or UA"], _ ;未译
["Use '/useskill <skill>' to stop the skill.", "Use '/useskill <skill>' to stop the skill."], _ ;未译
["Update successful, please restart toolbox.", "Update successful, please restart toolbox."], _ ;未译
["Thank you and sorry for the inconvenience.", "Thank you and sorry for the inconvenience."], _ ;未译
["Close other windows when opening a new one", "Close other windows when opening a new one"], _ ;未译
["As a boy I spent much time in these lands.", "As a boy I spent much time in these lands."], _ ;未译
["And messages matching regular expressions:", "And messages matching regular expressions:"], _ ;未译
["- Hold SHIFT or use mouse to select text\n", "- Hold SHIFT or use mouse to select text\n"], _ ;未译
["'/damage me' sends your own damage only.\n", "'/damage me' sends your own damage only.\n"], _ ;未译
["The first matching threshold will be used.", "The first matching threshold will be used."], _ ;未译
["Syntax: /%ls blue, /%ls purple or /%ls all", "Syntax: /%ls blue, /%ls purple or /%ls all"], _ ;未译
["https://api.ipgeolocation.io/ipgeo?apiKey=", "https://api.ipgeolocation.io/ipgeo?apiKey="], _ ;未译
["Auto Disable on final objective completion", "Auto Disable on final objective completion"], _ ;未译
["A dump file has been created in:\n\n%s\n\n", "A dump file has been created in:\n\n%s\n\n"], _ ;未译
["<a=1>%ls</a> (%ls) has just logged in.</c>", "<a=1>%ls</a> (%ls) has just logged in.</c>"], _ ;未译
["'/transmo reset' to reset your appearance.", "'/transmo reset' to reset your appearance."], _ ;未译
["Chat command '/tb <name>' to toggle a window or widget.", "对话框指令 '/tb <相关部件名>': 收展 窗口 或 配件."], _
["selling Gold and Green items introduced\n", "selling Gold and Green items introduced\n"], _ ;未译
["The hotkey can trigger only when selected", "The hotkey can trigger only when selected"], _ ;未译
["Please provide an integer or hex argument", "Please provide an integer or hex argument"], _ ;未译
["Displays the system time (hour : minutes)", "Displays the system time (hour : minutes)"], _ ;未译
["CTRL+Mouse Wheel to zoom window contents.", "CTRL+Mouse Wheel to zoom window contents."], _ ;未译
["'/age2' prints the instance time to chat.", "'/age2' prints the instance time to chat."], _ ;未译
["Use /enter from Temple of the Ages or Embark Beach", "Use /enter from 世纪神殿 or Embark Beach"], _
["Show warning when earned faction reaches ", "Show warning when earned faction reaches "], _ ;未译
["Shorthand item description on weapon ping", "Shorthand item description on weapon ping"], _ ;未译
["Nothing left to do but 'Netflix and ill'!", "Nothing left to do but 'Netflix and ill'!"], _ ;未译
["Not Connected - Click to re-connect to %s", "Not Connected - Click to re-connect to %s"], _ ;未译
["I'm down to my last roll of toilet paper!", "I'm down to my last roll of toilet paper!"], _ ;未译
["Halves casting time of <attribute> spells", "Halves casting time of <attribute> spells"], _ ;未译
["Crafted in tribute to an enduring legend.", "Crafted in tribute to an enduring legend."], _ ;未译
["Automatically return to outpost on defeat", "Automatically return to outpost on defeat"], _ ;未译
["'/today' prints current daily activities.", "'/today' prints current daily activities."], _ ;未译
["x minutes of favor of the gods remaining", "x minutes of favor of the gods remaining"], _ ;未译
["sending sell request for %d (price=%d)\n", "sending sell request for %d (price=%d)\n"], _ ;未译
["Oh boy, sleep! That's where I'm a Luxon.", "Oh boy, sleep! That's where I'm a Luxon."], _ ;未译
["Hide in-game info when appearing offline", "Hide in-game info when appearing offline"], _ ;未译
["Hide Spiritual Possession and Lucky Aura", "Hide Spiritual Possession and Lucky Aura"], _ ;未译
["Failed to find address for DiscordCreate", "Failed to find address for DiscordCreate"], _ ;未译
["<a=1>%S</a> (%S) has just logged in.</c>", "<a=1>%S</a> (%S) has just logged in.</c>"], _ ;未译
["- CTRL+A or double-click to select all\n", "- CTRL+A or double-click to select all\n"], _ ;未译
["Show NPC speech bubbles in emote channel", "Show NPC speech bubbles in emote channel"], _ ;未译
["Show boss by profession color on minimap", "Show boss by profession color on minimap"], _ ;未译
["Life draining -3, Health regeneration -1", "Life draining -3, Health regeneration -1"], _ ;未译
["You are no match for my almighty power.", "You are no match for my almighty power."], _ ;未译
["Size of each Pcon icon in the interface", "Size of each Pcon icon in the interface"], _ ;未译
["Note: only visible in explorable areas.", "Note: only visible in explorable areas."], _ ;未译
["Height of each row, leave 0 for default", "Height of each row, leave 0 for default"], _ ;未译
["GWToolbox++ - Clientside Error Detected", "GWToolbox++ - Clientside Error Detected"], _ ;未译
["Disable the confirmation request when\n", "Disable the confirmation request when\n"], _ ;未译
["[Error] Did not recognize outpost '%ls'", "[Error] Did not recognize outpost '%ls'"], _ ;未译
["Talk to an NPC to see available dialogs", "Talk to an NPC to see available dialogs"], _ ;未译
["No scroll found in inventory for travel", "No scroll found in inventory for travel"], _ ;未译
["Join request reply sent successfully.\n", "Join request reply sent successfully.\n"], _ ;未译
["i.e. Profession icon and character name", "i.e. Profession icon and character name"], _ ;未译
["Double Sunspear and Lightbringer points", "Double Sunspear and Lightbringer points"], _ ;未译
["Disable cons when completing a vanquish", "Disable cons when completing a vanquish"], _ ;未译
["<a=1>%ls</a> (%ls) entered the outpost.", "<a=1>%ls</a> (%ls) entered the outpost."], _ ;未译
["Enter DoA, FoW, UW, Deep or Urgoz to begin", "Enter DoA, FoW, UW, Deep or 尔果 to begin"], _
["Such as 'A skill was updated for pvp!'", "Such as 'A skill was updated for pvp!'"], _ ;未译
["Show the following in the main window:", "Show the following in the main window:"], _ ;未译
["No map were found with the prefix '%S'", "No map were found with the prefix '%S'"], _ ;未译
["GWToolbox++ version %s by Has and KAOS", "GWToolbox++ version %s by Has and KAOS"], _ ;未译
["Cancel the current queue of operations", "Cancel the current queue of operations"], _ ;未译
["Buffer size too small, file size is %d", "Buffer size too small, file size is %d"], _ ;未译
["Activity update failed with error %d\n", "Activity update failed with error %d\n"], _ ;未译
["[Error] You are already in the outpost", "[Error] You are already in the outpost"], _ ;未译
["Your username that you use for Twitch.", "Your username that you use for Twitch."], _ ;未译
["This only displays when in an outpost.", "This only displays when in an outpost."], _ ;未译
["Quests to show in Daily Quests window:", "Quests to show in Daily Quests window:"], _ ;未译
["ObjectiveTimerRuns_%02d-%02d-%02d.json", "ObjectiveTimerRuns_%02d-%02d-%02d.json"], _ ;未译
["Nicholas the Traveler, %s: %d %s in %s", "Nicholas the Traveler, %s: %d %s in %s"], _ ;未译
["Loaded DirectX module successfully: %s", "Loaded DirectX module successfully: %s"], _ ;未译
["https://wiki.guildwars.com/wiki/Guild:", "https://wiki.guildwars.com/wiki/Guild:"], _ ;未译
["Failed to load ObjectiveSets from json", "Failed to load ObjectiveSets from json"], _ ;未译
["Failed to equip item in bag %d slot %d", "Failed to equip item in bag %d slot %d"], _ ;未译
["Damage 15% (while Health is above 50%)", "Damage 15% (while Health is above 50%)"], _ ;未译
["Click to load build template and pcons", "Click to load build template and pcons"], _ ;未译
["Click Here to get a Twitch Oauth Token", "Click Here to get a Twitch Oauth Token"], _ ;未译
["Cannot enter outpost on this character", "Cannot enter outpost on this character"], _ ;未译
["Block key in Guild Wars when triggered", "Block key in Guild Wars when triggered"], _ ;未译
["'/zv' prints current zaishen vanquish.", "'/zv' prints current zaishen vanquish."], _ ;未译
["'/weekly' prints current weekly bonus.", "'/weekly' prints current weekly bonus."], _ ;未译
["https://haskha.github.io/GWToolboxpp/", "https://haskha.github.io/GWToolboxpp/"], _ ;未译
["[Error] Did not recognize guild '%ls'", "[Error] Did not recognize guild '%ls'"], _ ;未译
["[%s] ~ Start: %s ~ End: %s ~ Time: %s", "[%s] ~ Start: %s ~ End: %s ~ Time: %s"], _ ;未译
["PingsLinesRenderer Lock() error: %d\n", "PingsLinesRenderer Lock() error: %d\n"], _ ;未译
["My cat's breath smells like cat food.", "My cat's breath smells like cat food."], _ ;未译
["Disable Gold/Green items confirmation", "Disable Gold/Green items confirmation"], _ ;未译
["An alternative to the default compass", "An alternative to the default compass"], _ ;未译
["Allow mouse click-through in outposts", "Allow mouse click-through in outposts"], _ ;未译
["Show messages from %s in Trade Window", "Show messages from %s in Trade Window"], _ ;未译
["Lengthens ??? duration on foes by 33%", "Lengthens ??? duration on foes by 33%"], _ ;未译
["Friend <name> already added as <name>", "Friend <name> already added as <name>"], _ ;未译
["Failed to join party after 10 seconds", "Failed to join party after 10 seconds"], _ ;未译
["Failed to identify item in slot %d/%d", "Failed to identify item in slot %d/%d"], _ ;未译
["'/zm' prints current zaishen mission.", "'/zm' prints current zaishen mission."], _ ;未译
["Teleport Mountains\nThis is NOT the mountains quest", "传送至 地下世界 双头龙山\n此 [非] 龙山 任务"], _
["Auto Disable in final room of Urgoz/Deep", "Auto Disable in final room of 尔果/Deep"], _
["Target model id (PlayerNumber) is %d", "Target model id (PlayerNumber) is %d"], _ ;未译
["Show chat messages timestamp. Color:", "Show chat messages timestamp. Color:"], _ ;未译
["Received price %d for %d (item %d)\n", "Received price %d for %d (item %d)\n"], _ ;未译
["GWToolboxpp-Mutex-DiscordIntegration", "GWToolboxpp-Mutex-DiscordIntegration"], _ ;未译
["Error writing file %s - Error is %lu", "Error writing file %s - Error is %lu"], _ ;未译
["Cannot parse regular expression '%s'", "Cannot parse regular expression '%s'"], _ ;未译
["AgentRenderer initialize error: %d\n", "AgentRenderer initialize error: %d\n"], _ ;未译
["Trigger hotkey when entering outpost", "Trigger hotkey when entering outpost"], _ ;未译
["The custom color for this threshold.", "The custom color for this threshold."], _ ;未译
["Show messages in chat window. Color:", "Show messages in chat window. Color:"], _ ;未译
["Send this build's Pcons to team chat", "Send this build's Pcons to team chat"], _ ;未译
["Redirect NPC dialog to emote channel", "Redirect NPC dialog to emote channel"], _ ;未译
["No equippable item in bag %d slot %d", "No equippable item in bag %d slot %d"], _ ;未译
["GWToolbox is trying to connect to %s", "GWToolbox is trying to connect to %s"], _ ;未译
["Failed to save ObjectiveSets to json", "Failed to save ObjectiveSets to json"], _ ;未译
["Failed to salvage item in slot %d/%d", "Failed to salvage item in slot %d/%d"], _ ;未译
["Click to modify pcons for this build", "Click to modify pcons for this build"], _ ;未译
["<a=1>%S</a>: %s joined your channel.", "<a=1>%S</a>: %s joined your channel."], _ ;未译
["<a=1>%ls</a> (%ls) left the outpost.", "<a=1>%ls</a> (%ls) left the outpost."], _ ;未译
["'/zc' prints current zaishen combat.", "'/zc' prints current zaishen combat."], _ ;未译
["'/zb' prints current zaishen bounty.", "'/zb' prints current zaishen bounty."], _ ;未译
["%s is Wanted by the Shining Blade %s", "%s is Wanted by the Shining Blade %s"], _ ;未译
["Only in Domain of Anguish, within 1400 range", "Only in 悲难领地, within 1400 range"], _
["http://wiki.fbgmguild.com/Main_Page", "http://wiki.fbgmguild.com/Main_Page"], _ ;未译
["[SCAN] GoldConfirmationPatch = %p\n", "[SCAN] GoldConfirmationPatch = %p\n"], _ ;未译
["Shows a countdown timer for alcohol", "Shows a countdown timer for alcohol"], _ ;未译
["Show timestamps in message history.", "Show timestamps in message history."], _ ;未译
["Move to a specific (x,y) coordinate", "Move to a specific (x,y) coordinate"], _ ;未译
["Move the teambuild down in the list", "Move the teambuild down in the list"], _ ;未译
["Flash Guild Wars taskbar icon when:", "Flash Guild Wars taskbar icon when:"], _ ;未译
["Failed to create discord connection", "Failed to create discord connection"], _ ;未译
[", &marker.pos.y, 1.0f, 0.0f, 0.0f, ", ", &marker.pos.y, 1.0f, 0.0f, 0.0f, "], _ ;未译
[", &marker.pos.x, 1.0f, 0.0f, 0.0f, ", ", &marker.pos.x, 1.0f, 0.0f, 0.0f, "], _ ;未译
["'LoadLibraryW' failed on '%S' (%lu)", "'LoadLibraryW' failed on '%S' (%lu)"], _ ;未译
["[Error] Did not recognize favourite", "[Error] Did not recognize favourite"], _ ;未译
["Zaishen Vanquish, %s: <a=1>%s%s</a>", "Zaishen Vanquish, %s: <a=1>%s%s</a>"], _ ;未译
["Weekly Bonus PvP, %s: <a=1>%s%s</a>", "Weekly Bonus PvP, %s: <a=1>%s%s</a>"], _ ;未译
["Weekly Bonus PvE, %s: <a=1>%s%s</a>", "Weekly Bonus PvE, %s: <a=1>%s%s</a>"], _ ;未译
["The connection to %s has timed out.", "The connection to %s has timed out."], _ ;未译
["Such as 'Hold-out bonus: +2 points'", "Such as 'Hold-out bonus: +2 points'"], _ ;未译
["Show Guild Wars in foreground when:", "Show Guild Wars in foreground when:"], _ ;未译
["Show current run in separate window", "Show current run in separate window"], _ ;未译
["Move the threshold down in the list", "Move the threshold down in the list"], _ ;未译
["Mod Struct (identifier, arg1, arg2)", "Mod Struct (identifier, arg1, arg2)"], _ ;未译
["Hides widget when not using alcohol", "Hides widget when not using alcohol"], _ ;未译
["Hide city Pcons in explorable areas", "Hide city Pcons in explorable areas"], _ ;未译
["Enter a Canthan outpost to see data", "Enter a Canthan outpost to see data"], _ ;未译
["Drunk effect %d / %d, %d pts gained", "Drunk effect %d / %d, %d pts gained"], _ ;未译
["Cons auto-disabled in range of boss", "Cons auto-disabled in range of boss"], _ ;未译
["Auto-Disabling Pcons in elite areas", "Auto-Disabling Pcons in elite areas"], _ ;未译
["Auto Disable on Vanquish completion", "Auto Disable on Vanquish completion"], _ ;未译
["occur, such as entering instances.", "occur, such as entering instances."], _ ;未译
["[Error] Please provide an argument", "[Error] Please provide an argument"], _ ;未译
["You're disgusting, but I love you!", "You're disgusting, but I love you!"], _ ;未译
["The syntax is /resize width height", "The syntax is /resize width height"], _ ;未译
["Bad hero index '%d' for build '%s'", "Bad hero index '%d' for build '%s'"], _ ;未译
["- CTRL+X,CTRL+C,CTRL+V clipboard\n", "- CTRL+X,CTRL+C,CTRL+V clipboard\n"], _ ;未译
["(Left-click on a color to edit it)", "(Left-click on a color to edit it)"], _ ;未译
["Zaishen Mission, %s: <a=1>%s%s</a>", "Zaishen Mission, %s: <a=1>%s%s</a>"], _ ;未译
["You're about to salvage %d item%s:", "You're about to salvage %d item%s:"], _ ;未译
["This can be re-enabled in settings", "This can be re-enabled in settings"], _ ;未译
["Show auto disable pcons checkboxes", "Show auto disable pcons checkboxes"], _ ;未译
["Reduces ??? duration on you by 20%", "Reduces ??? duration on you by 20%"], _ ;未译
["Nicholas the Traveler: %d %s in %s", "Nicholas the Traveler: %d %s in %s"], _ ;未译
["Kurzick faction earned is %d of %d", "Kurzick faction earned is %d of %d"], _ ;未译
["Connected to kamadan.gwtoolbox.com", "Connected to kamadan.gwtoolbox.com"], _ ;未译
["Add player numbers to party window", "Add player numbers to party window"], _ ;未译
["<a=1>%S</a>: Connected to %s as %S", "<a=1>%S</a>: Connected to %s as %S"], _ ;未译
["<a=1>%S</a>: %s left your channel.", "<a=1>%S</a>: %s left your channel."], _ ;未译
["%s - %s###ObjectiveTimerCurrentRun", "%s - %s###ObjectiveTimerCurrentRun"], _ ;未译
["Cannot find %s, please refill or disable", "%s 失寻, please refill or disable"], _
["Time the instance has been active", "Time the instance has been active"], _ ;未译
["Send a message or command to chat", "Send a message or command to chat"], _ ;未译
["Ping a build from the Build Panel", "Ping a build from the Build Panel"], _ ;未译
["P081: agent_id %d, unk1 %d, unk2 ", "P081: agent_id %d, unk1 %d, unk2 "], _ ;未译
["Move the teambuild up in the list", "Move the teambuild up in the list"], _ ;未译
["Essence of Celerity\nFeathers and Dust", "Essence of Celerity\n羽毛 and Dust"], _
["Ctrl+Click to print target health", "Ctrl+Click to print target health"], _ ;未译
["Couldn't connect to the host '%s'", "Couldn't connect to the host '%s'"], _ ;未译
["<a=1>%s</a>: <c=#f96677><quote>%s", "<a=1>%s</a>: <c=#f96677><quote>%s"], _ ;未译
["Zaishen Combat, %s: <a=1>%s%s</a>", "Zaishen Combat, %s: <a=1>%s%s</a>"], _ ;未译
["Zaishen Bounty, %s: <a=1>%s%s</a>", "Zaishen Bounty, %s: <a=1>%s%s</a>"], _ ;未译
["Vanguard Quest, %s: <a=1>%s%s</a>", "Vanguard Quest, %s: <a=1>%s%s</a>"], _ ;未译
["Time until spirits die in seconds", "Time until spirits die in seconds"], _ ;未译
["Salvage All Purple & Lesser Items", "Salvage All Purple & Lesser Items"], _ ;未译
["Outgoing discord state = %s, %s\n", "Outgoing discord state = %s, %s\n"], _ ;未译
["Move the threshold up in the list", "Move the threshold up in the list"], _ ;未译
["Kanaxai infiltrates the minds of NPCs", "加奈赛 infiltrates the minds of NPCs"], _
["Join request reply send FAILED!\n", "Join request reply send FAILED!\n"], _ ;未译
["Failed to clear message buffer!\n", "Failed to clear message buffer!\n"], _ ;未译
["Equip an item from your inventory", "Equip an item from your inventory"], _ ;未译
["<a=1>%ls</a> entered the outpost.", "<a=1>%ls</a> entered the outpost."], _ ;未译
["The custom color for this agent.", "The custom color for this agent."], _ ;未译
["Show 'Active' checkbox in header", "Show 'Active' checkbox in header"], _ ;未译
["Powered by https://kamadan.decltype.org", "广告网 https://kamadan.github.io"], _
["Move the hotkey down in the list", "Move the hotkey down in the list"], _ ;未译
["Low on %s, please refill or disable", "%s 即将耗尽, please refill or disable"], _
["AgentRenderer Lock() error: %d\n", "AgentRenderer Lock() error: %d\n"], _ ;未译
["Abaddon will feast on your eyes!", "Abaddon will feast on your eyes!"], _ ;未译
["- CTRL+Left/Right to word jump\n", "- CTRL+Left/Right to word jump\n"], _ ;未译
["'Player x has achieved title...'", "'Player x has achieved title...'"], _ ;未译
["Untick an item to skip salvaging", "Untick an item to skip salvaging"], _ ;未译
["Show storage quantity in outpost", "Show storage quantity in outpost"], _ ;未译
["Luxon faction earned is %d of %d", "Luxon faction earned is %d of %d"], _ ;未译
["https://wiki.guildwars.com/wiki/", "https://wiki.guildwars.com/wiki/"], _ ;未译
["Failed to load build template %s", "Failed to load build template %s"], _ ;未译
["Display error message on failure", "Display error message on failure"], _ ;未译
["Cons auto-disabled on completion", "Cons auto-disabled on completion"], _ ;未译
["Add special NPCs to party window", "Add special NPCs to party window"], _ ;未译
["Activity updated successfully.\n", "Activity updated successfully.\n"], _ ;未译
["161f3834252a4ec6988e49bb75ccd902", "161f3834252a4ec6988e49bb75ccd902"], _ ;未译
["144de1673b1c473d9bab94f528acc214", "144de1673b1c473d9bab94f528acc214"], _ ;未译
["Use an item from your inventory", "Use an item from your inventory"], _ ;未译
["Target coordinates are (%f, %f)", "Target coordinates are (%f, %f)"], _ ;未译
["Show 'Open Xunlai Chest' button", "Show 'Open Xunlai Chest' button"], _ ;未译
["SafeThreadEntry __except body\n", "SafeThreadEntry __except body\n"], _ ;未译
["Price: Computing (request sent)", "Price: Computing (request sent)"], _ ;未译
["Price: (Material not available)", "Price: (Material not available)"], _ ;未译
["Move the color down in the list", "Move the color down in the list"], _ ;未译
["Favor of the Gods announcements", "Favor of the Gods announcements"], _ ;未译
["Automatically set 'Away' after ", "Automatically set 'Away' after "], _ ;未译
["A common item drops for an ally", "A common item drops for an ally"], _ ;未译
["Zaishen Vanquish: <a=1>%s%s</a>", "Zaishen Vanquish: <a=1>%s%s</a>"], _ ;未译
["Weekly Bonus PvP: <a=1>%s%s</a>", "Weekly Bonus PvP: <a=1>%s%s</a>"], _ ;未译
["Weekly Bonus PvE: <a=1>%s%s</a>", "Weekly Bonus PvE: <a=1>%s%s</a>"], _ ;未译
["user_defined_npcs_to_add_scroll", "user_defined_npcs_to_add_scroll"], _ ;未译
["Show daily quests for the next ", "Show daily quests for the next "], _ ;未译
["Send pcons when pinging a build", "Send pcons when pinging a build"], _ ;未译
["Salvage All Gold & Lesser Items", "Salvage All Gold & Lesser Items"], _ ;未译
["Salvage All Blue & Lesser Items", "Salvage All Blue & Lesser Items"], _ ;未译
["Party invite received from %s\n", "Party invite received from %s\n"], _ ;未译
["No more identification kit uses", "No more identification kit uses"], _ ;未译
["Mursaat Elementalist (Polymock)", "Mursaat Elementalist (Polymock)"], _ ;未译
["Missing /transmotarget argument", "Missing /transmotarget argument"], _ ;未译
["Halves skill recharge of spells", "Halves skill recharge of spells"], _ ;未译
["Font.ttf found and pre-loaded\n", "Font.ttf found and pre-loaded\n"], _ ;未译
["Failed to initialise winsock!\n", "Failed to initialise winsock!\n"], _ ;未译
["Armor of Salvation\nIron and Bones", "Armor of Salvation\nIron and 骨头"], _
["scale must be between [6, 255]", "scale must be between [6, 255]"], _ ;未译
["color_shadowstep_line_maxrange", "color_shadowstep_line_maxrange"], _ ;未译
["You can prefix the number by \", "You can prefix the number by \"], _ ;未译
["Waiting for logged character\n", "Waiting for logged character\n"], _ ;未译
["Target a game entity by its ID", "Target a game entity by its ID"], _ ;未译
["Send Kamadan ad1 trade chat to your trade chat", "把卡玛丹1区的广告导入角色的交易频道"], _
["Only show messages containing:", "Only show messages containing:"], _ ;未译
["Move the hotkey up in the list", "Move the hotkey up in the list"], _ ;未译
["If this custom agent is active", "If this custom agent is active"], _ ;未译
["Fix height when moving forward", "Fix height when moving forward"], _ ;未译
["Error creating the dump file\n", "Error creating the dump file\n"], _ ;未译
["Enable the following features:", "Enable the following features:"], _ ;未译
["Checkboxes in the Info window.", "Checkboxes in the Info window."], _ ;未译
["Check and automatically update", "Check and automatically update"], _ ;未译
["An ally picks up a common item", "An ally picks up a common item"], _ ;未译
["Ambiguous prefix because of %s", "Ambiguous prefix because of %s"], _ ;未译
["Alt + Click on minimap to move", "Alt + Click on minimap to move"], _ ;未译
["<c=#00ccff>GWToolbox++</c>: %s", "<c=#00ccff>GWToolbox++</c>: %s"], _ ;未译
["'You have been playing for...'", "'You have been playing for...'"], _ ;未译
["'/dialog <id>' sends a dialog.", "'/dialog <id>' sends a dialog."], _ ;未译
["%S's Health is %d of %d. (%.0f %%)", "%S的体力是 %d of %d. (%.0f %%)"], _
["Zaishen Mission: <a=1>%s%s</a>", "Zaishen Mission: <a=1>%s%s</a>"], _ ;未译
["vizunah square foreign quarter", "vizunah square foreign quarter"], _ ;未译
["Missing argument for /pingitem", "Missing argument for /pingitem"], _ ;未译
["Missing /transmoagent argument", "Missing /transmoagent argument"], _ ;未译
["Invalid profession for %s (%s)", "Invalid profession for %s (%s)"], _ ;未译
["Invalid /transmoagent agent_id", "Invalid /transmoagent agent_id"], _ ;未译
["Happy April Fools Da-- *cough*", "Happy April Fools Da-- *cough*"], _ ;未译
["Failed to find Font.ttf file\n", "Failed to find Font.ttf file\n"], _ ;未译
["Display message when triggered", "Display message when triggered"], _ ;未译
["Discord: on_activity_join %s\n", "Discord: on_activity_join %s\n"], _ ;未译
["A party member pings your name", "A party member pings your name"], _ ;未译
["<irc_nickname> @ <irc_channel>", "<irc_nickname> @ <irc_channel>"], _ ;未译
["<a=1>%ls</a> left the outpost.", "<a=1>%ls</a> left the outpost."], _ ;未译
["<a=1>%ls</a> joined the party.", "<a=1>%ls</a> joined the party."], _ ;未译
[", name, cached_time, failed ? ", ", name, cached_time, failed ? "], _ ;未译
["%ls (%ls) has just logged out.", "%ls (%ls) has just logged out."], _ ;未译
[" but before the district e.g. ", " but before the district e.g. "], _ ;未译
["DoA - Foundry 1: Foundry Of Failed Creations", "四门 - 铸造厂 1: 失败事物铸造厂"], _
["e.g. 'Sifhalla, America English 1'", "e.g. '袭哈拉, America English 1'"], _
["hero_flag_controls_background", "hero_flag_controls_background"], _ ;未译
["Wrote %lu of %lu bytes for %s", "Wrote %lu of %lu bytes for %s"], _ ;未译
["Suppress lunar and drunk text", "Suppress lunar and drunk text"], _ ;未译
["Soon you will all be crushed.", "Soon you will all be crushed."], _ ;未译
["Show a message when a friend:", "Show a message when a friend:"], _ ;未译
["Open web links from templates", "Open web links from templates"], _ ;未译
["Move the color up in the list", "Move the color up in the list"], _ ;未译
["Hide any messages containing:", "Hide any messages containing:"], _ ;未译
["Grail of Might\nIron and Dust", "Grail of Might\nIron and Dust"], _ ;未译
["Check and ask before updating", "Check and ask before updating"], _ ;未译
["Automatically skip cinematics", "Automatically skip cinematics"], _ ;未译
["A rare item drops for an ally", "A rare item drops for an ally"], _ ;未译
["/GUILD WARS/Templates/Skills/", "/GUILD WARS/Templates/Skills/"], _ ;未译
["Zaishen Combat: <a=1>%s%s</a>", "Zaishen Combat: <a=1>%s%s</a>"], _ ;未译
["Zaishen Bounty: <a=1>%s%s</a>", "Zaishen Bounty: <a=1>%s%s</a>"], _ ;未译
["Widget background hover color", "Widget background hover color"], _ ;未译
["Vanguard Quest: <a=1>%s%s</a>", "Vanguard Quest: <a=1>%s%s</a>"], _ ;未译
["Show a message when a player:", "Show a message when a player:"], _ ;未译
["Polling non-gw friends list\n", "Polling non-gw friends list\n"], _ ;未译
["Invalid outpost for scrolling", "Invalid outpost for scrolling"], _ ;未译
["Invalid /transmotarget target", "Invalid /transmotarget target"], _ ;未译
["https://kamadan.gwtoolbox.com", "https://kamadan.gwtoolbox.com"], _ ;未译
["Halves casting time of spells", "Halves casting time of spells"], _ ;未译
["Display in-game location info", "Display in-game location info"], _ ;未译
["/tp GrEaT TemplE oF BalthaZAR", "/tp GrEaT TemplE oF BalthaZAR"], _ ;未译
["%s is the Zaishen Vanquish %s", "%s is the Zaishen Vanquish %s"], _ ;未译
["%s is the Weekly PvP Bonus %s", "%s is the Weekly PvP Bonus %s"], _ ;未译
["%s is the Weekly PvE Bonus %s", "%s is the Weekly PvE Bonus %s"], _ ;未译
["##faction_warn_percent_amount", "##faction_warn_percent_amount"], _ ;未译
["The Rise of The White Mantle", "The Rise of The White Mantle"], _ ;未译
["Hide the following messages:", "Hide the following messages:"], _ ;未译
["Flip bond order (left/right)", "Flip bond order (left/right)"], _ ;未译
["Enter DoA, FoW, or UW to begin", "启动前提： 角色已入悲难之门(四门)，灾难裂痕，或地下世界."], _
["Discord Log Level %d: '%s'\n", "Discord Log Level %d: '%s'\n"], _ ;未译
["An ally picks up a rare item", "An ally picks up a rare item"], _ ;未译
["All is well. I'm not insane.", "All is well. I'm not insane."], _ ;未译
["Add another player build row", "Add another player build row"], _ ;未译
["vizunah square local quarter", "vizunah square local quarter"], _ ;未译
["Show chat messages timestamp", "Show chat messages timestamp"], _ ;未译
["Queueing poll friends list\n", "Queueing poll friends list\n"], _ ;未译
["Not enough Adrenaline/Energy", "Not enough Adrenaline/Energy"], _ ;未译
["Missing argument for /target", "Missing argument for /target"], _ ;未译
["Equip Item in bag %d slot %d", "Equip Item in bag %d slot %d"], _ ;未译
["Enchantments last 20% longer", "Enchantments last 20% longer"], _ ;未译
["Click to load build template", "Click to load build template"], _ ;未译
["Automatic /age on completion", "Automatic /age on completion"], _ ;未译
["<a=1>%ls</a> left the party.", "<a=1>%ls</a> left the party."], _ ;未译
["%s: Loading friends from ini", "%s: Loading friends from ini"], _ ;未译
["%s is the Zaishen Mission %s", "%s is the Zaishen Mission %s"], _ ;未译
["Recall\0Unyielding Aura\0Holy Veil\0Other", "回归\0坚毅灵气\0神圣遮罩\0其他"], _
["in February 5, 2019 update.", "in February 5, 2019 update."], _ ;未译
["This house has many hearts.", "This house has many hearts."], _ ;未译
["Show 'Run' button in header", "Show 'Run' button in header"], _ ;未译
["Shadowstep Line (Max range)", "Shadowstep Line (Max range)"], _ ;未译
["Receiving a private message", "Receiving a private message"], _ ;未译
["Price: Computing (in queue)", "Price: Computing (in queue)"], _ ;未译
["Opening and closing windows", "Opening and closing windows"], _ ;未译
["Keep away. The sow is mine.", "Keep away. The sow is mine."], _ ;未译
["GWToolbox crashed, oops\n\n", "GWToolbox crashed, oops\n\n"], _ ;未译
["Closing log/console, bye!\n", "Closing log/console, bye!\n"], _ ;未译
["Check and display a message", "Check and display a message"], _ ;未译
["Buttons in the main window.", "Buttons in the main window."], _ ;未译
["A common item drops for you", "A common item drops for you"], _ ;未译
["- CTRL+Z,CTRL+Y undo/redo\n", "- CTRL+Z,CTRL+Y undo/redo\n"], _ ;未译
["wss://kamadan.gwtoolbox.com", "wss://kamadan.gwtoolbox.com"], _ ;未译
["Removed special NPC %s (%d)", "Removed special NPC %s (%d)"], _ ;未译
["Nicholas Sandford, %s: 5 %s", "Nicholas Sandford, %s: 5 %s"], _ ;未译
["Login authentication failed", "Login authentication failed"], _ ;未译
["Invite sent successfully.\n", "Invite sent successfully.\n"], _ ;未译
["https://twitchapps.com/tmi/", "https://twitchapps.com/tmi/"], _ ;未译
["Failed to find build for %s", "Failed to find build for %s"], _ ;未译
["Clearing activity details\n", "Clearing activity details\n"], _ ;未译
["%s: Loaded friends from ini", "%s: Loaded friends from ini"], _ ;未译
["%s is the Zaishen Combat %s", "%s is the Zaishen Combat %s"], _ ;未译
["%s is the Zaishen Bounty %s", "%s is the Zaishen Bounty %s"], _ ;未译
["Powerstone of Courage\nGranite and Dust", "勇气粉石\n花岗岩石板 及 闪烁之土"], _
["installing event handler\n", "installing event handler\n"], _ ;未译
["[SCAN] StoragePatch = %p\n", "[SCAN] StoragePatch = %p\n"], _ ;未译
["Klaatu...barada...necktie?", "Klaatu...barada...necktie?"], _ ;未译
["Error checking for updates", "Error checking for updates"], _ ;未译
["Color:\n0x%02X%02X%02X%02X", "Color:\n0x%02X%02X%02X%02X"], _ ;未译
["Click to load builds to heroes and player", "击此以替英雄及角色装填技能样本"], _
["/flag all -2913.41 3004.78", "/flag all -2913.41 3004.78"], _ ;未译
["Unrecognised /pingitem %ls", "Unrecognised /pingitem %ls"], _ ;未译
["Travelling to guild hall\n", "Travelling to guild hall\n"], _ ;未译
["Toggle Pcons per character", "Toggle Pcons per character"], _ ;未译
["Player %S is not logged in", "Player %S is not logged in"], _ ;未译
["No more space in inventory", "No more space in inventory"], _ ;未译
["GWToolbox++ API Error (%d)", "GWToolbox++ API Error (%d)"], _ ;未译
["Failed to decode; invalid.", "Failed to decode; invalid."], _ ;未译
["Enable Discord integration", "Enable Discord integration"], _ ;未译
["DisplayDialogue from %ls: ", "DisplayDialogue from %ls: "], _ ;未译
["Discord: Network message\n", "Discord: Network message\n"], _ ;未译
["Discord Log Level %d: %s\n", "Discord Log Level %d: %s\n"], _ ;未译
["Day 5 of self isolation...", "Day 5 of self isolation..."], _ ;未译
["Click to send to team chat", "Click to send to team chat"], _ ;未译
["Challenge mission messages", "Challenge mission messages"], _ ;未译
["Automatic /age on vanquish", "Automatic /age on vanquish"], _ ;未译
["%ls found and pre-loaded\n", "%ls found and pre-loaded\n"], _ ;未译
[" (while Health is above n)", " (while Health is above n)"], _ ;未译
["DoA - Veil 1: Breaching Stygian Veil", "四门 - 冥狱之幕 1: 突破冥狱之幕"], _
["Room 8-9 | Failure/Shadows", "第 8-9 间 | Failure/Shadows"], _
["Room 13-14 | Decay/Torment", "第 13-14 间 | Decay/Torment"], _
["gateofthenightfallenlands", "夜蚀暗殒领地之门"], _
["activity.timestamps.start", "activity.timestamps.start"], _ ;未译
["Take me now, subcreature.", "Take me now, subcreature."], _ ;未译
["Only if you were 'Online'", "Only if you were 'Online'"], _ ;未译
["My cat's name is Mittens.", "My cat's name is Mittens."], _ ;未译
["Load Team Hero Build '%s'", "Load Team Hero Build '%s'"], _ ;未译
["It's a trick. Get an axe.", "It's a trick. Get an axe."], _ ;未译
["Failed openning file '%S'", "Failed openning file '%S'"], _ ;未译
["DoA - Gloom 2: The Rifts Between Us", "四门 - 夺心暗域 2: 异世界的裂缝"], _
["DoA - Gloom 1: Deathbringer Company", "四门 - 夺心暗域 1: 死亡召唤大队"], _
["Creating toolbox thread\n", "Creating toolbox thread\n"], _ ;未译
["CreateMutexW failed (%lu)", "CreateMutexW failed (%lu)"], _ ;未译
["Automatically manage gold", "Automatically manage gold"], _ ;未译
["Allow mouse click-through", "Allow mouse click-through"], _ ;未译
["A rare item drops for you", "A rare item drops for you"], _ ;未译
["(Each in a separate line)", "(Each in a separate line)"], _ ;未译
["You are not in an outpost", "You are not in an outpost"], _ ;未译
["Wanted, %s: <a=1>%s%s</a>", "Wanted, %s: <a=1>%s%s</a>"], _ ;未译
["Requires 9 Scythe Mastery", "Requires 9 Scythe Mastery"], _ ;未译
["ObjectiveTimerRuns_*.json", "ObjectiveTimerRuns_*.json"], _ ;未译
["Identify All Purple Items", "Identify All Purple Items"], _ ;未译
["GWToolbox++ is up-to-date", "GWToolbox++ is up-to-date"], _ ;未译
["Enable Twitch integration", "Enable Twitch integration"], _ ;未译
["DoA Quarantineway anyone?", "DoA Quarantineway anyone?"], _ ;未译
["Daily Quest Chat Commands", "Daily Quest Chat Commands"], _ ;未译
["Added special NPC %s (%d)", "Added special NPC %s (%d)"], _ ;未译
["Activity update FAILED!\n", "Activity update FAILED!\n"], _ ;未译
[" // enter something like ", " // enter something like "], _ ;未译
["https://kamadan.decltype.org", "https://kamadan.github.io"], _
["Scroll of Resurrection\nFibers and Bones", "复活卷\植物纤维 及 骨头"], _
["The size for this agent.", "The size for this agent."], _ ;未译
["The shape of this agent.", "The shape of this agent."], _ ;未译
["Receiving a party invite", "Receiving a party invite"], _ ;未译
["Open GWToolbox++ Website", "Open GWToolbox++ Website"], _ ;未译
["Hide any messages from: ", "Hide any messages from: "], _ ;未译
["Do not check for updates", "Do not check for updates"], _ ;未译
["Ctrl+Click to print time", "Ctrl+Click to print time"], _ ;未译
["Connected (not resigned)", "Connected (not resigned)"], _ ;未译
["Cannot find window '%ls'", "Cannot find window '%ls'"], _ ;未译
["/flag 5 -2913.41 3004.78", "/flag 5 -2913.41 3004.78"], _ ;未译
["Show run start date/time", "Show run start date/time"], _ ;未译
["No more salvage kit uses", "No more salvage kit uses"], _ ;未译
["Gyala Hatchery siege turtle", "盖拉孵化所_(探索区域) siege turtle"], _
["[SCAN] is_ingame = %p\n", "[SCAN] is_ingame = %p\n"], _ ;未译
["[SCAN] TomePatch = %p\n", "[SCAN] TomePatch = %p\n"], _ ;未译
["Whisper Target Name,msg", "Whisper Target Name,msg"], _ ;未译
["Show hero flag controls", "Show hero flag controls"], _ ;未译
["Only if you were 'Away'", "Only if you were 'Away'"], _ ;未译
["Lunar fortunes messages", "Lunar fortunes messages"], _ ;未译
["Level = %d, tint = %d\n", "Level = %d, tint = %d\n"], _ ;未译
["Installing Cursor Fix\n", "Installing Cursor Fix\n"], _ ;未译
["Green channel (0 - 255)", "Green channel (0 - 255)"], _ ;未译
["DoA - Foundry 2: Foundry Breakout", "四门 - 铸造厂 2: 逃出铸造厂"], _
["Will update on next map", "Will update on next map"], _ ;未译
["Wanted by Shining Blade", "Wanted by Shining Blade"], _ ;未译
["unwaking waters kurzick", "沉睡之水 (库兹柯)"], _
["Travelling to outpost\n", "Travelling to outpost\n"], _ ;未译
["transmoparty kanaxai 34", "transmoparty kanaxai 34"], _ ;未译
["transmoagent %d gwenpre", "transmoagent %d gwenpre"], _ ;未译
["Third Party Integration", "Third Party Integration"], _ ;未译
["sepulchre of dragrimmar", "爪格林玛坟墓"], _
["Salvage All White Items", "Salvage All White Items"], _ ;未译
["Requires 9 Divine Favor", "Requires 9 Divine Favor"], _ ;未译
["oauth:<your_token_here>", "oauth:<your_token_here>"], _ ;未译
["not idle nor moving, %d", "not idle nor moving, %d"], _ ;未译
["No results found for %s", "No results found for %s"], _ ;未译
["Nicholas Sandford: 5 %s", "Nicholas Sandford: 5 %s"], _ ;未译
["knocked down or missing", "knocked down or missing"], _ ;未译
["Kanaxai shows his true form", "加奈赛 shows his true form"], _
["Join process complete\n", "Join process complete\n"], _ ;未译
["Item already identified", "Item already identified"], _ ;未译
["Invalid bag slot %d/%d!", "Invalid bag slot %d/%d!"], _ ;未译
["Identify All Gold Items", "Identify All Gold Items"], _ ;未译
["Identify All Blue Items", "Identify All Blue Items"], _ ;未译
["I don't feel so good...", "I don't feel so good..."], _ ;未译
["Failed to parse message", "Failed to parse message"], _ ;未译
["catacombs of kathandrax", "卡山卓司的地下墓穴"], _
["Automatic /age2 on /age", "Automatic /age2 on /age"], _ ;未译
["##bycontentfilter_regex", "##bycontentfilter_regex"], _ ;未译
["Zone 9 | Blood Drinkers", "第 9 区 | Blood Drinkers"], _
["tomboftheprimevalkings", "先王之墓"], _
["greattempleofbalthazar", "巴萨泽圣殿"], _
["color_symbols_modifier", "color_symbols_modifier"], _ ;未译
["centraltransferchamber", "中央转送室"], _
["Restoring input hook\n", "Restoring input hook\n"], _ ;未译
["Reduce agent ping spam", "Reduce agent ping spam"], _ ;未译
["ReadFile failed ! (%u)", "ReadFile failed ! (%u)"], _ ;未译
["P085: id %d, type %d\n", "P085: id %d, type %d\n"], _ ;未译
["P082: id %d, type %d\n", "P082: id %d, type %d\n"], _ ;未译
["Moving to (%.0f, %.0f)", "Moving to (%.0f, %.0f)"], _ ;未译
["Mouse Wheel to scroll.", "Mouse Wheel to scroll."], _ ;未译
["Invalid district '%ls'", "Invalid district '%ls'"], _ ;未译
["Installed chat hooks\n", "Installed chat hooks\n"], _ ;未译
["Hall of Heroes winners", "Hall of Heroes winners"], _ ;未译
["Get away from my baby!", "Get away from my baby!"], _ ;未译
["Error downloading %s\n", "Error downloading %s\n"], _ ;未译
["Do you want to update?", "Do you want to update?"], _ ;未译
["Camera speed is now %f", "Camera speed is now %f"], _ ;未译
["Blue channel (0 - 255)", "Blue channel (0 - 255)"], _ ;未译
["Are you the Keymaster?", "Are you the Keymaster?"], _ ;未译
["Agent damaged modifier", "Agent damaged modifier"], _ ;未译
["Add Agent Custom Color", "Add Agent Custom Color"], _ ;未译
["Window\0Widget\0Hidden", "Window\0Widget\0Hidden"], _ ;未译
["Vale friendly spirit 2", "Vale friendly spirit 2"], _ ;未译
["Vale friendly spirit 1", "Vale friendly spirit 1"], _ ;未译
["Skills exported to %ls", "Skills exported to %ls"], _ ;未译
["Save/Load runs to disk", "Save/Load runs to disk"], _ ;未译
["Salvage Rare Materials", "Salvage Rare Materials"], _ ;未译
["Polling friends list\n", "Polling friends list\n"], _ ;未译
["Pits friendly spirit 4", "Pits friendly spirit 4"], _ ;未译
["Pits friendly spirit 3", "Pits friendly spirit 3"], _ ;未译
["Pits friendly spirit 2", "Pits friendly spirit 2"], _ ;未译
["Pits friendly spirit 1", "Pits friendly spirit 1"], _ ;未译
["Order team builds by: ", "Order team builds by: "], _ ;未译
["NpcGeneralStats name: ", "NpcGeneralStats name: "], _ ;未译
["No more %s items found", "No more %s items found"], _ ;未译
["Naga Shaman (Polymock)", "Naga Shaman (Polymock)"], _ ;未译
["Main Window Visibility", "Main Window Visibility"], _ ;未译
["kamadan jewel of istan", "kamadan jewel of istan"], _ ;未译
["Invalid server name!\n", "Invalid server name!\n"], _ ;未译
["fort aspenwood kurzick", "杨木要塞 (库兹柯)"], _
["Flame Djinn (Polymock)", "Flame Djinn (Polymock)"], _ ;未译
["Failed to send message", "Failed to send message"], _ ;未译
["Ebon Vanguard Assassin", "Ebon Vanguard Assassin"], _ ;未译
["e.e. 'You are: Online'", "e.e. 'You are: Online'"], _ ;未译
["Display character info", "Display character info"], _ ;未译
["Available NPC Dialogs:", "Available NPC Dialogs:"], _ ;未译
["aspenwood gate kurzick", "杨木大门 (库兹柯)"], _
["Agent Enc Name##target", "Agent Enc Name##target"], _ ;未译
["<a=1>%S</a>: Connected", "<a=1>%S</a>: Connected"], _ ;未译
["%s%s - %s%s###header%d", "%s%s - %s%s###header%d"], _ ;未译
["%s [%s]%s%s###header%u", "%s [%s]%s%s###header%u"], _ ;未译
["Kama -> Docks @ Hahnna", "卡玛丹 -> 领事馆码头 @ Hahnna"], _
["DoA - Gloom 3: To The Rescue!", "四门 - 夺心暗域 3: 前往救援!"], _
["Zone 4 | Bridge Wolves", "第 4 区 | Bridge Wolves"], _
["unwakingwaterskurzick", "沉睡之水 (库兹柯)"], _
["show_active_in_header", "show_active_in_header"], _ ;未译
["region_charrhomelands", "region_charrhomelands"], _ ;未译
["minutes of inactivity", "minutes of inactivity"], _ ;未译
["maxrange_interp_begin", "maxrange_interp_begin"], _ ;未译
["lutgardisconservatory", "路嘉帝斯温室"], _
["dll file name is %s\n", "dll file name is %s\n"], _ ;未译
["color_shadowstep_mark", "color_shadowstep_mark"], _ ;未译
["color_shadowstep_line", "color_shadowstep_line"], _ ;未译
["While editing text:\n", "While editing text:\n"], _ ;未译
["Suppress drunk emotes", "Suppress drunk emotes"], _ ;未译
["Show bonds for Allies", "Show bonds for Allies"], _ ;未译
["Removing Cursor Fix\n", "Removing Cursor Fix\n"], _ ;未译
["Red channel (0 - 255)", "Red channel (0 - 255)"], _ ;未译
["Just used the last %s", "Just used the last %s"], _ ;未译
["Installing dx hooks\n", "Installing dx hooks\n"], _ ;未译
["GWToolbox++ API Error", "GWToolbox++ API Error"], _ ;未译
["Bars towards the left", "Bars towards the left"], _ ;未译
["'No one hears you...'", "'No one hears you...'"], _ ;未译
["'/cam unlock' options", "'/cam unlock' options"], _ ;未译
["Wanted: <a=1>%s%s</a>", "Wanted: <a=1>%s%s</a>"], _ ;未译
["unwaking waters luxon", "沉睡之水 (勒克森)"], _
["transmoagent %d reset", "transmoagent %d reset"], _ ;未译
["Searching trade for \", "Searching trade for \"], _ ;未译
["No friend '%ls' found", "No friend '%ls' found"], _ ;未译
["NextedStruct(%lu) {\n", "NextedStruct(%lu) {\n"], _ ;未译
["message NOT encoded, ", "message NOT encoded, "], _ ;未译
["kamadan.gwtoolbox.com", "kamadan.gwtoolbox.com"], _ ;未译
["Join Party Failed: %s", "Join Party Failed: %s"], _ ;未译
["Invite send FAILED!\n", "Invite send FAILED!\n"], _ ;未译
["Guild Wars Skill List", "Guild Wars Skill List"], _ ;未译
["Friends list polled\n", "Friends list polled\n"], _ ;未译
["Fetching map info now", "Fetching map info now"], _ ;未译
["Enchantments +%d%%\x1", "Enchantments +%d%%\x1"], _ ;未译
["Don't remind me again", "Don't remind me again"], _ ;未译
["Do I look ill to you?", "Do I look ill to you?"], _ ;未译
["Discord DLL hooked!\n", "Discord DLL hooked!\n"], _ ;未译
["Disable on map change", "Disable on map change"], _ ;未译
["ChatFilter Blocked:\n", "ChatFilter Blocked:\n"], _ ;未译
["%d###ignore_packet_%d", "%d###ignore_packet_%d"], _ ;未译
["###show_as_explorable", "###show_as_explorable"], _ ;未译
[" to specify an hexadecimal number", " 指定一16位进制的数字"], _
["Zone 6 | Energy Drain", "第 6 区 | Energy Drain"], _
["vizunahsquareforeign", "vizunahsquareforeign"], _ ;未译
["region_crystaldesert", "region_crystaldesert"], _ ;未译
["jadequarrykurzickthe", "jadequarrykurzickthe"], _ ;未译
["greatnorthernwallthe", "greatnorthernwallthe"], _ ;未译
["grandcourtofsebelkeh", "希贝克大公廷"], _
["fortaspenwoodkurzick", "杨木要塞 (库兹柯)"], _
["color_custom_markers", "color_custom_markers"], _ ;未译
["aspenwoodgatekurzick", "杨木大门 (库兹柯)"], _
["WSAStartup Failed.\n", "WSAStartup Failed.\n"], _ ;未译
["This house is clean.", "This house is clean."], _ ;未译
["Such as Deep aspects", "Such as Deep aspects"], _ ;未译
["Shiverpeak Mountains", "Shiverpeak Mountains"], _ ;未译
["Move to (%.0f, %.0f)", "Move to (%.0f, %.0f)"], _ ;未译
["Marker: (%.0f, %.0f)", "Marker: (%.0f, %.0f)"], _ ;未译
["Load Hero Team Build", "Load Hero Team Build"], _ ;未译
["Load Build on Player", "Load Build on Player"], _ ;未译
["Launch Application 2", "Launch Application 2"], _ ;未译
["Launch Application 1", "Launch Application 1"], _ ;未译
["Installed dx hooks\n", "Installed dx hooks\n"], _ ;未译
["GWTB++ Debug Console", "GWTB++ Debug Console"], _ ;未译
["Earning skill points", "Earning skill points"], _ ;未译
["Delete the teambuild", "Delete the teambuild"], _ ;未译
["Click to cancel bond", "Click to cancel bond"], _ ;未译
["Automatic message: \", "Automatic message: \"], _ ;未译
["Allow window restore", "Allow window restore"], _ ;未译
["Afk message set to \", "Afk message set to \"], _ ;未译
["4...Itchy...Tasty...", "4...Itchy...Tasty..."], _ ;未译
["- ESCAPE to revert\n", "- ESCAPE to revert\n"], _ ;未译
["Urpp... feel sick...", "Urpp... feel sick..."], _ ;未译
["unknown transmo '%s'", "unknown transmo '%s'"], _ ;未译
["StoC packet(%lu) {\n", "StoC packet(%lu) {\n"], _ ;未译
["sender NOT encoded\n", "sender NOT encoded\n"], _ ;未译
["Salvage All options:", "Salvage All options:"], _ ;未译
["saint anjekas shrine", "圣者安捷卡的祭坛"], _
["Only show when drunk", "Only show when drunk"], _ ;未译
["Notify on user leave", "Notify on user leave"], _ ;未译
["No more space for %s", "No more space for %s"], _ ;未译
["minister chos estate", "周大臣庄园_(探索区域)"], _
["message IS encoded, ", "message IS encoded, "], _ ;未译
["Maps exported to %ls", "Maps exported to %ls"], _ ;未译
["kanaxai\\kanaxai.mp3", "kanaxai\\kanaxai.mp3"], _ ;未译
["IRC::start failed!\n", "IRC::start failed!\n"], _ ;未译
["Inventory Management", "Inventory Management"], _ ;未译
["Friend List Commands", "Friend List Commands"], _ ;未译
["fort aspenwood luxon", "杨木要塞 (勒克森)"], _
["Failed to add friend", "Failed to add friend"], _ ;未译
["Empty value for Name", "Empty value for Name"], _ ;未译
["Ebon Vanguard Ritual", "黑檀先锋队仪式"], _
["Discord disconnected", "Discord disconnected"], _ ;未译
["DialogBody content: ", "DialogBody content: "], _ ;未译
["Delete the threshold", "Delete the threshold"], _ ;未译
["Cannot enter outpost", "Cannot enter outpost"], _ ;未译
["browser_download_url", "browser_download_url"], _ ;未译
["aspenwood gate luxon", "杨木大门 (勒克森)"], _
["24h Deep mode off :(", "24h Deep mode off :("], _ ;未译
["/tp house zu heltzer", "/tp house zu heltzer"], _ ;未译
["'You gain x faction'", "'You gain x faction'"], _ ;未译
["LA Gate -> LA @ Neiro", "狮门 -> 狮子拱门 @ Neiro"], _
["Docks -> Kaineng @ Mhenlo", "领事馆码头 -> 凯宁中心 @ 涵洛"], _
["Click to send teambuild to chat", "击此以发送整团的技能样本"], _
["Zone 5 | More Wolves", "第 5 区 | More Wolves"], _
["unwakingwatersluxon", "沉睡之水 (勒克森)"], _
["region_tenguaccords", "region_tenguaccords"], _ ;未译
["profession_%d_512px", "profession_%d_512px"], _ ;未译
["maxrange_interp_end", "maxrange_interp_end"], _ ;未译
["ironminesofmoladune", "莫拉登矿山"], _
["color_range_compass", "color_range_compass"], _ ;未译
["Zoning in a new map", "Zoning in a new map"], _ ;未译
["The Tarnished Coast", "The Tarnished Coast"], _ ;未译
["The Depths of Tyria", "The Depths of Tyria"], _ ;未译
["Show second decimal", "Show second decimal"], _ ;未译
["Show 'Start' column", "Show 'Start' column"], _ ;未译
["Sent dialog %s (%d)", "Sent dialog %s (%d)"], _ ;未译
["Number of favorites", "Number of favorites"], _ ;未译
["No target selected!", "No target selected!"], _ ;未译
["Item #%d not found!", "Item #%d not found!"], _ ;未译
["Invalid hero number", "Invalid hero number"], _ ;未译
["Discord Integration", "Discord Integration"], _ ;未译
["DISCORD_INSTANCE_ID", "DISCORD_INSTANCE_ID"], _ ;未译
["Zaishen Vanquishing", "Zaishen Vanquishing"], _ ;未译
["Vect3(%f, %f, %f)\n", "Vect3(%f, %f, %f)\n"], _ ;未译
["sender IS encoded\n", "sender IS encoded\n"], _ ;未译
["Refill from storage", "Refill from storage"], _ ;未译
["PRIVMSG #%s :%s\r\n", "PRIVMSG #%s :%s\r\n"], _ ;未译
["Player Info##target", "Player Info##target"], _ ;未译
["Piercing Dmg: 11-22", "Piercing Dmg: 11-22"], _ ;未译
["Notify on user join", "Notify on user join"], _ ;未译
["No items to salvage", "No items to salvage"], _ ;未译
["Missing player name", "Missing player name"], _ ;未译
["Message from %s: %s", "Message from %s: %s"], _ ;未译
["Log Message Content", "Log Message Content"], _ ;未译
["Lock size as widget", "Lock size as widget"], _ ;未译
["Lock move as widget", "Lock move as widget"], _ ;未译
["kanaxai\\room14.mp3", "kanaxai\\room14.mp3"], _ ;未译
["kanaxai\\room13.mp3", "kanaxai\\room13.mp3"], _ ;未译
["kanaxai\\room12.mp3", "kanaxai\\room12.mp3"], _ ;未译
["kanaxai\\room10.mp3", "kanaxai\\room10.mp3"], _ ;未译
["jade quarry kurzick", "jade quarry kurzick"], _ ;未译
["Invalid username!\n", "Invalid username!\n"], _ ;未译
["Identified %d items", "Identified %d items"], _ ;未译
["great northern wall", "great northern wall"], _ ;未译
["Faction Leaderboard", "Faction Leaderboard"], _ ;未译
["Dmg +20% (Festival)", "Dmg +20% (Festival)"], _ ;未译
["Discord connected\n", "Discord connected\n"], _ ;未译
["Connecting to IRC\n", "Connecting to IRC\n"], _ ;未译
["Connected to IRC!\n", "Connected to IRC!\n"], _ ;未译
["Competitive Mission", "Competitive Mission"], _ ;未译
["color_aoe_effect_%d", "color_aoe_effect_%d"], _ ;未译
["Click to disconnect", "Click to disconnect"], _ ;未译
["Cinematic start/end", "Cinematic start/end"], _ ;未译
["cathedral of flames", "火焰大教堂"], _
["Building fonts...\n", "Building fonts...\n"], _ ;未译
["Build Chat Commands", "Build Chat Commands"], _ ;未译
["'Inventory is full'", "'Inventory is full'"], _ ;未译
["Map ID is unique for each area", "每处皆有一独特的地图号"], _
["Docks -> LA Gate @ Mhenlo", "领事馆码头 -> 狮门 @ 涵洛"], _
["DoA - Veil 2: Brood Wars", "四门 - 冥狱之幕 2: 一网打尽"], _
["%S (%S) has just logged out.", "%S (%S) 刚下游戏."], _
["Zone 7 | Exhaustion", "第 7 区 | Exhaustion"], _
["Zone 2 | Life Drain", "第 2 区 | Life Drain"], _
["Room 12 | Depletion", "第 12 间 | Depletion"], _
["vizunahsquarelocal", "vizunahsquarelocal"], _ ;未译
["show_run_in_header", "show_run_in_header"], _ ;未译
["sardelacsanitarium", "萨德拉克疗养院"], _
["saintanjekasshrine", "圣者安捷卡的祭坛"], _
["region_whitemantle", "region_whitemantle"], _ ;未译
["region_shiverpeaks", "region_shiverpeaks"], _ ;未译
["region_flightnorth", "region_flightnorth"], _ ;未译
["region_battlejahai", "region_battlejahai"], _ ;未译
["region_battleisles", "region_battleisles"], _ ;未译
["ministerchosestate", "周大臣庄园_(探索区域)"], _
["lairoftheforgotten", "被遗忘者的巢穴"], _
["jadequarryluxonthe", "jadequarryluxonthe"], _ ;未译
["grendichcourthouse", "葛兰迪法院"], _
["fortaspenwoodluxon", "杨木要塞 (勒克森)"], _
["color_range_spirit", "color_range_spirit"], _ ;未译
["blocked skill %d\n", "blocked skill %d\n"], _ ;未译
["assets.large_image", "assets.large_image"], _ ;未译
["aspenwoodgateluxon", "杨木大门 (勒克森)"], _
["Window Title Align", "Window Title Align"], _ ;未译
["Show 'Time' column", "Show 'Time' column"], _ ;未译
["Scrollbar Rounding", "Scrollbar Rounding"], _ ;未译
["Save Location Data", "Save Location Data"], _ ;未译
["Pings and drawings", "Pings and drawings"], _ ;未译
["P081: id %d, name ", "P081: id %d, name "], _ ;未译
["Opening ini file\n", "Opening ini file\n"], _ ;未译
["Lunars and Alcohol", "Lunars and Alcohol"], _ ;未译
["Load Build on Hero", "Load Build on Hero"], _ ;未译
["Initializing API\n", "Initializing API\n"], _ ;未译
["I see dead people.", "I see dead people."], _ ;未译
["GWToolbox++ Crash!", "GWToolbox++ Crash!"], _ ;未译
["Enabled-Background", "Enabled-Background"], _ ;未译
["Creating Toolbox\n", "Creating Toolbox\n"], _ ;未译
["Creating Modules\n", "Creating Modules\n"], _ ;未译
["Coin dropper is %s", "Coin dropper is %s"], _ ;未译
["Click to cast bond", "Click to cast bond"], _ ;未译
["%s [%s]###header%u", "%s [%s]###header%u"], _ ;未译
["%s - %s###header%d", "%s - %s###header%d"], _ ;未译
["} endpacket(%lu)\n", "} endpacket(%lu)\n"], _ ;未译
["Weekly Bonus (PvP)", "Weekly Bonus (PvP)"], _ ;未译
["Weekly Bonus (PvE)", "Weekly Bonus (PvE)"], _ ;未译
["vloxen excavations", "弗洛森古迹"], _
["Unable to use item", "Unable to use item"], _ ;未译
["Twitch Oauth Token", "Twitch Oauth Token"], _ ;未译
["transmoparty reset", "transmoparty reset"], _ ;未译
["Trade Window mode:", "Trade Window mode:"], _ ;未译
["Target##cam_target", "Target##cam_target"], _ ;未译
["Show spirit timers", "Show spirit timers"], _ ;未译
["Sending to IRC: %s", "Sending to IRC: %s"], _ ;未译
["Salvaging items...", "Salvaging items..."], _ ;未译
["kanaxai\\room8.mp3", "kanaxai\\room8.mp3"], _ ;未译
["kanaxai\\room6.mp3", "kanaxai\\room6.mp3"], _ ;未译
["kanaxai\\room5.mp3", "kanaxai\\room5.mp3"], _ ;未译
["jade flats kurzick", "翡翠浅滩 (库兹柯)"], _
["irc.chat.twitch.tv", "irc.chat.twitch.tv"], _ ;未译
["Inventory Settings", "Inventory Settings"], _ ;未译
["In-Game Trade Chat", "In-Game Trade Chat"], _ ;未译
["Identify All Items", "Identify All Items"], _ ;未译
["Ice Imp (Polymock)", "Ice Imp (Polymock)"], _ ;未译
["Guild Info##target", "Guild Info##target"], _ ;未译
["Guild Announcement", "Guild Announcement"], _ ;未译
["global_enable_cols", "global_enable_cols"], _ ;未译
["friend_list_scroll", "friend_list_scroll"], _ ;未译
["Edge of Extinction", "Edge of Extinction"], _ ;未译
["Display party info", "Display party info"], _ ;未译
["CtoS packet(%lu)\n", "CtoS packet(%lu)\n"], _ ;未译
["Bag #%d not found!", "Bag #%d not found!"], _ ;未译
["###show_as_outpost", "###show_as_outpost"], _ ;未译
["Disabled###pconstoggle", "已关闭###pconstoggle"], _
["Room 7 | Depletion", "第 7 间 | Depletion"], _
["Room 3 | Surrender", "第 3 间 | Surrender"], _
["Room 10 | Scorpion", "第 10 间 | Scorpion"], _
["zosshivroschannel", "佐席洛斯水道"], _
["sunspearsanctuary", "日戟避难所"], _
["sunspeargreathall", "日戟大会堂"], _
["shingjeamonastery", "星岬寺"], _
["riversideprovince", "河畔地带"], _
["remainsofsahlahja", "萨拉迦遗址"], _
["region_presearing", "region_presearing"], _ ;未译
["mouthoftormentthe", "mouthoftormentthe"], _ ;未译
["kodonurcrossroads", "科登诺路口"], _
["granitecitadelthe", "granitecitadelthe"], _ ;未译
["copperhammermines", "铜锤矿坑"], _
["color_range_aggro", "color_range_aggro"], _ ;未译
["WindowTitleAlignY", "WindowTitleAlignY"], _ ;未译
["WindowTitleAlignX", "WindowTitleAlignX"], _ ;未译
["The Tengu Accords", "The Tengu Accords"], _ ;未译
["Show extra timers", "Show extra timers"], _ ;未译
["Show close button", "Show close button"], _ ;未译
["Show 'End' column", "Show 'End' column"], _ ;未译
["Shadowstep Marker", "Shadowstep Marker"], _ ;未译
["Select a favorite", "Select a favorite"], _ ;未译
["ScrollbarRounding", "ScrollbarRounding"], _ ;未译
["Restore Defaults?", "Restore Defaults?"], _ ;未译
["Player ID##player", "Player ID##player"], _ ;未译
["Marker Y Position", "Marker Y Position"], _ ;未译
["Marker X Position", "Marker X Position"], _ ;未译
["ItemInnerSpacingY", "ItemInnerSpacingY"], _ ;未译
["ItemInnerSpacingX", "ItemInnerSpacingX"], _ ;未译
["Item InnerSpacing", "Item InnerSpacing"], _ ;未译
["Invalid argument.", "Invalid argument."], _ ;未译
["Global Font Scale", "Global Font Scale"], _ ;未译
["Enabled###pconstoggle", "已启动###pconstoggle"], _
["Delete Teambuild?", "Delete Teambuild?"], _ ;未译
["Cannot load font!", "Cannot load font!"], _ ;未译
["Button Text Align", "Button Text Align"], _ ;未译
["Browser Favorites", "Browser Favorites"], _ ;未译
["Attach to minimap", "Attach to minimap"], _ ;未译
["(Not implemented)", "(Not implemented)"], _ ;未译
["\n\nAre you sure?", "\n\nAre you sure?"], _ ;未译
["vanguard tomorrow", "vanguard tomorrow"], _ ;未译
["Scroll not found!", "Scroll not found!"], _ ;未译
["Salvaged %d items", "Salvaged %d items"], _ ;未译
["rragars menagerie", "拉喀的牢笼"], _
["q9 Scythe Mastery", "q9 Scythe Mastery"], _ ;未译
["Position##cam_pos", "Position##cam_pos"], _ ;未译
["nicholas tomorrow", "nicholas tomorrow"], _ ;未译
["Leaves your party", "Leaves your party"], _ ;未译
["jade quarry luxon", "jade quarry luxon"], _ ;未译
["Item Context Menu", "Item Context Menu"], _ ;未译
["Inscription: None", "Inscription: None"], _ ;未译
["frostmaws burrows", "冻霜地道"], _
["Enchantment Spell", "加持魔法"], _
["domain of anguish", "悲难领地"], _
["dalessio seaboard", "达雷西海滨"], _
["Connected Locally", "Connected Locally"], _ ;未译
["Check for updates", "Check for updates"], _ ;未译
["??? duration -20%", "??? duration -20%"], _ ;未译
["??? duration +33%", "??? duration +33%"], _ ;未译
["24h Deep mode on!", "24h Deep mode on!"], _ ;未译
["##bycontentfilter", "##bycontentfilter"], _ ;未译
["Load build on your character", "为角色装填技能样本"], _
["Gate of the Nightfallen Lands", "夜蚀暗殒领地之门"], _
["A simple in-game text editor", "一简易的嵌入式便笺"], _
["%d foes in compass range", "雷达范围内有 %d 名敌人"], _
["%d foes in casting range", "施法范围内有 %d 名敌人"], _
["Zone 1 | Weakness", "第 1 区 | Weakness"], _
["Room 6 | Lethargy", "第 6 间 | Lethargy"], _
["Room 4 | Exposure", "第 4 间 | Exposure"], _
["Room 1 | Soothing", "第 1 间 | Soothing"], _
["zaishenmenagerie", "战承动物园"], _
["zaishenchallenge", "战承挑战赛"], _
["sunjiangdistrict", "孙江行政区_(探索区域)"], _
["region_tarnished", "region_tarnished"], _ ;未译
["jadeflatskurzick", "翡翠浅滩 (库兹柯)"], _
["icecavesofsorrow", "悲伤冰谷"], _
["gateofdesolation", "荒芜之地入口"], _
["deldrimorwarcamp", "戴尔狄摩兵营"], _
["dalessioseaboard", "达雷西海滨"], _
["custommarker%03d", "custommarker%03d"], _ ;未译
["color_range_cast", "color_range_cast"], _ ;未译
["chantryofsecrets", "隐秘教堂"], _
["bergenhotsprings", "卑尔根温泉"], _
["Vanquish counter", "Vanquish counter"], _ ;未译
["Total ~ 100 % ~ ", "Total ~ 100 % ~ "], _ ;未译
["Tick is a toggle", "Tick is a toggle"], _ ;未译
["The Flight North", "The Flight North"], _ ;未译
["Show Enemy Count", "Show Enemy Count"], _ ;未译
["Sent Dialog 0x%X", "Sent Dialog 0x%X"], _ ;未译
["Send chat '%c%s'", "Send chat '%c%s'"], _ ;未译
["Restore Defaults", "Restore Defaults"], _ ;未译
["Realm of Torment", "Realm of Torment"], _ ;未译
["Poison Spout: %d", "Poison Spout: %d"], _ ;未译
["Model ID##target", "Model ID##target"], _ ;未译
["Keiran Thackeray", "Keiran Thackeray"], _ ;未译
["Jade Quarry (Kurzick), The", "翡翠矿场 (库兹柯)"], _
["International %d", "International %d"], _ ;未译
["I have returned!", "I have returned!"], _ ;未译
["Hooks Enabled!\n", "Hooks Enabled!\n"], _ ;未译
["Drop or Use Buff", "Drop or Use Buff"], _ ;未译
["Downloading %s\n", "Downloading %s\n"], _ ;未译
["Destroying API\n", "Destroying API\n"], _ ;未译
["Delete the color", "Delete the color"], _ ;未译
["ButtonTextAlignY", "ButtonTextAlignY"], _ ;未译
["ButtonTextAlignX", "ButtonTextAlignX"], _ ;未译
["Agent ID##target", "Agent ID##target"], _ ;未译
["Agent ID##player", "Agent ID##player"], _ ;未译
["Advanced##target", "Advanced##target"], _ ;未译
["%s_color_message", "%s_color_message"], _ ;未译
["%s###herobuild%d", "%s###herobuild%d"], _ ;未译
["Zaishen Vanquish", "Zaishen Vanquish"], _ ;未译
["Weekly Bonus PvP", "Weekly Bonus PvP"], _ ;未译
["Weekly Bonus PvE", "Weekly Bonus PvE"], _ ;未译
["vs. Earth damage", "vs. Earth damage"], _ ;未译
["Try '/pc <item>'", "Try '/pc <item>'"], _ ;未译
["spirit_effect_%d", "spirit_effect_%d"], _ ;未译
["Show hidden NPCs", "Show hidden NPCs"], _ ;未译
["Pcons loaded: %s", "Pcons loaded: %s"], _ ;未译
["Northern Support", "Northern Support"], _ ;未译
["No Party to join", "No Party to join"], _ ;未译
["mouth of torment", "mouth of torment"], _ ;未译
["menubuttons_cols", "menubuttons_cols"], _ ;未译
["Map ID (0 = Any)", "Map ID (0 = Any)"], _ ;未译
["Joins your party", "Joins your party"], _ ;未译
["jade flats luxon", "翡翠浅滩 (勒克森)"], _
["Invalid model id", "Invalid model id"], _ ;未译
["Go to Guild Hall", "Go to Guild Hall"], _ ;未译
["gadds encampment", "盖德营地"], _
["fishermens haven", "渔人避风港"], _
["Click to connect", "Click to connect"], _ ;未译
["Build loaded: %s", "Build loaded: %s"], _ ;未译
["Array32(%lu) {\n", "Array32(%lu) {\n"], _ ;未译
["Array16(%lu) {\n", "Array16(%lu) {\n"], _ ;未译
["%s: Connected %s", "%s: Connected %s"], _ ;未译
["##byauthorfilter", "##byauthorfilter"], _ ;未译
["Unwaking Waters (Kurzick)", "沉睡之水 (库兹柯)"], _
["Prof Change - Elementalist", "职业更换 - 元素"], _
["Price Check##resscroll", "估价##resscroll"], _
["Invalid dialog number '%s'", "无效令码 '%s'"], _
["Zone 8 | Pillars", "第 8 区 | Pillars"], _
["Zone 10 | Bridge", "第 10 区 | Bridge"], _
["The Hidden City of Ahdashim", "隐藏之城，哈达辛"], _
["thunderheadkeep", "雷云要塞"], _
["templeoftheages", "世纪神殿"], _
["tanglewoodcopse", "谭格梧树林"], _
["tahnnakaitemple", "谭纳凯神殿"], _
["region_shingjea", "region_shingjea"], _ ;未译
["region_farshivs", "region_farshivs"], _ ;未译
["kodashbazaarthe", "kodashbazaarthe"], _ ;未译
["jokanurdiggings", "卓坎诺挖掘点"], _
["imperialsanctum", "帝国圣所"], _
["gaddsencampment", "盖德营地"], _
["fishermenshaven", "渔人避风港"], _
["eternalgrovethe", "eternalgrovethe"], _ ;未译
["dzagonurbastion", "萨岗诺棱堡"], _
["durheimarchives", "杜汉姆卷藏室"], _
["customagent%03d", "customagent%03d"], _ ;未译
["color_range_hos", "color_range_hos"], _ ;未译
["color_mapshadow", "color_mapshadow"], _ ;未译
["Window Rounding", "Window Rounding"], _ ;未译
["Version %s is available!", "%s 版助手已发行!"], _
["Unlock Move All", "Unlock Move All"], _ ;未译
["Tick with pcons", "Tick with pcons"], _ ;未译
["Symbol Modifier", "Symbol Modifier"], _ ;未译
["Shadowstep Line", "Shadowstep Line"], _ ;未译
["Restore Default", "Restore Default"], _ ;未译
["Poison Trap: %d", "Poison Trap: %d"], _ ;未译
["Ping build '%s'", "Ping build '%s'"], _ ;未译
["Objective Timer", "Objective Timer"], _ ;未译
["Max range start", "Max range start"], _ ;未译
["Jade Quarry (Luxon), The", "翡翠矿场 (勒克森)"], _
["IME Mode change", "IME Mode change"], _ ;未译
["IME Hanja/Kanji", "IME Hanja/Kanji"], _ ;未译
["Hostile (>90%%)", "Hostile (>90%%)"], _ ;未译
["Hero Build Name", "Hero Build Name"], _ ;未译
["Full Conset Price: %g k", "三件套总价: %g k"], _
["Fort Aspenwood (Kurzick)", "杨木要塞 (库兹柯)"], _
["FontGlobalScale", "FontGlobalScale"], _ ;未译
["Far Shiverpeaks", "席娃山脉极端"], _
["Effects##player", "Effects##player"], _ ;未译
["Current drunk level: %d", "现醉酒程度: %d 级"], _
["Close on travel", "Close on travel"], _ ;未译
["Charr Homelands", "夏尔家园"], _
["Browser Refresh", "Browser Refresh"], _ ;未译
["Browser Forward", "Browser Forward"], _ ;未译
["Battle of Jahai", "Battle of Jahai"], _ ;未译
["Aspenwood Gate (Kurzick)", "杨木大门 (库兹柯)"], _
["10 Piles of Glittering Dust", "10 闪烁之土"], _
["%s_color_sender", "%s_color_sender"], _ ;未译
["%d foes in spirit range", "灵距内有 %d 名敌人"], _
["[Pcons][%s %d] ", "[Pcons][%s %d] "], _ ;未译
["Zaishen Mission", "Zaishen Mission"], _ ;未译
["wanted tomorrow", "wanted tomorrow"], _ ;未译
["ventaris refuge", "凡特里庇护所"], _
["Vect2(%f, %f)\n", "Vect2(%f, %f)\n"], _ ;未译
["Value: 122 gold", "Value: 122 gold"], _ ;未译
["Twitch Username", "Twitch Username"], _ ;未译
["The Floodplain of Mahnkelon", "曼克隆泛滥平原"], _
["seekers passage", "探索者通道"], _
["q9 Divine Favor", "q9 Divine Favor"], _ ;未译
["Piercing: 11-22", "Piercing: 11-22"], _ ;未译
["Off-Hand Attack", "即刻攻击"], _
["NPC ModelFileID", "NPC ModelFileID"], _ ;未译
["Lunars detected", "Lunars detected"], _ ;未译
["Log NPC Dialogs", "Log NPC Dialogs"], _ ;未译
["Loading fonts\n", "Loading fonts\n"], _ ;未译
["Ignored Packets", "Ignored Packets"], _ ;未译
["HSR <attribute>", "HSR <attribute>"], _ ;未译
["Hide in outpost", "Hide in outpost"], _ ;未译
["heroes audience", "英雄之痕"], _
["hells precipice", "地狱悬崖"], _
["HCT <attribute>", "HCT <attribute>"], _ ;未译
["granite citadel", "granite citadel"], _ ;未译
["Gandara, the Moon Fortress", "弦月要塞，干达拉"], _
["FoW Forgemaster", "FoW Forgemaster"], _ ;未译
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
["*cough* *cough*", "*cough* *cough*"], _ ;未译
["###resscrollqty", "###resscrollqty"], _ ;未译
["###Mod Struct 1", "###Mod Struct 1"], _ ;未译
["Vizunah Square (Foreign)", "薇茹广场 (外地)"], _
["Unwaking Waters (Luxon)", "沉睡之水 (勒克森)"], _
["Reapply appropriate Title", "重新展示相关头衔"], _
["Zone 3 | Levers", "第 3 区 | Levers"], _
["Murakai, Lady of the Night", "夜之女 幕兰凯"], _
["Intricate Grawl Necklaces", "精细的穴居人项链"], _
["wehhanterraces", "薇恩平台"], _
["ventarisrefuge", "凡特里庇护所"], _
["tarnishedhaven", "灰暗避难所"], _
["shadownexusthe", "shadownexusthe"], _ ;未译
["serenitytemple", "宁静神殿"], _
["seekerspassage", "探索者通道"], _
["region_torment", "region_torment"], _ ;未译
["region_maguuma", "region_maguuma"], _ ;未译
["region_kaineng", "region_kaineng"], _ ;未译
["region_ascalon", "region_ascalon"], _ ;未译
["ranmusugardens", "岚穆苏花园"], _
["moving to %s\n", "moving to %s\n"], _ ;未译
["mihanutownship", "米哈努小镇"], _
["marketplacethe", "marketplacethe"], _ ;未译
["kamadan, Jewel of Istan", "卡玛丹，艾斯坦之钻"], _
["jadeflatsluxon", "翡翠浅滩 (勒克森)"], _
["instance timer", "instance timer"], _ ;未译
["housezuheltzer", "凤荷议院"], _
["hotkey-%03d:%s", "hotkey-%03d:%s"], _ ;未译
["heroesaudience", "英雄之痕"], _
["hengeofdenravi", "丹拉维圣地"], _
["hellsprecipice", "地狱悬崖"], _
["emberlightcamp", "残火营地"], _
["dunesofdespair", "绝望沙丘"], _
["druidsoverlook", "德鲁伊高地"], _
["dragonslairthe", "dragonslairthe"], _ ;未译
["doomloreshrine", "末日传说神殿"], _
["dashavestibule", "达沙走廊"], _
["customline%03d", "customline%03d"], _ ;未译
["color_drawings", "color_drawings"], _ ;未译
["chahbekvillage", "夏贝克村庄"], _
["auriosminesthe", "auriosminesthe"], _ ;未译
["astralariumthe", "astralariumthe"], _ ;未译
["amnoonoasisthe", "amnoonoasisthe"], _ ;未译
["WindowRounding", "WindowRounding"], _ ;未译
["WindowPaddingY", "WindowPaddingY"], _ ;未译
["WindowPaddingX", "WindowPaddingX"], _ ;未译
["Window Padding", "Window Padding"], _ ;未译
["Toggle###combo", "Toggle###combo"], _ ;未译
["The Desolation", "荒芜之地"], _
["Scrollbar Size", "Scrollbar Size"], _ ;未译
["Prof Change - Ritualist", "职业更换 - 祭祀"], _
["Poison Jet: %d", "Poison Jet: %d"], _ ;未译
["Player (alive)", "Player (alive)"], _ ;未译
["NameProperties", "NameProperties"], _ ;未译
["Message Color:", "Message Color:"], _ ;未译
["Kamadan, Jewel of Istan", "卡玛丹，艾斯坦之钻"], _
["Indent Spacing", "Indent Spacing"], _ ;未译
["IME Nonconvert", "IME Nonconvert"], _ ;未译
["Hostile (dead)", "Hostile (dead)"], _ ;未译
["Frame Rounding", "Frame Rounding"], _ ;未译
["Fort Aspenwood (Luxon)", "杨木要塞 (勒克森)"], _
["FoW - Army Of Darkness", "灾难 - 黑暗的军队"], _
["Fire Spout: %d", "Fire Spout: %d"], _ ;未译
["Exhaustion: %d", "Exhaustion: %d"], _ ;未译
["Drop Gold Coin", "Drop Gold Coin"], _ ;未译
["Delete Hotkey?", "Delete Hotkey?"], _ ;未译
["Custom Markers", "Custom Markers"], _ ;未译
["Crystal Desert", "水晶沙漠"], _
["Browser Search", "Browser Search"], _ ;未译
["Aspenwood Gate (Luxon)", "杨木大门 (勒克森)"], _
["Agent modifier", "Agent modifier"], _ ;未译
["Action###combo", "Action###combo"], _ ;未译
["*Unknown item*", "*Unknown item*"], _ ;未译
["Zaishen Combat", "Zaishen Combat"], _ ;未译
["Zaishen Bounty", "Zaishen Bounty"], _ ;未译
["until %R on %A", "until %R on %A"], _ ;未译
["Twitch Channel", "Twitch Channel"], _ ;未译
["Trade Settings", "Trade Settings"], _ ;未译
["The Black Beast of Arrgh", "黑色魔兽 阿尔古"], _
["String Decoder", "String Decoder"], _ ;未译
["Ssuns, Blessed of Dwayna", "薇娜的祝福 桑斯"], _
["Show past runs", "Show past runs"], _ ;未译
["Show my status", "Show my status"], _ ;未译
["seafarers rest", "航海者休憩处"], _
["pingitem armor", "pingitem armor"], _ ;未译
["Pinged item:\n", "Pinged item:\n"], _ ;未译
["Party Settings", "Party Settings"], _ ;未译
["Opening chests", "Opening chests"], _ ;未译
["MessageLocal: ", "MessageLocal: "], _ ;未译
["Maximilian the Meticulous", "细心的马希米连"], _
["marhans grotto", "马翰洞穴"], _
["longeyes ledge", "长眼岩脉"], _
["KICK %s %s\r\n", "KICK %s %s\r\n"], _ ;未译
["Invalid target", "Invalid target"], _ ;未译
["Invalid map id", "Invalid map id"], _ ;未译
["instance_start", "instance_start"], _ ;未译
["img\\materials", "img\\materials"], _ ;未译
["Harn and Maxine Coldstone", "冰石哈恩/麦辛"], _
["Fonts loaded\n", "Fonts loaded\n"], _ ;未译
["Festival\x1\x1", "Festival\x1\x1"], _ ;未译
["Feathered Avicara Scalps", "阿比卡拉头皮羽毛"], _
["Factions Elite", "Factions Elite"], _ ;未译
["Export to JSON", "Export to JSON"], _ ;未译
["Enable Logging", "Enable Logging"], _ ;未译
["droknars forge", "卓克纳熔炉"], _
["dragons throat", "龙喉"], _
["Do not disturb", "Do not disturb"], _ ;未译
["destinys gorge", "命运峡谷"], _
["dailies_scroll", "dailies_scroll"], _ ;未译
["Churning Earth", "Churning Earth"], _ ;未译
["champions dawn", "勇士曙光"], _
["Breath of Fire", "Breath of Fire"], _ ;未译
["Binding Ritual", "缚灵仪式"], _
["AgentId(%lu)\n", "AgentId(%lu)\n"], _ ;未译
["Advanced##item", "Advanced##item"], _ ;未译
["Adjacent Range", "Adjacent Range"], _ ;未译
["abaddons mouth", "地狱隘口"], _
["##shape_active", "##shape_active"], _ ;未译
["##color_active", "##color_active"], _ ;未译
["###dialoginput", "###dialoginput"], _ ;未译
["###dialogcombo", "###dialogcombo"], _ ;未译
["Vizunah Square (Local)", "薇茹广场 (本地)"], _
["Take quest in Mountains", "接双头龙山的任务"], _
["Prof Change - Assassin", "职业更换 - 暗杀"], _
["Price Check##essence", "估价##essence"], _
["Margrid The Sly", "狡猾者玛格丽特 (狡诈者玛格丽)"], _
["First item in inventory", "背包左上格内之物"], _
["Room 2 | Death", "第 2 间 | Death"], _
["Room 11 | Fear", "第 11 间 | Fear"], _
["Mobrin, Lord of the Marsh", "碎之主 魔兵"], _
["Destor the Truth Seeker", "真实追寻者戴斯特"], _
["zinkucorridor", "辛库走廊"], _
["ventacemetery", "凡特墓地"], _
["vasburgarmory", "维思伯兵营"], _
["tsumeivillage", "苏梅村"], _
["tiharkorchard", "提亚克林地"], _
["sunspeararena", "日戟竞技场"], _
["shingjeaarena", "星岬竞技场"], _
["seitungharbor", "青函港"], _
["seafarersrest", "航海者休憩处"], _
["ruinsofsurmia", "苏米亚废墟"], _
["region_kourna", "region_kourna"], _ ;未译
["region_depths", "region_depths"], _ ;未译
["pogahnpassage", "波甘驿站"], _
["nolaniacademy", "若拉尼学院"], _
["nahpuiquarter", "纳普区_(探索区域)"], _
["moddokcrevice", "摩多克裂缝"], _
["marhansgrotto", "马翰洞穴"], _
["longeyesledge", "长眼岩脉"], _
["location logs", "location logs"], _ ;未译
["leviathanpits", "利拜亚森矿场"], _
["kodlonuhamlet", "克拓奴，哈姆雷特"], _
["kainengcenter", "凯宁中心"], _
["harvesttemple", "丰收神殿"], _
["gyalahatchery", "盖拉孵化所_(探索区域)"], _
["global_enable", "global_enable"], _ ;未译
["gateoftorment", "苦痛之门"], _
["gateofsecrets", "奥秘之门"], _
["gateofmadness", "疯狂之门"], _
["gateofanguish", "悲难之门"], _
["eyeofthenorth", "极地之眼"], _
["eredonterrace", "尔雷登平地"], _
["droknarsforge", "卓克纳熔炉"], _
["dragonsthroat", "龙喉"], _
["divinitycoast", "神圣海岸"], _
["destinysgorge", "命运峡谷"], _
["championsdawn", "勇士曙光"], _
["breakerhollow", "断崖谷"], _
["braueracademy", "巴尔学院"], _
["borealstation", "北极驻地"], _
["bloodstonefen", "血石沼泽"], _
["baipaasureach", "拜巴苏区域"], _
["abaddonsmouth", "地狱隘口"], _
["Use 24h clock", "Use 24h clock"], _ ;未译
["Tomb of the Primeval Kings", "先王之墓"], _
["Speed##target", "Speed##target"], _ ;未译
["Speed##player", "Speed##player"], _ ;未译
["Signpost Size", "Signpost Size"], _ ;未译
["Sender Color:", "Sender Color:"], _ ;未译
["ScrollbarSize", "ScrollbarSize"], _ ;未译
["Right Windows", "Right Windows"], _ ;未译
["Right Control", "Right Control"], _ ;未译
["Prof Change - Warrior", "职业更换 - 战士"], _
["Prof Change - Paragon", "职业更换 - 圣言"], _
["Prof Change - Dervish", "职业更换 - 神唤"], _
["Player (dead)", "Player (dead)"], _ ;未译
["Outpost\0\0\0", "Outpost\0\0\0"], _ ;未译
["No Profession", "No Profession"], _ ;未译
["Nightfall mission outpost", "三章任务城"], _
["Max range end", "Max range end"], _ ;未译
["Lock Position", "Lock Position"], _ ;未译
["Loading\0\0\0", "Loading\0\0\0"], _ ;未译
["Jade Flats (Kurzick)", "翡翠浅滩 (库兹柯)"], _
["Items per row", "Items per row"], _ ;未译
["IndentSpacing", "IndentSpacing"], _ ;未译
["In Guild Hall", "In Guild Hall"], _ ;未译
["In Explorable", "In Explorable"], _ ;未译
["Ice Spout: %d", "Ice Spout: %d"], _ ;未译
["HeroTeamBuild", "HeroTeamBuild"], _ ;未译
["Hero flagging", "Hero flagging"], _ ;未译
["Hero Controls", "Hero Controls"], _ ;未译
["Great Temple of Balthazar", "巴萨泽圣殿"], _
["Grab Rounding", "Grab Rounding"], _ ;未译
["GetClipCursor", "GetClipCursor"], _ ;未译
["Game Settings", "Game Settings"], _ ;未译
["FrameRounding", "FrameRounding"], _ ;未译
["FramePaddingY", "FramePaddingY"], _ ;未译
["FramePaddingX", "FramePaddingX"], _ ;未译
["Frame Padding", "Frame Padding"], _ ;未译
["Fire Trap: %d", "Fire Trap: %d"], _ ;未译
["Downloading update...", "正在下载更新..."], _
["DiscordCreate", "DiscordCreate"], _ ;未译
["Depletion: %d", "Depletion: %d"], _ ;未译
["Delete Color?", "Delete Color?"], _ ;未译
["Custom Agents", "Custom Agents"], _ ;未译
["Control-break", "Control-break"], _ ;未译
["Compass range", "Compass range"], _ ;未译
["Clicker is %s", "Clicker is %s"], _ ;未译
["Announcements", "Announcements"], _ ;未译
["Ally (spirit)", "Ally (spirit)"], _ ;未译
["Ally (player)", "Ally (player)"], _ ;未译
["Ally (minion)", "Ally (minion)"], _ ;未译
["Add Teambuild", "Add Teambuild"], _ ;未译
["/flag 5 clear", "/flag 5 clear"], _ ;未译
[" duration: %d", " duration: %d"], _ ;未译
["\nDamage +20%", "\nDamage +20%"], _ ;未译
["urgozs warren", "尔果的养殖场"], _
["Twitch Server", "Twitch Server"], _ ;未译
["Twitch Color:", "Twitch Color:"], _ ;未译
["transmotarget", "transmotarget"], _ ;未译
["threshold%03d", "threshold%03d"], _ ;未译
["String(%lu) \", "String(%lu) \"], _ ;未译
["Singed Gargoyle Skulls", "烧焦的石像鬼头颅"], _
["senjis corner", "山吉之街"], _
["Scythe Attack", "镰刀进攻技能"], _
["Savannah Heat", "Savannah Heat"], _ ;未译
["Salvage from:", "Salvage from:"], _ ;未译
["Ranged Attack", "区域攻击"], _
["Powered by %s", "Powered by %s"], _ ;未译
["Packet Logger", "Packet Logger"], _ ;未译
["NPC ModelFile", "NPC ModelFile"], _ ;未译
["Nature Ritual", "自然仪式"], _
["model_file_id", "model_file_id"], _ ;未译
["MessageCore: ", "MessageCore: "], _ ;未译
["kodash bazaar", "kodash bazaar"], _ ;未译
["jennurs horde", "征钠群落"], _
["Inscription: ", "Inscription: "], _ ;未译
["img/materials", "img/materials"], _ ;未译
["heroes ascent", "英雄之路"], _
["Hammer Attack", "锤术攻击技能"], _
["Forgotten Trinket Boxes", "被遗忘的小箱子"], _
["Feathered Caromi Scalps", "卡洛米羽毛头皮"], _
["eternal grove", "eternal grove"], _ ;未译
["Earshot Range", "Earshot Range"], _ ;未译
["Delete Build?", "Delete Build?"], _ ;未译
["Damage +15^50", "Damage +15^50"], _ ;未译
["Dagger Attack", "匕首攻击技能"], _
["Customized\x1", "Customized\x1"], _ ;未译
["Copper Crimson Skull Coins", "红颅铜币"], _
["Chat Settings", "Chat Settings"], _ ;未译
["cancel action", "cancel action"], _ ;未译
["Buffs##player", "Buffs##player"], _ ;未译
["Blob(%lu) => ", "Blob(%lu) => "], _ ;未译
["Blazefiend Griefblade", "火焰恶魔 悲伤刀片"], _
["beacons perch", "毕肯高地"], _
["Barthimus the Provident", "算计者巴希穆斯"], _
["Assault on the Stronghold", "袭击根据地"], _
["Add Threshold", "Add Threshold"], _ ;未译
["abaddons gate", "亚霸顿之门"], _
["<irc_channel>", "<irc_channel>"], _ ;未译
["24h Deep Mode", "24h Deep Mode"], _ ;未译
["(Chance: 18%)", "(Chance: 18%)"], _ ;未译
["##size_active", "##size_active"], _ ;未译
["##commoncombo", "##commoncombo"], _ ;未译
["##alertfilter", "##alertfilter"], _ ;未译
["###essenceqty", "###essenceqty"], _ ;未译
["Saint Anjeka's Shrine", "圣者安捷卡的祭坛"], _
["Prof Change - Ranger", "职业更换 - 游侠"], _
["Prof Change - Mesmer", "职业更换 - 幻术"], _
["Price Check##pstone", "估价##pstone"], _
["Grand Court of Sebelkeh", "希贝克大公廷"], _
["FoW - Forgemaster", "灾难 - 永生的锻造大师"], _
["Enable/Disable button", "启动/关闭 按钮"], _
["Deldrimor Steel Ingot", "戴尔狄摩钢铁矿石"], _
["Click to change hotkey", "击此以重配快键"], _
["Central Transfer Chamber", "中央转送室"], _
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
["zaishenelite", "战承精英"], _
["yahnurmarket", "雅诺尔市集"], _
["urgozswarren", "尔果的养殖场"], _
["umbralgrotto", "阴影石穴"], _
["trade_scroll", "trade_scroll"], _ ;未译
["thirstyriver", "干枯河流"], _
["start string", "start string"], _ ;未译
["senjiscorner", "山吉之街"], _
["ruinsofmorah", "摩拉废墟"], _
["rilohnrefuge", "里欧恩难民营"], _
["region_vabbi", "region_vabbi"], _ ;未译
["region_kryta", "region_kryta"], _ ;未译
["region_istan", "region_istan"], _ ;未译
["randomarenas", "随机竞技场"], _
["quarrelfalls", "怨言瀑布"], _
["maguumastade", "梅古玛丛林"], _
["jennurshorde", "征钠群落"], _
["icetoothcave", "冰牙洞穴"], _
["heroesascent", "英雄之路"], _
["gatesofkryta", "科瑞塔关所"], _
["frostgatethe", "frostgatethe"], _ ;未译
["frontiergate", "边境关所"], _
["custommarker", "custommarker"], _ ;未译
["boreasseabed", "风神海床_(探索区域)"], _
["blacktideden", "黑潮之穴"], _
["beknurharbor", "别克诺港"], _
["beaconsperch", "毕肯高地"], _
["basaltgrotto", "玄武岩石穴"], _
["altrummruins", "奥楚兰废墟"], _
["abaddonsgate", "亚霸顿之门"], _
["Wailing Lord", "Wailing Lord"], _ ;未译
["Update mode:", "Update mode:"], _ ;未译
["Teleport Planes", "传送至 地下世界 混沌平原"], _
["Take quest in Planes", "接混沌平原的任务"], _
["Spirit range", "Spirit range"], _ ;未译
["Show widget toggles", "Show 配件开关"], _
["Show numbers", "Show numbers"], _ ;未译
["Scorpion: %d", "Scorpion: %d"], _ ;未译
["Quest Marker", "Quest Marker"], _ ;未译
["PvP messages", "PvP messages"], _ ;未译
["Prof Change - Necro", "职业更换 - 死灵"], _
["PlayerNumber", "PlayerNumber"], _ ;未译
["North Marker", "North Marker"], _ ;未译
["Middle mouse", "Middle mouse"], _ ;未译
["Media Select", "Media Select"], _ ;未译
["Map Rotation", "Map Rotation"], _ ;未译
["Lutgardis Conservatory", "路嘉帝斯温室"], _
["Lunars delay", "Lunars delay"], _ ;未译
["Left Windows", "Left Windows"], _ ;未译
["Left Control", "Left Control"], _ ;未译
["Lair of the Forgotten", "被遗忘者的巢穴"], _
["Jade Flats (Luxon)", "翡翠浅滩 (勒克森)"], _
["ItemSpacingY", "ItemSpacingY"], _ ;未译
["ItemSpacingX", "ItemSpacingX"], _ ;未译
["Item Spacing", "Item Spacing"], _ ;未译
["Important:\n", "Important:\n"], _ ;未译
["Great Northern Wall, The", "北方长城"], _
["GrabRounding", "GrabRounding"], _ ;未译
["Grab MinSize", "Grab MinSize"], _ ;未译
["Global Alpha", "Global Alpha"], _ ;未译
["Full Conset Price: -", "三件套总价: -"], _
["Fire Jet: %d", "Fire Jet: %d"], _ ;未译
["Faction mission outpost", "二章任务城"], _
["Execute the hotkey now", "即刻触发快键"], _
["Embark Beach", "Embark Beach"], _ ;未译
["Elementalist", "Elementalist"], _ ;未译
["Don't change", "Don't change"], _ ;未译
["Delete build", "Delete build"], _ ;未译
["Default Size", "Default Size"], _ ;未译
["Chat Command", "Chat Command"], _ ;未译
["Camera speed", "Camera speed"], _ ;未译
["Browser Stop", "Browser Stop"], _ ;未译
["Browser Home", "Browser Home"], _ ;未译
["Browser Back", "Browser Back"], _ ;未译
["Battle Isles", "Battle Isles"], _ ;未译
["Applications", "Applications"], _ ;未译
["Agent Colors", "Agent Colors"], _ ;未译
["AS of Weapon", "AS of Weapon"], _ ;未译
["/afk message", "/afk message"], _ ;未译
["(Up to date)", "(Up to date)"], _ ;未译
["%s_threshold", "%s_threshold"], _ ;未译
["%s###build%d", "%s###build%d"], _ ;未译
["[Pcons][%s] ", "[Pcons][%s] "], _ ;未译
["Weapon Spell", "武装魔法"], _
["Unidentified", "Unidentified"], _ ;未译
["Twitch Alias", "Twitch Alias"], _ ;未译
["Triggered %s", "Triggered %s"], _ ;未译
["transmoparty", "transmoparty"], _ ;未译
["transmoagent", "transmoagent"], _ ;未译
["The Elusive Golemancer", "乌啦的实验室"], _
["Text spacing", "Text spacing"], _ ;未译
["Sword Attack", "剑术攻击技能"], _
["Superb Charr Carvings", "超级夏尔雕刻品"], _
["strmiids.lib", "strmiids.lib"], _ ;未译
["Spear Attack", "矛术进攻技能"], _
["Show seconds", "Show seconds"], _ ;未译
["shadow nexus", "shadow nexus"], _ ;未译
["Sarnia the Red-Handed", "染血之手萨妮亚"], _
["Salvage All?", "Salvage All?"], _ ;未译
["removefriend", "removefriend"], _ ;未译
["Recuperation", "Recuperation"], _ ;未译
["ravens point", "渡鸦岬角"], _
["Party Window", "Party Window"], _ ;未译
["NOTICE: %s\n", "NOTICE: %s\n"], _ ;未译
["Nearby Range", "Nearby Range"], _ ;未译
["Melee Attack", "近身攻击技能"], _
["Map District", "Map District"], _ ;未译
["Maintain FOV", "Maintain FOV"], _ ;未译
["Korshek the Immolated", "宰杀者 科薛克"], _
["is_tb_friend", "is_tb_friend"], _ ;未译
["Invalid NICK", "Invalid NICK"], _ ;未译
["HSR \x1\x2%c", "HSR \x1\x2%c"], _ ;未译
["HCT \x1\x2%c", "HCT \x1\x2%c"], _ ;未译
["gunnars hold", "甘拿的占领地"], _
["Greves the Overbearing", "傲慢的葛力斯"], _
["Ghial the Bone Dancer", "骨之舞者 葛西"], _
["Frostmaw the Kinslayer", "冻击 弑族者"], _
["Forest Minotaur Horns", "森林牛头怪的角"], _
["foibles fair", "佛伊伯市集"], _
["Finish Him!\", "Finish Him!\"], _ ;未译
["Enchanted\x1", "Enchanted\x1"], _ ;未译
["Elonian Leather Squares", "伊洛那皮革"], _
["dragons lair", "dragons lair"], _ ;未译
["Door Monitor", "Door Monitor"], _ ;未译
["Displacement", "Displacement"], _ ;未译
["Disconnected", "Disconnected"], _ ;未译
["Deselect All", "Deselect All"], _ ;未译
["deletefriend", "deletefriend"], _ ;未译
["Daily Quests", "Daily Quests"], _ ;未译
["country_name", "country_name"], _ ;未译
["Condition\x1", "Condition\x1"], _ ;未译
["Character(s)", "Character(s)"], _ ;未译
["aurios mines", "aurios mines"], _ ;未译
["Attacking\x1", "Attacking\x1"], _ ;未译
["Are you sure", "Are you sure"], _ ;未译
["amnoon oasis", "amnoon oasis"], _ ;未译
["Amalek the Unmerciful", "残酷者阿莫列克"], _
["%s###pcon_%s", "%s###pcon_%s"], _ ;未译
["###pstoneqty", "###pstoneqty"], _ ;未译
["Telport Wastes", "传送至 地下世界 荒凉冰地"], _
["Prof Change - Monk", "职业更换 - 僧侣"], _
["Price Check##grail", "估价##grail"], _
["Price Check##armor", "估价##armor"], _
["Mouth of Torment, The", "苦痛之地隘口"], _
["Iron Mines of Moladune", "莫拉登矿山"], _
["General Interface", "General 界面"], _
["Elonian Leather Square", "伊洛那皮革"], _
["Disable when not found", "失寻时关闭"], _
["Craft fow armor", "(灾难内)打造黑曜石盔甲"], _
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
["yohlonhaven", "犹朗避难所"], _
["update_mode", "update_mode"], _ ;未译
["showNumbers", "showNumbers"], _ ;未译
["region_swat", "region_swat"], _ ;未译
["region_kurz", "region_kurz"], _ ;未译
["region_deso", "region_deso"], _ ;未译
["raisupalace", "莱苏皇宫_(探索区域)"], _
["pikensquare", "派肯广场"], _
["num_results", "num_results"], _ ;未译
["menubuttons", "menubuttons"], _ ;未译
["heroindex%d", "heroindex%d"], _ ;未译
["gunnarshold", "甘拿的占领地"], _
["embarkbeach", "Embark Beach"], _
["dajkahinlet", "达卡港"], _
["color_quest", "color_quest"], _ ;未译
["color_pings", "color_pings"], _ ;未译
["color_north", "color_north"], _ ;未译
["auroraglade", "欧若拉林地"], _
["ascaloncity", "阿斯卡隆城"], _
["Volume Mute", "Volume Mute"], _ ;未译
["Volume Down", "Volume Down"], _ ;未译
["Unknown map", "Unknown map"], _ ;未译
["Tempered Glass Vial", "调合后的玻璃瓶"], _
["Teleport Pools", "传送至 地下世界 孵化池"], _
["Teleport Pits", "传送至 地下世界 骷髅墓穴"], _
["Show Target", "Show Target"], _ ;未译
["Show Player", "Show Player"], _ ;未译
["Show Dialog", "Show Dialog"], _ ;未译
["Scroll Lock", "Scroll Lock"], _ ;未译
["Sardelac Sanitarium", "萨德拉克疗养院"], _
["Right mouse", "Right mouse"], _ ;未译
["Right Shift", "Right Shift"], _ ;未译
["PrintScreen", "PrintScreen"], _ ;未译
["Price: %g k", "Price: %g k"], _ ;未译
["Player Size", "Player Size"], _ ;未译
["Pcons delay", "Pcons delay"], _ ;未译
["Necromancer", "Necromancer"], _ ;未译
["Minister Cho's Estate", "周大臣庄园"], _
["Minion Size", "Minion Size"], _ ;未译
["LoginNumber", "LoginNumber"], _ ;未译
["Ice Jet: %d", "Ice Jet: %d"], _ ;未译
["IME Process", "IME Process"], _ ;未译
["IME Convert", "IME Convert"], _ ;未译
["GrabMinSize", "GrabMinSize"], _ ;未译
["Go, banana!", "Go, banana!"], _ ;未译
["GlobalAlpha", "GlobalAlpha"], _ ;未译
["GWToolboxpp", "GWToolboxpp"], _ ;未译
["FoW - WailingLord", "灾难 - 悲鸣领主"], _
["DropUseBuff", "DropUseBuff"], _ ;未译
["Drop/Use %s", "Drop/Use %s"], _ ;未译
["Dialog Name", "Dialog Name"], _ ;未译
["Closed - %d", "Closed - %d"], _ ;未译
["Chat Filter", "Chat Filter"], _ ;未译
["Chat Colors", "Chat Colors"], _ ;未译
["Buy##resscroll", "买##resscroll"], _
["Ally (dead)", "Ally (dead)"], _ ;未译
["Aggro range", "Aggro range"], _ ;未译
["Agent Sizes", "Agent Sizes"], _ ;未译
["AS modifier", "AS modifier"], _ ;未译
["<not found>", "<not found>"], _ ;未译
["/flag clear", "/flag clear"], _ ;未译
["zv tomorrow", "zv tomorrow"], _ ;未译
["Zone 11 | Urgoz", "第 11 区 | 尔果"], _
["zm tomorrow", "zm tomorrow"], _ ;未译
["zc tomorrow", "zc tomorrow"], _ ;未译
["zb tomorrow", "zb tomorrow"], _ ;未译
["Word(%lu)\n", "Word(%lu)\n"], _ ;未译
["vloxs falls", "弗洛克斯瀑布"], _
["Vampiric\x1", "Vampiric\x1"], _ ;未译
["TPS Regulator Golem", "TPS调节高轮"], _
["Touch Skill", "碰触技能"], _
["The Stygian Underlords", "冥狱地王"], _
["Slot (1-25)", "Slot (1-25)"], _ ;未译
["skills.json", "skills.json"], _ ;未译
["Server Info", "Server Info"], _ ;未译
["Roaring Ether Heart", "苍穹咆哮者之心"], _
["Roaring Ether Claws", "苍穹咆哮者之爪"], _
["Quoted Item", "Quoted Item"], _ ;未译
["Quansong Spiritspeak", "通灵者 魁嵩"], _
["Preparation", "准备技能"], _
["Plague of Destruction", "疫之破坏者"], _
["on %A at %R", "on %A at %R"], _ ;未译
["marketplace", "marketplace"], _ ;未译
["Lead Attack", "引导攻击"], _
["JOIN %s\r\n", "JOIN %s\r\n"], _ ;未译
["Interaction", "Interaction"], _ ;未译
["GWToolbox++", "GWToolbox++"], _ ;未译
["Frozen Soil", "Frozen Soil"], _ ;未译
["Friend List", "Friend List"], _ ;未译
["Float(%f)\n", "Float(%f)\n"], _ ;未译
["First Close", "First Close"], _ ;未译
["Finding the Bloodstone", "寻找血石"], _
["Dual Attack", "双重攻击"], _
["description", "description"], _ ;未译
["Decayed Orr Emblems", "腐烂的欧尔纹章"], _
["Checking...", "Checking..."], _ ;未译
["Chaos Storm", "Chaos Storm"], _ ;未译
["Byte(%lu)\n", "Byte(%lu)\n"], _ ;未译
["Bottle of Vabbian Wine", "瓦贝红酒"], _
["Borrguus Blisterbark", "风吼 柏格斯"], _
["Barbed Trap", "Barbed Trap"], _ ;未译
["astralarium", "astralarium"], _ ;未译
["ask to join", "ask to join"], _ ;未译
["April Fools", "April Fools"], _ ;未译
["AoE Effects", "AoE Effects"], _ ;未译
["##rarecombo", "##rarecombo"], _ ;未译
["##commonqty", "##commonqty"], _ ;未译
["##awaydelay", "##awaydelay"], _ ;未译
["###grailqty", "###grailqty"], _ ;未译
["###district", "###district"], _ ;未译
["###armorqty", "###armorqty"], _ ;未译
[" target: %d", " target: %d"], _ ;未译
["Zos Shivros Channel", "佐席洛斯水道"], _
["Y pos##target", "Y 坐标##target"], _
["Y pos##player", "Y 坐标##player"], _
["X pos##target", "X 坐标##target"], _
["X pos##player", "X 坐标##player"], _
["Teleport Vale", "传送至 地下世界 遗忘谷"], _
["Show Resign Log", "Show 退出令统计"], _
["Open Settings Folder", "打开设置夹"], _
["Kodash Bazaar, The", "库丹西市集广场"], _
["Granite Citadel, The", "花岗岩堡垒"], _
["Click to reconnect", "击此以重新连网"], _
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
["vloxsfalls", "弗洛克斯瀑布"], _
["template%d", "template%d"], _ ;未译
["sanctumcay", "神圣沙滩"], _
["ringoffire", "火环群岛"], _
["region_lux", "region_lux"], _ ;未译
["region_fow", "region_fow"], _ ;未译
["portsledge", "雪橇港"], _
["gateofpain", "惩罚之门"], _
["gateoffear", "恐惧之门"], _
["elonareach", "伊洛那流域"], _
["dllversion", "dllversion"], _ ;未译
["customline", "customline"], _ ;未译
["codexarena", "Codex 竞技场"], _
["camprankor", "蓝口营地"], _
["camphojanu", "何加努营地"], _
["builds%03d", "builds%03d"], _ ;未译
["borlispass", "柏里斯通道"], _
["bonepalace", "白骨宫殿"], _
["auguryrock", "占卜之石"], _
["amatzbasin", "亚马兹盆地"], _
["WeaponType", "WeaponType"], _ ;未译
["Visibility", "Visibility"], _ ;未译
["Vanquished", "Vanquished"], _ ;未译
["UW - Restore", "地下 - 恢复古兰斯圣像"], _
["UW - Chamber", "地下 - 清除密室的障碍"], _
["Thresholds", "Thresholds"], _ ;未译
["The Barradin Estate", "巴拉丁庄园"], _
["TargetName", "TargetName"], _ ;未译
["Target #%d", "Target #%d"], _ ;未译
["Sunspear Great Hall", "日戟大会堂"], _
["Start Mail", "Start Mail"], _ ;未译
["Show Quest", "Show Quest"], _ ;未译
["Send to team chat", "往队伍频道发送"], _
["Row Height", "Row Height"], _ ;未译
["Remains of Sahlahja", "萨拉迦遗址"], _
["Region: %s", "Region: %s"], _ ;未译
["Prev Track", "Prev Track"], _ ;未译
["Presearing", "Presearing"], _ ;未译
["Play/Pause", "Play/Pause"], _ ;未译
["Ping Build", "Ping Build"], _ ;未译
["Open Xunlai Chest", "打开桑莱保险箱"], _
["Open Locked Chest", "打开锁住的宝箱"], _
["Next Track", "Next Track"], _ ;未译
["ModelState", "ModelState"], _ ;未译
["Media Stop", "Media Stop"], _ ;未译
["Left mouse", "Left mouse"], _ ;未译
["Left Shift", "Left Shift"], _ ;未译
["Interface:", "Interface:"], _ ;未译
["IME Accept", "IME Accept"], _ ;未译
["Hello %ls!", "Hello %ls!"], _ ;未译
["Grendich Courthouse", "葛兰迪法院"], _
["Gate of Desolation", "荒芜之地入口"], _
["FoW - Slaves", "灾难 - 孟席斯的奴隶们"], _
["FoW - Griffons", "灾难 - 狮鹫兽礼物"], _
["FillCircle", "FillCircle"], _ ;未译
["Disconnect", "Disconnect"], _ ;未译
["DialogName", "DialogName"], _ ;未译
["Dialog #%d", "Dialog #%d"], _ ;未译
["Dev Region", "Dev Region"], _ ;未译
["Deldrimor War Camp", "戴尔狄摩兵营"], _
["Control + ", "Control + "], _ ;未译
["Cast range", "Cast range"], _ ;未译
["Big Circle", "Big Circle"], _ ;未译
["Background", "Background"], _ ;未译
["Asia Korea", "Asia Korea"], _ ;未译
["Asia Japan", "Asia Japan"], _ ;未译
["Ally (NPC)", "Ally (NPC)"], _ ;未译
["Allegiance", "Allegiance"], _ ;未译
["Add Marker", "Add Marker"], _ ;未译
["9 Rings messages", "九环猜谜 提示语"], _
["10 Granite Slabs", "10 花岗岩石板"], _
["10 Chitin Fragments", "10 外壳"], _
["/ Commands", "/ Commands"], _ ;未译
["%s_visible", "%s_visible"], _ ;未译
["%.0f milliseconds", "%.0f 毫秒"], _
["Zealous\x1", "Zealous\x1"], _ ;未译
["Wilderness of Bahdza", "巴萨荒野"], _
["Well Spell", "涌泉魔法"], _
["week start", "week start"], _ ;未译
["Water Djinn Essence", "水巨灵精华"], _
["Ward Spell", "结界魔法"], _
["War Supply", "War Supply"], _ ;未译
["vs. Demons", "vs. Demons"], _ ;未译
["Vess the Disputant", "争论者 薇丝"], _
["ui element", "ui element"], _ ;未译
["Two-Handed", "Two-Handed"], _ ;未译
["The Sulfurous Wastes", "硫磺荒地"], _
["The Greater Darkness", "巨大暗影"], _
["Tears of the Fallen", "战死者之泪"], _
["Store Item", "Store Item"], _ ;未译
["Spike Trap", "Spike Trap"], _ ;未译
["skeletonic", "skeletonic"], _ ;未译
["Send Pcons", "Send Pcons"], _ ;未译
["Selenas the Blunt", "直言者瑟列娜丝"], _
["Select All", "Select All"], _ ;未译
["Scorched Lodestones", "烧焦的磁石"], _
["Royen Beastkeeper", "野兽看守者罗彦"], _
["Ring of Fire Islands", "火环列岛"], _
["Profession", "Profession"], _ ;未译
["Pet Attack", "宠物攻击"], _
["Percentage", "Percentage"], _ ;未译
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
["img\\pcons", "img\\pcons"], _ ;未译
["img\\icons", "img\\icons"], _ ;未译
["img\\bonds", "img\\bonds"], _ ;未译
["Guild Wars", "Guild Wars"], _ ;未译
["Grenth's Footprint", "古兰斯的足迹"], _
["Green Rock", "Green Rock"], _ ;未译
["frost gate", "frost gate"], _ ;未译
["FoW Griffs", "FoW Griffs"], _ ;未译
["Flame Trap", "Flame Trap"], _ ;未译
["First Open", "First Open"], _ ;未译
["First Load", "First Load"], _ ;未译
["fa kurzick", "fa kurzick"], _ ;未译
["Extra Luck", "Extra Luck"], _ ;未译
["Equip Item", "Equip Item"], _ ;未译
["Dreadnought's Drift", "无惧者之丘"], _
["destroyer2", "destroyer2"], _ ;未译
["Default_48", "Default_48"], _ ;未译
["Default_42", "Default_42"], _ ;未译
["Default_24", "Default_24"], _ ;未译
["Default_20", "Default_20"], _ ;未译
["Default_18", "Default_18"], _ ;未译
["Customized", "Customized"], _ ;未译
["Casting\x1", "Casting\x1"], _ ;未译
["Bow Attack", "弓术攻击技能"], _
["bonedragon", "bonedragon"], _ ;未译
["Belt Pouch", "Belt Pouch"], _ ;未译
["Axe Attack", "斧术攻击技能"], _
["Area Range", "Area Range"], _ ;未译
["aprilfools", "aprilfools"], _ ;未译
["Ancient Kappa Shells", "古河童壳"], _
["A Time for Heroes", "英雄的光采年代"], _
["/tp gh lag", "/tp gh lag"], _ ;未译
["##visible2", "##visible2"], _ ;未译
["UW - Pools", "地下 - 恐惧蛛化精灵女王"], _
["Teleport Lab", "传送至 地下世界 迷宫"], _
["Sunspear Sanctuary", "日戟避难所"], _
["Slice of Pumpkin Pie", "南瓜派"], _
["Kodonur Crossroads", "科登诺路口"], _
["Ice Caves of Sorrow", "悲伤冰谷"], _
["FoW - Defend", "灾难 - 保护战争圣殿"], _
["Essence of Celerity", "敏捷精华"], _
["D'Alessio Seaboard", "达雷西海滨"], _
["Create Hotkey...", "指定快键..."], _
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
["zendaijun", "祯台郡_(探索区域)"], _
["x##delete", "x##delete"], _ ;未译
["warsupply", "warsupply"], _ ;未译
["timestamp", "timestamp"], _ ;未译
["resignlog", "resignlog"], _ ;未译
["region_ha", "region_ha"], _ ;未译
["maatukeep", "麻都堡垒"], _
["lock_move", "lock_move"], _ ;未译
["lionsarch", "狮子拱门"], _
["honurhill", "霍奴尔丘陵"], _
["fortranik", "瑞尼克要塞"], _
["fav_count", "fav_count"], _ ;未译
["consulatedocks", "领事馆docks"], _
["color_map", "color_map"], _ ;未译
["buildname", "buildname"], _ ;未译
["Zaishen Menagerie", "战承动物园"], _
["Zaishen Challenge", "战承挑战赛"], _
["Winnowing", "Winnowing"], _ ;未译
["Volume Up", "Volume Up"], _ ;未译
["Ventari's Refuge", "凡特里庇护所"], _
["UW - Wastes", "地下 - 古兰斯的使者"], _
["Toggle...", "Toggle..."], _ ;未译
["Toggle %s", "Toggle %s"], _ ;未译
["Temple of the Ages", "世纪神殿"], _
["Target ID", "Target ID"], _ ;未译
["Target %s", "Target %s"], _ ;未译
["Sunjiang District", "孙江行政区"], _
["Show Item", "Show Item"], _ ;未译
["Shing Jea", "Shing Jea"], _ ;未译
["Shing Jea Monastery", "星岬寺"], _
["Separator", "Separator"], _ ;未译
["Send Chat", "Send Chat"], _ ;未译
["Riverside Province", "河畔地带"], _
["Ritualist", "Ritualist"], _ ;未译
["Right Alt", "Right Alt"], _ ;未译
["Resources", "Resources"], _ ;未译
["Price:  -", "Price:  -"], _ ;未译
["PingBuild", "PingBuild"], _ ;未译
["Pcon Size", "Pcon Size"], _ ;未译
["Page Down", "Page Down"], _ ;未译
["Open - %d", "Open - %d"], _ ;未译
["Move Down", "Move Down"], _ ;未译
["Master Of Whispers", "唤言大师"], _
["Lock Size", "Lock Size"], _ ;未译
["Kodlonu Hamlet", "克拓奴，哈姆雷特"], _
["Jokanur Diggings", "卓坎诺挖掘点"], _
["Item Size", "Item Size"], _ ;未译
["Item Name", "Item Name"], _ ;未译
["IME Junja", "IME Junja"], _ ;未译
["IME Final", "IME Final"], _ ;未译
["HoS range", "HoS range"], _ ;未译
["FoW - Restore", "灾难 - 恢复圣殿"], _
["FoW - Khobay", "灾难 - 背叛者库贝"], _
["Fishermen's Haven", "渔人避风港"], _
["Favorites", "Favorites"], _ ;未译
["ExtraType", "ExtraType"], _ ;未译
["Eternal Grove, The", "永恒之林"], _
["Erase EOF", "Erase EOF"], _ ;未译
["Durheim Archives", "杜汉姆卷藏室"], _
["Dialog ID", "Dialog ID"], _ ;未译
["Dialog %s", "Dialog %s"], _ ;未译
["Copperhammer Mines", "铜锤矿坑"], _
["Connected", "Connected"], _ ;未译
["Coin Drop", "Coin Drop"], _ ;未译
["Close this window", "关闭此窗口"], _
["Chantry of Secrets", "隐秘教堂"], _
["Caps Lock", "Caps Lock"], _ ;未译
["Buy##essence", "买##essence"], _
["Boss Size", "Boss Size"], _ ;未译
["Birthday Cupcake", "生日杯子蛋糕"], _
["Backspace", "Backspace"], _ ;未译
["Astralarium, The", "亚斯特拉利姆"], _
["Armor of Salvation", "救赎防具"], _
["Alignment", "Alignment"], _ ;未译
["Add Build", "Add Build"], _ ;未译
["10 Plant Fibers", "10 植物纤维"], _
["10 Bolts of Cloth", "10 布料"], _
["/flag all", "/flag all"], _ ;未译
["%s_active", "%s_active"], _ ;未译
["yaks bend", "牦牛村"], _
["Witman's Folly", "威特曼的怪异建筑"], _
["utc_start", "utc_start"], _ ;未译
["Turai's Procession", "托雷长廊"], _
["The Ruptured Heart", "破裂之心"], _
["The Mirror of Lyss", "丽之镜湖"], _
["The Four Horsemen", "多姆四骑士"], _
["The Darknesses", "暗影(先王之墓)"], _
["Symbiosis", "Symbiosis"], _ ;未译
["Stance\x1", "Stance\x1"], _ ;未译
["Shiverpeak Manes", "席娃山脉鬃毛"], _
["Sentient Lodestone", "知觉磁石"], _
["Searching", "Searching"], _ ;未译
["Rolls of Parchment", "羊皮纸卷"], _
["resscroll", "resscroll"], _ ;未译
["Rand Stormweaver", "织暴者 硬皮"], _
["Pywatt the Swift", "迅捷 派维特"], _
["Panjiang Peninsula", "班让半岛"], _
["Off @ end", "Off @ end"], _ ;未译
["NPC Flags", "NPC Flags"], _ ;未译
["Norrhart Domains", "诺恩之心领地"], _
["Mungri Magicbox", "魔法盒 牧格里"], _
["maps.json", "maps.json"], _ ;未译
["Maelstrom", "Maelstrom"], _ ;未译
["Low on %s", "Low on %s"], _ ;未译
["Loggit!\n", "Loggit!\n"], _ ;未译
["loadbuild", "loadbuild"], _ ;未译
["Lava font", "Lava font"], _ ;未译
["Last Open", "Last Open"], _ ;未译
["kuunavang", "kuunavang"], _ ;未译
["Justiciar Amilyn", "判官 亚蜜琳"], _
["invite %s", "invite %s"], _ ;未译
["img/pcons", "img/pcons"], _ ;未译
["img/icons", "img/icons"], _ ;未译
["img/bonds", "img/bonds"], _ ;未译
["Hex Spell", "降咒魔法"], _
["Gruesome Ribcages", "可怕的胸腔"], _
["Gadget ID", "Gadget ID"], _ ;未译
["EquipItem", "EquipItem"], _ ;未译
["Ench +20%", "Ench +20%"], _ ;未译
["destroyer", "destroyer"], _ ;未译
["continent", "continent"], _ ;未译
["Celestial Essences", "天神质体"], _
["Blue Rock", "Blue Rock"], _ ;未译
["Blood Washes Blood", "血债血偿"], _
["Bag (1-5)", "Bag (1-5)"], _ ;未译
["Arbor Earthcall", "大地之唤 亚伯"], _
["addfriend", "addfriend"], _ ;未译
["##visible", "##visible"], _ ;未译
["##rareqty", "##rareqty"], _ ;未译
["###heroid", "###heroid"], _ ;未译
["###active", "###active"], _ ;未译
[" [Map %d]", " [Map %d]"], _ ;未译
[" to just ", " to just "], _ ;未译
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
["Lump of Charcoal", "结块的木炭"], _
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
["Delete the hotkey", "删除快键"], _
["Burning Forest", "孟席斯的奴隶们"], _
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
["yaksbend", "牦牛村"], _
["wildsthe", "wildsthe"], _ ;未译
["whispers", "whispers"], _ ;未译
["useskill", "useskill"], _ ;未译
["travelto", "travelto"], _ ;未译
["tag_name", "tag_name"], _ ;未译
["settings", "settings"], _ ;未译
["pconsize", "pconsize"], _ ;未译
["nundubay", "纳度湾"], _
["minimize", "minimize"], _ ;未译
["maximize", "maximize"], _ ;未译
["marker%d", "marker%d"], _ ;未译
["enter-up", "enter-up"], _ ;未译
["doomlore", "doomlore"], _ ;未译
["alliance", "alliance"], _ ;未译
["_Release", "_Release"], _ ;未译
["X2 mouse", "X2 mouse"], _ ;未译
["X1 mouse", "X1 mouse"], _ ;未译
["Windows:", "Windows:"], _ ;未译
["Whispers", "Whispers"], _ ;未译
["Vanquish", "Vanquish"], _ ;未译
["Use Item", "Use Item"], _ ;未译
["Urgoz's Warren", "尔果的养殖场"], _
["UW - Pits", "地下 - 被拘禁的亡魂"], _
["UW - Escort", "地下 - 护送灵魂"], _
["Toolbox Update!", "助手更新!"], _
["Toolbox Settings", "助手设置"], _
["ToggleID", "ToggleID"], _ ;未译
["Thunderhead Keep", "雷云要塞"], _
["Template", "Template"], _ ;未译
["Tarnished Haven", "灰暗避难所"], _
["TargetID", "TargetID"], _ ;未译
["Subtract", "Subtract"], _ ;未译
["Spiritwood Plank", "心灵之板"], _
["Skill#%d", "Skill#%d"], _ ;未译
["Skill ID", "Skill ID"], _ ;未译
["Signpost", "Signpost"], _ ;未译
["Show Map", "Show Map"], _ ;未译
["Shing Jea Arena", "星岬竞技场"], _
["Shift + ", "Shift + "], _ ;未译
["SendChat", "SendChat"], _ ;未译
["Ruins of Surmia", "苏米亚废墟"], _
["Pyre Fierceshot", "烈之击炎焰"], _
["Position", "Position"], _ ;未译
["Pcons %s", "Pcons %s"], _ ;未译
["Numpad 9", "Numpad 9"], _ ;未译
["Numpad 8", "Numpad 8"], _ ;未译
["Numpad 7", "Numpad 7"], _ ;未译
["Numpad 6", "Numpad 6"], _ ;未译
["Numpad 5", "Numpad 5"], _ ;未译
["Numpad 4", "Numpad 4"], _ ;未译
["Numpad 3", "Numpad 3"], _ ;未译
["Numpad 2", "Numpad 2"], _ ;未译
["Numpad 1", "Numpad 1"], _ ;未译
["Numpad 0", "Numpad 0"], _ ;未译
["Num Lock", "Num Lock"], _ ;未译
["Not connected", "已失联/已断网"], _
["Multiply", "Multiply"], _ ;未译
["Model ID", "Model ID"], _ ;未译
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
["Logs out", "Logs out"], _ ;未译
["Line Y 2", "Line Y 2"], _ ;未译
["Line Y 1", "Line Y 1"], _ ;未译
["Line X 2", "Line X 2"], _ ;未译
["Line X 1", "Line X 1"], _ ;未译
["Leviathan Pits", "利拜亚森矿场"], _
["Left Alt", "Left Alt"], _ ;未译
["ItemName", "ItemName"], _ ;未译
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
["Dunes of Despair", "绝望沙丘"], _
["Droknar's Forge", "卓克纳熔炉"], _
["Drawings", "Drawings"], _ ;未译
["Dragon's Lair, The", "龙穴"], _
["DialogID", "DialogID"], _ ;未译
["Current District", "现有区域"], _
["Consulate Docks", "领事馆码头"], _
["Connecting...", "正在连接..."], _
["Common 4", "Common 4"], _ ;未译
["Codex Arena", "Codex 竞技场"], _
["City speedboost", "城内加速品"], _
["Changes:", "Changes:"], _ ;未译
["Chahbek Village", "夏贝克村庄"], _
["Buy##pstone", "买##pstone"], _
["Buy##common", "买##common"], _
["Bai Paasu Reach", "拜巴苏区域"], _
["BE GONE!", "BE GONE!"], _ ;未译
["Assassin", "Assassin"], _ ;未译
["Ashford Abbey", "灰色浅滩修道院"], _
["Alliance", "Alliance"], _ ;未译
["Add Line", "Add Line"], _ ;未译
["ActionID", "ActionID"], _ ;未译
["Acolyte Sousuke", "侍从萨苏克"], _
["<A Hero>", "<A Hero>"], _ ;未译
["10 Iron Ingots", "10 铁矿石"], _
[", guild ", ", guild "], _ ;未译
[" Whisper", " Whisper"], _ ;未译
["[Pcons] ", "[Pcons] "], _ ;未译
["[Map %d]", "[Map %d]"], _ ;未译
["You are:", "You are:"], _ ;未译
["Yatendi Canyons", "亚天帝峡谷"], _
["Warnings", "Warnings"], _ ;未译
["Verdant Cascades", "原野瀑布"], _
["Vehtendi Valley", "巍天帝峡谷"], _
["vanguard", "vanguard"], _ ;未译
["Vampiric", "Vampiric"], _ ;未译
["Utini Wupwup", "尤提尼 乌坡乌坡"], _
["timstamp", "timstamp"], _ ;未译
["Success!", "Success!"], _ ;未译
["Shadow's Passage", "阴暗通道"], _
["settitle", "settitle"], _ ;未译
["Scoundrel's Rise", "恶汉山丘"], _
["reindeer", "reindeer"], _ ;未译
["Red Rock", "Red Rock"], _ ;未译
["pingitem", "pingitem"], _ ;未译
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
["identify", "identify"], _ ;未译
["Ice Cliff Chasms", "冰崖裂口"], _
["Hexed\x1", "Hexed\x1"], _ ;未译
["gwenchan", "gwenchan"], _ ;未译
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
["bestarea", "bestarea"], _ ;未译
["Berserker Horns", "狂战士的角"], _
["Bag/Slot", "Bag/Slot"], _ ;未译
["Backpack", "Backpack"], _ ;未译
["Add new:", "Add new:"], _ ;未译
["A Gate Too Far", "一道过远的门"], _
["##source", "##source"], _ ;未译
["##params", "##params"], _ ;未译
["##active", "##active"], _ ;未译
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
["Green Rock Candy", "绿冰糖"], _
["General Morgahn", "摩根将军"], _
["Gates of Kryta", "科瑞塔关所"], _
["Gate of Torment", "苦痛之门"], _
["Gate of Secrets", "奥秘之门"], _
["Gate of Madness", "疯狂之门"], _
["Gate of Anguish", "悲难之门"], _
["Frost Gate, The", "寒霜之门"], _
["Europe Polish", "欧洲 波兰语"], _
["Europe English", "欧洲 英语"], _
["Eredon Terrace", "尔雷登平地"], _
["DoA - City", "四门 - 托加之城"], _
["Destiny's Gorge", "命运峡谷"], _
["Demon Assassin", "恶魔暗杀者"], _
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
["Charr Carvings", "夏尔雕刻品"], _
["Bog Skale Fins", "泥鳞怪的鳍"], _
["Barbarous Shore", "野蛮河岸"], _
["Bahdok Caverns", "巴多克洞穴"], _
["Alliance Battles", "同盟战"], _
["Admiral Kantoh", "上将 坎托"], _
["Abnormal Seeds", "畸形的种子"], _
["visible", "visible"], _ ;未译
["typeMap", "typeMap"], _ ;未译
["transmo", "transmo"], _ ;未译
["suggest", "suggest"], _ ;未译
["selling", "selling"], _ ;未译
["results", "results"], _ ;未译
["ratasum", "洛达顶点"], _
["nearest", "nearest"], _ ;未译
["message", "message"], _ ;未译
["markers", "markers"], _ ;未译
["kamadan", "kamadan"], _ ;未译
["kaineng", "kaineng"], _ ;未译
["hotkey-", "hotkey-"], _ ;未译
["dllpath", "dllpath"], _ ;未译
["default", "default"], _ ;未译
["deepthe", "deepthe"], _ ;未译
["closest", "closest"], _ ;未译
["buffer_", "buffer_"], _ ;未译
["Yahnur Market", "雅诺尔市集"], _
["Working", "Working"], _ ;未译
["Warrior", "Warrior"], _ ;未译
["Warning", "Warning"], _ ;未译
["Vlox's Falls", "弗洛克斯瀑布"], _
["Visible", "Visible"], _ ;未译
["Venta Cemetery", "凡特墓地"], _
["UseItem", "UseItem"], _ ;未译
["Use #%d", "Use #%d"], _ ;未译
["Updater", "Updater"], _ ;未译
["UW - Mnt", "地下 - 恶魔暗杀者"], _
["Toolbox", "Toolbox"], _ ;未译
["Timeout", "Timeout"], _ ;未译
["Terrain", "Terrain"], _ ;未译
["Symbols", "Symbols"], _ ;未译
["Spanish", "Spanish"], _ ;未译
["Senji's Corner", "山吉之街"], _
["Russian", "Russian"], _ ;未译
["Ruins of Morah", "摩拉废墟"], _
["Roll of Vellum", "牛皮纸卷"], _
["Restore", "Restore"], _ ;未译
["Random Arenas", "随机竞技场"], _
["R:%3.0f", "R:%3.0f"], _ ;未译
["Quest%d", "Quest%d"], _ ;未译
["Pogahn Passage", "波甘驿站"], _
["Paragon", "Paragon"], _ ;未译
["Page Up", "Page Up"], _ ;未译
["No Hero", "No Hero"], _ ;未译
["Neutral", "Neutral"], _ ;未译
["Move Up", "Move Up"], _ ;未译
["Monstrous Fang", "巨大尖牙"], _
["Monstrous Claw", "巨大的爪"], _
["ModelID", "ModelID"], _ ;未译
["Minimap", "Minimap"], _ ;未译
["Message", "Message"], _ ;未译
["Marketplace, The", "市集"], _
["Maguuma", "Maguuma"], _ ;未译
["Maguuma Stade", "梅古玛丛林"], _
["Lunar Fortunes", "命运锦囊"], _
["Logs in", "Logs in"], _ ;未译
["Kurzick", "Kurzick"], _ ;未译
["Kaineng", "Kaineng"], _ ;未译
["Kaineng Center", "凯宁中心"], _
["Jennur's Horde", "征钠群落"], _
["Item ID", "Item ID"], _ ;未译
["Italian", "Italian"], _ ;未译
["Ice Tooth Cave", "冰牙洞穴"], _
["Heroes' Ascent", "英雄之路"], _
["Harvest Temple", "丰收神殿"], _
["Grail of Might", "力量圣杯"], _
["General", "General"], _ ;未译
["G:%3.0f", "G:%3.0f"], _ ;未译
["Four Horseman", "多姆四骑士"], _
["Foundry", "Foundry"], _ ;未译
["Foible's Fair", "佛伊伯市集"], _
["FoW - Tos", "灾难 - 力量之塔"], _
["FoW - Toc", "灾难 - 勇气之塔"], _
["Fissure of Woe", "灾难裂痕"], _
["Execute", "Execute"], _ ;未译
["Europe German", "欧洲 德语"], _
["Europe French", "欧洲 法语"], _
["English", "English"], _ ;未译
["Enemy count", "(敌)个数统计"], _
["Effects", "Effects"], _ ;未译
["Divinity Coast", "神圣海岸"], _
["Dervish", "Dervish"], _ ;未译
["Decimal", "Decimal"], _ ;未译
["Control", "Control"], _ ;未译
["Connect", "Connect"], _ ;未译
["Clicker", "Clicker"], _ ;未译
["Chat Commands", "对话框指令"], _
["Chamber", "Chamber"], _ ;未译
["CONOUT$", "CONOUT$"], _ ;未译
["Buy##grail", "买##grail"], _
["Buy##armor", "买##armor"], _
["Brauer Academy", "巴尔学院"], _
["Boreal Station", "北极驻地"], _
["Blue Rock Candy", "蓝冰糖"], _
["Bloodstone Fen", "血石沼泽"], _
["Beacon's Perch", "毕肯高地"], _
["Basalt Grotto", "玄武岩石穴"], _
["B:%3.0f", "B:%3.0f"], _ ;未译
["Asia Japanese", "亚洲 日文"], _
["Ascalon", "阿斯卡隆"], _
["America", "America"], _ ;未译
["Altrumm Ruins", "奥楚兰废墟"], _
["Alcohol", "Alcohol"], _ ;未译
["A:%3.0f", "A:%3.0f"], _ ;未译
["/flag 5", "/flag 5"], _ ;未译
["Zealous", "Zealous"], _ ;未译
["Xaquang Skyway", "夏安便道"], _
["weapons", "weapons"], _ ;未译
["Vulture Drifts", "秃鹰沙丘"], _
["Vizunah Square", "薇茹广场"], _
["Varajar Fells", "维拉戛阵地"], _
["Use 24h", "Use 24h"], _ ;未译
["Traveler's Vale", "旅人谷"], _
["The Frost Gate", "寒霜之门"], _
["The Alkali Pan", "金属镕炉"], _
["Tangled Seeds", "纠结的种子"], _
["Show as", "Show as"], _ ;未译
["Shelter", "Shelter"], _ ;未译
["Sentient Seeds", "知觉种子"], _
["Saoshang Trail", "绍商小径"], _
["salvage", "salvage"], _ ;未译
["Rhea's Crater", "席亚火山口"], _
["Regent Valley", "统治者之谷"], _
["Quetzal Crests", "长尾冠毛"], _
["Prophet's Path", "先知之路"], _
["PRIVMSG", "PRIVMSG"], _ ;未译
["Prismatic Ooze", "多彩乌兹"], _
["Pockmark Flats", "麻点平原"], _
["pcons%d", "pcons%d"], _ ;未译
["Outpost", "Outpost"], _ ;未译
["offhand", "offhand"], _ ;未译
["Modniir Manes", "莫得米鬃毛"], _
["Minotaur Horns", "牛头怪角"], _
["Mamnoon Lagoon", "玛奴泻湖"], _
["Maishang Hills", "麦尚山丘"], _
["Maguuma Manes", "梅古玛鬃毛"], _
["Lornar's Pass", "洛拿斯通道"], _
["Leathery Claws", "强韧的爪"], _
["Kinya Province", "欣弥领地"], _
["Jaga Moraine", "亚加 摩瑞音"], _
["Jade Bracelets", "翡翠手镯"], _
["In Game", "In Game"], _ ;未译
["gwenpre", "gwenpre"], _ ;未译
["Frigid Hearts", "冰冻的心脏"], _
["Fort Aspenwood", "杨木要塞"], _
["Faction", "Faction"], _ ;未译
["Ettin's Back", "双头怪隐匿地"], _
["Door ID", "Door ID"], _ ;未译
["Discord", "Discord"], _ ;未译
["deep24h", "deep24h"], _ ;未译
["dailies", "dailies"], _ ;未译
["costume", "costume"], _ ;未译
["celepig", "celepig"], _ ;未译
["Behemoth Hides", "巨兽皮革"], _
["Azure Remains", "湛蓝残留物"], _
["Alerts:", "Alerts:"], _ ;未译
["24hdeep", "24hdeep"], _ ;未译
["/tp doa", "/tp doa"], _ ;未译
["/tp ae1", "/tp ae1"], _ ;未译
["##start", "##start"], _ ;未译
["##check", "##check"], _ ;未译
["###name", "###name"], _ ;未译
["###code", "###code"], _ ;未译
["Zaishen Elite", "战承精英"], _
["Yohlon Haven", "犹朗避难所"], _
["Umbral Grotto", "阴影石穴"], _
["UW - UWG", "地下 - 不速之客"], _
["Tsumei Village", "苏梅村"], _
["Travel To...", "前往..."], _
["Thirsty River", "干枯河流"], _
["Send a Dialog", "发送暗码"], _
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
["Hero Builds", "英雄技能样本"], _
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
["xunlai", "xunlai"], _ ;未译
["unlock", "unlock"], _ ;未译
["travel", "travel"], _ ;未译
["target", "target"], _ ;未译
["sugest", "sugest"], _ ;未译
["scwiki", "scwiki"], _ ;未译
["resize", "resize"], _ ;未译
["resign", "resign"], _ ;未译
["report", "report"], _ ;未译
["name%d", "name%d"], _ ;未译
["marker", "marker"], _ ;未译
["line%d", "line%d"], _ ;未译
["ignore", "ignore"], _ ;未译
["id: %d", "id: %d"], _ ;未译
["health", "health"], _ ;未译
["header", "header"], _ ;未译
["getpos", "getpos"], _ ;未译
["embark", "embark"], _ ;未译
["dialog", "dialog"], _ ;未译
["damage", "damage"], _ ;未译
["count_", "count_"], _ ;未译
["camera", "camera"], _ ;未译
["builds", "builds"], _ ;未译
["active", "active"], _ ;未译
["Zei Ri", "Zei Ri"], _ ;未译
["War Supplies", "战承物资"], _
["Vlox's", "Vlox's"], _ ;未译
["Use %s", "Use %s"], _ ;未译
["Trade Alerts", "买卖提示"], _
["Toggle", "Toggle"], _ ;未译
["TeamId", "TeamId"], _ ;未译
["Target", "Target"], _ ;未译
["Square", "Square"], _ ;未译
["Shadow", "Shadow"], _ ;未译
["Sender", "Sender"], _ ;未译
["Select", "Select"], _ ;未译
["Search", "Search"], _ ;未译
["Ring of Fire", "火环群岛"], _
["Revert", "Revert"], _ ;未译
["Recent", "Recent"], _ ;未译
["Ranges", "Ranges"], _ ;未译
["Ranger", "Ranger"], _ ;未译
["Raisu Palace", "莱苏皇宫"], _
["Polish", "Polish"], _ ;未译
["Player", "Player"], _ ;未译
["Piken Square", "派肯广场"], _
["Packet", "Packet"], _ ;未译
["Others", "Others"], _ ;未译
["Oem 10", "Oem 10"], _ ;未译
["Noname", "Noname"], _ ;未译
["Mesmer", "Mesmer"], _ ;未译
["Map ID", "Map ID"], _ ;未译
["Leather Square", "皮革"], _
["Kourna", "高楠"], _
["Khobay", "Khobay"], _ ;未译
["ItemId", "ItemId"], _ ;未译
["ItemID", "ItemID"], _ ;未译
["International", "国际区"], _
["Hotkey: %s", "快键: %s"], _
["German", "German"], _ ;未译
["Gate of Pain", "惩罚之门"], _
["Gate of Fear", "恐惧之门"], _
["Gadd's", "Gadd's"], _ ;未译
["French", "French"], _ ;未译
["Escort", "Escort"], _ ;未译
["Embark", "Embark"], _ ;未译
["Elona Reach", "伊洛那流域"], _
["Divide", "Divide"], _ ;未译
["Dialog", "Dialog"], _ ;未译
["Damage", "Damage"], _ ;未译
["Custom", "Custom"], _ ;未译
["Colors", "Colors"], _ ;未译
["Color:", "Color:"], _ ;未译
["Circle", "Circle"], _ ;未译
["Camp Hojanu", "何加努营地"], _
["Buy##rare", "买##rare"], _
["Borlis Pass", "柏里斯通道"], _
["Bolt of Linen", "亚麻布"], _
["Bolt of Damask", "缎布"], _
["Amatz Basin", "亚马兹盆地"], _
["Alt + ", "Alt + "], _ ;未译
["Alerts", "Alerts"], _ ;未译
["Action", "Action"], _ ;未译
["<name>", "<name>"], _ ;未译
["<None>", "<None>"], _ ;未译
["10 Feathers", "10 羽毛"], _
["%d %s ago", "%d %s 前"], _
["% Alliance", "% 同盟频道"], _
[" (%s ago)", " (%s 前)"], _
["Zehlon Reach", "列隆流域"], _
["Worn Belts", "破旧的腰带s"], _
["window", "window"], _ ;未译
["widget", "widget"], _ ;未译
["weekly", "weekly"], _ ;未译
["Weaver Legs", "编织者的腿"], _
["weapon", "weapon"], _ ;未译
["vipers", "vipers"], _ ;未译
["Vials of Ink", "小瓶墨水"], _
["Vehjin Mines", "威金矿坑"], _
["unused", "unused"], _ ;未译
["Twitch", "Twitch"], _ ;未译
["Topaz Crest", "黄宝石颈脊"], _
["The Undercity", "地下城"], _
["The Arid Sea", "枯竭之海"], _
["surmia", "surmia"], _ ;未译
["Stone Carving", "石雕品"], _
["status", "status"], _ ;未译
["Stance", "态势"], _
["Signet", "纹章"], _
["shield", "shield"], _ ;未译
["Scroll", "Scroll"], _ ;未译
["region", "region"], _ ;未译
["Putrid Cysts", "腐败胞囊"], _
["purple", "purple"], _ ;未译
["Plague Idols", "瘟疫法器"], _
["Old Ascalon", "旧阿斯卡隆"], _
["NPC ID", "NPC ID"], _ ;未译
["NOTICE", "NOTICE"], _ ;未译
["Nebo Terrace", "尼伯山丘"], _
["module", "module"], _ ;未译
["mallyx", "mallyx"], _ ;未译
["Jahai Bluffs", "夏亥峭壁"], _
["Jadeite Shards", "硬玉"], _
["Issnur Isles", "伊斯诺岛"], _
["HSR\x1", "HSR\x1"], _ ;未译
["HCT\x1", "HCT\x1"], _ ;未译
["Hardened Humps", "硬瘤"], _
["Haiju Lagoon", "海幽泻湖"], _
["greyed", "greyed"], _ ;未译
["Gold Doubloon", "金古币"], _
["gloves", "gloves"], _ ;未译
["Flash ", "Flash "], _ ;未译
["Famine", "Famine"], _ ;未译
["Elite ", "Elite "], _ ;未译
["Dwarven Ales", "矮人啤酒"], _
["dorian", "dorian"], _ ;未译
["Demons", "Demons"], _ ;未译
["Decode", "Decode"], _ ;未译
["Cursed Lands", "诅咒之地"], _
["beetle", "beetle"], _ ;未译
["Baked Husks", "烧焦外壳s"], _
["assets", "assets"], _ ;未译
["Ancient Eyes", "远古之眼"], _
["Alpine Seeds", "柏木种子"], _
["/tp gh", "/tp gh"], _ ;未译
["/tp 77", "/tp 77"], _ ;未译
["##type", "##type"], _ ;未译
["##time", "##time"], _ ;未译
["##size", "##size"], _ ;未译
["##name", "##name"], _ ;未译
["Vial of Ink", "小瓶墨水"], _
["Steel Ingot", "钢铁矿石"], _
["Sanctum Cay", "神圣沙滩"], _
["Resign Log", "退出令统计"], _
["Primary Prof", "主职业"], _
["Normal Mode", "普通模式"], _
["Move to %s", "前往 %s"], _
["Lion's Arch", "狮子拱门"], _
["Last Dialog", "前一令码"], _
["Jadeite Shard", "硬玉"], _
["Honur Hill", "霍奴尔丘陵"], _
["Fort Ranik", "瑞尼克要塞"], _
["Execute...", "执行..."], _
["Drake Kabob", "烤龙兽肉"], _
["Dajkah Inlet", "达卡港"], _
["Choose Hero", "选择英雄"], _
["Camp Rankor", "蓝口营地"], _
["BuildIndex", "样本索引号"], _
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
["vloxs", "vloxs"], _ ;未译
["urgoz", "尔果"], _
["type_", "type_"], _ ;未译
["trade", "trade"], _ ;未译
["title", "头衔"], _
["speed", "speed"], _ ;未译
["shape", "shape"], _ ;未译
["round", "round"], _ ;未译
["reset", "reset"], _ ;未译
["query", "query"], _ ;未译
["print", "print"], _ ;未译
["plane", "plane"], _ ;未译
["pcons", "pcons"], _ ;未译
["olafstead", "欧拉夫之地"], _
["local", "local"], _ ;未译
["lines", "lines"], _ ;未译
["guild", "guild"], _ ;未译
["getid", "getid"], _ ;未译
["gadds", "gadds"], _ ;未译
["error", "error"], _ ;未译
["close", "close"], _ ;未译
["clear", "clear"], _ ;未译
["chest", "chest"], _ ;未译
["Waste", "Waste"], _ ;未译
["Vabbi", "瓦贝"], _
["Trade", "Trade"], _ ;未译
["Timer", "Timer"], _ ;未译
["Time=", "Time="], _ ;未译
["Theme", "Theme"], _ ;未译
["Space", "Space"], _ ;未译
["Sleep", "Sleep"], _ ;未译
["Skill", "技能"], _
["Sizes", "Sizes"], _ ;未译
["Show:", "Show:"], _ ;未译
["Shift", "Shift"], _ ;未译
["Shape", "Shape"], _ ;未译
["Scale", "Scale"], _ ;未译
["Right", "Right"], _ ;未译
["Reset", "Reset"], _ ;未译
["Ready", "Ready"], _ ;未译
["Range", "Range"], _ ;未译
["Quest", "Quest"], _ ;未译
["Print", "Print"], _ ;未译
["Port Sledge", "雪橇港"], _
["Pings", "Pings"], _ ;未译
["Pause", "Pause"], _ ;未译
["Owner", "Owner"], _ ;未译
["Olafstead", "欧拉夫之地"], _
["Ogden", "Ogden"], _ ;未译
["Oem 8", "Oem 8"], _ ;未译
["Oem 7", "Oem 7"], _ ;未译
["Oem 6", "Oem 6"], _ ;未译
["Oem 5", "Oem 5"], _ ;未译
["Oem 4", "Oem 4"], _ ;未译
["Oem 3", "Oem 3"], _ ;未译
["Oem 2", "Oem 2"], _ ;未译
["Oem 1", "Oem 1"], _ ;未译
["Maatu Keep", "麻都堡垒"], _
["Luxon", "Luxon"], _ ;未译
["Local", "Local"], _ ;未译
["Level", "Level"], _ ;未译
["Later", "Later"], _ ;未译
["Kryta", "科瑞塔"], _
["Istan", "艾斯坦"], _
["Guild", "Guild"], _ ;未译
["Gloom", "Gloom"], _ ;未译
["Fav%d", "Fav%d"], _ ;未译
["Explorable", "探索区域"], _
["ExSel", "ExSel"], _ ;未译
["Error", "Error"], _ ;未译
["Enter", "Enter"], _ ;未译
["Drops", "Drops"], _ ;未译
["CrSel", "CrSel"], _ ;未译
["Color", "Color"], _ ;未译
["Clock", "Clock"], _ ;未译
["Clear", "Clear"], _ ;未译
["Candy Apple", "糖苹果"], _
["Bonds", "Bonds"], _ ;未译
["Bolt of Silk", "丝绸"], _
["Acolyte Jin", "侍从静"], _
["10 Scales", "10 鳞片"], _
["/flag", "/flag"], _ ;未译
["Winds", "Winds"], _ ;未译
["Verata", "死灵法师 芙瑞达"], _
["Union", "Union"], _ ;未译
["tp gh", "tp gh"], _ ;未译
["Sunqua Vale", "桑泉谷"], _
["Stormy Eye", "暴风之眼"], _
["Spell", "咒文魔法"], _
["Soul Stones", "灵魂石"], _
["smite", "smite"], _ ;未译
["Skull Juju", "头骨土符"], _
["Skelk Claws", "司怪爪"], _
["Skale Fins", "鳞怪鳍s"], _
["Shout", "战嚎"], _
["Sage Lands", "贤者领地"], _
["polar", "polar"], _ ;未译
["on %A", "on %A"], _ ;未译
["Naga Skins", "迦纳外皮"], _
["morah", "morah"], _ ;未译
["Mahgo Claw", "码果的爪"], _
["Krait Skins", "环蛇皮"], _
["Jotun Pelt", "角顿皮毛"], _
["Index", "Index"], _ ;未译
["hands", "hands"], _ ;未译
["Glyph", "符号"], _
["Gloom Seed", "黑暗种子"], _
["Forgewight", "炼冶维特"], _
["flags", "flags"], _ ;未译
["Earth", "Earth"], _ ;未译
["Debug", "Debug"], _ ;未译
["daily", "daily"], _ ;未译
["Chant", "圣歌"], _
["boots", "boots"], _ ;未译
["Bag 2", "Bag 2"], _ ;未译
["Bag 1", "Bag 1"], _ ;未译
["Archipelagos", "群岛"], _
["Amber Chunks", "琥珀"], _
["alias", "alias"], _ ;未译
["##map", "##map"], _ ;未译
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
["Griffons", "狮鹫兽礼物"], _
["Golden Egg", "金鸡蛋"], _
["Candy Corn", "粟米糖"], _
["Build Name", "样本名"], _
["Amber Chunk", "琥珀"], _
["@ Guild", "@ 公会频道"], _
["10 Bones", "10 骨头"], _
["%.2f m", "%.2f 百万"], _
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
["zoom", "zoom"], _ ;未译
["vlox", "vlox"], _ ;未译
["team", "team"], _ ;未译
["stop", "stop"], _ ;未译
["size", "size"], _ ;未译
["show", "show"], _ ;未译
["save", "save"], _ ;未译
["quit", "quit"], _ ;未译
["p.m.", "p.m."], _ ;未译
["name", "name"], _ ;未译
["mini", "mini"], _ ;未译
["maxi", "maxi"], _ ;未译
["lock", "lock"], _ ;未译
["load", "load"], _ ;未译
["line", "line"], _ ;未译
["kama", "kama"], _ ;未译
["hide", "hide"], _ ;未译
["gtob", "gtob"], _ ;未译
["greenrock", "绿冰糖"], _
["gadd", "gadd"], _ ;未译
["foes", "foes"], _ ;未译
["flag", "flag"], _ ;未译
["exit", "exit"], _ ;未译
["eotn", "eotn"], _ ;未译
["doom", "doom"], _ ;未译
["deep", "deep"], _ ;未译
["city", "city"], _ ;未译
["body", "body"], _ ;未译
["beetletun", "甲虫镇"], _
["arborstone", "亭石"], _
["age2", "age2"], _ ;未译
["a.m.", "a.m."], _ ;未译
["Zoom", "Zoom"], _ ;未译
["Wilds, The", "荒原"], _
["Veil", "Veil"], _ ;未译
["UW Teles", "地下传送"], _
["Type", "Type"], _ ;未译
["Time", "Time"], _ ;未译
["Tear", "Tear"], _ ;未译
["Team", "Team"], _ ;未译
["Swat", "Swat"], _ ;未译
["Size", "Size"], _ ;未译
["Send##2", "发送##2"], _
["Send##1", "发送##1"], _
["Save Now", "即刻存档"], _
["Rata Sum", "洛达顶点"], _
["Play", "Play"], _ ;未译
["Nundu Bay", "纳度湾"], _
["None", "None"], _ ;未译
["Name", "Name"], _ ;未译
["Move", "Move"], _ ;未译
["Monk", "Monk"], _ ;未译
["Mode", "Mode"], _ ;未译
["Mnts", "Mnts"], _ ;未译
["Miku", "Miku"], _ ;未译
["Map-", "Map-"], _ ;未译
["Load Now", "即刻装填"], _
["Left", "Left"], _ ;未译
["Item", "Item"], _ ;未译
["Home", "Home"], _ ;未译
["Hide", "Hide"], _ ;未译
["H#%d", "H#%d"], _ ;未译
["Fur Square", "毛皮"], _
["Forge", "永生的锻造大师"], _
["Down", "Down"], _ ;未译
["Defend", "保护战争圣殿"], _
["City", "City"], _ ;未译
["Cancelled", "已取消"], _
["Bye!", "Bye!"], _ ;未译
["Beetletun", "甲虫镇"], _
["Attn", "Attn"], _ ;未译
["Arborstone", "亭石"], _
["2.29", "2.29"], _ ;未译
["%.2f k", "%.2f 千"], _
["%.1f k", "%.1f 千"], _
["Wiki", "Wiki"], _ ;未译
["View", "View"], _ ;未译
["Trap", "陷阱"], _
["topk", "topk"], _ ;未译
["The Falls", "陷落区"], _
["The Breach", "缺口"], _
["the ", "the "], _ ;未译
["Slot", "Slot"], _ ;未译
["Silverwood", "银树"], _
["salv", "salv"], _ ;未译
["Salt Flats", "盐滩"], _
["runs", "runs"], _ ;未译
["Rotscale", "恶臭骨龙"], _
["Rank", "Rank"], _ ;未译
["Prof", "Prof"], _ ;未译
["PART", "PART"], _ ;未译
["Life", "Life"], _ ;未译
["legs", "legs"], _ ;未译
["JOIN", "JOIN"], _ ;未译
["Icy Humps", "冰雪瘤"], _
["head", "head"], _ ;未译
["gold", "gold"], _ ;未译
["Form", "形态"], _
["Fendi Nin", "梵蒂宁"], _
["feet", "feet"], _ ;未译
["fake", "fake"], _ ;未译
["Echo", "回响"], _
["done", "done"], _ ;未译
["Date", "Date"], _ ;未译
["blue", "blue"], _ ;未译
["Attr", "Attr"], _ ;未译
["Arbor Bay", "安博湾"], _
["3.42", "3.42"], _ ;未译
["##y2", "##y2"], _ ;未译
["##y1", "##y1"], _ ;未译
["##x2", "##x2"], _ ;未译
["##x1", "##x1"], _ ;未译
["sifhalla", "袭哈拉"], _
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
["Arachni", "奥拉赫妮"], _
["salad", "伊波枷沙拉"], _
["redrock", "红冰糖"], _
["lunars", "命运锦囊"], _
["enabled", "已启动"], _
["distance", "距离"], _
["cavalon", "卡瓦隆"], _
["Wastes", "荒凉冰地"], _
["SkillID", "技能号"], _
["Settings", "设置"], _
["Rotation", "面向"], _
["Planes", "混沌平原"], _
["Menzies", "孟席斯"], _
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
["Dialogs", "令码"], _
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
["Travel", "直达"], _
["Reward", "奖励"], _
["Recall", "回归"], _
["Pools", "孵化池"], _
["Pits", "骷髅墓穴"], _
["Livia", "莉薇亚"], _
["Height", "高度"], _
["Health", "体力"], _
["Europe", "欧洲"], _
["Delete", "删除"], _
["Cancel", "取消"], _
["Builds", "样本"], _
["Addr", "内存地址"], _
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
["Geode", "晶石"], _
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
["Edit", "修改"], _
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
