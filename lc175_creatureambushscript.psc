ScriptName LC175_CreatureAmbushScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
Keyword Property LC175_CreatureLinkKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Event OnOpen(ObjectReference akActionRef)
  ObjectReference[] CagedAnimalRef = Self.GetRef().GetLinkedRefChain(LC175_CreatureLinkKeyword, 100) ; #DEBUG_LINE_NO:10
  Int I = 0 ; #DEBUG_LINE_NO:11
  While I < CagedAnimalRef.Length ; #DEBUG_LINE_NO:12
    (CagedAnimalRef[I] as Actor).RemoveFromFaction(CaptiveFaction) ; #DEBUG_LINE_NO:13
    CagedAnimalRef[I].SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:14
    I += 1 ; #DEBUG_LINE_NO:15
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
