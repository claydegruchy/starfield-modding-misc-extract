ScriptName Fragments:Quests:QF_FC_Neon_CT_CityLife_Encou_000F8A94 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor01 Auto Const mandatory
ReferenceAlias Property Alias_Actor02 Auto Const mandatory
Scene Property LifeScene Auto Const
ActorValue Property StateAV Auto Const
ReferenceAlias Property Alias_E05EnableMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_E05EnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  LifeScene.Start() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Actor01.GetRef().SetValue(StateAV, 1.0) ; #DEBUG_LINE_NO:33
  Alias_Actor02.GetRef().SetValue(StateAV, 1.0) ; #DEBUG_LINE_NO:34
  Alias_Actor01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:37
  Alias_Actor02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_E05EnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:47
  Self.Stop() ; #DEBUG_LINE_NO:48
EndFunction
