ScriptName Fragments:Quests:QF_City_NA_FAB_Quest13_0036885A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor01 Auto Const mandatory
ReferenceAlias Property Alias_Actor02 Auto Const mandatory
ActorValue Property CityLife_FAB_State Auto Const mandatory
Scene Property LifeScene Auto Const
ReferenceAlias Property Alias_Kid01 Auto Const mandatory
ReferenceAlias Property Alias_Kid02 Auto Const mandatory

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
  Alias_Kid01.GetRef().Disable(False) ; #DEBUG_LINE_NO:33
  Alias_Kid02.GetRef().Disable(False) ; #DEBUG_LINE_NO:34
  Self.Stop() ; #DEBUG_LINE_NO:36
EndFunction
