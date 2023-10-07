ScriptName PilotSeatFurnitureScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool suppressDefaultActivationBlockedMessage

;-- Properties --------------------------------------
Message Property PilotSeatNotAuthorizedMessage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && Self.IsActivationBlocked() && !suppressDefaultActivationBlockedMessage ; #DEBUG_LINE_NO:9
    PilotSeatNotAuthorizedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function suppressDefaultActivationBlockedMessage(Bool shouldSuppress)
  suppressDefaultActivationBlockedMessage = shouldSuppress ; #DEBUG_LINE_NO:15
EndFunction
