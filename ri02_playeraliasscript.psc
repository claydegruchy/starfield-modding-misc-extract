ScriptName RI02_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property CityNeonTradeTowerAstralLoungeLocation Auto Const mandatory
GlobalVariable Property RI02_AstralLoungeBodyCount Auto Const mandatory
Int Property iStartTrackingStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnKill(ObjectReference akVictim)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:9
  If MyQuest.GetStageDone(iStartTrackingStage) ; #DEBUG_LINE_NO:11
    If akVictim.GetCurrentLocation() == CityNeonTradeTowerAstralLoungeLocation ; #DEBUG_LINE_NO:12
      RI02_AstralLoungeBodyCount.SetValue(RI02_AstralLoungeBodyCount.GetValue() + 1.0) ; #DEBUG_LINE_NO:13
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
