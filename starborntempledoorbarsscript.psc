ScriptName StarbornTempleDoorBarsScript Extends ObjectReference
{ Script for the Starborn Temple Door Bars. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group BaseProperties collapsedonref
  Float Property AnimateDistanceOpen = 6.0 Auto Const
  Float Property AnimateDistanceClose = 10.0 Auto Const
  String Property OpenAnimation = "Play01" Auto Const
  String Property CloseAnimation = "Play02" Auto Const
EndGroup

Group RefProperties collapsedonbase
  Bool Property ShouldRegisterForOpenEvent = True Auto
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If ShouldRegisterForOpenEvent ; #DEBUG_LINE_NO:17
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceOpen, 0) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetShouldRegisterForOpenEvent(Bool shouldRegister)
  ShouldRegisterForOpenEvent = shouldRegister ; #DEBUG_LINE_NO:23
  If shouldRegister ; #DEBUG_LINE_NO:24
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceOpen, 0) ; #DEBUG_LINE_NO:25
  Else ; #DEBUG_LINE_NO:
    Self.UnregisterForDistanceEvents(Self as ScriptObject, Game.GetPlayer() as ScriptObject, -1) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.PlayAnimationAndWait(OpenAnimation, "Done") ; #DEBUG_LINE_NO:33
  Self.RegisterForDistanceGreaterThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceClose, 0) ; #DEBUG_LINE_NO:34
EndEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.PlayAnimationAndWait(CloseAnimation, "Done") ; #DEBUG_LINE_NO:38
  Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceOpen, 0) ; #DEBUG_LINE_NO:39
EndEvent
