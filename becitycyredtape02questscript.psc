ScriptName BECityCYRedTape02QuestScript Extends Quest

;-- Variables ---------------------------------------
Int CountdownTimerID = 1
Int UndockTimerID = 2

;-- Properties --------------------------------------
Int Property TimesUpStage = 32 Auto Const
Int Property GaveFuelStage = 41 Auto Const
Int Property SabotagedFuelStage = 42 Auto Const
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory
ReferenceAlias Property EnemyShip Auto Const mandatory
Topic Property BE_City_CY_RedTape02_Ship_JumpTopic Auto Const mandatory
Float Property CountdownTimerLength = 20.0 Auto Const
Float Property UndockTimerLength = 5.0 Auto Const

;-- Functions ---------------------------------------

Function StartCountdown()
  Self.StartTimer(CountdownTimerLength, CountdownTimerID) ; #DEBUG_LINE_NO:18
EndFunction

Function StopCountdown()
  Self.CancelTimer(CountdownTimerID) ; #DEBUG_LINE_NO:22
EndFunction

Function ShipUndock()
  If Self.GetStageDone(GaveFuelStage) || Self.GetStageDone(SabotagedFuelStage) ; #DEBUG_LINE_NO:26
    Self.StartTimer(UndockTimerLength, UndockTimerID) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ShipGoodbye()
  spaceshipreference myEnemyShip = EnemyShip.GetShipRef() ; #DEBUG_LINE_NO:32
  myEnemyShip.Say(BE_City_CY_RedTape02_Ship_JumpTopic, None, False, None) ; #DEBUG_LINE_NO:33
  If Self.GetStageDone(GaveFuelStage) ; #DEBUG_LINE_NO:34
    myEnemyShip.EnablePartRepair(ShipSystemEngineHealth, True) ; #DEBUG_LINE_NO:35
    myEnemyShip.RestoreValue(ShipSystemEngineHealth, 100000.0) ; #DEBUG_LINE_NO:36
    myEnemyShip.DisableWithGravJump() ; #DEBUG_LINE_NO:37
  ElseIf Self.GetStageDone(SabotagedFuelStage) ; #DEBUG_LINE_NO:38
    myEnemyShip.Kill(None) ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RemoveShipParts()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:45
  spaceshipreference myShip = PlayerShip.GetShipReference() ; #DEBUG_LINE_NO:46
  If myPlayer.GetItemCount(ShipRepairKit as Form) >= 1 ; #DEBUG_LINE_NO:48
    myPlayer.RemoveItem(ShipRepairKit as Form, 1, False, None) ; #DEBUG_LINE_NO:49
  ElseIf myShip.GetItemCount(ShipRepairKit as Form) >= 1 ; #DEBUG_LINE_NO:50
    myShip.RemoveItem(ShipRepairKit as Form, 1, False, None) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == CountdownTimerID ; #DEBUG_LINE_NO:57
    Self.SetStage(TimesUpStage) ; #DEBUG_LINE_NO:58
  ElseIf aiTimerID == UndockTimerID ; #DEBUG_LINE_NO:59
    Self.ShipGoodbye() ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
EndEvent
