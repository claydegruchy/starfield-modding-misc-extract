ScriptName Fragments:Quests:QF_City_AC_FAB_Quest18_0037C5A7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor01 Auto Const mandatory
ReferenceAlias Property Alias_Actor02 Auto Const mandatory
ActorValue Property CityLife_FAB_State Auto Const mandatory
Scene Property LifeScene Auto Const
ReferenceAlias Property Alias_TalkTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_Actor01.GetRef().Enable(False) ; #DEBUG_LINE_NO:8
  Alias_Actor02.GetRef().Enable(False) ; #DEBUG_LINE_NO:9
  Alias_TalkTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0100_Item_00()
  LifeScene.Start() ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Actor01.GetRef().SetValue(CityLife_FAB_State, 1.0) ; #DEBUG_LINE_NO:28
  Alias_Actor02.GetRef().SetValue(CityLife_FAB_State, 1.0) ; #DEBUG_LINE_NO:29
  Alias_Actor01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:32
  Alias_Actor02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_Actor01.GetRef().Disable(False) ; #DEBUG_LINE_NO:42
  Alias_Actor02.GetRef().Disable(False) ; #DEBUG_LINE_NO:43
  Self.Stop() ; #DEBUG_LINE_NO:45
EndFunction
