ScriptName UC08_AB_HostileThrallCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------
Bool EnemiesEnabled
Bool WaveTriggered

;-- Properties --------------------------------------
RefCollectionAlias Property SubsequentCollection Auto Const
{ Once this collection is emptied, which one spawns next? }
RefCollectionAlias Property ActiveHostiles Auto Const mandatory
{ Ref collection that contains only the active enemy NPCs }
Int Property StageToSetOnEmpty = -1 Auto Const
{ Stage to set once this collection has been emptied }
GlobalVariable Property UC08_AB_SwitchCount Auto Const mandatory
{ Count of the number of switches to be thrown. If greater than 2, the Queen has lost her ability to call in reinforcements }
GlobalVariable Property UC08_AB_NextWaveTimer Auto Const mandatory
{ Global used to managed the amount ot time between the Queen's spawns }
GlobalVariable Property UC08_AB_WaveCount Auto Const mandatory
{ Count of how many enemy waves have fired off. Used to change up the dialogue lines from Percival. }
Bool Property TriggerNextWaveOnEmpty = True Auto Const
{ If set to true, when this wave is empty, start a timer to spawn the next one }
Bool Property PlayIncomingEnemiesScene = True Auto Const
{ If set to true, use one of the generic "enemies incoming" scenes }
Float Property MinTimerMultiper = 0.75 Auto Const
{ Multiplier for the min amount of time a next wave should take to trigger }
Float Property MaxTimerMultiper = 1.25 Auto Const
{ Multiplier for the max amount of time a next wave should take to trigger }
Scene Property UC08_QueenBattle_Percival_EnemiesInbound Auto Const mandatory
{ Scene to play when non-Morph enemies are inbound }
Scene Property UC08_QueenBattle_Percival_MorphsInbound Auto Const mandatory
{ Scene to play when Morphs are inbound }

;-- Functions ---------------------------------------

Function TriggerWave()
  WaveTriggered = True ; #DEBUG_LINE_NO:44
  Self.CheckForEmpty() ; #DEBUG_LINE_NO:46
EndFunction

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:50
  Self.CheckForEmpty() ; #DEBUG_LINE_NO:51
EndEvent

Function CheckForEmpty()
  If WaveTriggered ; #DEBUG_LINE_NO:55
    If Self.GetCount() <= 0 && UC08_AB_SwitchCount.GetValueInt() < 3 ; #DEBUG_LINE_NO:56
      If TriggerNextWaveOnEmpty ; #DEBUG_LINE_NO:59
        Int WaveTimerBase = UC08_AB_NextWaveTimer.GetValueInt() ; #DEBUG_LINE_NO:61
        Int iMinTime = (WaveTimerBase as Float * MinTimerMultiper) as Int ; #DEBUG_LINE_NO:62
        Int iMaxTime = (WaveTimerBase as Float * MaxTimerMultiper) as Int ; #DEBUG_LINE_NO:63
        Int iTimerLength = Utility.RandomInt(iMinTime, iMaxTime) ; #DEBUG_LINE_NO:64
        Self.StartTimer(iTimerLength as Float, 0) ; #DEBUG_LINE_NO:66
      EndIf ; #DEBUG_LINE_NO:
      If StageToSetOnEmpty >= 0 ; #DEBUG_LINE_NO:70
        Self.GetOwningQuest().SetStage(StageToSetOnEmpty) ; #DEBUG_LINE_NO:71
      EndIf ; #DEBUG_LINE_NO:
    ElseIf !EnemiesEnabled ; #DEBUG_LINE_NO:73
      EnemiesEnabled = True ; #DEBUG_LINE_NO:74
      UC08_AB_WaveCount.Mod(1.0) ; #DEBUG_LINE_NO:76
      Self.EnableAll(False) ; #DEBUG_LINE_NO:78
      ActiveHostiles.AddRefCollection(Self as RefCollectionAlias) ; #DEBUG_LINE_NO:79
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  If UC08_AB_SwitchCount.GetValueInt() < 3 ; #DEBUG_LINE_NO:87
    UC08_AB_HostileThrallCollScript NextColl = SubsequentCollection as UC08_AB_HostileThrallCollScript ; #DEBUG_LINE_NO:88
    If NextColl != None ; #DEBUG_LINE_NO:90
      NextColl.TriggerWave() ; #DEBUG_LINE_NO:91
      If PlayIncomingEnemiesScene ; #DEBUG_LINE_NO:93
        Int icurrWave = UC08_AB_WaveCount.GetValueInt() ; #DEBUG_LINE_NO:94
        If icurrWave == 4 ; #DEBUG_LINE_NO:96
          UC08_QueenBattle_Percival_MorphsInbound.Start() ; #DEBUG_LINE_NO:97
        ElseIf icurrWave > 1 ; #DEBUG_LINE_NO:98
          UC08_QueenBattle_Percival_EnemiesInbound.Start() ; #DEBUG_LINE_NO:99
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:110
EndFunction
