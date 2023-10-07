ScriptName SetFactionOnDoorOpen Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property FactionToSet Auto Const
Keyword Property TargetActorKeyword Auto Const

;-- Functions ---------------------------------------

Event OnOpen(ObjectReference akActionRef)
  Actor targetActor = Self.GetLinkedRef(TargetActorKeyword) as Actor ; #DEBUG_LINE_NO:7
  If targetActor != None ; #DEBUG_LINE_NO:8
    targetActor.AddToFaction(FactionToSet) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
