ScriptName OneOfAKindQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CageDoor Auto Const mandatory
{ Ref alias for the Ecliptic base cage door. }

;-- Functions ---------------------------------------

Function OpenCageGate()
  ObjectReference CageREF = CageDoor.GetRef() ; #DEBUG_LINE_NO:7
  Int currOpenState = CageREF.GetOpenState() ; #DEBUG_LINE_NO:8
  If currOpenState == 1 ; #DEBUG_LINE_NO:10
    CageREF.SetOpen(False) ; #DEBUG_LINE_NO:11
  ElseIf currOpenState == 3 ; #DEBUG_LINE_NO:12
    CageREF.SetOpen(True) ; #DEBUG_LINE_NO:13
    Self.SetStage(200) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndFunction
