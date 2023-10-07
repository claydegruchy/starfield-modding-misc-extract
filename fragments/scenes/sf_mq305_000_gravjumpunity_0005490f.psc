ScriptName Fragments:Scenes:SF_MQ305_000_GravJumpUnity_0005490F Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const
VisualEffect Property ShipGravJumpSpaceVFX Auto Const mandatory
MusicType Property MUSGenesisStingerGravJumpUnity Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:7
  PlayerShip.GetShipRef().SetGhost(True) ; #DEBUG_LINE_NO:8
  ShipGravJumpSpaceVFX.Play(PlayerShip.GetRef(), -1.0, None) ; #DEBUG_LINE_NO:9
  MUSGenesisStingerGravJumpUnity.Add() ; #DEBUG_LINE_NO:10
  Game.HideHudMenus() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_End()
  mq305script kmyQuest = Self.GetOwningQuest() as mq305script ; #DEBUG_LINE_NO:19
  PlayerShip.GetShipRef().SetGhost(False) ; #DEBUG_LINE_NO:22
  kmyQuest.GravJumpToUnity() ; #DEBUG_LINE_NO:23
  ShipGravJumpSpaceVFX.Stop(PlayerShip.GetRef()) ; #DEBUG_LINE_NO:24
EndFunction
