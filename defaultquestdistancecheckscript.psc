ScriptName DefaultQuestDistanceCheckScript Extends Quest Const default
{ Checks alias's distance to player, then sets stage }

;-- Structs -----------------------------------------
Struct DistanceCheckStage
  ReferenceAlias TargetAlias
  { The alias we're interested in }
  Int StageToSet = -1
  { Stage to Set }
  Float TargetDistance
  { The needed distance between this and the target }
  Bool DistanceLessThan = True
  { OPTIONAL - If true (default) checks if distance is less than. If false, checks if distance is greater than. }
  Int PrereqStage = -1
  { OPTIONAL - Stage that must be set for this script's functionality to execute }
  Int TurnOffStage = -1
  { OPTIONAL - If stage >= TurnOffStage, this script's functionality is ignored }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
defaultquestdistancecheckscript:distancecheckstage[] Property DistanceCheckStages Auto Const
{ array of stage/distance check data }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:31
  Int I = 0 ; #DEBUG_LINE_NO:33
  While I < DistanceCheckStages.Length ; #DEBUG_LINE_NO:34
    defaultquestdistancecheckscript:distancecheckstage theDistanceCheck = DistanceCheckStages[I] ; #DEBUG_LINE_NO:35
    Self.RegisterForDistanceCheck(theDistanceCheck, player as ObjectReference) ; #DEBUG_LINE_NO:36
    I += 1 ; #DEBUG_LINE_NO:37
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.CheckDistanceStages(True, akObj2) ; #DEBUG_LINE_NO:44
EndEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.CheckDistanceStages(False, akObj2) ; #DEBUG_LINE_NO:50
EndEvent

Event OnStageSet(Int auiStageID, Int auiItemID)
  Int index = 0 ; #DEBUG_LINE_NO:55
  While index > -1 && index < DistanceCheckStages.Length ; #DEBUG_LINE_NO:57
    index = DistanceCheckStages.findstruct("PrereqStage", auiStageID, index) ; #DEBUG_LINE_NO:58
    If index > -1 ; #DEBUG_LINE_NO:59
      defaultquestdistancecheckscript:distancecheckstage theDistanceCheck = DistanceCheckStages[index] ; #DEBUG_LINE_NO:60
      If Self.GetStageDone(theDistanceCheck.StageToSet) == False && (theDistanceCheck.TurnOffStage == -1 || Self.GetStage() < theDistanceCheck.TurnOffStage) ; #DEBUG_LINE_NO:63
        Self.RegisterForDistanceCheck(theDistanceCheck, Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:65
      EndIf ; #DEBUG_LINE_NO:
      index += 1 ; #DEBUG_LINE_NO:67
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Function CheckDistanceStages(Bool bDistanceLessThan, ObjectReference theRef)
  Int I = 0 ; #DEBUG_LINE_NO:73
  While I < DistanceCheckStages.Length ; #DEBUG_LINE_NO:74
    defaultquestdistancecheckscript:distancecheckstage theDistanceCheck = DistanceCheckStages[I] ; #DEBUG_LINE_NO:75
    If theDistanceCheck.TargetAlias.GetRef() == theRef && theDistanceCheck.DistanceLessThan == bDistanceLessThan ; #DEBUG_LINE_NO:76
      If theDistanceCheck.TurnOffStage == -1 || Self.GetStage() < theDistanceCheck.TurnOffStage ; #DEBUG_LINE_NO:78
        Self.SetStage(theDistanceCheck.StageToSet) ; #DEBUG_LINE_NO:80
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:83
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RegisterForDistanceCheck(defaultquestdistancecheckscript:distancecheckstage theDistanceCheck, ObjectReference targetRef)
  If theDistanceCheck.PrereqStage == -1 || Self.GetStageDone(theDistanceCheck.PrereqStage) ; #DEBUG_LINE_NO:90
    If theDistanceCheck.DistanceLessThan ; #DEBUG_LINE_NO:92
      Self.RegisterForDistanceLessThanEvent(targetRef as ScriptObject, theDistanceCheck.TargetAlias as ScriptObject, theDistanceCheck.TargetDistance, 0) ; #DEBUG_LINE_NO:94
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForDistanceGreaterThanEvent(targetRef as ScriptObject, theDistanceCheck.TargetAlias as ScriptObject, theDistanceCheck.TargetDistance, 0) ; #DEBUG_LINE_NO:97
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
