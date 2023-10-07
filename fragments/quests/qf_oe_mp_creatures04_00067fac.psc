ScriptName Fragments:Quests:QF_OE_MP_Creatures04_00067FAC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Attacker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0150_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor Attacker = Alias_Attacker.GetActorRef() ; #DEBUG_LINE_NO:15
  Attacker.Enable(False) ; #DEBUG_LINE_NO:17
  Attacker.EvaluatePackage(False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0325_Item_00()
  If Self.GetStageDone(350) ; #DEBUG_LINE_NO:34
    Self.SetStage(300) ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0350_Item_00()
  If Self.GetStageDone(325) ; #DEBUG_LINE_NO:44
    Self.SetStage(300) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:54
EndFunction
