ScriptName RedMileHandlerQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PlayerCompletedRedMile Auto Const mandatory
LocationAlias Property RedMile Auto Const mandatory
RefCollectionAlias Property Markers Auto Const mandatory
RefCollectionAlias Property Phase2Markers Auto Const mandatory
RefCollectionAlias Property Creatures Auto Const mandatory
ActorBase Property PCM_Porrima_Porrima_III_Predator01 Auto Const mandatory

;-- Functions ---------------------------------------

Function RespawnCreatures(Int aiPhase)
  Int I = 0 ; #DEBUG_LINE_NO:11
  Int iCount = 0 ; #DEBUG_LINE_NO:12
  If aiPhase <= 0 ; #DEBUG_LINE_NO:14
    iCount = Markers.GetCount() ; #DEBUG_LINE_NO:15
    Self.Cleanup() ; #DEBUG_LINE_NO:17
  Else ; #DEBUG_LINE_NO:
    iCount = Phase2Markers.GetCount() ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
  While I < iCount ; #DEBUG_LINE_NO:23
    ObjectReference myMarker = None ; #DEBUG_LINE_NO:24
    If aiPhase <= 0 ; #DEBUG_LINE_NO:25
      myMarker = Markers.GetAt(I) ; #DEBUG_LINE_NO:26
    Else ; #DEBUG_LINE_NO:
      myMarker = Phase2Markers.GetAt(I) ; #DEBUG_LINE_NO:28
    EndIf ; #DEBUG_LINE_NO:
    Int iRandom = Utility.RandomInt(1, 100) ; #DEBUG_LINE_NO:33
    Int iSpawnMod = 0 ; #DEBUG_LINE_NO:34
    Float fNumTimesCompleted = PlayerCompletedRedMile.GetValue() ; #DEBUG_LINE_NO:36
    If fNumTimesCompleted < 5.0 ; #DEBUG_LINE_NO:38
      If iRandom <= 25 ; #DEBUG_LINE_NO:39
        iSpawnMod = 0 ; #DEBUG_LINE_NO:40
      ElseIf iRandom > 25 && iRandom <= 65 ; #DEBUG_LINE_NO:41
        iSpawnMod = 1 ; #DEBUG_LINE_NO:42
      ElseIf iRandom > 55 && iRandom <= 75 ; #DEBUG_LINE_NO:43
        iSpawnMod = 2 ; #DEBUG_LINE_NO:44
      ElseIf iRandom > 75 && iRandom <= 80 ; #DEBUG_LINE_NO:45
        iSpawnMod = 3 ; #DEBUG_LINE_NO:46
      Else ; #DEBUG_LINE_NO:
        iSpawnMod = 4 ; #DEBUG_LINE_NO:48
      EndIf ; #DEBUG_LINE_NO:
    ElseIf fNumTimesCompleted >= 5.0 && fNumTimesCompleted < 12.0 ; #DEBUG_LINE_NO:52
      If iRandom <= 15 ; #DEBUG_LINE_NO:53
        iSpawnMod = 0 ; #DEBUG_LINE_NO:54
      ElseIf iRandom > 15 && iRandom <= 65 ; #DEBUG_LINE_NO:55
        iSpawnMod = 1 ; #DEBUG_LINE_NO:56
      ElseIf iRandom > 65 && iRandom <= 80 ; #DEBUG_LINE_NO:57
        iSpawnMod = 2 ; #DEBUG_LINE_NO:58
      ElseIf iRandom > 80 && iRandom <= 85 ; #DEBUG_LINE_NO:59
        iSpawnMod = 3 ; #DEBUG_LINE_NO:60
      Else ; #DEBUG_LINE_NO:
        iSpawnMod = 4 ; #DEBUG_LINE_NO:62
      EndIf ; #DEBUG_LINE_NO:
    ElseIf fNumTimesCompleted >= 12.0 && fNumTimesCompleted < 20.0 ; #DEBUG_LINE_NO:66
      If iRandom <= 10 ; #DEBUG_LINE_NO:67
        iSpawnMod = 0 ; #DEBUG_LINE_NO:68
      ElseIf iRandom > 10 && iRandom <= 40 ; #DEBUG_LINE_NO:69
        iSpawnMod = 1 ; #DEBUG_LINE_NO:70
      ElseIf iRandom > 40 && iRandom <= 80 ; #DEBUG_LINE_NO:71
        iSpawnMod = 2 ; #DEBUG_LINE_NO:72
      ElseIf iRandom > 80 && iRandom <= 90 ; #DEBUG_LINE_NO:73
        iSpawnMod = 3 ; #DEBUG_LINE_NO:74
      Else ; #DEBUG_LINE_NO:
        iSpawnMod = 4 ; #DEBUG_LINE_NO:76
      EndIf ; #DEBUG_LINE_NO:
    ElseIf fNumTimesCompleted >= 20.0 && fNumTimesCompleted < 25.0 ; #DEBUG_LINE_NO:80
      If iRandom <= 25 ; #DEBUG_LINE_NO:81
        iSpawnMod = 1 ; #DEBUG_LINE_NO:82
      ElseIf iRandom > 25 && iRandom <= 85 ; #DEBUG_LINE_NO:83
        iSpawnMod = 2 ; #DEBUG_LINE_NO:84
      ElseIf iRandom > 85 && iRandom <= 95 ; #DEBUG_LINE_NO:85
        iSpawnMod = 3 ; #DEBUG_LINE_NO:86
      Else ; #DEBUG_LINE_NO:
        iSpawnMod = 4 ; #DEBUG_LINE_NO:88
      EndIf ; #DEBUG_LINE_NO:
    ElseIf iRandom <= 80 ; #DEBUG_LINE_NO:93
      iSpawnMod = 2 ; #DEBUG_LINE_NO:94
    ElseIf iRandom > 80 && iRandom <= 95 ; #DEBUG_LINE_NO:95
      iSpawnMod = 3 ; #DEBUG_LINE_NO:96
    Else ; #DEBUG_LINE_NO:
      iSpawnMod = 4 ; #DEBUG_LINE_NO:98
    EndIf ; #DEBUG_LINE_NO:
    Location myLoc = RedMile.GetLocation() ; #DEBUG_LINE_NO:104
    ObjectReference myCreature = myMarker.PlaceActorAtMe(PCM_Porrima_Porrima_III_Predator01, iSpawnMod, myLoc, False, False, True, None, True) as ObjectReference ; #DEBUG_LINE_NO:105
    Creatures.AddRef(myCreature) ; #DEBUG_LINE_NO:106
    I += 1 ; #DEBUG_LINE_NO:107
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Cleanup()
  Int I = 0 ; #DEBUG_LINE_NO:115
  Int iCount = Creatures.GetCount() ; #DEBUG_LINE_NO:116
  While I < iCount ; #DEBUG_LINE_NO:118
    ObjectReference myCreature = Creatures.GetAt(I) ; #DEBUG_LINE_NO:119
    myCreature.Disable(False) ; #DEBUG_LINE_NO:120
    myCreature.Delete() ; #DEBUG_LINE_NO:121
    I += 1 ; #DEBUG_LINE_NO:122
  EndWhile ; #DEBUG_LINE_NO:
  Creatures.RemoveAll() ; #DEBUG_LINE_NO:125
EndFunction
