local HandicraftsMaster = GameMain:NewMod("HandicraftsMaster");
local stack = 1;

function CheerUpFabaoSpd()
	world:SetRandomSeed();
	local charismaIF = 1.0;	
	local featureIF = 1.0;
	
	local sideNpc = me.npcObj;
	local sideNpcName = sideNpc:GetName();
	local sideNpcLuaHelper = story:GetDoingNpc();
	local sideNpcCharisma = sideNpcLuaHelper:GetCharisma();
	
	local charismaIF = sideNpcCharisma / 10 +0.1;
	
	if sideNpc.PropertyMgr:CheckFeature("BeautifulFace1") or sideNpc.PropertyMgr:CheckFeature("BeautifulFace2") then
		--world:ShowMsgBox("NPC长的好看","养眼");
		featureIF = featureIF + 0.3;
	end
	
	if sideNpc.PropertyMgr:CheckFeature("UglyFace1") or sideNpc.PropertyMgr:CheckFeature("UglyFace2") then
		--world:ShowMsgBox("NPC长的丑","扣眼");
		featureIF = featureIF - 0.3;
	end
	
	--world:ShowMsgBox(" Charisma&Feature IF \n"..charismaIF.." "..featureIF.."  ","CFIF");
	
	
	--world:ShowMsgBox(" Side Charisma "..sideNpcCharisma.."  ","NPC");
	--sideNpc:PlayAnimation("wudao1@F",true,0.03);
	

	
	local nR = world:RandomFloat(0.3,0.5);
	--world:ShowMsgBox("RandomFloat   "..nR.."   ","Random");
	
	local mainNpcLuaHelper = story:GetBindNpc();
	--mainNpcLuaHelper:AddModifier("Story_test");
	--mainNpcLuaHelper:AddModifier("Story_test",nR,true);
	--world:ShowMsgBox("Story","Trigger Story");
	
	local mainNpc = mainNpcLuaHelper.npcObj;
	local mainNpcName = mainNpc:GetName();
	mainNpc:AddModifier("Story_KajiSpdUp",(nR+charismaIF)*featureIF,true,stack);
	stack = stack + 1;

	local mainNpc = mainNpcLuaHelper.npcObj;
	
	local msgText = "";
	if charismaIF >= 0.6 then
		msgText = ("而且"..sideNpcName.."的魅力高，效果加成\n");
	else
		msgText = ("但是"..sideNpcName.."的魅力不足，效果不佳\n");
	end
	
	if featureIF > 1.0 then
		msgText = (msgText.."外加"..sideNpcName.."长的很养眼，效果加成");
	else
		if featureIF == 1.0 then
			msgText = (msgText..sideNpcName.."长的还行，效果尚可");
		else
			msgText = (msgText.."但是"..sideNpcName.."长的太丑，反向效果");
		end
	end
	--world:ShowMsgBox(msgText);
	world:ShowMsgBox(mainNpcName.." 已经被 "..sideNpcName.." 激励了!\n"..msgText,"炼器速度提升");
	--mainNpc:PlayAnimation("LSXX",true,0.84);
	
end

function CheerUpDanSpd()
	local mainNpcLuaHelper = story:GetBindNpc();
	local mainNpc = mainNpcLuaHelper.npcObj;
	local mainNpcName = mainNpc:GetName();
	mainNpc:AddModifier("Story_DanSpdUp");
	world:ShowMsgBox(mainNpcName.." 已经被激励了!\n","炼丹速度提升");
end

function CheerUpLingYouRate()
	local mainNpcLuaHelper = story:GetBindNpc();
	local mainNpc = mainNpcLuaHelper.npcObj;
	local mainNpcName = mainNpc:GetName();
	mainNpc:AddModifier("Story_YouRateUp");
	mainNpc:AddModifier("Story_LingRateUp");
	
	--[[
	--Test Part--
	local sslbase = GameDefine.SOULCRYSTALLING_BASE;
	local ssybase = GameDefine.SOULCRYSTALYOU_BASE;
	world:ShowMsgBox("基础概率 Ling: "..sslbase.."\n 基础概率 You"..ssybase,"基础概率变更前");
	--]]
	local GDefine = CS.XiaWorld.GameDefine;
	GDefine.SOULCRYSTALLING_BASE = 1.5;
	GDefine.SOULCRYSTALYOU_BASE = 1.5;
	--[[
	local testValue = GDefine.SOULCRYSTALLING_BASE;
	world:ShowMsgBox(testValue,"测试值");
	local sslbase = GameDefine.SOULCRYSTALLING_BASE;
	local ssybase = GameDefine.SOULCRYSTALYOU_BASE;
	world:ShowMsgBox("基础概率 Ling: "..sslbase.."\n 基础概率 You"..ssybase,"基础概率变更后");
	--]]
	
	world:ShowMsgBox("灵萃成功率 -> 100%\n幽萃成功率 -> 100%","成功率上升");
end

function CheerUpFuQuality();
	local fuData = PracticeMgr.m_mapSpellDefs;
	local realvalue = 1;
	for k, v in pairs(fuData) do
		World:SaveFuValue(k,realvalue);
	end
	
	local mainNpcLuaHelper = story:GetBindNpc();
	local mainNpc = mainNpcLuaHelper.npcObj;
	mainNpc:AddModifier("Story_FuQualityUp");
	world:ShowMsgBox("所有符箓已经设定为100品质","符箓品质设定完成");
end

function HandicraftsMaster:OnSave()
	--local tbSave = shengercao;
	--return tbSave;
end

function HandicraftsMaster:OnLoad(tbLoad)
	--shengercao = tbLoad or {a = 0, b = 0};
end





