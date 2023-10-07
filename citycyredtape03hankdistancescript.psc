ScriptName CityCYRedTape03HankDistanceScript Extends Quest
{ Checks Hank's distance to his ship, then sets stage }

;-- Structs -----------------------------------------
Struct DistanceCheckStage
  Int StageToSet = -1
  { Stage to Set }
  Float TargetDistance
  { The needed distance between this and the target }
  Int PrereqStage = -1
  { OPTIONAL - Stage that must be set for this script's functionality to execute }
  Int TurnOffStageDone = -1
  { OPTIONAL - If stage TurnOffStageDone is set, this script's functionality is ignored }
EndStruct


;-- Variables ---------------------------------------
Int I = 0

;-- Properties --------------------------------------
ReferenceAlias Property Hank Auto Const mandatory
ReferenceAlias Property EquipmentMarker Auto Const mandatory
citycyredtape03hankdistancescript:distancecheckstage[] Property DistanceCheckStages Auto Const
{ array of stage/distance check data }

;-- Functions ---------------------------------------

Function StartDistanceCheck()
  If I < DistanceCheckStages.Length ; #DEBUG_LINE_NO:29
    citycyredtape03hankdistancescript:distancecheckstage theDistanceCheck = DistanceCheckStages[I] ; #DEBUG_LINE_NO:30
    Self.RegisterForDistanceLessThanEvent(Hank.GetRef() as ScriptObject, EquipmentMarker.GetRef() as ScriptObject, theDistanceCheck.TargetDistance, 0) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  citycyredtape03hankdistancescript:distancecheckstage theDistanceCheck = DistanceCheckStages[I] ; #DEBUG_LINE_NO:39
  If (theDistanceCheck.PrereqStage == -1 || Self.GetStageDone(theDistanceCheck.PrereqStage)) && (theDistanceCheck.TurnOffStageDone == -1 || !Self.GetStageDone(theDistanceCheck.TurnOffStageDone)) ; #DEBUG_LINE_NO:40
    If I < DistanceCheckStages.Length ; #DEBUG_LINE_NO:41
      I += 1 ; #DEBUG_LINE_NO:42
    EndIf ; #DEBUG_LINE_NO:
    Self.SetStage(theDistanceCheck.StageToSet) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndEvent
