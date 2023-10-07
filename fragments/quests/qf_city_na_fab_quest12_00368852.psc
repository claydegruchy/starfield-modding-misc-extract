ScriptName Fragments:Quests:QF_City_NA_FAB_Quest12_00368852 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor01 Auto Const mandatory
ReferenceAlias Property Alias_Actor02 Auto Const mandatory
ActorValue Property CityLife_FAB_State Auto Const mandatory
Scene Property LifeScene Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  LifeScene.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Actor01.GetRef().SetValue(CityLife_FAB_State, 1.0) ; #DEBUG_LINE_NO:17
  Alias_Actor02.GetRef().SetValue(CityLife_FAB_State, 1.0) ; #DEBUG_LINE_NO:18
  Alias_Actor01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:21
  Alias_Actor02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_Actor01.GetRef().Disable(False) ; #DEBUG_LINE_NO:31
  Alias_Actor02.GetRef().Disable(False) ; #DEBUG_LINE_NO:32
  Self.Stop() ; #DEBUG_LINE_NO:34
EndFunction
