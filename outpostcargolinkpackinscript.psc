ScriptName OutpostCargoLinkPackinScript Extends ObjectReference Const
{ passes on events to linked ref }

;-- Functions ---------------------------------------

Event OnLoad()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopCargoLinkChanged(ObjectReference akOldTarget, ObjectReference akNewTarget)
  outpostcargolinkmarkerscript myLinkedRef = Self.GetLinkedRef(None) as outpostcargolinkmarkerscript ; #DEBUG_LINE_NO:9
  If myLinkedRef ; #DEBUG_LINE_NO:11
    myLinkedRef.OnWorkshopCargoLinkChanged(akOldTarget, akNewTarget) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akActionRef)
  outpostcargolinkmarkerscript myLinkedRef = Self.GetLinkedRef(None) as outpostcargolinkmarkerscript ; #DEBUG_LINE_NO:17
  If myLinkedRef ; #DEBUG_LINE_NO:19
    myLinkedRef.OnWorkshopObjectRemoved(akActionRef) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent
