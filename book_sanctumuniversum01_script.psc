ScriptName Book_SanctumUniversum01_Script Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_NA_Aquilus01 Auto Const mandatory
GlobalVariable Property City_NA_Aquilus01_BookRead Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference ActionRef)
  If ActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:10
    If City_NA_Aquilus01.GetStageDone(100) == True ; #DEBUG_LINE_NO:12
      City_NA_Aquilus01.SetStage(300) ; #DEBUG_LINE_NO:13
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnRead()
  If City_NA_Aquilus01_BookRead.GetValue() == 0.0 ; #DEBUG_LINE_NO:23
    City_NA_Aquilus01_BookRead.SetValue(1.0) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent
