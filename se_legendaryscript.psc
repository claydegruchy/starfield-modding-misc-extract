ScriptName SE_LegendaryScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property OrbitLocation Auto Const
Quest Property SE_ZW08_SpaceCell Auto Const mandatory
ReferenceAlias Property playerShip Auto Const
ReferenceAlias Property LegendaryShip Auto Const
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Int Property timerID = 1 Auto Const
Int Property GameHours = 48 Auto Const
Float Property PlayerDistanceCheck = 10000.0 Auto Const

;-- Functions ---------------------------------------

Bool Function MoveShip()
  Bool isShipMoving = False ; #DEBUG_LINE_NO:5
  If playerShip.GetRef().GetDistance(LegendaryShip.GetRef()) > PlayerDistanceCheck ; #DEBUG_LINE_NO:6
    OrbitLocation.RefillAlias() ; #DEBUG_LINE_NO:8
    If OrbitLocation.GetLocation() != None ; #DEBUG_LINE_NO:11
      isShipMoving = True ; #DEBUG_LINE_NO:12
      SE_ZW08_SpaceCell.Stop() ; #DEBUG_LINE_NO:14
      While SE_ZW08_SpaceCell.IsStopped() == False ; #DEBUG_LINE_NO:17
        Utility.Wait(0.5) ; #DEBUG_LINE_NO:18
      EndWhile ; #DEBUG_LINE_NO:
      SE_ZW08_SpaceCell.Start() ; #DEBUG_LINE_NO:22
    EndIf ; #DEBUG_LINE_NO:
    If Self.IsObjectiveDisplayed(10) && OrbitLocation.GetLocation() != None ; #DEBUG_LINE_NO:26
      Self.SetObjectiveDisplayed(10, True, True) ; #DEBUG_LINE_NO:27
    EndIf ; #DEBUG_LINE_NO:
    Alias_MapMarker.GetRef().SetMarkerDiscovered() ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
  Return isShipMoving ; #DEBUG_LINE_NO:31
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == timerID ; #DEBUG_LINE_NO:36
    If Self.MoveShip() == False ; #DEBUG_LINE_NO:37
      Self.StartMoveTimer() ; #DEBUG_LINE_NO:38
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartMoveTimer()
  Self.StartTimerGameTime(GameHours as Float, timerID) ; #DEBUG_LINE_NO:44
EndFunction

Function DebugTimerNow()
  Self.CancelTimerGameTime(1) ; #DEBUG_LINE_NO:48
  Self.StartTimerGameTime(0.000001, 1) ; #DEBUG_LINE_NO:49
EndFunction
