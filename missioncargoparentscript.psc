ScriptName MissionCargoParentScript Extends MissionQuestScript conditional
{ parent script for mission quests that involve player cargo space }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group CargoParentData
  GlobalVariable Property PlayerCargoSpaceCurrent Auto Const mandatory
  { used for text replacement - needs to be updated when player ship inventory changes }
  GlobalVariable Property PlayerCargoSpaceTotal Auto Const mandatory
  { used for text replacement }
  Bool Property hasCargoSpace = False Auto hidden
  { updated by UpdatePlayerCargoSpace }
  Bool Property hasShieldedCargoSpace = True Auto hidden
  { updated by UpdatePlayerCargoSpace }
  Keyword Property LocTypeStarStation Auto Const mandatory
  { for checking for docking }
  Keyword Property LocTypeStarstationExterior Auto Const mandatory
  { keyword to check if you've docked with a starstation }
EndGroup


;-- Functions ---------------------------------------

Function UpdatePlayerCargoSpace()
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:26
  If PlayerShipRef ; #DEBUG_LINE_NO:27
    missionboardcargocontainerscript cargoContainerRef = Self.GetCargoContainer() ; #DEBUG_LINE_NO:29
    If cargoContainerRef ; #DEBUG_LINE_NO:32
      Float cargoWeight = MissionIntValue01.GetValue() ; #DEBUG_LINE_NO:33
      Float cargoSpaceTotal = PlayerShipRef.GetShipMaxCargoWeight() ; #DEBUG_LINE_NO:34
      Float cargoSpaceUsed = PlayerShipRef.GetWeightInContainer() ; #DEBUG_LINE_NO:35
      Float cargoSpace = cargoSpaceTotal - cargoSpaceUsed ; #DEBUG_LINE_NO:36
      Float cargoSpaceShielded = PlayerShipRef.GetValue(MissionParent.CarryWeightShielded) - PlayerShipRef.GetContrabandWeight(False) ; #DEBUG_LINE_NO:37
      hasCargoSpace = cargoWeight <= cargoSpace ; #DEBUG_LINE_NO:40
      hasShieldedCargoSpace = cargoWeight <= cargoSpaceShielded ; #DEBUG_LINE_NO:41
      PlayerCargoSpaceCurrent.SetValue(Math.Floor(cargoSpaceUsed) as Float) ; #DEBUG_LINE_NO:43
      PlayerCargoSpaceTotal.SetValue(cargoSpaceTotal) ; #DEBUG_LINE_NO:44
      Self.UpdateCurrentInstanceGlobal(PlayerCargoSpaceCurrent) ; #DEBUG_LINE_NO:45
      Self.UpdateCurrentInstanceGlobal(PlayerCargoSpaceTotal) ; #DEBUG_LINE_NO:46
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

missionboardcargocontainerscript Function GetCargoContainer()
  Return None ; #DEBUG_LINE_NO:54
EndFunction
