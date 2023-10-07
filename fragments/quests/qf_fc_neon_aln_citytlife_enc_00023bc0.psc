ScriptName Fragments:Quests:QF_FC_Neon_ALN_CitytLife_Enc_00023BC0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor01 Auto Const mandatory
ReferenceAlias Property Alias_Actor02 Auto Const mandatory
Scene Property LifeScene Auto Const
ActorValue Property FC_Neon_ALN_CityLife_State Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  LifeScene.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Actor01.GetRef().SetValue(FC_Neon_ALN_CityLife_State, 1.0) ; #DEBUG_LINE_NO:25
  Alias_Actor02.GetRef().SetValue(FC_Neon_ALN_CityLife_State, 1.0) ; #DEBUG_LINE_NO:26
  Alias_Actor01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:29
  Alias_Actor02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_Actor01.GetRef().Disable(False) ; #DEBUG_LINE_NO:39
  Alias_Actor02.GetRef().Disable(False) ; #DEBUG_LINE_NO:40
  Self.Stop() ; #DEBUG_LINE_NO:42
EndFunction
