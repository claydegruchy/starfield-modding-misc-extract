ScriptName Fragments:Terminals:TERM_UC01_SimShipTerminal_Di_0003D5E7 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC01_ShipSimulatorHelperQuest Auto Const mandatory
spaceshipbase Property UC01_LvlShip_UC_A_Fighter_PossibleAlly01 Auto Const
GlobalVariable Property UC01_ShipSim_AllySpawned_Basic Auto Const mandatory
GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Weapons Auto Const mandatory
Perk Property UC01_DebugBuff_Weapons Auto Const mandatory
Perk Property UC01_DebugBuff_Shields Auto Const mandatory
GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Shields Auto Const mandatory
Scene Property UC01_ShipSimQuest_400b_ShieldsIncreased Auto Const mandatory
Scene Property UC01_ShipSimQuest_400c_ShipDamageIncreased Auto Const mandatory
Scene Property UC01_ShipSimQuest_400d_Ally Auto Const mandatory
Quest Property UC01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  UC01_ShipSim_Debug_PerkApplied_Shields.SetValue(1.0) ; #DEBUG_LINE_NO:7
  (UC01_ShipSimulatorHelperQuest as uc01_shipsimulationquestscript).ApplyShipPerk(UC01_DebugBuff_Shields) ; #DEBUG_LINE_NO:8
  (UC01_ShipSimulatorHelperQuest as uc01_shipsimulationquestscript).TriggerUpgradeScene() ; #DEBUG_LINE_NO:9
  If UC01.IsRunning() && !UC01.GetStageDone(420) && !UC01.GetStageDone(630) ; #DEBUG_LINE_NO:11
    UC01.SetStage(420) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  UC01_ShipSim_Debug_PerkApplied_Weapons.SetValue(1.0) ; #DEBUG_LINE_NO:21
  (UC01_ShipSimulatorHelperQuest as uc01_shipsimulationquestscript).ApplyShipPerk(UC01_DebugBuff_Weapons) ; #DEBUG_LINE_NO:22
  (UC01_ShipSimulatorHelperQuest as uc01_shipsimulationquestscript).TriggerUpgradeScene() ; #DEBUG_LINE_NO:23
  If UC01.IsRunning() && !UC01.GetStageDone(420) && !UC01.GetStageDone(630) ; #DEBUG_LINE_NO:25
    UC01.SetStage(420) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  UC01_ShipSim_AllySpawned_Basic.SetValue(1.0) ; #DEBUG_LINE_NO:35
  (UC01_ShipSimulatorHelperQuest as uc01_shipsimulationquestscript).SpawnPlayerAlly(UC01_LvlShip_UC_A_Fighter_PossibleAlly01 as Form) ; #DEBUG_LINE_NO:36
  (UC01_ShipSimulatorHelperQuest as uc01_shipsimulationquestscript).TriggerUpgradeScene() ; #DEBUG_LINE_NO:37
  If UC01.IsRunning() && !UC01.GetStageDone(420) && !UC01.GetStageDone(630) ; #DEBUG_LINE_NO:39
    UC01.SetStage(420) ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
EndFunction
