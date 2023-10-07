ScriptName Fragments:Quests:QF_SE_GenericDerelict_BlackB_000F35BC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Blackbox Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_BlackboxGlobal Auto Const mandatory
MiscObject Property SE_GenericDerelict_BlackBox Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  SE_GenericDerelict_BlackboxGlobal.SetValue(100.0) ; #DEBUG_LINE_NO:7
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:8
  Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_BlackBox as Form, Alias_Blackbox as Alias, 1, True) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0020_Item_00()
  SE_GenericDerelict_BlackboxGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:17
  Game.GetPlayer().RemoveItem(Alias_Blackbox.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:18
  Game.GetPlayer().RemoveItem(SE_GenericDerelict_BlackBox as Form, 99, False, None) ; #DEBUG_LINE_NO:19
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:20
  Self.Stop() ; #DEBUG_LINE_NO:21
EndFunction
