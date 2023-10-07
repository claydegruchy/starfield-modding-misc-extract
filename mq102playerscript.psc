ScriptName MQ102PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property LC099NovaShipyardLocation Auto Const mandatory
Faction Property EclipticFaction Auto Const mandatory
Int Property EclipticCommentStage = 540 Auto Const

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnKill(ObjectReference akVictim)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnKill(ObjectReference akVictim)
    If (akVictim as Actor).IsInFaction(EclipticFaction) && Game.GetPlayer().IsInLocation(LC099NovaShipyardLocation) ; #DEBUG_LINE_NO:9
      Self.GotoState("HasBeenTriggered") ; #DEBUG_LINE_NO:10
      Self.GetOwningQuest().SetStage(EclipticCommentStage) ; #DEBUG_LINE_NO:11
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
