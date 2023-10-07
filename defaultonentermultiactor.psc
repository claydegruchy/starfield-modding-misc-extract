ScriptName DefaultOnEnterMultiActor Extends ObjectReference conditional default
{ script to test if one or more actors are in a trigger }

;-- Variables ---------------------------------------
Bool bSendEvent = False
Int targetCountCurrent
Int targetCountTotal

;-- Properties --------------------------------------
Group Required_Properties
  ActorBase[] Property TriggerActors Auto Const
  { actors that trigger is looking for - all actors in array must be in trigger
	NOTE: There must be at least one item in either TriggerActors or TriggerAliases }
  ReferenceAlias[] Property TriggerAliases Auto Const
  { Ref Aliases that trigger is looking for - all actors in array must be in trigger
	NOTE: There must be at least one item in either TriggerActors or TriggerAliases }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log. }
EndGroup

Bool Property bAllTargetsInTrigger = False Auto conditional hidden

;-- Functions ---------------------------------------

Function TriggerMe()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnInit()
  Int ActorArrayLength = TriggerActors.Length ; #DEBUG_LINE_NO:40
  Int AliasArrayLength = TriggerAliases.Length ; #DEBUG_LINE_NO:41
  targetCountTotal = ActorArrayLength + AliasArrayLength ; #DEBUG_LINE_NO:43
EndEvent

Function modTargetCount(Int modValue)
  targetCountCurrent += modValue ; #DEBUG_LINE_NO:69
  If targetCountCurrent >= targetCountTotal ; #DEBUG_LINE_NO:76
    If bAllTargetsInTrigger == False ; #DEBUG_LINE_NO:78
      bAllTargetsInTrigger = True ; #DEBUG_LINE_NO:80
      bSendEvent = True ; #DEBUG_LINE_NO:81
    Else ; #DEBUG_LINE_NO:
      bSendEvent = False ; #DEBUG_LINE_NO:83
    EndIf ; #DEBUG_LINE_NO:
  ElseIf bAllTargetsInTrigger == True ; #DEBUG_LINE_NO:87
    bAllTargetsInTrigger = False ; #DEBUG_LINE_NO:89
    bSendEvent = True ; #DEBUG_LINE_NO:90
  Else ; #DEBUG_LINE_NO:
    bSendEvent = False ; #DEBUG_LINE_NO:92
  EndIf ; #DEBUG_LINE_NO:
  If bSendEvent == True ; #DEBUG_LINE_NO:97
    Var[] kargs = new Var[1] ; #DEBUG_LINE_NO:99
    kargs[0] = bAllTargetsInTrigger as Var ; #DEBUG_LINE_NO:100
    Self.SendCustomEvent("defaultonentermultiactor_MultiActorTriggerReady", kargs) ; #DEBUG_LINE_NO:101
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function CheckTriggerRef(ObjectReference triggerRef)
  Bool bSuccess = False ; #DEBUG_LINE_NO:108
  If triggerRef ; #DEBUG_LINE_NO:110
    Actor triggerActor = triggerRef as Actor ; #DEBUG_LINE_NO:111
    If triggerActor ; #DEBUG_LINE_NO:113
      ActorBase triggerActorBase = triggerActor.GetBaseObject() as ActorBase ; #DEBUG_LINE_NO:115
      If TriggerActors.find(triggerActorBase, 0) >= 0 ; #DEBUG_LINE_NO:117
        bSuccess = True ; #DEBUG_LINE_NO:119
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If !bSuccess ; #DEBUG_LINE_NO:125
      Int AliasArrayElement = commonarrayfunctions.FindInReferenceAliasArray(triggerRef, TriggerAliases) ; #DEBUG_LINE_NO:126
      If AliasArrayElement < 0 ; #DEBUG_LINE_NO:127
        bSuccess = False ; #DEBUG_LINE_NO:128
      Else ; #DEBUG_LINE_NO:
        bSuccess = True ; #DEBUG_LINE_NO:130
      EndIf ; #DEBUG_LINE_NO:
      If bSuccess == False ; #DEBUG_LINE_NO:133
         ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return bSuccess ; #DEBUG_LINE_NO:139
EndFunction

;-- State -------------------------------------------
Auto State waiting

  Event OnTriggerLeave(ObjectReference triggerRef)
    If Self.CheckTriggerRef(triggerRef) ; #DEBUG_LINE_NO:
      Self.modTargetCount(-1) ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event onTriggerEnter(ObjectReference triggerRef)
    If Self.CheckTriggerRef(triggerRef) ; #DEBUG_LINE_NO:49
      Self.modTargetCount(1) ; #DEBUG_LINE_NO:51
      If bAllTargetsInTrigger ; #DEBUG_LINE_NO:53
        Self.TriggerMe() ; #DEBUG_LINE_NO:54
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
