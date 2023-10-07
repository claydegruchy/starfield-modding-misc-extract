ScriptName MissionHackQuestScript Extends MissionQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group HackMissionData
  ReferenceAlias Property HoldingContainer Auto Const mandatory
  { alias where data disk ref will be created }
  ReferenceAlias Property DataDisk Auto Const mandatory
  { data disk }
  Float Property CooldownDays = 2.0 Auto Const
  { how long before the same target location can be picked again? }
  ActorValue Property CooldownAV Auto Const mandatory
  { AV to use for cooldown timestamp }
EndGroup


;-- Functions ---------------------------------------

Function MissionAccepted(Bool bAccepted)
  If bAccepted ; #DEBUG_LINE_NO:19
    Game.GetPlayer().AddItem(DataDisk.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
  Parent.MissionAccepted(bAccepted) ; #DEBUG_LINE_NO:23
EndFunction

Function HandleOnQuestRejected()
  Self.CleanupMission() ; #DEBUG_LINE_NO:28
  Self.MissionFailed() ; #DEBUG_LINE_NO:29
EndFunction

Function MissionComplete()
  Self.CleanupMission() ; #DEBUG_LINE_NO:33
  Parent.MissionComplete() ; #DEBUG_LINE_NO:34
EndFunction

Function CleanupMission()
  Game.GetPlayer().RemoveItem(DataDisk.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:39
  Location targetLoc = TargetLocation.GetLocation() ; #DEBUG_LINE_NO:42
  targetLoc.SetValue(CooldownAV, Utility.GetCurrentGameTime() + CooldownDays) ; #DEBUG_LINE_NO:43
EndFunction
