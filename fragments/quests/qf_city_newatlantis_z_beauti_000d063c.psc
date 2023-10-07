ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Beauti_000D063C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Slate Auto Const mandatory
ReferenceAlias Property Alias_Warner Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
  Alias_Slate.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:16
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:25
  Self.Stop() ; #DEBUG_LINE_NO:26
EndFunction
