ScriptName xxDefaultRefAmbushTrigger Extends ObjectReference Const default
{ set the AmbushTriggered actor value on this ref when player enters }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  ActorValue Property AmbushTriggered Auto Const mandatory
  { autofill }
  Keyword Property LinkAmbushTrigger Auto Const mandatory
  { autofill }
EndGroup

Group Optional_Properties
  Bool Property TriggerIfAnyLinkedActorEntersCombat = True Auto Const
  { TRUE = any linked actor that enters combat sets AmbushTriggered to 1
	  FALSE = only set AmbushTrigger to 1 if player enters me }
EndGroup


;-- Functions ---------------------------------------

Event OnCellLoad()
  If TriggerIfAnyLinkedActorEntersCombat ; #DEBUG_LINE_NO:20
    Actor[] myChildren = Self.GetRefsLinkedToMe(LinkAmbushTrigger, None) as Actor[] ; #DEBUG_LINE_NO:21
    Int I = 0 ; #DEBUG_LINE_NO:22
    While I < myChildren.Length ; #DEBUG_LINE_NO:23
      Self.RegisterForRemoteEvent(myChildren[I] as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:24
      I += 1 ; #DEBUG_LINE_NO:25
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:32
    Self.TriggerAmbush() ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function TriggerAmbush()
  Self.SetValue(AmbushTriggered, 1.0) ; #DEBUG_LINE_NO:38
  Actor[] myChildren = Self.GetRefsLinkedToMe(LinkAmbushTrigger, None) as Actor[] ; #DEBUG_LINE_NO:39
  Int I = 0 ; #DEBUG_LINE_NO:40
  While I < myChildren.Length ; #DEBUG_LINE_NO:41
    myChildren[I].EvaluatePackage(False) ; #DEBUG_LINE_NO:42
    I += 1 ; #DEBUG_LINE_NO:43
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState == 1 ; #DEBUG_LINE_NO:50
    Self.SetValue(AmbushTriggered, 1.0) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndEvent
