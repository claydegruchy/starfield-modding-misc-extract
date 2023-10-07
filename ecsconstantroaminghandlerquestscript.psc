ScriptName ECSConstantRoamingHandlerQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Quest_Properties
  Int Property StageToSet = -1 Auto Const
  { The stage we want to set, presumably to end the quest }
  LocationAlias Property ShipInteriorLocation Auto Const mandatory
  { The Location Alias of the Ship's interior that we want to check, in case the player is inside when the quest tries to stop }
  ReferenceAlias Property PlayerShip Auto Const mandatory
  { The Player's ship }
  ReferenceAlias Property Ship Auto Const mandatory
  { The ship we want to move }
  ReferenceAlias Property ShipMarker Auto Const mandatory
  { The Marker we want to send the ship to in the new location when the quest starts }
  ReferenceAlias Property ShipHoldingMarker Auto Const mandatory
  { The Marker we want to send the ship to in the ship's holding cell before stopping the quest }
EndGroup

Group Timer_Properties
  Int Property ShipMoveTimerID = 1 Auto Const
  Float Property ShipMoveTimerLengthMin = 48.0 Auto Const
  { The minimum time, in game time hours, we want to wait before trying to stop the quest and start it again. }
  Float Property ShipMoveTimerLengthMax = 120.0 Auto Const
  { The maximum time, in game time hours, we want to wait before trying to stop the quest and start it again. }
  Int Property TryAgainTimerID = 2 Auto Const
  Float Property TryAgainTimerLength = 150.0 Auto Const
  { The length, in real time seconds to wait before trying to stop the quest again }
  Int Property UndockTimerID = 3 Auto Const
  Float Property UndockTimerLengthMin = 10.0 Auto Const
  { The minimum time, in real time seconds to wait before trying to stop the quest }
  Float Property UndockTimerLengthMax = 30.0 Auto Const
  { The maximum time, in real time seconds to wait before trying to stop the quest }
EndGroup


;-- Functions ---------------------------------------

Function TryToStopQuest()
  If !Self.GetStageDone(StageToSet) ; #DEBUG_LINE_NO:39
    If !Game.GetPlayer().IsInLocation(ShipInteriorLocation.GetLocation()) ; #DEBUG_LINE_NO:41
      spaceshipreference myPlayerShip = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:42
      spaceshipreference myShip = Ship.GetShipRef() ; #DEBUG_LINE_NO:43
      If !myPlayerShip.IsDockedWith(myShip) ; #DEBUG_LINE_NO:45
        myShip.DisableWithGravJump() ; #DEBUG_LINE_NO:46
        myShip.MoveTo(ShipHoldingMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:47
        If StageToSet >= 0 ; #DEBUG_LINE_NO:48
          Self.SetStage(StageToSet) ; #DEBUG_LINE_NO:49
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Self.StartTimer(TryAgainTimerLength, TryAgainTimerID) ; #DEBUG_LINE_NO:53
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.StartTimer(TryAgainTimerLength, TryAgainTimerID) ; #DEBUG_LINE_NO:58
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RandomJump()
  Int iRandom = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:64
  If iRandom == 0 ; #DEBUG_LINE_NO:65
    Float fRandom = Utility.RandomFloat(UndockTimerLengthMin, UndockTimerLengthMax) ; #DEBUG_LINE_NO:66
    Self.StartTimer(fRandom, UndockTimerID) ; #DEBUG_LINE_NO:67
    Self.TryToStopQuest() ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  Self.TryToStopQuest() ; #DEBUG_LINE_NO:74
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == TryAgainTimerID ; #DEBUG_LINE_NO:78
    Self.TryToStopQuest() ; #DEBUG_LINE_NO:79
  ElseIf aiTimerID == UndockTimerID ; #DEBUG_LINE_NO:80
    Self.TryToStopQuest() ; #DEBUG_LINE_NO:81
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestInit()
  Float fRandomGameTimeTimer = Utility.RandomFloat(ShipMoveTimerLengthMin, ShipMoveTimerLengthMax) ; #DEBUG_LINE_NO:86
  Self.StartTimerGameTime(fRandomGameTimeTimer, ShipMoveTimerID) ; #DEBUG_LINE_NO:87
  spaceshipreference myShip = Ship.GetShipRef() ; #DEBUG_LINE_NO:88
  myShip.MoveTo(ShipMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:89
  myShip.Enable(False) ; #DEBUG_LINE_NO:90
EndEvent
