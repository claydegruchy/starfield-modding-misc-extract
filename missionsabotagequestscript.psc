ScriptName MissionSabotageQuestScript Extends MissionQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group SabotageMissionData
  ReferenceAlias Property HoldingContainer Auto Const mandatory
  { alias where sabotage ref will be created }
  ReferenceAlias Property Device Auto Const mandatory
  { sabotage ref }
  ReferenceAlias Property DevicePlacementTrigger Auto Const mandatory
  { sabotage ref }
  ReferenceAlias Property PlacedDevice Auto Const mandatory
  { static version of the ARC device that is actually placed }
  MiscObject Property RIR04_Device Auto Const mandatory
  { base object to create planted device }
  Float Property CooldownDays = 2.0 Auto Const
  { how long before the same target location can be picked again? }
  ActorValue Property CooldownAV Auto Const mandatory
  { AV to use for cooldown timestamp }
EndGroup


;-- Functions ---------------------------------------

Function MissionAccepted(Bool bAccepted)
  If bAccepted ; #DEBUG_LINE_NO:28
    Game.GetPlayer().AddItem(Device.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:30
    DevicePlacementTrigger.TryToEnable() ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
  Parent.MissionAccepted(bAccepted) ; #DEBUG_LINE_NO:34
EndFunction

Function HandleOnQuestRejected()
  Self.CleanupMission() ; #DEBUG_LINE_NO:39
  Self.MissionFailed() ; #DEBUG_LINE_NO:40
EndFunction

Function MissionComplete()
  Self.CleanupMission() ; #DEBUG_LINE_NO:44
  Parent.MissionComplete() ; #DEBUG_LINE_NO:45
EndFunction

Function CleanupMission()
  Game.GetPlayer().RemoveItem(Device.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:51
  PlacedDevice.GetRef().MoveTo(PrimaryRef.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:52
  DevicePlacementTrigger.TryToDisable() ; #DEBUG_LINE_NO:54
  Location targetLoc = TargetLocation.GetLocation() ; #DEBUG_LINE_NO:57
  targetLoc.SetValue(CooldownAV, Utility.GetCurrentGameTime() + CooldownDays) ; #DEBUG_LINE_NO:58
EndFunction
