ScriptName RemoveFactionFromPlayerOnActivate Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property FactionToAdd Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:6
    Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:7
    player.RemoveFromFaction(FactionToAdd) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
