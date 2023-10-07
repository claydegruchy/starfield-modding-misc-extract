ScriptName Fragments:Quests:QF_CF_Post_00143472 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CFPost_CFEnableMarker Auto Const mandatory
ReferenceAlias Property CFPost_SDEnableMarker Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property CF08_Fleet Auto Const mandatory
Quest Property CF08_SysDef Auto Const mandatory
Quest Property LC088 Auto Const mandatory
Quest Property LC088_Key Auto Const mandatory
Quest Property LC088_Vigilance Auto Const mandatory
ReferenceAlias Property Alias_Vigilance Auto Const mandatory
ReferenceAlias Property Alias_LC088_KeyTurretsEnableMarker Auto Const mandatory
ObjectReference Property LC082_Quickstart_DockingPort Auto Const mandatory
ObjectReference Property cTestCOCMarkerRef Auto Const mandatory
ReferenceAlias Property Alias_CFPost_SysDefatKeyEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_CFPost_FleetatVigilanceEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_CF_Post_Kibwe Auto Const mandatory
ReferenceAlias Property Alias_CF_Post_Toft Auto Const mandatory
Quest Property DialogueCFTheKey Auto Const mandatory
ReferenceAlias Property Alias_CF08_Key_DataCoreAnalyzer_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_CF08_Key_DataCoreAnalyzer_DisableMarker Auto Const mandatory
ReferenceAlias Property Alias_CFPost_Key_DataCoreAnalyzer_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_CFPost_Key_DataCoreAnalyzer_DisableMarker Auto Const mandatory
ReferenceAlias Property Alias_CFPost_Key_DataCoreAnalyzer Auto Const mandatory
Quest Property LC088_Space Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  cf_postquestscript kmyQuest = __temp as cf_postquestscript ; #DEBUG_LINE_NO:8
  LC088.SetStage(10) ; #DEBUG_LINE_NO:14
  LC088_Vigilance.SetStage(8) ; #DEBUG_LINE_NO:15
  LC088_Vigilance.SetStage(1101) ; #DEBUG_LINE_NO:16
  LC088_Space.SetStage(195) ; #DEBUG_LINE_NO:17
  CF08_Fleet.SetStage(1000) ; #DEBUG_LINE_NO:18
  Game.GetPlayer().MoveTo(cTestCOCMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:21
  Self.SetStage(110) ; #DEBUG_LINE_NO:24
  kmyQuest.QuickstartToKey() ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:35
  cf_postquestscript kmyQuest = __temp as cf_postquestscript ; #DEBUG_LINE_NO:36
  LC088.SetStage(10) ; #DEBUG_LINE_NO:42
  LC088_Key.SetStage(9) ; #DEBUG_LINE_NO:43
  Game.GetPlayer().MoveTo(LC082_Quickstart_DockingPort, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:44
  LC088_Key.SetStage(1101) ; #DEBUG_LINE_NO:45
  LC088_Key.SetStage(2000) ; #DEBUG_LINE_NO:46
  LC088_Space.SetStage(295) ; #DEBUG_LINE_NO:47
  CF08_SysDef.SetStage(1000) ; #DEBUG_LINE_NO:48
  Game.GetPlayer().MoveTo(cTestCOCMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:51
  Self.SetStage(200) ; #DEBUG_LINE_NO:54
  Self.SetStage(210) ; #DEBUG_LINE_NO:55
  kmyQuest.QuickstartToKey() ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0030_Item_00()
  DialogueCFTheKey.SetStage(950) ; #DEBUG_LINE_NO:69
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:77
  cf_postquestscript kmyQuest = __temp as cf_postquestscript ; #DEBUG_LINE_NO:78
  kmyQuest.CF_CleanupAllCaptainShips() ; #DEBUG_LINE_NO:84
  kmyQuest.CF_ConvertVigilance() ; #DEBUG_LINE_NO:87
  kmyQuest.RegisterForPostquestLocationChange() ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:98
  cf_postquestscript kmyQuest = __temp as cf_postquestscript ; #DEBUG_LINE_NO:99
  LC088.SetStage(2000) ; #DEBUG_LINE_NO:105
  kmyQuest.CF_DisableCaptainShips() ; #DEBUG_LINE_NO:108
  kmyQuest.CF_MoveAndCrippleVigilance() ; #DEBUG_LINE_NO:111
  Alias_LC088_KeyTurretsEnableMarker.TryToDisable() ; #DEBUG_LINE_NO:114
  CFPost_CFEnableMarker.TryToEnable() ; #DEBUG_LINE_NO:117
  Alias_CFPost_FleetatVigilanceEnableMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:120
  If LC088_Vigilance.GetStageDone(1019) ; #DEBUG_LINE_NO:123
    (LC082 as lc082_brigquestscript).AddPrisoner(Alias_CF_Post_Kibwe.GetActorRef(), 1) ; #DEBUG_LINE_NO:124
    (LC082 as lc082_brigquestscript).AddPrisoner(Alias_CF_Post_Toft.GetActorRef(), 2) ; #DEBUG_LINE_NO:125
  EndIf ; #DEBUG_LINE_NO:
  Alias_CF08_Key_DataCoreAnalyzer_EnableMarker.TryToDisable() ; #DEBUG_LINE_NO:129
  Alias_CF08_Key_DataCoreAnalyzer_DisableMarker.TryToEnable() ; #DEBUG_LINE_NO:130
  Alias_CFPost_Key_DataCoreAnalyzer_EnableMarker.TryToEnable() ; #DEBUG_LINE_NO:131
  Alias_CFPost_Key_DataCoreAnalyzer_DisableMarker.TryToDisable() ; #DEBUG_LINE_NO:132
  (Alias_CFPost_Key_DataCoreAnalyzer.GetRef() as defaultmultistateactivator).SetAnimationState("Done", False) ; #DEBUG_LINE_NO:133
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:141
  cf_postquestscript kmyQuest = __temp as cf_postquestscript ; #DEBUG_LINE_NO:142
  kmyQuest.RegisterForPostquestLocationChange() ; #DEBUG_LINE_NO:148
EndFunction

Function Fragment_Stage_0210_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:156
  cf_postquestscript kmyQuest = __temp as cf_postquestscript ; #DEBUG_LINE_NO:157
  LC088.SetStage(2000) ; #DEBUG_LINE_NO:163
  kmyQuest.SD_CleanupAllCaptainShips() ; #DEBUG_LINE_NO:166
  LC082.SetStage(211) ; #DEBUG_LINE_NO:169
  kmyQuest.SD_MoveVigilance() ; #DEBUG_LINE_NO:172
  Alias_LC088_KeyTurretsEnableMarker.TryToDisable() ; #DEBUG_LINE_NO:175
  CFPost_SDEnableMarker.TryToEnable() ; #DEBUG_LINE_NO:178
  Alias_CFPost_SysDefatKeyEnableMarker.TryToEnableNoWait() ; #DEBUG_LINE_NO:181
EndFunction
