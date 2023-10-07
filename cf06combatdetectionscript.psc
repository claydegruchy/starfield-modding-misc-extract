ScriptName CF06CombatDetectionScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool stageIsSet = False
Int stageToSet = 195

;-- Properties --------------------------------------
Quest Property CF06 Auto Const
Location Property LC0939Location Auto Const
Faction Property RobotSecurityFaction Auto Const
Faction Property RobotJanitorFaction Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:12
  Self.RegisterForRemoteEvent(player as ScriptObject, "OnKill") ; #DEBUG_LINE_NO:14
EndEvent

Event OnCellDetach()
  If !stageIsSet ; #DEBUG_LINE_NO:18
    Self.UnregisterForKillEvents() ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnKill(Actor akSender, ObjectReference akVictim)
  If akSender.GetCurrentLocation() == LC0939Location ; #DEBUG_LINE_NO:24
    Actor victimActor = akVictim as Actor ; #DEBUG_LINE_NO:25
    If victimActor != None ; #DEBUG_LINE_NO:27
      Bool victimIsInRobotSecurityFaction = victimActor.IsInFaction(RobotSecurityFaction) ; #DEBUG_LINE_NO:28
      Bool victimIsInRobotJanitorFaction = False ; #DEBUG_LINE_NO:29
      If !victimIsInRobotSecurityFaction && !victimIsInRobotJanitorFaction ; #DEBUG_LINE_NO:31
        Self.SetCombatStage() ; #DEBUG_LINE_NO:32
        Self.UnregisterForKillEvents() ; #DEBUG_LINE_NO:33
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetCombatStage()
  CF06.SetStage(stageToSet) ; #DEBUG_LINE_NO:40
  stageIsSet = True ; #DEBUG_LINE_NO:42
EndFunction

Function UnregisterForKillEvents()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:46
  Self.UnregisterForRemoteEvent(player as ScriptObject, "OnKill") ; #DEBUG_LINE_NO:48
EndFunction
