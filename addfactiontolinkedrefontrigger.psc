ScriptName AddFactionToLinkedRefOnTrigger Extends ObjectReference Const
{ Add Faction to linked actors on trigger. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property FactionToAdd Auto Const mandatory
Keyword Property LinkKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  ObjectReference[] LinkedRefs = Self.GetLinkedRefChain(LinkKeyword, 100) ; #DEBUG_LINE_NO:9
  Int I = 0 ; #DEBUG_LINE_NO:10
  While I < LinkedRefs.Length ; #DEBUG_LINE_NO:11
    (LinkedRefs[I] as Actor).AddToFaction(FactionToAdd) ; #DEBUG_LINE_NO:12
    I += 1 ; #DEBUG_LINE_NO:13
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
