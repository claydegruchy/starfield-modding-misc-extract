ScriptName Fragments:Quests:QF_MQ207C_Support_0027E24A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_parentscript Property SQ_Parent Auto Const mandatory
Quest Property MQ207C Auto Const mandatory
Scene Property MQ207C_110_EntranceIntercom Auto Const mandatory
Perk Property MQ207C_BarakovaPriceModPerk Auto Const mandatory
Book Property MQ207C_Nishina01_DrBarakovaSlate_II Auto Const mandatory
Message Property MQ207C_SurveyDataDownloadedMessage Auto Const mandatory
Keyword Property PlanetTrait19PsychotropicBiota Auto Const mandatory
LeveledItem Property MQ207C_LL_Weapon_Cataxi Auto Const mandatory
LeveledItem Property MQ207C_LL_MedPacks Auto Const mandatory
LeveledItem Property MQ207C_LL_MedSupplies Auto Const mandatory
LeveledItem Property MQ207C_LL_MinorReward_Credits Auto Const mandatory
MiscObject Property MQ207C_ProbeControlUnit Auto Const mandatory
ReferenceAlias Property Alias_Nishina02_I_ScientistEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Nishina02_I_ScientistDisableMarker Auto Const mandatory
RefCollectionAlias Property Alias_Nishina02_SkillMagazines Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0022_Item_00()
  Game.GetPlayer().AddItem(MQ207C_LL_Weapon_Cataxi as Form, 1, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0025_Item_00()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:21
  sq_parentscript:planettraitdata traitData = SQ_Parent.FindMatchingPlanetTraitForKeyword(PlanetTrait19PsychotropicBiota, player.GetCurrentPlanet()) ; #DEBUG_LINE_NO:22
  SQ_Parent.UpdatePlanetTraitDiscovery(player as ObjectReference, traitData, 1) ; #DEBUG_LINE_NO:23
  MQ207C_SurveyDataDownloadedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().AddItem(MQ207C_LL_MinorReward_Credits as Form, 1, False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0031_Item_00()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:46
  player.RemoveItem(MQ207C_ProbeControlUnit as Form, 1, False, None) ; #DEBUG_LINE_NO:47
  player.AddItem(MQ207C_LL_MinorReward_Credits as Form, 1, False) ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0050_Item_00()
  Game.GetPlayer().AddItem(MQ207C_LL_MedPacks as Form, 1, False) ; #DEBUG_LINE_NO:61
  MQ207C.SetStage(572) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0051_Item_00()
  Game.GetPlayer().RemoveItem(MQ207C_Nishina01_DrBarakovaSlate_II as Form, 1, False, None) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0052_Item_00()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:86
  player.AddItem(MQ207C_LL_MedSupplies as Form, 1, False) ; #DEBUG_LINE_NO:87
  player.AddPerk(MQ207C_BarakovaPriceModPerk, False) ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0110_Item_00()
  MQ207C_110_EntranceIntercom.Start() ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0120_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:109
  mq207csupportquestscript kmyQuest = __temp as mq207csupportquestscript ; #DEBUG_LINE_NO:110
  kmyQuest.UnregisterForExteriorDoorEvents() ; #DEBUG_LINE_NO:116
  MQ207C.SetStage(120) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Nishina02_I_ScientistEnableMarker.TryToEnable() ; #DEBUG_LINE_NO:131
  Alias_Nishina02_I_ScientistDisableMarker.TryToDisable() ; #DEBUG_LINE_NO:132
EndFunction
