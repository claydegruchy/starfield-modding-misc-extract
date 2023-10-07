ScriptName MissionCargoLinkActivatorScript Extends ObjectReference
{ blocks activation unless allowed by quest }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MissionCargoLinkActivatorBlockedMessage Auto Const
{ message to show if activated when inactive }

;-- Functions ---------------------------------------

Event OnLoad()
  Self.BlockActivation(True, False) ; #DEBUG_LINE_NO:8
EndEvent

Function AllowActivation(Bool bActivationAllowed)
  If bActivationAllowed ; #DEBUG_LINE_NO:12
    Self.gotoState("active") ; #DEBUG_LINE_NO:13
  Else ; #DEBUG_LINE_NO:
    Self.gotoState("inactive") ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State active

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State inactive

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:21
      MissionCargoLinkActivatorBlockedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:22
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
