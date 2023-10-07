ScriptName Fragments:Quests:QF_OE_BryanB_ProtectHomestea_000D6440 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Predator_Spawn Auto Const mandatory
RefCollectionAlias Property Alias_PredatorGroup_Spawn Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
RefCollectionAlias Property Alias_HomesteaderSurvivors Auto Const mandatory
ReferenceAlias Property Alias_Container_Reward Auto Const mandatory
ReferenceAlias Property Alias_Marker_Center Auto Const mandatory
ReferenceAlias Property Alias_Homesteader_Leader Auto Const mandatory
ReferenceAlias Property Alias_Object_Key Auto Const mandatory
LeveledItem Property LL_OE_AlternativeReward Auto Const mandatory
Keyword Property OE_PackageCheck_Keyword Auto Const mandatory
ReferenceAlias Property Alias_Marker_TravelA03 Auto Const mandatory
RefCollectionAlias Property Alias_PredatorGroup_Targets Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Int maxCount = Alias_PredatorGroup_Spawn.GetCount() ; #DEBUG_LINE_NO:8
  Int maxToEnable = Utility.RandomInt(2, maxCount) ; #DEBUG_LINE_NO:9
  Int I = 0 ; #DEBUG_LINE_NO:11
  While I < maxToEnable ; #DEBUG_LINE_NO:12
    ObjectReference predatorRef = Alias_PredatorGroup_Spawn.GetAt(I) ; #DEBUG_LINE_NO:13
    Alias_PredatorGroup_Targets.AddRef(predatorRef) ; #DEBUG_LINE_NO:14
    predatorRef.Enable(False) ; #DEBUG_LINE_NO:15
    I += 1 ; #DEBUG_LINE_NO:16
  EndWhile ; #DEBUG_LINE_NO:
  Alias_PredatorGroup_Targets.SetValue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Alias_Object_Key.GetRef() ; #DEBUG_LINE_NO:28
    Self.SetStage(125) ; #DEBUG_LINE_NO:29
  Else ; #DEBUG_LINE_NO:
    Alias_Container_Reward.GetRef().SetLockLevel(50) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0125_Item_00()
  Alias_Homesteader_Leader.GetRef().AddItem(Alias_Object_Key.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(450) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0450_Item_00()
  If !Self.GetStageDone(475) ; #DEBUG_LINE_NO:56
    Alias_Homesteader_Leader.GetRef().AddKeyword(OE_PackageCheck_Keyword) ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
  Int index = 0 ; #DEBUG_LINE_NO:60
  While index < Alias_HomesteaderSurvivors.GetCount() ; #DEBUG_LINE_NO:61
    If Alias_HomesteaderSurvivors.GetAt(index) ; #DEBUG_LINE_NO:62
      Alias_HomesteaderSurvivors.GetAt(index).AddKeyword(OE_PackageCheck_Keyword) ; #DEBUG_LINE_NO:63
    EndIf ; #DEBUG_LINE_NO:
    index += 1 ; #DEBUG_LINE_NO:65
  EndWhile ; #DEBUG_LINE_NO:
  Alias_Homesteader_Leader.GetRef().AddItem(Alias_Object_Key.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0465_Item_00()
  Self.SetStage(460) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0475_Item_00()
  Self.SetStage(1000) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Alias_Object_Key ; #DEBUG_LINE_NO:92
    Game.GetPlayer().AddItem(Alias_Object_Key.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:93
  Else ; #DEBUG_LINE_NO:
    Game.GetPlayer().AddItem(LL_OE_AlternativeReward as Form, 1, False) ; #DEBUG_LINE_NO:95
  EndIf ; #DEBUG_LINE_NO:
  Alias_Container_Reward.GetRef().SetFactionOwner(None, False) ; #DEBUG_LINE_NO:98
  Self.SetStage(1000) ; #DEBUG_LINE_NO:100
EndFunction

Function Fragment_Stage_0510_Item_00()
  Game.GetPlayer().AddItem(LL_OE_AlternativeReward as Form, 1, False) ; #DEBUG_LINE_NO:108
  Self.SetStage(1000) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_5000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:133
  oescript kmyQuest = __temp as oescript ; #DEBUG_LINE_NO:134
EndFunction
