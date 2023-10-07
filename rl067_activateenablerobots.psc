ScriptName RL067_ActivateEnableRobots Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Actor[] Property SpawnedRobot Auto mandatory
Bool Property DoEnable Auto mandatory
Bool Property DoAggro Auto mandatory
Faction Property PirateFaction Auto Const
Faction Property PirateEnemyFaction Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Utility.wait(2.0) ; #DEBUG_LINE_NO:19
  Int index = 0 ; #DEBUG_LINE_NO:20
  While index < SpawnedRobot.Length ; #DEBUG_LINE_NO:21
    If DoEnable == True ; #DEBUG_LINE_NO:23
      SpawnedRobot[index].Enable(False) ; #DEBUG_LINE_NO:24
    EndIf ; #DEBUG_LINE_NO:
    If DoAggro == True ; #DEBUG_LINE_NO:26
      SpawnedRobot[index].SetValue(Game.GetAggressionAV(), 2.0) ; #DEBUG_LINE_NO:27
      SpawnedRobot[index].RemoveFromFaction(PirateFaction) ; #DEBUG_LINE_NO:28
      SpawnedRobot[index].AddToFaction(PirateEnemyFaction) ; #DEBUG_LINE_NO:29
    EndIf ; #DEBUG_LINE_NO:
    index += 1 ; #DEBUG_LINE_NO:32
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
