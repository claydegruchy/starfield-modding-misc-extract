ScriptName Fragments:Quests:QF_FC_Neon_ALN_CitytLife_Enc_00023BD2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor01 Auto Const mandatory
ReferenceAlias Property Alias_Actor02 Auto Const mandatory
Scene Property LifeScene Auto Const
ActorValue Property FC_Neon_ALN_CityLife_State Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  LifeScene.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.setstage(300) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Actor01.GetRef().SetValue(FC_Neon_ALN_CityLife_State, 1.0) ; #DEBUG_LINE_NO:28
  Alias_Actor02.GetRef().SetValue(FC_Neon_ALN_CityLife_State, 1.0) ; #DEBUG_LINE_NO:29
  Alias_Actor01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:32
  Alias_Actor02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_Actor01.GetRef().Disable(False) ; #DEBUG_LINE_NO:42
  Alias_Actor02.GetRef().Disable(False) ; #DEBUG_LINE_NO:43
  Self.Stop() ; #DEBUG_LINE_NO:45
EndFunction
