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

Local $ConversionTable[1086][2] = [ _
["Great Northern Wall, The", "北方长城"], _ ;["The Great Northern Wall", "北方长城"], _
["Jade Quarry (Kurzick), The", "翡翠矿场 (库兹柯)"], _ ;["The Jade Quarry", "翡翠矿场"], _
["Jade Quarry (Luxon), The", "翡翠矿场 (勒克森)"], _ ;["The Jade Quarry", "翡翠矿场"], _
["Mouth of Torment, The", "苦痛之地隘口"], _ ;["The Mouth of Torment", "苦痛之地隘口"], _
["Granite Citadel, The", "花岗岩堡垒"], _ ;["The Granite Citadel", "花岗岩堡垒"], _
["Kodash Bazaar, The", "库丹西市集广场"], _ ;["The Kodash Bazaar", "库丹西市集广场"], _
["Aurios Mines, The", "奥里欧斯矿坑"], _ ;["The Aurios Mines", "奥里欧斯矿坑"], _
["Eternal Grove, The", "永恒之林"], _ ;["The Eternal Grove", "永恒之林"], _
["Astralarium, The", "亚斯特拉利姆"], _ ;["The Astralarium", "亚斯特拉利姆"], _
["Amnoon Oasis, The", "安奴绿洲"], _ ;["The Amnoon Oasis", "安奴绿洲"], _
["Shadow Nexus, The", "阴郁核心"], _ ;["The Shadow Nexus", "阴郁核心"], _
["Dragon's Lair, The", "龙穴"], _ ;["The Dragon's Lair", "龙穴"], _
["Minister Cho's Estate (explorable area)", "周大臣庄园 (探索区域)"], _
["Frost Gate, The", "寒霜之门"], _ ;["The Frost Gate", "寒霜之门"], _
["Marketplace, The", "市集"], _ ;["The Marketplace", "市集"], _
["Sunjiang District (explorable area)", "孙江行政区 (探索区域)"], _
["The Eternal Grove (explorable area)", "永恒之林 (探索区域)"], _
["Tahnnakai Temple (explorable area)", "谭纳凯神殿 (探索区域)"], _
["Unwaking Waters (explorable area)", "沉睡之水 (探索区域)"], _
["Gyala Hatchery (explorable area)", "盖拉孵化所 (探索区域)"], _
["Nahpui Quarter (explorable area)", "纳普区 (探索区域)"], _
["Boreas Seabed (explorable area)", "风神海床 (探索区域)"], _
["Raisu Palace (explorable area)", "莱苏皇宫 (探索区域)"], _
["The Foundry of Failed Creations", "失败事物铸造厂"], _
["Zen Daijun (explorable area)", "祯台郡 (探索区域)"], _
["Gate of the Nightfallen Lands", "夜蚀暗殒领地之门"], _
["Arborstone (explorable area)", "亭石 (探索区域)"], _
["Wilds, The", "荒原"], _ ;["The Wilds", "荒原"], _
["Nightfallen Garden", "Nightfallen Garden"], _
["Unwaking Waters (Kurzick)", "沉睡之水 (库兹柯)"], _
["The Hidden City of Ahdashim", "隐藏之城，哈达辛"], _
["Prince Bokka the Magnificent", "豪者 波卡侯爵"], _
["Royal Finance Maste Oluda", "王室财政大臣 欧蓝达"], _
["Restoring Grenth's Monuments", "恢复古兰斯圣像"], _
["The Hidden City of Ahdashim", "隐藏之城，哈达辛"], _
["Aspenwood Gate (Kurzick)", "杨木大门 (库兹柯)"], _
["Fort Aspenwood (Kurzick)", "杨木要塞 (库兹柯)"], _
["Gandara, the Moon Fortress", "弦月要塞，干达拉"], _
["The Floodplain of Mahnkelon", "曼克隆泛滥平原"], _
["Deep, The", "深处"], _ ;["The Deep", "深处"], _
["Foundry of Failed Creations", "失败事物铸造厂"], _
["The Floodplain of Mahnkelon", "曼克隆泛滥平原"], _
["Gandara, the Moon Fortress", "弦月要塞，干达拉"], _
["Droajam, Mage of the Sands", "沙之法师 卓加姆"], _
["Unwaking Waters (Luxon)", "沉睡之水 (勒克森)"], _
["Secret Lair of the Snowmen", "雪怪的秘密巢穴"], _
["Royal Food Taster Rendu", "王室食品尝味师 兰杜"], _
["Murakai, Lady of the Night", "夜之女 幕兰凯"], _
["Minister Cho's Estate", "周大臣庄园_(探索区域)"], _
["Intricate Grawl Necklaces", "精细的穴居人项链"], _
["Aspenwood Gate (Luxon)", "杨木大门 (勒克森)"], _
["Fort Aspenwood (Luxon)", "杨木要塞 (勒克森)"], _
["Kamadan, Jewel of Istan", "卡玛丹，艾斯坦之钻"], _
["Catacombs of Kathandrax", "卡山卓司的地下墓穴"], _
["Heart of Abaddon", "Heart of Abaddon"], _
["Breaching the Stygian Veil", "突破冥狱之幕"], _
["The Black Beast of Arrgh", "黑色魔兽 阿尔古"], _
["Ssuns, Blessed of Dwayna", "薇娜的祝福 桑斯"], _
["Maximilian the Meticulous", "细心的马希米连"], _
["Harn and Maxine Coldstone", "冰石哈恩/麦辛"], _
["Feathered Avicara Scalps", "阿比卡拉头皮羽毛"], _
["Fahranur, The First City", "旧城，法兰努尔"], _
["Margrid the Sly", "狡猾者玛格丽特 (狡诈者玛格丽)"], _
["Prince Ahmtur the Mighty", "强者 安托侯爵"], _
["Mobrin, Lord of the Marsh", "碎之主 魔兵"], _
["Fahranur, the First City", "旧城，法兰努尔"], _
["Destor the Truth Seeker", "真实追寻者戴斯特"], _
["Tomb of the Primeval Kings", "先王之墓"], _
["Jade Flats (Kurzick)", "翡翠浅滩 (库兹柯)"], _
["Heart of the Shiverpeaks", "席娃山脉之心"], _
["Great Temple of Balthazar", "巴萨泽圣殿"], _
["Zaishen Menagerie Grounds", "战承动物园"], _
["Imperial Guard Musashi ", "皇室卫兵 武藏"], _
["The Eternal Forgemaster", "永生的锻造大师"], _
["Defend the Temple of War", "保护战争圣殿"], _
["Singed Gargoyle Skulls", "烧焦的石像鬼头颅"], _
["Forgotten Trinket Boxes", "被遗忘的小箱子"], _
["Feathered Caromi Scalps", "卡洛米羽毛头皮"], _
["Copper Crimson Skull Coins", "红颅铜币"], _
["Blazefiend Griefblade", "火焰恶魔 悲伤刀片"], _
["Barthimus the Provident", "算计者巴希穆斯"], _
["Assault on the Stronghold", "袭击根据地"], _
["Saint Anjeka's Shrine", "圣者安捷卡的祭坛"], _
["Grand Court of Sebelkeh", "希贝克大公廷"], _
["Central Transfer Chamber", "中央转送室"], _
["Sepulchre of Dragrimmar", "爪格林玛坟墓"], _
["Fronis Irontoe's Lair", "铁趾佛朗尼的巢穴"], _
["Restore the Temple of War", "恢复圣殿"], _
["Deldrimor Steel Ingot", "戴尔狄摩钢铁矿石"], _
["Sunjiang District", "孙江行政区_(探索区域)"], _
["Sapphire Djinn Essence", "蓝宝石巨灵精华"], _
["Myish, Lady of the Lake", "湖之女 蜜希"], _
["Jarimiya the Unmerciful", "残酷 贾米里"], _
["Ilsundur, Lord of Fire", "火之主 音丧多"], _
["Grand Court of Sebelkeh", "希贝克大公廷"], _
["Frosted Griffon Wings", "冻结的狮鹫兽翅膀"], _
["Frigid Mandragor Husks", "呆板曼陀罗外壳"], _
["Fibrous Mandragor Roots", "纤维曼陀罗根"], _
["Dessicated Hydra Claws", "干燥的三头龙爪"], _
["flash enchantment spell", "即刻加持魔法"], _
["Jade Flats (Luxon)", "翡翠浅滩 (勒克森)"], _
["Lutgardis Conservatory", "路嘉帝斯温室"], _
["Lair of the Forgotten", "被遗忘者的巢穴"], _
["Event Planner Kazsha", "庆典筹办人 凯沙"], _
["Prince Mehtu the Wise", "智者 梅图侯爵"], _
["Piles of Glittering Dust", "闪烁之土"], _
["The Elusive Golemancer", "乌啦的实验室"], _
["Superb Charr Carvings", "超级夏尔雕刻品"], _
["Sarnia the Red-Handed", "染血之手萨妮亚"], _
["Korshek the Immolated", "宰杀者 科薛克"], _
["Greves the Overbearing", "傲慢的葛力斯"], _
["Ghial the Bone Dancer", "骨之舞者 葛西"], _
["Frostmaw the Kinslayer", "冻击 弑族者"], _
["Forest Minotaur Horns", "森林牛头怪的角"], _
["Elonian Leather Squares", "伊洛那皮革"], _
["Amalek the Unmerciful", "残酷者阿莫列克"], _
["Iron Mines of Moladune", "莫拉登矿山"], _
["Flame Temple Corridor", "夏尔火焰神殿"], _
["Estate Guard Rikesh", "庄园守卫 里克许"], _
["Elonian Leather Square", "伊洛那皮革"], _
["The Great Northern Wall", "北方长城"], _
["Tempered Glass Vials", "调合后的玻璃瓶"], _
["Stone Grawl Necklaces", "石穴居人项链"], _
["Remnant of Antiquities", "残余的断片"], _
["Piles of Elemental Dust", "元素之土"], _
["Nulfastu, Earthbound", "地缚 纳法斯图"], _
["Kepkhet Marrowfeast", "柯博海特 食髓者"], _
["Iron Mines of Moladune", "莫拉登矿山"], _
["Gold Crimson Skull Coin", "红颅金币"], _
["Flame Temple Corridor", "夏尔火焰神殿"], _
["Diamond Djinn Essence", "钻石巨灵精华"], _
["Curse of the Nornbear", "诺恩熊的诅咒"], _
["Branches of Juni Berries", "柳树枝"], _
["ebon vanguard ritual", "黑檀先锋队仪式"], _
["half range bow attack", "半距弓术攻击"], _
["Sardelac Sanitarium", "萨德拉克疗养院"], _
["Minister Cho's Estate", "周大臣庄园"], _
["Minister Cho's Estate", "周大臣庄园"], _
["Costume Brawl", "Costume Brawl"], _
["Head Priest Vahmani", "主祭司 范马尼"], _
["The Rifts Between Us", "异世界的裂缝"], _
["Deathbringer Company", "死亡召唤大队"], _
["Tempered Glass Vial", "调合后的玻璃瓶"], _
["TPS Regulator Golem", "TPS调节高轮"], _
["The Stygian Underlords", "冥狱地王"], _
["Roaring Ether Heart", "苍穹咆哮者之心"], _
["Roaring Ether Claws", "苍穹咆哮者之爪"], _
["Quansong Spiritspeak", "通灵者 魁嵩"], _
["Plague of Destruction", "疫之破坏者"], _
["North Kryta Province ", "科瑞塔北部"], _
["Minister Cho's Estate", "周大臣庄园"], _
["Gyala Hatchery", "盖拉孵化所_(探索区域)"], _
["Finding the Bloodstone", "寻找血石"], _
["Decayed Orr Emblems", "腐烂的欧尔纹章"], _
["Bottle of Vabbian Wine", "瓦贝红酒"], _
["Borrguus Blisterbark", "风吼 柏格斯"], _
["half range hex spell", "半距降咒魔法"], _
["North Kryta Province", "科瑞塔北部"], _
["Zos Shivros Channel", "佐席洛斯水道"], _
["Mourning Veil Falls", "哀伤之墓瀑布"], _
["Holdings of Chokhin", "舟克辛卷藏室"], _
["Resplendent Makuun", "奢华之城，莫肯"], _
["The Shattered Ravines", "碎裂沟谷"], _
["Grothmar Wardowns", "古斯玛战争丘陵地"], _
["Rollerbeetle Racing", "滚滚甲虫竞赛"], _
["Dockmaster Ahlaro", "码头管理者 亚罗"], _
["Tortured Sunspear", "受折磨的日戟骑士"], _
["Bowl of Skalefin Soup", "鳞怪鳍汤"], _
["Powerstone of Courage", "勇气粉石"], _
["Scroll of Resurrection", "复活卷"], _
["Warband of Brothers", "战争军团之友"], _
["The Shattered Ravines", "碎裂沟谷"], _
["Southern Shiverpeaks", "南席娃山脉"], _
["Sandblasted Lodestone", "喷沙磁石"], _
["Ruby Djinn Essence", "红宝石巨灵精华"], _
["Resplendent Makuun", "奢华之城，莫肯"], _
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
["Destruction's Depths", "破坏的深渊"], _
["Bowl of Skalefin Soup", "鳞怪鳍汤"], _
["The Barradin Estate", "巴拉丁庄园"], _
["Deldrimor War Camp", "戴尔狄摩兵营"], _
["Grendich Courthouse", "葛兰迪法院"], _
["Tears of the Fallen", "战死者之泪"], _
["Dreadnought's Drift", "无惧者之丘"], _
["Grenth's Footprint", "古兰斯的足迹"], _
["Sunspear Great Hall", "日戟大会堂"], _
["Gate of Desolation", "荒芜之地入口"], _
["Remains of Sahlahja", "萨拉迦遗址"], _
["Wilderness of Bahdza", "巴萨荒野"], _
["The Sulfurous Wastes", "硫磺荒地"], _
["Nightfallen Jahai", "夜蚀暗殒 夏亥"], _
["Cathedral of Flames", "火焰大教堂"], _
["Embark Beach", "Embark Beach"], _
["Lieutenant Murunda", "副官 米汪达"], _
["Sahlahjar the Dead", "亡者 萨拉迦"], _
["Clear the Chamber", "清除密室的障碍"], _
["Imprisoned Spirits", "被拘禁的亡魂"], _
["Servants of Grenth", "古兰斯的使者"], _
["Khobay the Betrayer", "背叛者库贝"], _
["Slaves of Menzies", "孟席斯的奴隶们"], _
["Wilderness of Bahdza", "巴萨荒野"], _
["Water Djinn Essence", "水巨灵精华"], _
["Vess the Disputant", "争论者 薇丝"], _
["The Sulfurous Wastes", "硫磺荒地"], _
["The Greater Darkness", "巨大暗影"], _
["Tears of the Fallen", "战死者之泪"], _
["Selenas the Blunt", "直言者瑟列娜丝"], _
["Scorched Lodestones", "烧焦的磁石"], _
["Royen Beastkeeper", "野兽看守者罗彦"], _
["Ring of Fire Islands", "火环列岛"], _
["Nahpui Quarter", "纳普区_(探索区域)"], _
["Mandragor Swamproots", "曼陀罗根"], _
["Maguuma Spider Web", "梅古玛蜘蛛丝"], _
["Justiciar Thommis", "司法官 汤米兹"], _
["Jungle Troll Tusks", "丛林巨魔獠牙"], _
["Grenth's Footprint", "古兰斯的足迹"], _
["Gate of Desolation", "荒芜之地入口"], _
["Dreadnought's Drift", "无惧者之丘"], _
["Boreas Seabed", "风神海床_(探索区域)"], _
["Ancient Kappa Shells", "古河童壳"], _
["A Time for Heroes", "英雄的光采年代"], _
["spear melee attack", "近战矛术攻击"], _
["Shiverpeak Arena", "席娃山脉竞技场"], _
["Bergen Hot Springs", "卑尔根温泉"], _
["D'Alessio Seaboard", "达雷西海滨"], _
["Ice Caves of Sorrow", "悲伤冰谷"], _
["Ascalon Foothills", "阿斯卡隆丘陵"], _
["Talmark Wilderness", "突马克荒地"], _
["Twin Serpent Lakes", "双头蛇湖泊"], _
["Sunspear Sanctuary", "日戟避难所"], _
["Kodonur Crossroads", "科登诺路口"], _
["Garden of Seborhin", "希伯欣花园"], _
["Rragar's Menagerie", "拉喀的牢笼"], _
["Vloxen Excavations", "弗洛森古迹"], _
["Arachni's Haunt", "奥拉克妮的栖息地"], _
["Isle of the Nameless", "无名岛"], _
["Isle of the Nameless", "无名岛"], _
["Ogden Stonehealer", "石愈者欧格登"], _
["Zerai the Learner", "学习者 萨瑞"], _
["Terrorweb Queen", "恐惧蛛化精灵女王"], _
["The Nightman Cometh", "夜叉来临"], _
["A Gift of Griffons", "狮鹫兽礼物"], _
["Tanned Hide Squares", "褐色兽皮"], _
["Essence of Celerity", "敏捷精华"], _
["Slice of Pumpkin Pie", "南瓜派"], _
["Zoldark the Unholy", "不洁 咒暗"], _
["Valis the Rampant", "猖獗的瓦里斯"], _
["Twin Serpent Lakes", "双头蛇湖泊"], _
["Talmark Wilderness", "突马克荒地"], _
["Stone Summit Badges", "石峰标志"], _
["Silver Bullion Coins", "银铸币"], _
["Raisu Palace", "莱苏皇宫_(探索区域)"], _
["Priest of Menzies", "曼席斯的祭司"], _
["Molotov Rocktail", "石尾 摩洛托夫"], _
["Lev the Condemned", "被诅咒的莉芙"], _
["Kodonur Crossroads", "科登诺路口"], _
["Ice Caves of Sorrow", "悲伤冰谷"], _
["Garden of Seborhin", "希伯欣花园"], _
["Enchanted Lodestone", "附魔磁石"], _
["D'Alessio Seaboard", "达雷西海滨"], _
["Chung, the Attuned", "得道者 村"], _
["Carnak the Hungry", "饥饿者卡纳克"], _
["Ascalonian Noble", "阿斯卡隆 贵族"], _
["Ascalon Foothills", "阿斯卡隆丘陵"], _
["Amphibian Tongues", "双面人的舌头"], _
["Copperhammer Mines", "铜锤矿坑"], _
["Fishermen's Haven", "渔人避风港"], _
["Temple of the Ages", "世纪神殿"], _
["Ventari's Refuge", "凡特里庇护所"], _
["Riverside Province", "河畔地带"], _
["Witman's Folly", "威特曼的怪异建筑"], _
["Shing Jea Monastery", "星岬寺"], _
["Durheim Archives", "杜汉姆卷藏室"], _
["Sunjiang District", "孙江行政区"], _
["Monastery Overlook", "寺庙高处"], _
["Panjiang Peninsula", "班让半岛"], _
["Sunjiang District", "孙江行政区"], _
["Chantry of Secrets", "隐秘教堂"], _
["Kodlonu Hamlet", "克拓奴，哈姆雷特"], _
["Jokanur Diggings", "卓坎诺挖掘点"], _
["Turai's Procession", "托雷长廊"], _
["Bokka Amphitheatre", "波卡剧院"], _
["The Mirror of Lyss", "丽之镜湖"], _
["The Ruptured Heart", "破裂之心"], _
["Norrhart Domains", "诺恩之心领地"], _
["Frostmaw's Burrows", "冻霜地道"], _
["Zaishen Challenge", "战承挑战赛"], _
["Zaishen Menagerie", "战承动物园"], _
["Master of Whispers", "唤言大师"], _
["Mirza Veldrunner", "奔原者 弥萨"], _
["The Four Horsemen", "多姆四骑士"], _
["Armor of Salvation", "救赎防具"], _
["Birthday Cupcake", "生日杯子蛋糕"], _
["Witman's Folly", "威特曼的怪异建筑"], _
["Turai's Procession", "托雷长廊"], _
["The Ruptured Heart", "破裂之心"], _
["The Mirror of Lyss", "丽之镜湖"], _
["The Four Horsemen", "多姆四骑士"], _
["The Darknesses", "暗影(先王之墓)"], _
["Sunjiang District", "孙江行政区"], _
["Shiverpeak Manes", "席娃山脉鬃毛"], _
["Sentient Lodestone", "知觉磁石"], _
["Rolls of Parchment", "羊皮纸卷"], _
["Riverside Province", "河畔地带"], _
["Rand Stormweaver", "织暴者 硬皮"], _
["Pywatt the Swift", "迅捷 派维特"], _
["Panjiang Peninsula", "班让半岛"], _
["Norrhart Domains", "诺恩之心领地"], _
["Mungri Magicbox", "魔法盒 牧格里"], _
["Justiciar Amilyn", "判官 亚蜜琳"], _
["Jokanur Diggings", "卓坎诺挖掘点"], _
["Gruesome Ribcages", "可怕的胸腔"], _
["Celestial Essences", "天神质体"], _
["Blood Washes Blood", "血债血偿"], _
["Arbor Earthcall", "大地之唤 亚伯"], _
["environment effect", "环境效应"], _
["D'Alessio Arena", "达雷西竞技场"], _
["Green Hills County", "绿丘郡"], _
["Wizard's Folly", "巫师的怪异建筑"], _
["Henge of Denravi", "丹拉维圣地"], _
["Druid's Overlook", "德鲁伊高地"], _
["Seeker's Passage", "探索者通道"], _
["The Black Curtain", "黑色帷幕"], _
["Watchtower Coast", "瞭望塔海岸"], _
["Diviner's Ascent", "预言者之坡"], _
["Ran Musu Gardens", "岚穆苏花园"], _
["Seafarer's Rest", "航海者休憩处"], _
["Tanglewood Copse", "谭格梧树林"], _
["Tahnnakai Temple", "谭纳凯神殿"], _
["Tahnnakai Temple", "谭纳凯神殿"], _
["Drazach Thicket", "德瑞札灌木林"], _
["Melandru's Hope", "梅兰朵的盼望"], _
["The Eternal Grove", "永恒之林"], _
["Dzagonur Bastion", "萨岗诺棱堡"], _
["Churrhir Fields", "楚尔赫训练场"], _
["Poisoned Outcrops", "剧毒地表"], _
["Depths of Madness", "疯狂深渊"], _
["Domain of Anguish", "悲难领地"], _
["Domain of Secrets", "奥秘领地"], _
["Doomlore Shrine", "末日传说神殿"], _
["Gadd's Encampment", "盖德营地"], _
["Hall of Monuments", "史迹殿堂"], _
["Alcazia Tangle", "纠结之艾卡滋亚"], _
["Slavers' Exile", "奴隶商人放逐地"], _
["Throne of Secrets", "神秘王座"], _
["Keeper Halyssi", "看守者 海立司"], _
["Priestess Haila", "女祭司 海菈"], _
["Sunspear Modiki", "日戟 莫地奇"], _
["Foundry Breakout", "逃出铸造厂"], _
["Wrathful Spirits", "愤怒的灵魂"], _
["Tower of Strength", "力量之塔"], _
["Army of Darkness", "黑暗的军队"], _
["Glob of Ectoplasm", "心灵之玉"], _
["Lump of Charcoal", "结块的木炭"], _
["Roll of Parchment", "羊皮纸卷"], _
["Zaln the Jaded", "精疲力竭的萨恩"], _
["Watchtower Coast", "瞭望塔海岸"], _
["Thorny Carapaces", "多刺的甲壳"], _
["The Stygian Lords", "冥狱霸主"], _
["The Iron Forgeman", "钢铁巨人"], _
["The Eternal Grove", "永恒之林"], _
["The Black Curtain", "黑色帷幕"], _
["Tahnnakai Temple", "谭纳凯神殿"], _
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
["Far Shiverpeaks", "席娃山脉极端"], _
["Enslavement Stones", "奴隶石"], _
["Dzagonur Bastion", "萨岗诺棱堡"], _
["Duncan the Black", "黑色 唐肯"], _
["Drazach Thicket", "德瑞札灌木林"], _
["Diviner's Ascent", "预言者之坡"], _
["Countess Nadya", "伯爵夫人 娜佳"], _
["Commander Wahli", "指挥官 瓦里"], _
["Charged Blackness", "暗黑幽灵"], _
["Baubao Wavewrath", "怒浪 保博"], _
["Alcazia Tangle", "纠结之艾卡滋亚"], _
["Against the Charr", "对抗夏尔"], _
["enchantment spell", "加持魔法"], _
["half range signet", "半距纹章"], _
["touch hex spell", "碰触降咒魔法"], _
["Ascalon Arena", "阿斯卡隆竞技场"], _
["Ashford Abbey", "灰色浅滩修道院"], _
["Ascalon Academy", "阿斯卡隆城"], _
["Droknar's Forge", "卓克纳熔炉"], _
["Ember Light Camp", "残火营地"], _
["Heroes' Audience", "英雄之痕"], _
["Dunes of Despair", "绝望沙丘"], _
["Hell's Precipice", "地狱悬崖"], _
["Ruins of Surmia", "苏米亚废墟"], _
["Thunderhead Keep", "雷云要塞"], _
["Diessa Lowlands", "底耶沙低地"], _
["Eastern Frontier", "东方边境"], _
["Deldrimor Bowl", "戴尔狄摩盆地"], _
["Griffon's Mouth", "狮鹫兽隘口"], _
["Scoundrel's Rise", "恶汉山丘"], _
["House zu Heltzer", "凤荷议院"], _
["Bai Paasu Reach", "拜巴苏区域"], _
["Leviathan Pits", "利拜亚森矿场"], _
["Imperial Sanctum", "帝国圣所"], _
["Linnok Courtyard", "里诺庭园"], _
["Shadow's Passage", "阴暗通道"], _
["Morostav Trail", "摩洛神秘通道"], _
["Mihanu Township", "米哈努小镇"], _
["Chahbek Village", "夏贝克村庄"], _
["Consulate Docks", "领事馆码头"], _
["Cliffs of Dohjok", "杜夏悬崖"], _
["Vehtendi Valley", "巍天帝峡谷"], _
["Yatendi Canyons", "亚天帝峡谷"], _
["Crystal Overlook", "水晶高地"], _
["City of Torc'qua", "托加之城"], _
["Ravenheart Gloom", "夺心暗域"], _
["Eye of the North", "极地之眼"], _
["Tarnished Haven", "灰暗避难所"], _
["Ice Cliff Chasms", "冰崖裂口"], _
["Verdant Cascades", "原野瀑布"], _
["Bogroot Growths", "泥塘根源地"], _
["Sorrow's Furnace", "哀伤熔炉"], _
["Urgoz's Warren", "尔果的养殖场"], _
["Island of Shehkah", "沙卡岛"], _
["Codex Arena", "Codex 竞技场"], _
["Shing Jea Arena", "星岬竞技场"], _
["Acolyte Sousuke", "侍从萨苏克"], _
["Pyre Fierceshot", "烈之击炎焰"], _
["Butoh the Bold", "无畏者 布陀"], _
["Commander Suha", "指挥官 约哈"], _
["Dirah Traptail", "迪拉 崔普特"], _
["Whispers Acolyte", "唤言侍从"], _
["City of Torc'qua", "托加之城"], _
["Tower of Courage", "勇气之塔"], _
["The Wailing Lord", "悲鸣领主"], _
["Spiritwood Plank", "心灵之板"], _
["Zen Daijun", "祯台郡_(探索区域)"], _
["Yatendi Canyons", "亚天帝峡谷"], _
["Verdant Cascades", "原野瀑布"], _
["Vehtendi Valley", "巍天帝峡谷"], _
["Utini Wupwup", "尤提尼 乌坡乌坡"], _
["Thunderhead Keep", "雷云要塞"], _
["Shadow's Passage", "阴暗通道"], _
["Scoundrel's Rise", "恶汉山丘"], _
["Ruins of Surmia", "苏米亚废墟"], _
["Red Iris Flower", "红色鸢尾花"], _
["Phantom Residue", "幻影残留物"], _
["Mossy Mandibles", "生苔下颚骨"], _
["Morostav Trail", "摩洛神秘通道"], _
["Mergoyle Skulls", "石像魔头颅"], _
["Massive Jawbone", "粗大下颚骨"], _
["Margonite Masks", "玛骨奈面具"], _
["Kunvie Firewing", "火翼 坤维"], _
["Kournan Pendants", "高楠垂饰"], _
["Justiciar Kimii", "判官 绮米"], _
["Inscribed Shards", "铭刻碎片"], _
["Imperial Sanctum", "帝国圣所"], _
["Ice Cliff Chasms", "冰崖裂口"], _
["Hell's Precipice", "地狱悬崖"], _
["Griffon's Mouth", "狮鹫兽隘口"], _
["Fronis Irontoe", "铁趾 弗朗尼"], _
["Fozzy Yeoryios", "冻 耀尔伊欧"], _
["Forgotten Seals", "遗忘者图章"], _
["Fetid Carapaces", "恶臭的甲壳"], _
["Farmer Hamnet", "农民 哈姆奈特"], _
["Eldritch Ettin", "怪异双头巨人"], _
["Echovald Forest", "科凡德森林"], _
["Eastern Frontier", "东方边境"], _
["Dunes of Despair", "绝望沙丘"], _
["Dredge Incisors", "挖掘者之牙"], _
["Diessa Lowlands", "底耶沙低地"], _
["Deldrimor Bowl", "戴尔狄摩盆地"], _
["Crystal Overlook", "水晶高地"], _
["Consulate Docks", "领事馆码头"], _
["Codex Arena", "Codex 竞技场"], _
["Cliffs of Dohjok", "杜夏悬崖"], _
["Chromatic Scale", "染色的麟片"], _
["Chahbek Village", "夏贝克村庄"], _
["Berserker Horns", "狂战士的角"], _
["A Gate Too Far", "一道过远的门"], _
["half range skill", "半距技能"], _
["half range spell", "半距魔法"], _
["Destiny's Gorge", "命运峡谷"], _
["Marhan's Grotto", "马翰洞穴"], _
["Abaddon's Mouth", "地狱隘口"], _
["Gates of Kryta", "科瑞塔关所"], _
["Nolani Academy", "若拉尼学院"], _
["Dragon's Gullet", "巨龙峡谷"], _
["Iron Horse Mine", "铁马矿山"], _
["Stingray Strand", "魟鱼湖滨"], _
["Majesty's Rest", "王者安息处"], _
["Mineral Springs", "矿物泉源"], _
["Tasca's Demise", "塔斯加之死"], _
["Eredon Terrace", "尔雷登平地"], _
["Vasburg Armory", "维思伯兵营"], _
["Zin Ku Corridor", "辛库走廊"], _
["Gyala Hatchery", "盖拉孵化所"], _
["Shenzun Tunnels", "申赞通道"], _
["Gyala Hatchery", "盖拉孵化所"], _
["Unwaking Waters", "沉睡之水"], _
["Gate of Torment", "苦痛之门"], _
["Champion's Dawn", "勇士曙光"], _
["Gate of Secrets", "奥秘之门"], _
["Wehhan Terraces", "薇恩平台"], _
["Abaddon's Gate", "亚霸顿之门"], _
["Dasha Vestibule", "达沙走廊"], _
["Gate of Anguish", "悲难之门"], _
["Gate of Madness", "疯狂之门"], _
["Moddok Crevice", "摩多克裂缝"], _
["Rilohn Refuge", "里欧恩难民营"], _
["Tihark Orchard", "提亚克林地"], _
["Plains of Jarin", "贾林平原"], _
["Bahdok Caverns", "巴多克洞穴"], _
["Barbarous Shore", "野蛮河岸"], _
["Dejarin Estate", "达贾林庄园"], _
["Sunward Marches", "向阳边境"], _
["Forum Highlands", "高地广场"], _
["Gunnar's Hold", "甘拿的占领地"], _
["Longeye's Ledge", "长眼岩脉"], _
["Dalada Uplands", "达拉达山地"], _
["Sparkfly Swamp", "火星蝇沼泽"], _
["Darkrime Delves", "黑霜洞穴"], _
["Bloodstone Caves", "血石洞"], _
["Serenity Temple", "宁静神殿"], _
["Sunspear Arena", "日戟竞技场"], _
["General Morgahn", "摩根将军"], _
["Zhed Shadowhoof", "影爪杰德"], _
["Captain Mehhan", "队长 弥汉"], _
["Dreamer Hahla", "解梦人 荷伦"], _
["Guardsman Bahsi", "守卫巴赛"], _
["Haroj Firemane", "火鬃 札洛"], _
["Laph Longmane", "长鬃 拉鲁夫"], _
["Priest Kehmtut", "祭司 肯穆"], _
["To the Rescue!", "前往救援!"], _
["Escort of Souls", "护送灵魂"], _
["Unwanted Guests", "不速之客"], _
["Demon Assassin", "恶魔暗杀者"], _
["Obsidian Shard", "黑曜石碎片"], _
["Green Rock Candy", "绿冰糖"], _
["Vengeful Aatxe", "复仇牛头怪"], _
["Unwaking Waters", "沉睡之水"], _
["Unnatural Seed", "古怪的种子"], _
["Tihark Orchard", "提亚克林地"], _
["The Dragon's Lair", "龙穴"], _
["Tasca's Demise", "塔斯加之死"], _
["Tarnished Coast", "灰暗沿岸"], _
["Sunward Marches", "向阳边境"], _
["Stingray Strand", "魟鱼湖滨"], _
["Sparkfly Swamp", "火星蝇沼泽"], _
["Shriveled Eyes", "干枯的眼睛"], _
["Shing Jea Island", "星岬岛"], _
["Shenzun Tunnels", "申赞通道"], _
["Sentient Spores", "知觉孢子"], _
["Rilohn Refuge", "里欧恩难民营"], _
["Plains of Jarin", "贾林平原"], _
["Pillaged Goods", "掠夺的货品"], _
["Nolani Academy", "若拉尼学院"], _
["Mursaat Tokens", "马赛特记号"], _
["Mohby Windbeak", "莫比 风喙"], _
["Moddok Crevice", "摩多克裂缝"], _
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
["Gyala Hatchery", "盖拉孵化所"], _
["Grawl Necklace", "穴居人项链"], _
["Glowing Hearts", "灼热的心脏"], _
["Gates of Kryta", "科瑞塔关所"], _
["Gate of Madness", "疯狂之门"], _
["Gargoyle Skull", "石像鬼头颅"], _
["Frostfire Fangs", "霜火尖牙"], _
["Forum Highlands", "高地广场"], _
["Feathered Scalps", "羽头皮"], _
["Dragon's Gullet", "巨龙峡谷"], _
["Dejarin Estate", "达贾林庄园"], _
["Dasha Vestibule", "达沙走廊"], _
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
["Abaddon's Mouth", "地狱隘口"], _
["Abaddon's Gate", "亚霸顿之门"], _
["dagger attack", "匕首攻击技能"], _
["hammer attack", "锤术攻击技能"], _
["off-hand attack", "即刻攻击"], _
["scythe attack", "镰刀进攻技能"], _
["Foible's Fair", "佛伊伯市集"], _
["Lakeside County", "湖畔郡"], _
["Regent Valley", "统治者之谷"], _
["The Northlands", "北方领土"], _
["Beacon's Perch", "毕肯高地"], _
["Ice Tooth Cave", "冰牙洞穴"], _
["Maguuma Stade", "梅古玛丛林"], _
["Bloodstone Fen", "血石沼泽"], _
["Divinity Coast", "神圣海岸"], _
["Pockmark Flats", "麻点平原"], _
["Regent Valley", "统治者之谷"], _
["Traveler's Vale", "旅人谷"], _
["Ettin's Back", "双头怪隐匿地"], _
["Mamnoon Lagoon", "玛奴泻湖"], _
["Prophet's Path", "先知之路"], _
["Vulture Drifts", "秃鹰沙丘"], _
["Lornar's Pass", "洛拿斯通道"], _
["Kaineng Center", "凯宁中心"], _
["Brauer Academy", "巴尔学院"], _
["Harvest Temple", "丰收神殿"], _
["Senji's Corner", "山吉之街"], _
["Altrumm Ruins", "奥楚兰废墟"], _
["Vizunah Square", "薇茹广场"], _
["Vizunah Square", "薇茹广场"], _
["Kinya Province", "欣弥领地"], _
["Saoshang Trail", "绍商小径"], _
["Xaquang Skyway", "夏安便道"], _
["Maishang Hills", "麦尚山丘"], _
["Rhea's Crater", "席亚火山口"], _
["Basalt Grotto", "玄武岩石穴"], _
["Yahnur Market", "雅诺尔市集"], _
["Jennur's Horde", "征钠群落"], _
["Pogahn Passage", "波甘驿站"], _
["Ruins of Morah", "摩拉废墟"], _
["Venta Cemetery", "凡特墓地"], _
["The Alkali Pan", "金属镕炉"], _
["Domain of Fear", "恐惧领地"], _
["Domain of Pain", "苦痛领地"], _
["Boreal Station", "北极驻地"], _
["Vlox's Falls", "弗洛克斯瀑布"], _
["Jaga Moraine", "亚加 摩瑞音"], _
["Varajar Fells", "维拉戛阵地"], _
["Heroes' Ascent", "英雄之路"], _
["Random Arenas", "随机竞技场"], _
["Fissure of Woe", "灾难裂痕"], _
["The Underworld", "地下世界"], _
["Dreamer Raja", "解梦人 洛佳"], _
["Whispers Adept", "唤言高手"], _
["Chitin Fragments", "外壳"], _
["Granite Slabs", "花岗岩石板"], _
["Monstrous Claw", "巨大的爪"], _
["Monstrous Fang", "巨大尖牙"], _
["Roll of Vellum", "牛皮纸卷"], _
["Blue Rock Candy", "蓝冰糖"], _
["Grail of Might", "力量圣杯"], _
["Xaquang Skyway", "夏安便道"], _
["Vulture Drifts", "秃鹰沙丘"], _
["Vizunah Square", "薇茹广场"], _
["Venta Cemetery", "凡特墓地"], _
["Varajar Fells", "维拉戛阵地"], _
["Traveler's Vale", "旅人谷"], _
["The Frost Gate", "寒霜之门"], _
["The Desolation", "荒芜之地"], _
["The Alkali Pan", "金属镕炉"], _
["Tangled Seeds", "纠结的种子"], _
["Sentient Seeds", "知觉种子"], _
["Saoshang Trail", "绍商小径"], _
["Ruins of Morah", "摩拉废墟"], _
["Rhea's Crater", "席亚火山口"], _
["Regent Valley", "统治者之谷"], _
["Quetzal Crests", "长尾冠毛"], _
["Prophet's Path", "先知之路"], _
["Prismatic Ooze", "多彩乌兹"], _
["Pogahn Passage", "波甘驿站"], _
["Pockmark Flats", "麻点平原"], _
["Modniir Manes", "莫得米鬃毛"], _
["Minotaur Horns", "牛头怪角"], _
["Mamnoon Lagoon", "玛奴泻湖"], _
["Maishang Hills", "麦尚山丘"], _
["Maguuma Manes", "梅古玛鬃毛"], _
["Lornar's Pass", "洛拿斯通道"], _
["Leathery Claws", "强韧的爪"], _
["Kinya Province", "欣弥领地"], _
["Jennur's Horde", "征钠群落"], _
["Jaga Moraine", "亚加 摩瑞音"], _
["Jade Bracelets", "翡翠手镯"], _
["Heroes' Ascent", "英雄之路"], _
["Frigid Hearts", "冰冻的心脏"], _
["Fort Aspenwood", "杨木要塞"], _
["Ettin's Back", "双头怪隐匿地"], _
["Dull Carapace", "阴暗的甲壳"], _
["Divinity Coast", "神圣海岸"], _
["Crystal Desert", "水晶沙漠"], _
["Charr Carving", "夏尔雕刻品"], _
["Bloodstone Fen", "血石沼泽"], _
["Behemoth Hides", "巨兽皮革"], _
["Azure Remains", "湛蓝残留物"], _
["binding ritual", "缚灵仪式"], _
["melee attack", "近身攻击技能"], _
["spear attack", "矛术进攻技能"], _
["sword attack", "剑术攻击技能"], _
["Amnoon Arena", "安奴竞技场"], _
["The Catacombs", "地下墓穴"], _
["Ascalon City", "阿斯卡隆城"], _
["Ascalon City", "阿斯卡隆城"], _
["Frontier Gate", "边境关所"], _
["Quarrel Falls", "怨言瀑布"], _
["Aurora Glade", "欧若拉林地"], _
["Thirsty River", "干枯河流"], _
["Skyward Reach", "天际流域"], _
["Frozen Forest", "冰冻森林"], _
["Spearhead Peak", "枪尖山"], _
["Perdition Rock", "破灭石"], _
["Breaker Hollow", "断崖谷"], _
["Seitung Harbor", "青函港"], _
["Tsumei Village", "苏梅村"], _
["Boreas Seabed", "风神海床"], _
["Dragon's Throat", "龙喉"], _
["Nahpui Quarter", "纳普区"], _
["Bejunkan Pier", "君瞰码头"], _
["Bukdek Byway", "巴德克小径"], _
["Kaineng Docks", "凯宁船坞"], _
["Nahpui Quarter", "纳普区"], _
["Pongmei Valley", "朋美谷"], _
["Raisu Pavilion", "莱苏阁"], _
["Wajjun Bazaar", "瓦江市场"], _
["Boreas Seabed", "风神海床"], _
["Beknur Harbor", "别克诺港"], _
["Yohlon Haven", "犹朗避难所"], _
["Blacktide Den", "黑潮之穴"], _
["Lahtenda Bog", "洛天帝沼泽"], _
["Mehtani Keys", "梅坦尼之钥"], _
["Arkjok Ward", "阿尔科监禁区"], _
["Joko's Domain", "杰格领地"], _
["Umbral Grotto", "阴影石穴"], _
["Sacnoth Valley", "圣诺谷"], _
["Bjora Marches", "碧拉边境"], _
["Magus Stones", "玛古斯之石"], _
["Raven's Point", "渡鸦岬角"], _
["Shards of Orr", "欧尔残迹"], _
["Zaishen Elite", "战承精英"], _
["Dragon Arena", "龙之竞技场"], _
["Scout Ahtok", "侦察兵 雅度"], _
["Brother Sitai", "须台教友"], _
["Monstrous Eye", "巨大的眼"], _
["Onyx Gemstone", "玛瑙宝石"], _
["Lunar Fortune", "命运锦囊"], _
["Pahnai Salad", "伊波枷沙拉"], _
["Red Rock Candy", "红冰糖"], _
["Wajjun Bazaar", "瓦江市场"], _
["Vermin Hides", "寄生虫皮革"], _
["Thirsty River", "干枯河流"], _
["Spiked Crest", "尖刺的颈脊"], _
["Spearhead Peak", "枪尖山"], _
["Skyward Reach", "天际流域"], _
["Skeletal Limb", "骷髅手臂"], _
["Saurian Bones", "蜥蜴骨头"], _
["Sacnoth Valley", "圣诺谷"], _
["Random Arena", "随机竞技场"], _
["Pongmei Valley", "朋美谷"], _
["Perdition Rock", "破灭石"], _
["Pahnai Salad", "伊波茄沙拉"], _
["Nahpui Quarter", "纳普区"], _
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
["Boreas Seabed", "风神海床"], _
["Bolts of Linen", "亚麻布"], _
["Blacktide Den", "黑潮之穴"], _
["Bjora Marches", "碧拉边境"], _
["Aurora Glade", "欧若拉林地"], _
["Arkjok Ward", "阿尔科监禁区"], _
["nature ritual", "自然仪式"], _
["ranged attack", "区域攻击"], _
["Piken Square", "派肯广场"], _
["Borlis Pass", "柏里斯通道"], _
["Elona Reach", "伊洛那流域"], _
["Ring of Fire", "火环群岛"], _
["Old Ascalon", "旧阿斯卡隆"], _
["Cursed Lands", "诅咒之地"], _
["Nebo Terrace", "尼伯山丘"], _
["The Arid Sea", "枯竭之海"], _
["Amatz Basin", "亚马兹盆地"], _
["Raisu Palace", "莱苏皇宫"], _
["Haiju Lagoon", "海幽泻湖"], _
["Raisu Palace", "莱苏皇宫"], _
["Camp Hojanu", "何加努营地"], _
["Gate of Fear", "恐惧之门"], _
["Gate of Pain", "惩罚之门"], _
["Issnur Isles", "伊斯诺岛"], _
["Zehlon Reach", "列隆流域"], _
["Jahai Bluffs", "夏亥峭壁"], _
["Vehjin Mines", "威金矿坑"], _
["Stygian Veil", "冥狱之幕"], _
["Battledepths", "战斗深渊"], _
["Oola's Lab", "乌啦的实验室"], _
["The Undercity", "地下城"], _
["Font of Lyss", "丽之圣水"], _
["Runic Oracle", "古文先知"], _
["Bolts of Cloth", "布料"], _
["Plant Fibers", "植物纤维"], _
["Bolt of Damask", "缎布"], _
["Bolt of Linen", "亚麻布"], _
["Leather Square", "皮革"], _
["War Supplies", "战承物资"], _
["Zehlon Reach", "列隆流域"], _
["Weaver Legs", "编织者的腿"], _
["Vials of Ink", "小瓶墨水"], _
["Vehjin Mines", "威金矿坑"], _
["Topaz Crest", "黄宝石颈脊"], _
["The Undercity", "地下城"], _
["The Arid Sea", "枯竭之海"], _
["Stone Carving", "石雕品"], _
["Ring of Fire", "火环群岛"], _
["Raisu Palace", "莱苏皇宫"], _
["Putrid Cysts", "腐败胞囊"], _
["Plague Idols", "瘟疫法器"], _
["Old Ascalon", "旧阿斯卡隆"], _
["Nebo Terrace", "尼伯山丘"], _
["Jahai Bluffs", "夏亥峭壁"], _
["Jadeite Shards", "硬玉"], _
["Issnur Isles", "伊斯诺岛"], _
["Icy Lodestone", "冰磁石"], _
["Hardened Humps", "硬瘤"], _
["Haiju Lagoon", "海幽泻湖"], _
["Gold Doubloon", "金古币"], _
["Gate of Pain", "惩罚之门"], _
["Elona Reach", "伊洛那流域"], _
["Dwarven Ales", "矮人啤酒"], _
["Cursed Lands", "诅咒之地"], _
["Borlis Pass", "柏里斯通道"], _
["Ancient Eyes", "远古之眼"], _
["Alpine Seeds", "柏木种子"], _
["attack skill", "攻击技能"], _
["axe attack", "斧术攻击技能"], _
["bow attack", "弓术攻击技能"], _
["weapon spell", "武装魔法"], _
["Asura Gate", "阿苏拉之门"], _
["Fort Ranik", "瑞尼克要塞"], _
["Lion's Arch", "狮子拱门"], _
["Camp Rankor", "蓝口营地"], _
["Augury Rock", "占卜之石"], _
["Fort Ranik", "瑞尼克要塞"], _
["Sanctum Cay", "神圣沙滩"], _
["Kessex Peak", "凯席斯山"], _
["Tangle Root", "纠结之根"], _
["Talus Chute", "碎石坡道"], _
["Jaya Bluffs", "蛇野断崖"], _
["Divine Path", "神圣之路"], _
["Mount Qinkai", "今凯山"], _
["Silent Surf", "寂静之浪"], _
["Bone Palace", "白骨宫殿"], _
["Honur Hill", "霍奴尔丘陵"], _
["Dajkah Inlet", "达卡港"], _
["Command Post", "指挥所"], _
["Marga Coast", "马加海岸"], _
["Drakkar Lake", "卓卡湖"], _
["Riven Earth", "撕裂大地"], _
["Elder Dahut", "长老达胡"], _
["Elder Jonah", "裘那长老"], _
["Elder Nahlo", "长老纳洛"], _
["Crimson Skull", "红颅"], _
["Lesser Grasp", "小鬼爪"], _
["Jadeite Shard", "硬玉"], _
["Steel Ingot", "钢铁矿石"], _
["Vial of Ink", "小瓶墨水"], _
["Drake Kabob", "烤龙兽肉"], _
["The Jade Sea", "碧玉海"], _
["Tangle Root", "纠结之根"], _
["Talus Chute", "碎石坡道"], _
["Skree Wings", "鸟妖翅膀"], _
["Silent Surf", "寂静之浪"], _
["Sanctum Cay", "神圣沙滩"], _
["Riven Earth", "撕裂大地"], _
["Mount Qinkai", "今凯山"], _
["Marga Coast", "马加海岸"], _
["Lord Khobay", "领主库贝"], _
["Kraken Eyes", "海妖之眼"], _
["Kessex Peak", "凯席斯山"], _
["Kaineng City", "凯宁城"], _
["Jaya Bluffs", "蛇野断崖"], _
["Jade Quarry", "翡翠矿场"], _
["Fort Ranik", "瑞尼克要塞"], _
["Drakkar Lake", "卓卡湖"], _
["Drake Kabob", "烤龙兽肉"], _
["Dragon Lich", "巫妖之龙"], _
["Calamitous", "卡拉米托斯"], _
["Bone Charms", "骨制护符"], _
["Black Pearls", "黑珍珠"], _
["Behemoth Jaw", "巨兽颚"], _
["Azure Crest", "湛蓝羽冠"], _
["Augury Rock", "占卜之石"], _
["dual attack", "双重攻击"], _
["lead attack", "引导攻击"], _
["party bonus", "队伍奖励"], _
["preparation", "准备技能"], _
["touch skill", "碰触技能"], _
["touch spell", "碰触魔法"], _
["Port Sledge", "雪橇港"], _
["Sage Lands", "贤者领地"], _
["Maatu Keep", "麻都堡垒"], _
["Sunqua Vale", "桑泉谷"], _
["Archipelagos", "群岛"], _
["Olafstead", "欧拉夫之地"], _
["Acolyte Jin", "侍从静"], _
["Elder Suhl", "长老苏尔"], _
["Brood Wars", "一网打尽"], _
["Iron Ingots", "铁矿石"], _
["Bolt of Silk", "丝绸"], _
["Candy Apple", "糖苹果"], _
["Worn Belt", "破旧的腰带"], _
["Verata", "死灵法师 芙瑞达"], _
["Sunqua Vale", "桑泉谷"], _
["Stormy Eye", "暴风之眼"], _
["Soul Stones", "灵魂石"], _
["Skull Juju", "头骨土符"], _
["Skelk Claws", "司怪爪"], _
["Sage Lands", "贤者领地"], _
["Naga Skins", "迦纳外皮"], _
["Mahgo Claw", "码果的爪"], _
["Krait Skins", "环蛇皮"], _
["Jotun Pelt", "角顿皮毛"], _
["Gloom Seed", "黑暗种子"], _
["Forgewight", "炼冶维特"], _
["Baked Husk", "烧焦外壳"], _
["Archipelagos", "群岛"], _
["Amber Chunks", "琥珀"], _
["item spell", "抱持魔法"], _
["pet attack", "宠物攻击"], _
["ward spell", "结界魔法"], _
["well spell", "涌泉魔法"], _
["Yak's Bend", "牦牛村"], _
["Anvil Rock", "铁砧石"], _
["Lion's Gate", "狮门"], _
["Snake Dance", "蛇舞"], _
["Zen Daijun", "祯台郡"], _
["Zen Daijun", "祯台郡"], _
["Sun Docks", "朝阳码头"], _
["The Hunt", "猎杀碎片狼"], _
["Wood Planks", "木材"], _
["Amber Chunk", "琥珀"], _
["Candy Corn", "粟米糖"], _
["Golden Egg", "金鸡蛋"], _
["Zen Daijun", "祯台郡"], _
["Z'him Monns", "晶蒙"], _
["Spider Leg", "蜘蛛腿"], _
["Snake Dance", "蛇舞"], _
["Selvetarm", "希维塔姆"], _
["Reed Bog", "芦苇沼泽地"], _
["Naga Hides", "纳迦皮"], _
["Moon Shells", "月贝"], _
["Dragon Root", "龙根"], _
["Charr Hide", "夏尔皮"], _
["Anvil Rock", "铁砧石"], _
["hex spell", "降咒魔法"], _
["Beetletun", "甲虫镇"], _
["The Breach", "缺口"], _
["Reed Bog", "芦苇沼泽"], _
["Silverwood", "银树"], _
["The Falls", "陷落区"], _
["Salt Flats", "盐滩"], _
["Arborstone", "亭石"], _
["Arborstone", "亭石"], _
["Nundu Bay", "纳度湾"], _
["Consulate", "领事馆"], _
["Rata Sum", "洛达顶点"], _
["Arbor Bay", "安博湾"], _
["Ooze Pit", "乌兹地窖"], _
["Fur Square", "毛皮"], _
["The Falls", "陷落区"], _
["The Breach", "缺口"], _
["Skale Fin", "鳞怪鳍"], _
["Silverwood", "银树"], _
["Salt Flats", "盐滩"], _
["Rotscale", "恶臭骨龙"], _
["Reed Bog", "芦苇沼泽"], _
["Nundu Bay", "纳度湾"], _
["Icy Humps", "冰雪瘤"], _
["Fendi Nin", "梵蒂宁"], _
["Arborstone", "亭石"], _
["Arbor Bay", "安博湾"], _
["Dry Top", "干燥高地"], _
["Sifhalla", "袭哈拉"], _
["Tahlkora", "塔蔻菈"], _
["Jarindok", "贾令达"], _
["Kao Tseng", "高胜"], _
["Sapphire", "蓝宝石"], _
["The Wilds", "荒原"], _
["Dry Top", "干燥高地"], _
["Ascalon", "阿斯卡隆"], _
["Arachni", "奥拉赫妮"], _
["condition", "病症"], _
["The Scar", "断崖"], _
["Ice Floe", "浮冰"], _
["Cavalon", "卡瓦隆"], _
["Ferndale", "蕨谷"], _
["Dunkoro", "唐克罗"], _
["Melonni", "梅隆妮"], _
["Kehanni", "柯函妮"], _
["Feathers", "羽毛"], _
["Diamond", "金刚石"], _
["Undead", "不死族 "], _
["The Scar", "断崖"], _
["Magmus", "麦格默斯"], _
["Khabuus", "卡布斯"], _
["Kanaxai", "加奈赛"], _
["Ice Floe", "浮冰"], _
["Ferndale", "蕨谷"], _
["blessing", "赐福"], _
["disguise", "伪装"], _
["Icedome", "冰顶"], _
["Olias", "奥里亚斯"], _
["Xandra", "珊卓亚"], _
["Zenmai", "刃玛伊"], _
["Kormir", "柯米儿"], _
["Kuwame", "库维弥"], _
["Morgahn", "摩根"], _
["Truffle", "松露"], _
["Icedome", "冰顶"], _
["Herring", "鲱鱼"], _
["Cerris", "瑟瑞丝"], _
["Bandits", "草寇"], _
["spell", "咒文魔法"], _
["Vortex", "涡流"], _
["Livia", "莉薇亚"], _
["Dehjah", "德雅"], _
["Rojis", "罗吉斯"], _
["Rahmor", "拉默"], _
["Scales", "鳞片"], _
["Kryta", "科瑞塔"], _
["Kourna", "高楠"], _
["Istan", "艾斯坦"], _
["Fenrir", "芬瑞"], _
["signet", "纹章"], _
["stance", "态势"], _
["Anton", "安托"], _
["Goren", "高恩"], _
["Hayda", "海妲"], _
["Kahmu", "卡慕"], _
["Norgu", "诺古"], _
["Razah", "雷萨"], _
["Lonai", "萝艾"], _
["Pehai", "班禾"], _
["Bones", "骨头"], _
["Ruby", "红宝石"], _
["Vabbi", "瓦贝"], _
["Urgoz", "尔果"], _
["Geode", "晶石"], _
["Charr", "夏尔"], _
["chant", "圣歌"], _
["glyph", "符号"], _
["shout", "战嚎"], _
["skill", "技能"], _
["title", "头衔"], _
["Jora", "乔拉"], _
["Koss", "寇斯"], _
["Vekk", "维克"], _
["echo", "回响"], _
["form", "形态"], _
["trap", "陷阱"], _
["Gwen", "关"] _
]

Local $fileNames=_FileListToArray(@ScriptDir, "*.au3")


for $i=1 to $fileNames[0]

	Local $hFileOpen = FileOpen($fileNames[$i], 128)

	Local $dFileOpen=FileOpen("temp/"&$fileNames[$i], 138)

	Local $readLine = FileReadLine($hFileOpen)

	while @error <> -1

		if $readLine = "" then

		Else
			FileWriteLine($dFileOpen, Convert($readLine))
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

		Local $testString = ', "' & $ConversionTable[$i][0] & '"],'
		if StringInStr($lData, $testString) then
			$lData = StringReplace($lData, $testString, ', "' & $ConversionTable[$i][1] & '"],', 0, $STR_NOCASESENSE)
			continueloop
		endif

		$testString = StringReplace($testString, "'", "")
		$testString = StringReplace($testString, "!", "")
		if StringInStr($lData, $testString) then
			$lData = StringReplace($lData, $testString, ', "' & $ConversionTable[$i][1] & '"],', 0, $STR_NOCASESENSE)
			continueloop
		endif

		$testString = StringReplace($testString, "(", "")
		$testString = StringReplace($testString, ")", "")
		if StringInStr($lData, $testString) then
			$lData = StringReplace($lData, $testString, ', "' & $ConversionTable[$i][1] & '"],', 0, $STR_NOCASESENSE)
			continueloop
		endif

		$testString = StringReplace($testString, ', "', "")
		$testString = StringReplace($testString, '"],', "")
		$testString = StringReplace($testString, " ", "")
		if StringInStr($lData, $testString) then
			$lData = StringReplace($lData, ', "' & $testString & '"],', ', "' & $ConversionTable[$i][1] & '"],', 0, $STR_NOCASESENSE)
			continueloop
		endif

	Next

	return $lData
EndFunc
