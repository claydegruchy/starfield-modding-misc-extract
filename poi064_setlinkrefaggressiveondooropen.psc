ScriptName POI064_SetLinkRefAggressiveOnDoorOpen Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
{ Aggression actor value }
Float Property NewValue = 2.0 Auto Const
{ New value to set the linked ref's aggression once the door is open }

;-- Functions ---------------------------------------

Event OnOpen(ObjectReference akActionRef)
  ObjectReference myAct = (Self.GetLinkedRef(None) as Actor) as ObjectReference ; #DEBUG_LINE_NO:10
  If myAct != None ; #DEBUG_LINE_NO:12
    myAct.SetValue(Aggression, NewValue) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndEvent
