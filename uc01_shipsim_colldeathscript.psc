ScriptName UC01_ShipSim_CollDeathScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC01_ShipSim_CurrentWaveEnemyCountDefeated Auto Const mandatory
{ Global used to display how many enemies the player's knocked out in this wave }
Int Property EnemyCountObj = 300 Auto Const
{ Objective to update as the player defeats enemies }

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:10
  uc01_shipsimulationquestscript OQ = Self.GetOwningQuest() as uc01_shipsimulationquestscript ; #DEBUG_LINE_NO:12
  If Self.GetCount() <= 0 ; #DEBUG_LINE_NO:13
    UC01_ShipSim_CurrentWaveEnemyCountDefeated.SetValue(0.0) ; #DEBUG_LINE_NO:14
    OQ.UpdateCurrentInstanceGlobal(UC01_ShipSim_CurrentWaveEnemyCountDefeated) ; #DEBUG_LINE_NO:15
    OQ.EnemyDefeated() ; #DEBUG_LINE_NO:16
  Else ; #DEBUG_LINE_NO:
    UC01_ShipSim_CurrentWaveEnemyCountDefeated.Mod(1.0) ; #DEBUG_LINE_NO:18
    OQ.UpdateCurrentInstanceGlobal(UC01_ShipSim_CurrentWaveEnemyCountDefeated) ; #DEBUG_LINE_NO:19
    OQ.SetObjectiveDisplayedAtTop(EnemyCountObj) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:24
  akSenderRef.Disable(False) ; #DEBUG_LINE_NO:25
EndEvent
