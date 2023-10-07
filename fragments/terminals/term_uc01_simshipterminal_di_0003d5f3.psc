ScriptName Fragments:Terminals:TERM_UC01_SimShipTerminal_Di_0003D5F3 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC01_ShipSim_Debug_AllySpawned_Debug Auto Const mandatory
Quest Property UC01_ShipSimQuest Auto Const mandatory
spaceshipbase Property UC01_Navy_Cruiser_C_Stroud_Vindicator01_PlayerAlly Auto Const
GlobalVariable Property UC01_ShipSim_Debug_InifinitePerks Auto Const mandatory
Scene Property UC01_ShipSimQuest_400e_DebugAlly Auto Const mandatory
GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Shields Auto Const mandatory
Perk Property UC01_DebugBuff_Shields Auto Const mandatory
Perk Property UC01_DebugBuff_Weapons Auto Const mandatory
GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Weapons Auto Const mandatory
Quest Property UC01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  UC01_ShipSim_Debug_InifinitePerks.SetValue(1.0) ; #DEBUG_LINE_NO:7
  UC01_ShipSim_Debug_PerkApplied_Shields.SetValue(1.0) ; #DEBUG_LINE_NO:8
  (UC01_ShipSimQuest as uc01_shipsimulationquestscript).ApplyShipPerk(UC01_DebugBuff_Shields) ; #DEBUG_LINE_NO:9
  UC01_ShipSim_Debug_PerkApplied_Weapons.SetValue(1.0) ; #DEBUG_LINE_NO:10
  (UC01_ShipSimQuest as uc01_shipsimulationquestscript).ApplyShipPerk(UC01_DebugBuff_Weapons) ; #DEBUG_LINE_NO:11
  (UC01_ShipSimQuest as uc01_shipsimulationquestscript).TriggerUpgradeScene() ; #DEBUG_LINE_NO:12
  If UC01.IsRunning() && !UC01.GetStageDone(420) && !UC01.GetStageDone(630) ; #DEBUG_LINE_NO:14
    UC01.SetStage(425) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  UC01_ShipSim_Debug_AllySpawned_Debug.SetValue(1.0) ; #DEBUG_LINE_NO:24
  (UC01_ShipSimQuest as uc01_shipsimulationquestscript).SpawnPlayerAlly(UC01_Navy_Cruiser_C_Stroud_Vindicator01_PlayerAlly as Form) ; #DEBUG_LINE_NO:25
  (UC01_ShipSimQuest as uc01_shipsimulationquestscript).TriggerUpgradeScene() ; #DEBUG_LINE_NO:26
  If UC01.IsRunning() && !UC01.GetStageDone(420) && !UC01.GetStageDone(630) ; #DEBUG_LINE_NO:28
    UC01.SetStage(425) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndFunction
