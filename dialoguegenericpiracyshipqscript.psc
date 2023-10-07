ScriptName DialogueGenericPiracyShipQScript Extends Quest

;-- Variables ---------------------------------------
Int iPiracy_Lose = 2
Int iPiracy_LoseGU = 3
Int iPiracy_Win = 1

;-- Properties --------------------------------------
ReferenceAlias Property DialogueGenericPiracyShips_Ship Auto Const mandatory
ActorValue Property DialogueGenericPiracyShipsAV Auto Const mandatory
ActorValue Property PiracySurrenderCountAV Auto Const mandatory
{ used to track number of ships that surrender to the player }
sq_parentscript Property SQ_Parent Auto Const mandatory
{ autofill }

;-- Functions ---------------------------------------

Function PiracySuccess(spaceshipreference ShipRef)
  ShipRef.SetValue(DialogueGenericPiracyShipsAV, iPiracy_Win as Float) ; #DEBUG_LINE_NO:18
  ShipRef.OpenInventory() ; #DEBUG_LINE_NO:19
  Self.SendPiracyAlarm(ShipRef, True) ; #DEBUG_LINE_NO:20
  Game.GetPlayer().ModValue(PiracySurrenderCountAV, 1.0) ; #DEBUG_LINE_NO:21
EndFunction

Function PiracyFail(spaceshipreference ShipRef)
  ShipRef.SetValue(DialogueGenericPiracyShipsAV, iPiracy_Lose as Float) ; #DEBUG_LINE_NO:27
  Self.SendPiracyAlarm(ShipRef, False) ; #DEBUG_LINE_NO:28
  ShipRef.StartCombat(Game.GetPlayer().GetCurrentShipRef(), False) ; #DEBUG_LINE_NO:29
EndFunction

Function PiracyLoseSpeechChallenge(spaceshipreference ShipRef)
  ShipRef.SetValue(DialogueGenericPiracyShipsAV, iPiracy_LoseGU as Float) ; #DEBUG_LINE_NO:35
  Self.SendPiracyAlarm(ShipRef, False) ; #DEBUG_LINE_NO:36
EndFunction

Function SendPiracyAlarm(spaceshipreference ShipRef, Bool PiracySuccess)
  SQ_Parent.SendPiracyEvent(ShipRef as ObjectReference, PiracySuccess) ; #DEBUG_LINE_NO:40
  ShipRef.SendPiracyAlarm() ; #DEBUG_LINE_NO:41
EndFunction
