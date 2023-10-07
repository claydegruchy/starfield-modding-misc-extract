ScriptName COM_Quest_SamCoe_Q01_LocationScript Extends ReferenceAlias
{ Script to ensure quest does not break if player leaves in the middle of Sam's scene with Lillian }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property VictorLocation Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_CoraCoe Auto Const mandatory
Scene Property COM_SamCoeQ01_0750_LillianAlert Auto Const mandatory
Keyword Property LinkCustom04 Auto Const mandatory
Int Property PrereqStage = 750 Auto Const
Int Property DoneStage = 775 Auto Const
Int Property DistanceCheck = 10 Auto Const

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Location myLandingArea = VictorLocation.GetLocation() ; #DEBUG_LINE_NO:21
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:22
  If myQuest.GetStageDone(PrereqStage) && !myQuest.GetStageDone(DoneStage) ; #DEBUG_LINE_NO:24
    If akOldLoc == myLandingArea && COM_SamCoeQ01_0750_LillianAlert.IsPlaying() ; #DEBUG_LINE_NO:25
      COM_SamCoeQ01_0750_LillianAlert.Stop() ; #DEBUG_LINE_NO:27
    ElseIf akNewLoc == myLandingArea ; #DEBUG_LINE_NO:28
      ObjectReference SamCoeRef = Alias_SamCoe.GetRef() ; #DEBUG_LINE_NO:30
      ObjectReference SamCoeFurnitureRef = SamCoeRef.GetLinkedRef(LinkCustom04) ; #DEBUG_LINE_NO:31
      ObjectReference CoraCoeRef = Alias_CoraCoe.GetRef() ; #DEBUG_LINE_NO:32
      ObjectReference CoraCoeFurnitureRef = CoraCoeRef.GetLinkedRef(LinkCustom04) ; #DEBUG_LINE_NO:33
      If SamCoeRef.GetDistance(SamCoeFurnitureRef) > DistanceCheck as Float ; #DEBUG_LINE_NO:36
        SamCoeRef.MoveTo(SamCoeFurnitureRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:37
      EndIf ; #DEBUG_LINE_NO:
      If CoraCoeRef.GetDistance(CoraCoeFurnitureRef) > DistanceCheck as Float ; #DEBUG_LINE_NO:39
        CoraCoeRef.MoveTo(CoraCoeFurnitureRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:40
      EndIf ; #DEBUG_LINE_NO:
      If !COM_SamCoeQ01_0750_LillianAlert.IsPlaying() ; #DEBUG_LINE_NO:43
        COM_SamCoeQ01_0750_LillianAlert.Start() ; #DEBUG_LINE_NO:44
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
