ScriptName MQ101PirateLandingShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ101LandingEncounter01 Auto Const

;-- State -------------------------------------------
Auto State WaitingToTrigger

  Event OnShipLanding(Bool abComplete)
    If MQ101LandingEncounter01.IsRunning() == False ; #DEBUG_LINE_NO:7
      Self.GotoState("hasbeentriggered") ; #DEBUG_LINE_NO:8
      MQ101LandingEncounter01.Start() ; #DEBUG_LINE_NO:9
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State hasbeentriggered
EndState
