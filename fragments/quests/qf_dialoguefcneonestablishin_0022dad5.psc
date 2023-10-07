ScriptName Fragments:Quests:QF_DialogueFCNeonEstablishin_0022DAD5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueFCNeonEstablishingScene_Main Auto Const mandatory
ReferenceAlias Property Alias_NeonGuard_F02 Auto Const mandatory
ReferenceAlias Property Alias_NeonGuard_M01 Auto Const mandatory
ReferenceAlias Property Alias_Neshar Auto Const mandatory
GlobalVariable Property NeonESSceneStatus Auto Const mandatory
Quest Property City_Neon_Drug01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  DialogueFCNeonEstablishingScene_Main.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_NeonGuard_F02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:15
  Alias_NeonGuard_M01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:16
  Alias_Neshar.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:17
  City_Neon_Drug01.Start() ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_Neshar.GetActorRef().Disable(True) ; #DEBUG_LINE_NO:28
  NeonESSceneStatus.SetValue(NeonESSceneStatus.GetValue() + 1.0) ; #DEBUG_LINE_NO:29
  If NeonESSceneStatus.GetValue() >= 3.0 ; #DEBUG_LINE_NO:31
    Self.SetStage(1000) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_NeonGuard_F02.GetActorRef().Disable(True) ; #DEBUG_LINE_NO:41
  NeonESSceneStatus.SetValue(NeonESSceneStatus.GetValue() + 1.0) ; #DEBUG_LINE_NO:42
  If NeonESSceneStatus.GetValue() >= 3.0 ; #DEBUG_LINE_NO:44
    Self.SetStage(1000) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_NeonGuard_M01.GetActorRef().Disable(True) ; #DEBUG_LINE_NO:54
  NeonESSceneStatus.SetValue(NeonESSceneStatus.GetValue() + 1.0) ; #DEBUG_LINE_NO:55
  If NeonESSceneStatus.GetValue() >= 3.0 ; #DEBUG_LINE_NO:57
    Self.SetStage(1000) ; #DEBUG_LINE_NO:58
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:67
EndFunction
