ScriptName DefaultAliasSetGroupFaction Extends ReferenceAlias default
{ sets a group faction on the aliased actor }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup

Faction Property GroupFaction Auto Const mandatory
{ group faction to set on the aliased actor }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.SetGroupFaction() ; #DEBUG_LINE_NO:14
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If abRemove == False ; #DEBUG_LINE_NO:19
    Self.SetGroupFaction() ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetGroupFaction()
  Actor actorRef = Self.GetActorReference() ; #DEBUG_LINE_NO:25
  If actorRef ; #DEBUG_LINE_NO:26
    actorRef.SetGroupFaction(GroupFaction) ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndFunction
