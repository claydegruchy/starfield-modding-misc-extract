ScriptName City_AkilaLife04_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const
ReferenceAlias Property KateFoley Auto Const mandatory

;-- Functions ---------------------------------------

Function Wait24()
  Self.StartTimerGameTime(24.0, 1) ; #DEBUG_LINE_NO:6
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == 1 ; #DEBUG_LINE_NO:11
    Self.SetStage(StageToSet) ; #DEBUG_LINE_NO:13
    If KateFoley.GetRef().Is3DLoaded() ; #DEBUG_LINE_NO:16
      Self.SetStage(350) ; #DEBUG_LINE_NO:17
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
