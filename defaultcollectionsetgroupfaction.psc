ScriptName DefaultCollectionSetGroupFaction Extends RefCollectionAlias default
{ sets a group faction on the aliased actors }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup

Faction Property GroupFaction Auto Const mandatory
{ group faction to set on the aliased actors }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.SetGroupFactionOnAll() ; #DEBUG_LINE_NO:14
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If abRemove == False ; #DEBUG_LINE_NO:19
    Self.SetGroupFaction(akObject as Actor) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetGroupFactionOnAll()
  Int I = 0 ; #DEBUG_LINE_NO:25
  Int count = Self.GetCount() ; #DEBUG_LINE_NO:26
  While I < count ; #DEBUG_LINE_NO:27
    Actor actorRef = Self.GetActorAt(I) ; #DEBUG_LINE_NO:28
    Self.SetGroupFaction(actorRef) ; #DEBUG_LINE_NO:29
    I += 1 ; #DEBUG_LINE_NO:30
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetGroupFaction(Actor actorToUpdate)
  If actorToUpdate ; #DEBUG_LINE_NO:35
    actorToUpdate.SetGroupFaction(GroupFaction) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndFunction
