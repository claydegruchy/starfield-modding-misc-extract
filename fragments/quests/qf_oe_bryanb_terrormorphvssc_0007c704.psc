ScriptName Fragments:Quests:QF_OE_BryanB_TerrormorphVSSc_0007C704 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Predator_Spawn Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
RefCollectionAlias Property Alias_HomesteaderSurvivors Auto Const mandatory
ReferenceAlias Property Alias_Container_Reward Auto Const mandatory
ReferenceAlias Property Alias_Marker_Center Auto Const mandatory
ReferenceAlias Property Alias_Homesteader_Leader Auto Const mandatory
ReferenceAlias Property Alias_Object_Key Auto Const mandatory
LeveledItem Property LL_OE_AlternativeReward Auto Const mandatory
Keyword Property OE_PackageCheck_Keyword Auto Const mandatory
GlobalVariable Property OE_KreetTerrormorphDone Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory
LocationAlias Property Alias_OE_Location Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0125_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0025_Item_00()
  OE_KreetTerrormorphDone.SetValue(1.0) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Alias_Object_Key.GetRef() ; #DEBUG_LINE_NO:24
    Self.SetStage(125) ; #DEBUG_LINE_NO:25
  Else ; #DEBUG_LINE_NO:
    Alias_Container_Reward.GetRef().SetLockLevel(50) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetStage(25) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:56
  Self.SetStage(25) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(450) ; #DEBUG_LINE_NO:65
  Self.SetStage(460) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0450_Item_00()
  If Self.GetStageDone(400) ; #DEBUG_LINE_NO:74
    Self.SetStage(460) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0460_Item_00()
  If !Self.GetStageDone(475) ; #DEBUG_LINE_NO:84
    Alias_Homesteader_Leader.GetRef().AddKeyword(OE_PackageCheck_Keyword) ; #DEBUG_LINE_NO:85
  EndIf ; #DEBUG_LINE_NO:
  Int index = 0 ; #DEBUG_LINE_NO:88
  While index < Alias_HomesteaderSurvivors.GetCount() ; #DEBUG_LINE_NO:89
    If Alias_HomesteaderSurvivors.GetAt(index) ; #DEBUG_LINE_NO:90
      Alias_HomesteaderSurvivors.GetAt(index).AddKeyword(OE_PackageCheck_Keyword) ; #DEBUG_LINE_NO:91
    EndIf ; #DEBUG_LINE_NO:
    index += 1 ; #DEBUG_LINE_NO:93
  EndWhile ; #DEBUG_LINE_NO:
  Alias_Homesteader_Leader.GetRef().AddItem(Alias_Object_Key.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0475_Item_00()
  Self.SetStage(1000) ; #DEBUG_LINE_NO:104
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Alias_Object_Key ; #DEBUG_LINE_NO:114
    Game.GetPlayer().AddItem(Alias_Object_Key.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:115
  Else ; #DEBUG_LINE_NO:
    Game.GetPlayer().AddItem(LL_OE_AlternativeReward as Form, 1, False) ; #DEBUG_LINE_NO:117
  EndIf ; #DEBUG_LINE_NO:
  Alias_Container_Reward.GetRef().SetFactionOwner(None, False) ; #DEBUG_LINE_NO:120
  Self.SetStage(1000) ; #DEBUG_LINE_NO:122
EndFunction

Function Fragment_Stage_0510_Item_00()
  Game.GetPlayer().AddItem(LL_OE_AlternativeReward as Form, 1, False) ; #DEBUG_LINE_NO:130
  Self.SetStage(1000) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_5000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:155
  oescript kmyQuest = __temp as oescript ; #DEBUG_LINE_NO:156
EndFunction
