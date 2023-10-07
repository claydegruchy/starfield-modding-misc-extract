ScriptName OutpostCargoLinkLightScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property OutpostCargoLinkLightsKeyword Auto Const mandatory
{ used to get my outpost cargo link }
ActorValue Property OutpostCargoLinkAnimState Auto Const mandatory
{ actor value to set on myself for code to use as default ship carry weight }

;-- Functions ---------------------------------------

Event OnLoad()
  outpostcargolinkmarkerscript myCargoLinkRef = Self.GetLinkedRef(OutpostCargoLinkLightsKeyword) as outpostcargolinkmarkerscript ; #DEBUG_LINE_NO:10
  If myCargoLinkRef ; #DEBUG_LINE_NO:11
    Self.RegisterForCustomEvent(myCargoLinkRef as ScriptObject, "outpostcargolinkmarkerscript_SetAnimationStateEvent") ; #DEBUG_LINE_NO:12
    Int stateEnum = myCargoLinkRef.GetValueInt(OutpostCargoLinkAnimState) ; #DEBUG_LINE_NO:14
    sq_outpostcargolinkscript:animdata theData = myCargoLinkRef.SQ_OutpostCargoLink.GetAnimationData(stateEnum) ; #DEBUG_LINE_NO:15
    If theData ; #DEBUG_LINE_NO:16
      Self.PlayAnimation(theData.lightColorEvent) ; #DEBUG_LINE_NO:17
      Self.PlayAnimation(theData.lightStateEvent) ; #DEBUG_LINE_NO:18
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OutpostCargoLinkMarkerScript.SetAnimationStateEvent(outpostcargolinkmarkerscript akSender, Var[] akArgs)
  sq_outpostcargolinkscript:animdata theData = akArgs[0] as sq_outpostcargolinkscript:animdata ; #DEBUG_LINE_NO:25
  If theData ; #DEBUG_LINE_NO:26
    Self.PlayAnimation(theData.lightColorEvent) ; #DEBUG_LINE_NO:27
    Self.PlayAnimation(theData.lightStateEvent) ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.UnregisterForAllCustomEvents() ; #DEBUG_LINE_NO:33
EndEvent
