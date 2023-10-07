ScriptName UC09_ContinueAddressTrigger Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Abello Auto Const mandatory
{ Reference alias for President Abello }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference PlayerREF = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:7
  If akActionRef == PlayerREF ; #DEBUG_LINE_NO:8
    Abello.GetRef().Activate(PlayerREF, False) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
