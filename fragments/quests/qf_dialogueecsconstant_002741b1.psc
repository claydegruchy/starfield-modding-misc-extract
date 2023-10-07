ScriptName Fragments:Quests:QF_DialogueECSConstant_002741B1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_BomaniRida Auto Const mandatory
ReferenceAlias Property Alias_DianaBrackenridge Auto Const mandatory
ReferenceAlias Property Alias_MabhutiDaCosta Auto Const mandatory
ReferenceAlias Property Alias_IntroGuard01 Auto Const mandatory
ReferenceAlias Property Alias_IntroGuard02 Auto Const mandatory
ReferenceAlias Property Alias_IntroGuard03 Auto Const mandatory
ReferenceAlias Property Alias_DianaIntroMarker01 Auto Const mandatory
ReferenceAlias Property Alias_BomaniIntroMarker01 Auto Const mandatory
ReferenceAlias Property Alias_MabhutiIntroMarker01 Auto Const mandatory
ReferenceAlias Property Alias_DianaBridgeMarker01 Auto Const mandatory
ReferenceAlias Property Alias_BomaniBridgeMarker01 Auto Const mandatory
ReferenceAlias Property Alias_MabhutiHomeMarker01 Auto Const mandatory
Scene Property DialogueECS_Establishing01 Auto Const mandatory
Scene Property DialogueECS_Establishing02 Auto Const
Scene Property DialogueECS_Establishing03 Auto Const
Quest Property MS06 Auto Const mandatory
ReferenceAlias Property Alias_JanetYang Auto Const mandatory
GlobalVariable Property ECS_EndState Auto Const mandatory
Quest Property FFConstantZ04 Auto Const mandatory
Quest Property FFConstantZ04Misc Auto Const mandatory
Quest Property FFConstantZ05 Auto Const mandatory
Quest Property FFConstantZ05Misc Auto Const mandatory
ReferenceAlias Property Alias_AbeLevitz Auto Const mandatory
ReferenceAlias Property Alias_CompanionIntroMarker01 Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
GlobalVariable Property FFConstantR02_CompletedNextToLast Auto Const mandatory
GlobalVariable Property FFConstantR02_NumTimesCompleted Auto Const mandatory
ReferenceAlias Property Alias_CargoColonist Auto Const mandatory
Quest Property DialogueParadiso Auto Const mandatory
RefCollectionAlias Property Alias_NamedECSNPCs Auto Const mandatory
Keyword Property ECSConstantRoamingHandlerQuestStartKeyword Auto Const mandatory
ReferenceAlias Property Alias_ECSConstantShip Auto Const mandatory
ReferenceAlias Property Alias_ECSConstantGravDrive Auto Const mandatory
ReferenceAlias Property Alias_EmptyModule Auto Const mandatory
RefCollectionAlias Property Alias_GravDriveModules Auto Const mandatory
RefCollectionAlias Property Alias_GenericNPCs Auto Const mandatory
RefCollectionAlias Property Alias_IntroNPCs Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_DianaBrackenridge.GetRef().MoveTo(Alias_DianaIntroMarker01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
  Alias_BomaniRida.GetRef().MoveTo(Alias_BomaniIntroMarker01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
  Alias_MabhutiDaCosta.GetRef().MoveTo(Alias_MabhutiIntroMarker01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  Alias_IntroNPCs.SetGhost(True) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0001_Item_00()
  MS06.Start() ; #DEBUG_LINE_NO:18
  MS06.SetStage(400) ; #DEBUG_LINE_NO:19
  DialogueECS_Establishing01.Start() ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0020_Item_00()
  ECS_EndState.SetValue(0.0) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0021_Item_00()
  ECS_EndState.SetValue(1.0) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0022_Item_00()
  ECS_EndState.SetValue(2.0) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0052_Item_00()
  Self.SetStage(110) ; #DEBUG_LINE_NO:54
  Self.SetStage(200) ; #DEBUG_LINE_NO:55
  MS06.SetStage(2410) ; #DEBUG_LINE_NO:56
  Game.GetPlayer().MoveTo(Alias_AbeLevitz.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0054_Item_00()
  ECS_EndState.SetValue(1.0) ; #DEBUG_LINE_NO:65
  Game.GetPlayer().MoveTo(Alias_JanetYang.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:66
  Self.SetStage(110) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0055_Item_00()
  ECS_EndState.SetValue(2.0) ; #DEBUG_LINE_NO:75
  Game.GetPlayer().MoveTo(Alias_JanetYang.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:76
  Self.SetStage(110) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0062_Item_00()
  FFConstantR02_NumTimesCompleted.SetValue(FFConstantR02_CompletedNextToLast.GetValue()) ; #DEBUG_LINE_NO:85
  Self.SetStage(52) ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0100_Item_00()
  If !MS06.GetStageDone(1) ; #DEBUG_LINE_NO:96
    Alias_Companion.GetRef().MoveTo(Alias_CompanionIntroMarker01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:97
    DialogueECS_Establishing01.Stop() ; #DEBUG_LINE_NO:98
    DialogueECS_Establishing02.Start() ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  MS06.SetStage(500) ; #DEBUG_LINE_NO:108
  DialogueECS_Establishing03.Start() ; #DEBUG_LINE_NO:109
  Alias_IntroNPCs.SetGhost(False) ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0120_Item_00()
  MS06.SetStage(600) ; #DEBUG_LINE_NO:118
  Alias_CargoColonist.GetRef().Enable(False) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:127
  dialogueecsconstantquestscript kmyQuest = __temp as dialogueecsconstantquestscript ; #DEBUG_LINE_NO:128
  Alias_NamedECSNPCs.RefillAlias() ; #DEBUG_LINE_NO:131
  kmyQuest.MoveNPCs() ; #DEBUG_LINE_NO:134
  Alias_GenericNPCs.DisableAll(False) ; #DEBUG_LINE_NO:137
  DialogueParadiso.SetStage(2010) ; #DEBUG_LINE_NO:141
EndFunction

Function Fragment_Stage_1400_Item_00()
  If !FFConstantZ04.IsRunning() && !FFConstantZ04.IsCompleted() ; #DEBUG_LINE_NO:149
    FFConstantZ04Misc.Start() ; #DEBUG_LINE_NO:150
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1401_Item_00()
  If FFConstantZ04Misc.IsRunning() ; #DEBUG_LINE_NO:160
    FFConstantZ04Misc.SetStage(1000) ; #DEBUG_LINE_NO:161
  EndIf ; #DEBUG_LINE_NO:
  FFConstantZ04.Start() ; #DEBUG_LINE_NO:163
EndFunction

Function Fragment_Stage_1451_Item_00()
  Alias_JanetYang.GetRef().Disable(False) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_1500_Item_00()
  If !FFConstantZ05.IsRunning() && !FFConstantZ05.IsCompleted() ; #DEBUG_LINE_NO:179
    FFConstantZ05Misc.Start() ; #DEBUG_LINE_NO:180
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1501_Item_00()
  If FFConstantZ05Misc.IsRunning() ; #DEBUG_LINE_NO:190
    FFConstantZ05Misc.SetStage(1000) ; #DEBUG_LINE_NO:191
  EndIf ; #DEBUG_LINE_NO:
  FFConstantZ05.Start() ; #DEBUG_LINE_NO:193
EndFunction

Function Fragment_Stage_1600_Item_00()
  Alias_CargoColonist.GetRef().Disable(False) ; #DEBUG_LINE_NO:201
EndFunction

Function Fragment_Stage_2100_Item_00()
  Alias_EmptyModule.GetRef().Disable(False) ; #DEBUG_LINE_NO:209
  Alias_GravDriveModules.EnableAll(False) ; #DEBUG_LINE_NO:210
  ECSConstantRoamingHandlerQuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0) ; #DEBUG_LINE_NO:212
  Self.SetObjectiveDisplayed(2100, True, False) ; #DEBUG_LINE_NO:213
EndFunction
