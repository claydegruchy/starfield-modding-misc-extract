ScriptName MQ104APlayerShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property Planet01ScanStage = 24 Auto Const
Int Property Planet02ScanStage = 34 Auto Const
Int Property ScanPrereqStage = 20 Auto Const
LocationAlias Property Location01Planet Auto Const mandatory
LocationAlias Property Location02Planet Auto Const mandatory

;-- Functions ---------------------------------------

Event OnShipScan(Location aPlanet, ObjectReference[] aMarkersArray)
  Location Planet01Loc = Location01Planet.GetLocation() ; #DEBUG_LINE_NO:10
  Location Planet02Loc = Location02Planet.GetLocation() ; #DEBUG_LINE_NO:11
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:12
  If aPlanet == Planet01Loc && myQuest.GetStageDone(ScanPrereqStage) && myQuest.GetStageDone(Planet01ScanStage) == False ; #DEBUG_LINE_NO:15
    myQuest.SetStage(Planet01ScanStage) ; #DEBUG_LINE_NO:16
  ElseIf aPlanet == Planet02Loc && myQuest.GetStageDone(ScanPrereqStage) && myQuest.GetStageDone(Planet02ScanStage) == False ; #DEBUG_LINE_NO:17
    myQuest.SetStage(Planet02ScanStage) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent
