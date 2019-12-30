#include-once
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <Array.au3>
#include <File.au3>
#include <WinAPI.au3>

;&'"'&"'"&'" & '
;&'"'&"'"&'" & '
;" & "&'"'&"'"&'"      '
;& ' & "'&"'"&'"

;^(.*?)'(.*?) \:\=\: (.*?)$
;\[", '"&'"'&"$1"&"'"&"$2"&'"'&"'\], _ ;未译", ", '"&'"$3'&'"'&"'\], _ "\] _

;百科词典： https://guildwars.huijiwiki.com/wiki/%E8%AF%8D%E5%85%B8

;^(.*?) :=: (.*?)$
;\["$1", "$2"\], _

Local $ConversionTable[550][2] = [ _
["Asura Gate", "阿苏拉之门"], _
["Vortex", "涡流"], _
["Ascalon Arena", "阿斯卡隆竞技场"], _
["Shiverpeak Arena", "席娃山脉竞技场"], _
["D'Alessio Arena", "达雷西竞技场"], _
["Amnoon Arena", "安奴竞技场"], _
["Ashford Abbey", "灰色浅滩修道院"], _
["Foible's Fair", "佛伊伯市集"], _
["Fort Ranik", "瑞尼克要塞"], _
["The Barradin Estate", "巴拉丁庄园"], _
["Ascalon Academy", "阿斯卡隆城"], _
["Green Hills County", "绿丘郡"], _
["Lakeside County", "湖畔郡"], _
["Regent Valley", "统治者之谷"], _
["The Catacombs", "地下墓穴"], _
["The Northlands", "北方领土"], _
["Wizard's Folly", "巫师的怪异建筑"], _
["Ascalon City", "阿斯卡隆城"], _
["Lion's Arch", "狮子拱门"], _
["Henge of Denravi", "丹拉维圣地"], _
["Amnoon Oasis, The", "安奴绿洲"], _ ;["The Amnoon Oasis", "安奴绿洲"], _
["Droknar's Forge", "卓克纳熔炉"], _
["Ascalon City", "阿斯卡隆城"], _
["Beacon's Perch", "毕肯高地"], _
["Beetletun", "甲虫镇"], _
["Bergen Hot Springs", "卑尔根温泉"], _
["Camp Rankor", "蓝口营地"], _
["Copperhammer Mines", "铜锤矿坑"], _
["Deldrimor War Camp", "戴尔狄摩兵营"], _
["Destiny's Gorge", "命运峡谷"], _
["Druid's Overlook", "德鲁伊高地"], _
["Ember Light Camp", "残火营地"], _
["Fishermen's Haven", "渔人避风港"], _
["Frontier Gate", "边境关所"], _
["Grendich Courthouse", "葛兰迪法院"], _
["Heroes' Audience", "英雄之痕"], _
["Ice Tooth Cave", "冰牙洞穴"], _
["Maguuma Stade", "梅古玛丛林"], _
["Marhan's Grotto", "马翰洞穴"], _
["Piken Square", "派肯广场"], _
["Port Sledge", "雪橇港"], _
["Quarrel Falls", "怨言瀑布"], _
["Sardelac Sanitarium", "萨德拉克疗养院"], _
["Seeker's Passage", "探索者通道"], _
["Temple of the Ages", "世纪神殿"], _
["Granite Citadel, The", "花岗岩堡垒"], _ ;["The Granite Citadel", "花岗岩堡垒"], _
["Tomb of the Primeval Kings", "先王之墓"], _
["Ventari's Refuge", "凡特里庇护所"], _
["Yak's Bend", "牦牛村"], _
["Abaddon's Mouth", "地狱隘口"], _
["Augury Rock", "占卜之石"], _
["Aurora Glade", "欧若拉林地"], _
["Bloodstone Fen", "血石沼泽"], _
["Borlis Pass", "柏里斯通道"], _
["D'Alessio Seaboard", "达雷西海滨"], _
["Divinity Coast", "神圣海岸"], _
["Dunes of Despair", "绝望沙丘"], _
["Elona Reach", "伊洛那流域"], _
["Fort Ranik", "瑞尼克要塞"], _
["Gates of Kryta", "科瑞塔关所"], _
["Hell's Precipice", "地狱悬崖"], _
["Ice Caves of Sorrow", "悲伤冰谷"], _
["Iron Mines of Moladune", "莫拉登矿山"], _
["Nolani Academy", "若拉尼学院"], _
["Ring of Fire", "火环群岛"], _
["Riverside Province", "河畔地带"], _
["Ruins of Surmia", "苏米亚废墟"], _
["Sanctum Cay", "神圣沙滩"], _
["Dragon's Lair, The", "龙穴"], _ ;["The Dragon's Lair", "龙穴"], _
["Frost Gate, The", "寒霜之门"], _ ;["The Frost Gate", "寒霜之门"], _
["Great Northern Wall, The", "北方长城"], _ ;["The Great Northern Wall", "北方长城"], _
["Wilds, The", "荒原"], _ ;["The Wilds", "荒原"], _
["Thirsty River", "干枯河流"], _
["Thunderhead Keep", "雷云要塞"], _
["Ascalon Foothills", "阿斯卡隆丘陵"], _
["Diessa Lowlands", "底耶沙低地"], _
["Dragon's Gullet", "巨龙峡谷"], _
["Eastern Frontier", "东方边境"], _
["Flame Temple Corridor", "夏尔火焰神殿"], _
["Old Ascalon", "旧阿斯卡隆"], _
["Pockmark Flats", "麻点平原"], _
["Regent Valley", "统治者之谷"], _
["The Breach", "缺口"], _
["Anvil Rock", "铁砧石"], _
["Deldrimor Bowl", "戴尔狄摩盆地"], _
["Griffon's Mouth", "狮鹫兽隘口"], _
["Iron Horse Mine", "铁马矿山"], _
["Traveler's Vale", "旅人谷"], _
["Cursed Lands", "诅咒之地"], _
["Kessex Peak", "凯席斯山"], _
["Lion's Gate", "狮门"], _
["Nebo Terrace", "尼伯山丘"], _
["North Kryta Province", "科瑞塔北部"], _
["Scoundrel's Rise", "恶汉山丘"], _
["Stingray Strand", "魟鱼湖滨"], _
["Talmark Wilderness", "突马克荒地"], _
["Tears of the Fallen", "战死者之泪"], _
["The Black Curtain", "黑色帷幕"], _
["Twin Serpent Lakes", "双头蛇湖泊"], _
["Watchtower Coast", "瞭望塔海岸"], _
["Dry Top", "干燥高地"], _
["Ettin's Back", "双头怪隐匿地"], _
["Majesty's Rest", "王者安息处"], _
["Mamnoon Lagoon", "玛奴泻湖"], _
["Reed Bog", "芦苇沼泽"], _
["Sage Lands", "贤者领地"], _
["Silverwood", "银树"], _
["Tangle Root", "纠结之根"], _
["The Falls", "陷落区"], _
["Diviner's Ascent", "预言者之坡"], _
["Prophet's Path", "先知之路"], _
["Salt Flats", "盐滩"], _
["Skyward Reach", "天际流域"], _
["The Arid Sea", "枯竭之海"], _
["The Scar", "断崖"], _
["Vulture Drifts", "秃鹰沙丘"], _
["Dreadnought's Drift", "无惧者之丘"], _
["Frozen Forest", "冰冻森林"], _
["Grenth's Footprint", "古兰斯的足迹"], _
["Ice Floe", "浮冰"], _
["Icedome", "冰顶"], _
["Lornar's Pass", "洛拿斯通道"], _
["Mineral Springs", "矿物泉源"], _
["Snake Dance", "蛇舞"], _
["Spearhead Peak", "枪尖山"], _
["Talus Chute", "碎石坡道"], _
["Tasca's Demise", "塔斯加之死"], _
["Witman's Folly", "威特曼的怪异建筑"], _
["Perdition Rock", "破灭石"], _
["Shing Jea Monastery", "星岬寺"], _
["Kaineng Center", "凯宁中心"], _
["House zu Heltzer", "凤荷议院"], _
["Cavalon", "卡瓦隆"], _
["Aspenwood Gate (Kurzick)", "杨木大门 (库兹柯)"], _
["Aspenwood Gate (Luxon)", "杨木大门 (勒克森)"], _
["Bai Paasu Reach", "拜巴苏区域"], _
["Brauer Academy", "巴尔学院"], _
["Breaker Hollow", "断崖谷"], _
["Durheim Archives", "杜汉姆卷藏室"], _
["Eredon Terrace", "尔雷登平地"], _
["Harvest Temple", "丰收神殿"], _
["Jade Flats (Kurzick)", "翡翠浅滩 (库兹柯)"], _
["Jade Flats (Luxon)", "翡翠浅滩 (勒克森)"], _
["Leviathan Pits", "利拜亚森矿场"], _
["Lutgardis Conservatory", "路嘉帝斯温室"], _
["Maatu Keep", "麻都堡垒"], _
["Ran Musu Gardens", "岚穆苏花园"], _
["Saint Anjeka's Shrine", "圣者安捷卡的祭坛"], _
["Seafarer's Rest", "航海者休憩处"], _
["Seitung Harbor", "青函港"], _
["Senji's Corner", "山吉之街"], _
["Tanglewood Copse", "谭格梧树林"], _
["Marketplace, The", "市集"], _ ;["The Marketplace", "市集"], _
["Tsumei Village", "苏梅村"], _
["Vasburg Armory", "维思伯兵营"], _
["Zin Ku Corridor", "辛库走廊"], _
["Altrumm Ruins", "奥楚兰废墟"], _
["Amatz Basin", "亚马兹盆地"], _
["Arborstone", "亭石"], _
["Boreas Seabed", "风神海床"], _
["Dragon's Throat", "龙喉"], _
["Fort Aspenwood (Kurzick)", "杨木要塞 (库兹柯)"], _
["Fort Aspenwood (Luxon)", "杨木要塞 (勒克森)"], _
["Gyala Hatchery", "盖拉孵化所"], _
["Imperial Sanctum", "帝国圣所"], _
["Minister Cho's Estate", "周大臣庄园"], _
["Nahpui Quarter", "纳普区"], _
["Raisu Palace", "莱苏皇宫"], _
["Sunjiang District", "孙江行政区"], _
["Tahnnakai Temple", "谭纳凯神殿"], _
["Aurios Mines, The", "奥里欧斯矿坑"], _ ;["The Aurios Mines", "奥里欧斯矿坑"], _
["Eternal Grove, The", "永恒之林"], _ ;["The Eternal Grove", "永恒之林"], _
["Jade Quarry (Kurzick), The", "翡翠矿场 (库兹柯)"], _ ;["The Jade Quarry", "翡翠矿场"], _
["Jade Quarry (Luxon), The", "翡翠矿场 (勒克森)"], _ ;["The Jade Quarry", "翡翠矿场"], _
["Unwaking Waters (Kurzick)", "沉睡之水 (库兹柯)"], _
["Unwaking Waters (Luxon)", "沉睡之水 (勒克森)"], _
["Vizunah Square", "薇茹广场"], _
["Vizunah Square", "薇茹广场"], _
["Zen Daijun", "祯台郡"], _
["Zos Shivros Channel", "佐席洛斯水道"], _
["Haiju Lagoon", "海幽泻湖"], _
["Jaya Bluffs", "蛇野断崖"], _
["Kinya Province", "欣弥领地"], _
["Linnok Courtyard", "里诺庭园"], _
["Minister Cho's Estate", "周大臣庄园"], _
["Monastery Overlook", "寺庙高处"], _
["Panjiang Peninsula", "班让半岛"], _
["Saoshang Trail", "绍商小径"], _
["Sunqua Vale", "桑泉谷"], _
["Zen Daijun", "祯台郡"], _
["Bejunkan Pier", "君瞰码头"], _
["Bukdek Byway", "巴德克小径"], _
["Divine Path", "神圣之路"], _
["Kaineng Docks", "凯宁船坞"], _
["Nahpui Quarter", "纳普区"], _
["Pongmei Valley", "朋美谷"], _
["Raisu Palace", "莱苏皇宫"], _
["Raisu Pavilion", "莱苏阁"], _
["Shadow's Passage", "阴暗通道"], _
["Shenzun Tunnels", "申赞通道"], _
["Sunjiang District", "孙江行政区"], _
["Tahnnakai Temple", "谭纳凯神殿"], _
["Wajjun Bazaar", "瓦江市场"], _
["Xaquang Skyway", "夏安便道"], _
["Arborstone", "亭石"], _
["Drazach Thicket", "德瑞札灌木林"], _
["Ferndale", "蕨谷"], _
["Melandru's Hope", "梅兰朵的盼望"], _
["Morostav Trail", "摩洛神秘通道"], _
["Mourning Veil Falls", "哀伤之墓瀑布"], _
["The Eternal Grove", "永恒之林"], _
["Archipelagos", "群岛"], _
["Boreas Seabed", "风神海床"], _
["Maishang Hills", "麦尚山丘"], _
["Mount Qinkai", "今凯山"], _
["Gyala Hatchery", "盖拉孵化所"], _
["Rhea's Crater", "席亚火山口"], _
["Silent Surf", "寂静之浪"], _
["Unwaking Waters", "沉睡之水"], _
["Kamadan, Jewel of Istan", "卡玛丹，艾斯坦之钻"], _
["Sunspear Sanctuary", "日戟避难所"], _
["Kodash Bazaar, The", "库丹西市集广场"], _ ;["The Kodash Bazaar", "库丹西市集广场"], _
["Gate of Torment", "苦痛之门"], _
["Basalt Grotto", "玄武岩石穴"], _
["Beknur Harbor", "别克诺港"], _
["Bone Palace", "白骨宫殿"], _
["Camp Hojanu", "何加努营地"], _
["Champion's Dawn", "勇士曙光"], _
["Chantry of Secrets", "隐秘教堂"], _
["Gate of Fear", "恐惧之门"], _
["Gate of Secrets", "奥秘之门"], _
["Gate of the Nightfallen Lands", "夜蚀暗殒领地之门"], _
["Honur Hill", "霍奴尔丘陵"], _
["Kodlonu Hamlet", "克拓奴，哈姆雷特"], _
["Lair of the Forgotten", "被遗忘者的巢穴"], _
["Mihanu Township", "米哈努小镇"], _
["Sunspear Great Hall", "日戟大会堂"], _
["Astralarium, The", "亚斯特拉利姆"], _ ;["The Astralarium", "亚斯特拉利姆"], _
["Mouth of Torment, The", "苦痛之地隘口"], _ ;["The Mouth of Torment", "苦痛之地隘口"], _
["Wehhan Terraces", "薇恩平台"], _
["Yahnur Market", "雅诺尔市集"], _
["Yohlon Haven", "犹朗避难所"], _
["Abaddon's Gate", "亚霸顿之门"], _
["Blacktide Den", "黑潮之穴"], _
["Chahbek Village", "夏贝克村庄"], _
["Consulate Docks", "领事馆码头"], _
["Dajkah Inlet", "达卡港"], _
["Dasha Vestibule", "达沙走廊"], _
["Dzagonur Bastion", "萨岗诺棱堡"], _
["Gate of Anguish", "悲难之门"], _
["Gate of Desolation", "荒芜之地入口"], _
["Gate of Madness", "疯狂之门"], _
["Gate of Pain", "惩罚之门"], _
["Grand Court of Sebelkeh", "希贝克大公廷"], _
["Jennur's Horde", "征钠群落"], _
["Jokanur Diggings", "卓坎诺挖掘点"], _
["Kodonur Crossroads", "科登诺路口"], _
["Moddok Crevice", "摩多克裂缝"], _
["Nundu Bay", "纳度湾"], _
["Pogahn Passage", "波甘驿站"], _
["Remains of Sahlahja", "萨拉迦遗址"], _
["Rilohn Refuge", "里欧恩难民营"], _
["Ruins of Morah", "摩拉废墟"], _
["Shadow Nexus, The", "阴郁核心"], _ ;["The Shadow Nexus", "阴郁核心"], _
["Tihark Orchard", "提亚克林地"], _
["Venta Cemetery", "凡特墓地"], _
["Churrhir Fields", "楚尔赫训练场"], _
["Cliffs of Dohjok", "杜夏悬崖"], _
["Consulate", "领事馆"], _
["Fahranur, The First City", "旧城，法兰努尔"], _
["Issnur Isles", "伊斯诺岛"], _
["Lahtenda Bog", "洛天帝沼泽"], _
["Mehtani Keys", "梅坦尼之钥"], _
["Plains of Jarin", "贾林平原"], _
["Sun Docks", "朝阳码头"], _
["Zehlon Reach", "列隆流域"], _
["Arkjok Ward", "阿尔科监禁区"], _
["Bahdok Caverns", "巴多克洞穴"], _
["Barbarous Shore", "野蛮河岸"], _
["Command Post", "指挥所"], _
["Dejarin Estate", "达贾林庄园"], _
["Gandara, the Moon Fortress", "弦月要塞，干达拉"], _
["Jahai Bluffs", "夏亥峭壁"], _
["Marga Coast", "马加海岸"], _
["Sunward Marches", "向阳边境"], _
["The Floodplain of Mahnkelon", "曼克隆泛滥平原"], _
["Turai's Procession", "托雷长廊"], _
["Bokka Amphitheatre", "波卡剧院"], _
["Forum Highlands", "高地广场"], _
["Garden of Seborhin", "希伯欣花园"], _
["Holdings of Chokhin", "舟克辛卷藏室"], _
["Resplendent Makuun", "奢华之城，莫肯"], _
["The Hidden City of Ahdashim", "隐藏之城，哈达辛"], _
["The Mirror of Lyss", "丽之镜湖"], _
["Vehjin Mines", "威金矿坑"], _
["Vehtendi Valley", "巍天帝峡谷"], _
["Wilderness of Bahdza", "巴萨荒野"], _
["Yatendi Canyons", "亚天帝峡谷"], _
["Crystal Overlook", "水晶高地"], _
["Joko's Domain", "杰格领地"], _
["Poisoned Outcrops", "剧毒地表"], _
["The Alkali Pan", "金属镕炉"], _
["The Ruptured Heart", "破裂之心"], _
["The Shattered Ravines", "碎裂沟谷"], _
["The Sulfurous Wastes", "硫磺荒地"], _
["Depths of Madness", "疯狂深渊"], _
["Domain of Anguish", "悲难领地"], _
["City of Torc'qua", "托加之城"], _
["Ravenheart Gloom", "夺心暗域"], _
["Stygian Veil", "冥狱之幕"], _
["The Foundry of Failed Creations", "失败事物铸造厂"], _
["Domain of Fear", "恐惧领地"], _
["Domain of Pain", "苦痛领地"], _
["Domain of Secrets", "奥秘领地"], _
["Nightfallen Jahai", "夜蚀暗殒 夏亥"], _
["Rata Sum", "洛达顶点"], _
["Gunnar's Hold", "甘拿的占领地"], _
["Doomlore Shrine", "末日传说神殿"], _
["Boreal Station", "北极驻地"], _
["Central Transfer Chamber", "中央转送室"], _
["Eye of the North", "极地之眼"], _
["Gadd's Encampment", "盖德营地"], _
["Longeye's Ledge", "长眼岩脉"], _
["Olafstead", "欧拉夫之地"], _
["Sifhalla", "袭哈拉"], _
["Tarnished Haven", "灰暗避难所"], _
["Umbral Grotto", "阴影石穴"], _
["Vlox's Falls", "弗洛克斯瀑布"], _
["Dalada Uplands", "达拉达山地"], _
["Grothmar Wardowns", "古斯玛战争丘陵地"], _
["Sacnoth Valley", "圣诺谷"], _
["Battledepths", "战斗深渊"], _
["Bjora Marches", "碧拉边境"], _
["Drakkar Lake", "卓卡湖"], _
["Hall of Monuments", "史迹殿堂"], _
["Ice Cliff Chasms", "冰崖裂口"], _
["Jaga Moraine", "亚加 摩瑞音"], _
["Norrhart Domains", "诺恩之心领地"], _
["Varajar Fells", "维拉戛阵地"], _
["Alcazia Tangle", "纠结之艾卡滋亚"], _
["Arbor Bay", "安博湾"], _
["Magus Stones", "玛古斯之石"], _
["Riven Earth", "撕裂大地"], _
["Sparkfly Swamp", "火星蝇沼泽"], _
["Verdant Cascades", "原野瀑布"], _
["Catacombs of Kathandrax", "卡山卓司的地下墓穴"], _
["Rragar's Menagerie", "拉喀的牢笼"], _
["Cathedral of Flames", "火焰大教堂"], _
["Ooze Pit", "乌兹地窖"], _
["Darkrime Delves", "黑霜洞穴"], _
["Frostmaw's Burrows", "冻霜地道"], _
["Sepulchre of Dragrimmar", "爪格林玛坟墓"], _
["Raven's Point", "渡鸦岬角"], _
["Vloxen Excavations", "弗洛森古迹"], _
["Bogroot Growths", "泥塘根源地"], _
["Bloodstone Caves", "血石洞"], _
["Shards of Orr", "欧尔残迹"], _
["Oola's Lab", "乌啦的实验室"], _
["Arachni's Haunt", "奥拉克妮的栖息地"], _
["Slavers' Exile", "奴隶商人放逐地"], _
["Fronis Irontoe's Lair", "铁趾佛朗尼的巢穴"], _
["Secret Lair of the Snowmen", "雪怪的秘密巢穴"], _
["Heart of the Shiverpeaks", "席娃山脉之心"], _
["Great Temple of Balthazar", "巴萨泽圣殿"], _
["Heroes' Ascent", "英雄之路"], _
["Random Arenas", "随机竞技场"], _
["Zaishen Challenge", "战承挑战赛"], _
["Zaishen Elite", "战承精英"], _
["Zaishen Menagerie", "战承动物园"], _
["Isle of the Nameless", "无名岛"], _
["Isle of the Nameless", "无名岛"], _
["Zaishen Menagerie Grounds", "战承动物园"], _
["Serenity Temple", "宁静神殿"], _
["Sorrow's Furnace", "哀伤熔炉"], _
["The Undercity", "地下城"], _
["Urgoz's Warren", "尔果的养殖场"], _
["Deep, The", "深处"], _ ;["The Deep", "深处"], _
["Island of Shehkah", "沙卡岛"], _
["Nightfallen Garden", "Nightfallen Garden"], _
["Throne of Secrets", "神秘王座"], _
["Heart of Abaddon", "Heart of Abaddon"], _
["Embark Beach", "Embark Beach"], _
["Codex Arena", "Codex 竞技场"], _
["Costume Brawl", "Costume Brawl"], _
["Dragon Arena", "龙之竞技场"], _
["Shing Jea Arena", "星岬竞技场"], _
["Rollerbeetle Racing", "滚滚甲虫竞赛"], _
["Sunspear Arena", "日戟竞技场"], _
["Fissure of Woe", "灾难裂痕"], _
["The Underworld", "地下世界"], _
["Acolyte Jin", "侍从静"], _
["Acolyte Sousuke", "侍从萨苏克"], _
["Anton", "安托"], _
["Dunkoro", "唐克罗"], _
["General Morgahn", "摩根将军"], _
["Goren", "高恩"], _
["Gwen", "关"], _
["Hayda", "海妲"], _
["Jora", "乔拉"], _
["Kahmu", "卡慕"], _
["Koss", "寇斯"], _
["Livia", "莉薇亚"], _
["Margrid the Sly", "狡猾者玛格丽特 (狡诈者玛格丽)"], _
["Master of Whispers", "唤言大师"], _
["Melonni", "梅隆妮"], _
["Norgu", "诺古"], _
["Ogden Stonehealer", "石愈者欧格登"], _
["Olias", "奥里亚斯"], _
["Pyre Fierceshot", "烈之击炎焰"], _
["Razah", "雷萨"], _
["Tahlkora", "塔蔻菈"], _
["Vekk", "维克"], _
["Xandra", "珊卓亚"], _
["Zenmai", "刃玛伊"], _
["Zhed Shadowhoof", "影爪杰德"], _
["Butoh the Bold", "无畏者 布陀"], _
["Captain Mehhan", "队长 弥汉"], _
["Commander Suha", "指挥官 约哈"], _
["Dehjah", "德雅"], _
["Dirah Traptail", "迪拉 崔普特"], _
["Dockmaster Ahlaro", "码头管理者 亚罗"], _
["Dreamer Hahla", "解梦人 荷伦"], _
["Dreamer Raja", "解梦人 洛佳"], _
["Elder Dahut", "长老达胡"], _
["Elder Jonah", "裘那长老"], _
["Elder Nahlo", "长老纳洛"], _
["Elder Suhl", "长老苏尔"], _
["Estate Guard Rikesh", "庄园守卫 里克许"], _
["Event Planner Kazsha", "庆典筹办人 凯沙"], _
["Font of Lyss", "丽之圣水"], _
["Guardsman Bahsi", "守卫巴赛"], _
["Haroj Firemane", "火鬃 札洛"], _
["Head Priest Vahmani", "主祭司 范马尼"], _
["Jarindok", "贾令达"], _
["Keeper Halyssi", "看守者 海立司"], _
["Kehanni", "柯函妮"], _
["Kormir", "柯米儿"], _
["Kuwame", "库维弥"], _
["Laph Longmane", "长鬃 拉鲁夫"], _
["Lieutenant Murunda", "副官 米汪达"], _
["Lonai", "萝艾"], _
["Mirza Veldrunner", "奔原者 弥萨"], _
["Morgahn", "摩根"], _
["Pehai", "班禾"], _
["Priestess Haila", "女祭司 海菈"], _
["Prince Ahmtur the Mighty", "强者 安托侯爵"], _
["Prince Bokka the Magnificent", "豪者 波卡侯爵"], _
["Prince Mehtu the Wise", "智者 梅图侯爵"], _
["Priest Kehmtut", "祭司 肯穆"], _
["Rojis", "罗吉斯"], _
["Rahmor", "拉默"], _
["Royal Finance Maste Oluda", "王室财政大臣 欧蓝达"], _
["Royal Food Taster Rendu", "王室食品尝味师 兰杜"], _
["Runic Oracle", "古文先知"], _
["Sahlahjar the Dead", "亡者 萨拉迦"], _
["Scout Ahtok", "侦察兵 雅度"], _
["Sunspear Modiki", "日戟 莫地奇"], _
["Tortured Sunspear", "受折磨的日戟骑士"], _
["Whispers Acolyte", "唤言侍从"], _
["Whispers Adept", "唤言高手"], _
["Zerai the Learner", "学习者 萨瑞"], _
["Brother Sitai", "须台教友"], _
["Crimson Skull", "红颅"], _
["Imperial Guard Musashi ", "皇室卫兵 武藏"], _
["Kao Tseng", "高胜"], _
["Lesser Grasp", "小鬼爪"], _
["City of Torc'qua", "托加之城"], _
["Foundry of Failed Creations", "失败事物铸造厂"], _
["Foundry Breakout", "逃出铸造厂"], _
["Breaching the Stygian Veil", "突破冥狱之幕"], _
["Brood Wars", "一网打尽"], _
["To the Rescue!", "前往救援!"], _
["The Rifts Between Us", "异世界的裂缝"], _
["Deathbringer Company", "死亡召唤大队"], _
["Clear the Chamber", "清除密室的障碍"], _
["Escort of Souls", "护送灵魂"], _
["Unwanted Guests", "不速之客"], _
["Restoring Grenth's Monuments", "恢复古兰斯圣像"], _
["Imprisoned Spirits", "被拘禁的亡魂"], _
["The Four Horsemen", "多姆四骑士"], _
["Wrathful Spirits", "愤怒的灵魂"], _
["Servants of Grenth", "古兰斯的使者"], _
["Terrorweb Queen", "恐惧蛛化精灵女王"], _
["Demon Assassin", "恶魔暗杀者"], _
["The Nightman Cometh", "夜叉来临"], _
["Tower of Courage", "勇气之塔"], _
["The Wailing Lord", "悲鸣领主"], _
["A Gift of Griffons", "狮鹫兽礼物"], _
["The Eternal Forgemaster", "永生的锻造大师"], _
["Defend the Temple of War", "保护战争圣殿"], _
["Restore the Temple of War", "恢复圣殿"], _
["Khobay the Betrayer", "背叛者库贝"], _
["Tower of Strength", "力量之塔"], _
["Army of Darkness", "黑暗的军队"], _
["Slaves of Menzies", "孟席斯的奴隶们"], _
["The Hunt", "猎杀碎片狼"], _
["Bolts of Cloth", "布料"], _
["Bones", "骨头"], _
["Chitin Fragments", "外壳"], _
["Feathers", "羽毛"], _
["Granite Slabs", "花岗岩石板"], _
["Iron Ingots", "铁矿石"], _
["Piles of Glittering Dust", "闪烁之土"], _
["Plant Fibers", "植物纤维"], _
["Scales", "鳞片"], _
["Tanned Hide Squares", "褐色兽皮"], _
["Wood Planks", "木材"], _
["Amber Chunk", "琥珀"], _
["Bolt of Damask", "缎布"], _
["Bolt of Linen", "亚麻布"], _
["Bolt of Silk", "丝绸"], _
["Deldrimor Steel Ingot", "戴尔狄摩钢铁矿石"], _
["Diamond", "金刚石"], _
["Elonian Leather Square", "伊洛那皮革"], _
["Fur Square", "毛皮"], _
["Glob of Ectoplasm", "心灵之玉"], _
["Jadeite Shard", "硬玉"], _
["Leather Square", "皮革"], _
["Lump of Charcoal", "结块的木炭"], _
["Monstrous Claw", "巨大的爪"], _
["Monstrous Eye", "巨大的眼"], _
["Monstrous Fang", "巨大尖牙"], _
["Obsidian Shard", "黑曜石碎片"], _
["Onyx Gemstone", "玛瑙宝石"], _
["Roll of Parchment", "羊皮纸卷"], _
["Roll of Vellum", "牛皮纸卷"], _
["Ruby", "红宝石"], _
["Sapphire", "蓝宝石"], _
["Spiritwood Plank", "心灵之板"], _
["Steel Ingot", "钢铁矿石"], _
["Tempered Glass Vial", "调合后的玻璃瓶"], _
["Vial of Ink", "小瓶墨水"], _
["Armor of Salvation", "救赎防具"], _
["Birthday Cupcake", "生日杯子蛋糕"], _
["Blue Rock Candy", "蓝冰糖"], _
["Bowl of Skalefin Soup", "鳞怪鳍汤"], _
["Candy Apple", "糖苹果"], _
["Candy Corn", "粟米糖"], _
["Drake Kabob", "烤龙兽肉"], _
["Essence of Celerity", "敏捷精华"], _
["Golden Egg", "金鸡蛋"], _
["Grail of Might", "力量圣杯"], _
["Green Rock Candy", "绿冰糖"], _
["Lunar Fortune", "命运锦囊"], _
["Pahnai Salad", "伊波枷沙拉"], _
["Powerstone of Courage", "勇气粉石"], _
["Red Rock Candy", "红冰糖"], _
["Scroll of Resurrection", "复活卷"], _
["Slice of Pumpkin Pie", "南瓜派"], _
["War Supplies", "战承物资"] _
]

Local $fileNames=_FileListToArray(@ScriptDir, "*.txt")


for $i=1 to $fileNames[0]

	Local $hFileOpen = FileOpen($fileNames[$i], 128)

	Local $dFileOpen=FileOpen("temp/"&$fileNames[$i], 138)

	Local $readLine = FileReadLine($hFileOpen)

	while @error <> -1

		if $readLine = "" then

		Else
			Local $dictionaryEntry
			Local $convert = Convert($readLine)
			if $readLine <> $convert then
                $dictionaryEntry = "[" & $readLine & ", " & $convert & "], _"
				;$dictionaryEntry = "["&'"'&"'"&'" & '& $readLine & " & "&'"'&"'"&'", '&'"'&"'"&'" & ' & $convert & ' & "'&"'"&'"], _'
			else
                $dictionaryEntry = "[" & $readLine & ", " & $convert & "], _ ;未译"
				;$dictionaryEntry = "["&'"'&"'"&'" & '& $readLine & " & "&'"'&"'"&'", '&'"'&"'"&'" & ' & $convert & ' & "'&"'"&'"], _ ;未译'
			endif

			FileWriteLine($dFileOpen, $dictionaryEntry)
		EndIf

		$readLine = FileReadLine($hFileOpen)

	Wend

	FileClose($hFileOpen)
	FileClose($dFileOpen)
Next

msgbox(0,"提示", "运行完毕")

Func Convert($lData)

	Local $original = $lData

	For $i = 0 To Ubound($ConversionTable) - 1
		$lData = StringReplace($lData,$ConversionTable[$i][0], $ConversionTable[$i][1])
	Next

	return $lData
EndFunc