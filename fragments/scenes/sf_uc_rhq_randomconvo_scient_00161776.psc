ScriptName Fragments:Scenes:SF_UC_RHQ_RandomConvo_Scient_00161776 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC_RHQ_RC_MindControlTestMostRecentResponseGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End()
  If UC_RHQ_RC_MindControlTestMostRecentResponseGlobal.GetValue() < 0.0 ; #DEBUG_LINE_NO:7
    UC_RHQ_RC_MindControlTestMostRecentResponseGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndFunction
