ScriptName TestGym_FXSeqOnOff Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
String Property SeqName = "TestSmoothLoop01" Auto
Bool Property OnOff = False Auto
ObjectReference Property TargetArt Auto

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If OnOff == True ; #DEBUG_LINE_NO:10
    OnOff = False ; #DEBUG_LINE_NO:11
    TargetArt.StopSequence(SeqName) ; #DEBUG_LINE_NO:14
  ElseIf OnOff == False ; #DEBUG_LINE_NO:16
    OnOff = True ; #DEBUG_LINE_NO:17
    TargetArt.StartSequence(SeqName, True, 1.0) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent
