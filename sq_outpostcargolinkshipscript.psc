ScriptName SQ_OutpostCargoLinkShipScript Extends SpaceshipReference

;-- Variables ---------------------------------------
Float WaitForFuelGameHours
Float WaitToLoadCargoGameHours
Float WaitToTakeoffGameHours
Float fCalendarTimeScaleGround
Bool timersInitialized

;-- Properties --------------------------------------
sq_outpostcargolinkscript Property SQ_OutpostCargoLink Auto Const mandatory
Keyword Property LinkOutpostCargoShipLandingMarker01 Auto Const mandatory
Keyword Property LinkOutpostCargoShipLandingMarker02 Auto Const mandatory
Keyword Property LinkOutpostCargoShipLandingMarkerCurrent Auto Const mandatory
Keyword Property LandingMarkerKeyword Auto Const mandatory
{ used to find landing marker }
Keyword Property LandingZoneTriggerKeyword Auto Const mandatory
{ used to find landing zone trigger }
ActorValue Property OutpostCargoLinkShipDestination Auto Const mandatory
{ use to condition packages }
Bool Property RequiresFuel = False Auto hidden
{ if false, ignore CanProduce checks
    set by script when created }
String Property fCalendarTimeScaleGroundString = "fCalendarTimeScaleGround" Auto Const
{ gamesetting for time scale multiplier on real time for game time: game time = real time * fCalendarTimeScaleGround }
Int Property WaitToLoadCargoTimerID = 0 Auto Const
Float Property WaitToLoadCargoSeconds = 30.0 Auto Const
{ 0.04 game hours = 30 seconds of real time }
Int Property WaitToTakeoffTimerID = 1 Auto Const
Float Property WaitToTakeoffSeconds = 15.0 Auto Const
{ 0.02 game hours = 15 seconds of real time }
Int Property WaitForFuelTimerID = 2 Auto Const
Float Property WaitForFuelSeconds = 30.0 Auto Const
{ 0.04 game hours = 30 seconds of real time }

;-- Functions ---------------------------------------

Event OnInit()
  Self.InitializeTimers() ; #DEBUG_LINE_NO:46
EndEvent

Function InitializeTimers()
  If timersInitialized == False ; #DEBUG_LINE_NO:50
    timersInitialized = True ; #DEBUG_LINE_NO:51
    fCalendarTimeScaleGround = Game.GetGameSettingFloat(fCalendarTimeScaleGroundString) ; #DEBUG_LINE_NO:52
    Float secondsToHours = 3600.0 ; #DEBUG_LINE_NO:53
    WaitToLoadCargoGameHours = WaitToLoadCargoSeconds / secondsToHours * fCalendarTimeScaleGround ; #DEBUG_LINE_NO:54
    WaitToTakeoffGameHours = WaitToTakeoffSeconds / secondsToHours * fCalendarTimeScaleGround ; #DEBUG_LINE_NO:55
    WaitForFuelGameHours = WaitForFuelSeconds / secondsToHours * fCalendarTimeScaleGround ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CancelTimers()
  Self.CancelTimerGameTime(WaitToLoadCargoTimerID) ; #DEBUG_LINE_NO:64
  Self.CancelTimerGameTime(WaitForFuelTimerID) ; #DEBUG_LINE_NO:65
  Self.CancelTimerGameTime(WaitToTakeoffTimerID) ; #DEBUG_LINE_NO:66
EndFunction

Function ArriveAtOutpost()
  Bool canproduce = Self.TransferCargo(True) ; #DEBUG_LINE_NO:72
  If canproduce || RequiresFuel == False ; #DEBUG_LINE_NO:73
    Float gameTimeHours = WaitToLoadCargoGameHours ; #DEBUG_LINE_NO:76
    Self.StartTimerGameTime(gameTimeHours, WaitToLoadCargoTimerID) ; #DEBUG_LINE_NO:78
  Else ; #DEBUG_LINE_NO:
    Float gametimehours = WaitForFuelGameHours ; #DEBUG_LINE_NO:82
    Self.StartTimerGameTime(gametimehours, WaitForFuelTimerID) ; #DEBUG_LINE_NO:84
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function LeaveOutpost()
  ObjectReference landingMarker01Ref = Self.GetLinkedRef(LinkOutpostCargoShipLandingMarker01) ; #DEBUG_LINE_NO:91
  ObjectReference landingMarker02Ref = Self.GetLinkedRef(LinkOutpostCargoShipLandingMarker02) ; #DEBUG_LINE_NO:92
  ObjectReference landingMarkerCurrent = Self.GetLinkedRef(LinkOutpostCargoShipLandingMarkerCurrent) ; #DEBUG_LINE_NO:94
  Bool bAtOutpost01 = False ; #DEBUG_LINE_NO:96
  If landingMarkerCurrent == landingMarker01Ref ; #DEBUG_LINE_NO:97
    bAtOutpost01 = True ; #DEBUG_LINE_NO:98
    Self.SetLinkedRef(landingMarker02Ref, LinkOutpostCargoShipLandingMarkerCurrent, True) ; #DEBUG_LINE_NO:99
    Self.SetValue(OutpostCargoLinkShipDestination, 1.0) ; #DEBUG_LINE_NO:100
  Else ; #DEBUG_LINE_NO:
    bAtOutpost01 = False ; #DEBUG_LINE_NO:102
    Self.SetLinkedRef(landingMarker01Ref, LinkOutpostCargoShipLandingMarkerCurrent, True) ; #DEBUG_LINE_NO:103
    Self.SetValue(OutpostCargoLinkShipDestination, 0.0) ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
  Self.EvaluatePackage(False) ; #DEBUG_LINE_NO:106
  SQ_OutpostCargoLink.ShipLanding(Self as SpaceshipReference, bAtOutpost01, SQ_OutpostCargoLink.stateEnum02_landing) ; #DEBUG_LINE_NO:107
EndFunction

Bool Function TransferCargo(Bool bUnloadCargo)
  Bool bAtOutpost01 = Self.GetLinkedRef(LinkOutpostCargoShipLandingMarkerCurrent) == Self.GetLinkedRef(LinkOutpostCargoShipLandingMarker01) ; #DEBUG_LINE_NO:112
  Bool canproduce = SQ_OutpostCargoLink.TransferCargo(Self, bAtOutpost01, bUnloadCargo) ; #DEBUG_LINE_NO:113
  Return canproduce ; #DEBUG_LINE_NO:114
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  Self.InitializeTimers() ; #DEBUG_LINE_NO:119
  If Self.IsDisabled() ; #DEBUG_LINE_NO:121
    Return  ; #DEBUG_LINE_NO:122
  EndIf ; #DEBUG_LINE_NO:
  If aiTimerID == WaitToLoadCargoTimerID ; #DEBUG_LINE_NO:125
    Self.TransferCargo(False) ; #DEBUG_LINE_NO:127
    Float gameTimeHours = WaitToTakeoffGameHours ; #DEBUG_LINE_NO:129
    Self.StartTimerGameTime(gameTimeHours, WaitToTakeoffTimerID) ; #DEBUG_LINE_NO:131
  ElseIf aiTimerID == WaitToTakeoffTimerID ; #DEBUG_LINE_NO:132
    Self.LeaveOutpost() ; #DEBUG_LINE_NO:133
  ElseIf aiTimerID == WaitForFuelTimerID ; #DEBUG_LINE_NO:134
    Self.ArriveAtOutpost() ; #DEBUG_LINE_NO:135
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnShipLanding(Bool abComplete)
  Bool bAtOutpost01 = Self.GetLinkedRef(LinkOutpostCargoShipLandingMarkerCurrent) == Self.GetLinkedRef(LinkOutpostCargoShipLandingMarker01) ; #DEBUG_LINE_NO:140
  If abComplete == False ; #DEBUG_LINE_NO:141
    ObjectReference landingMarker = Self.GetLinkedRef(LandingMarkerKeyword) ; #DEBUG_LINE_NO:142
    If landingMarker ; #DEBUG_LINE_NO:144
      landingzonetriggerscript landingZoneTrigger = landingMarker.GetLinkedRef(LandingZoneTriggerKeyword) as landingzonetriggerscript ; #DEBUG_LINE_NO:146
      If landingZoneTrigger ; #DEBUG_LINE_NO:147
        landingZoneTrigger.BeginLanding(Self as SpaceshipReference, landingMarker) ; #DEBUG_LINE_NO:148
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    SQ_OutpostCargoLink.ShipLanding(Self as SpaceshipReference, bAtOutpost01, SQ_OutpostCargoLink.stateEnum02_landing) ; #DEBUG_LINE_NO:151
  Else ; #DEBUG_LINE_NO:
    SQ_OutpostCargoLink.ShipLanding(Self as SpaceshipReference, bAtOutpost01, SQ_OutpostCargoLink.stateEnum03_landed) ; #DEBUG_LINE_NO:153
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnShipTakeOff(Bool abComplete)
  If abComplete ; #DEBUG_LINE_NO:158
    Bool bAtOutpost01 = Self.GetLinkedRef(LinkOutpostCargoShipLandingMarkerCurrent) == Self.GetLinkedRef(LinkOutpostCargoShipLandingMarker02) ; #DEBUG_LINE_NO:159
    SQ_OutpostCargoLink.ShipLanding(Self as SpaceshipReference, bAtOutpost01, SQ_OutpostCargoLink.stateEnum01_linked) ; #DEBUG_LINE_NO:160
  EndIf ; #DEBUG_LINE_NO:
EndEvent
