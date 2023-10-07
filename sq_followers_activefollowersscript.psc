ScriptName SQ_Followers_ActiveFollowersScript Extends RefCollectionAlias
{ Script attached to ActiveFollowers refcollection alias.
Currently it is managing the COM_SandboxDistancePollSuccessful which is used to turn on/off the sandboxing while player is loitering }

;-- Variables ---------------------------------------
Int PollSuccessCount
Float PollSuccess_Distance = 5.0 Const
Int PollSuccessesNeeded = 3 Const
Float Timer_Dur_DistancePoll = 10.0 Const
Int Timer_ID_DistancePoll = 1 Const
Actor[] activeFollowers
Bool activeFollowersArrayLock
Int iPollSuccess = 1 Const
Int iPollUnsetOrNotYetSuccess = 0 Const

;-- Properties --------------------------------------
GlobalVariable Property COM_SandboxDistancePollSuccessful Auto Const mandatory
{ Used to conditionalize sandbox package }

;-- Functions ---------------------------------------

Event OnPackageChange(ObjectReference akSenderRef, Package akOldPackage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPackageEnd(ObjectReference akSenderRef, Package akOldPackage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPackageStart(ObjectReference akSenderRef, Package akNewPackage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAliasInit()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:23
  Self.RegisterForRemoteEvent(PlayerRef as ScriptObject, "OnPlayerLoiteringBegin") ; #DEBUG_LINE_NO:26
  Self.RegisterForRemoteEvent(PlayerRef as ScriptObject, "OnPlayerLoiteringEnd") ; #DEBUG_LINE_NO:27
  activeFollowers = Self.GetArray() as Actor[] ; #DEBUG_LINE_NO:29
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  While activeFollowersArrayLock ; #DEBUG_LINE_NO:
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:35
  EndWhile ; #DEBUG_LINE_NO:
  activeFollowersArrayLock = True ; #DEBUG_LINE_NO:37
  activeFollowers = Self.GetArray() as Actor[] ; #DEBUG_LINE_NO:40
  activeFollowersArrayLock = False ; #DEBUG_LINE_NO:42
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == Timer_ID_DistancePoll ; #DEBUG_LINE_NO:48
    Bool shouldKeepPolling = Self.KeepPolling() ; #DEBUG_LINE_NO:49
    If shouldKeepPolling ; #DEBUG_LINE_NO:52
      Self.StartTimer(Timer_Dur_DistancePoll, Timer_ID_DistancePoll) ; #DEBUG_LINE_NO:53
    Else ; #DEBUG_LINE_NO:
      COM_SandboxDistancePollSuccessful.SetValue(iPollSuccess as Float) ; #DEBUG_LINE_NO:56
      Self.EvaluatePackageForAll() ; #DEBUG_LINE_NO:57
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnPlayerLoiteringBegin(Actor akSenderRef)
  Self.StartTimer(Timer_Dur_DistancePoll, Timer_ID_DistancePoll) ; #DEBUG_LINE_NO:65
  Self.EvaluatePackageForAll() ; #DEBUG_LINE_NO:66
EndEvent

Event Actor.OnPlayerLoiteringEnd(Actor akSenderRef)
  Self.CancelTimer(Timer_ID_DistancePoll) ; #DEBUG_LINE_NO:72
  PollSuccessCount = 0 ; #DEBUG_LINE_NO:73
  COM_SandboxDistancePollSuccessful.SetValue(iPollUnsetOrNotYetSuccess as Float) ; #DEBUG_LINE_NO:74
  Self.EvaluatePackageForAll() ; #DEBUG_LINE_NO:75
EndEvent

Bool Function KeepPolling()
  While activeFollowersArrayLock ; #DEBUG_LINE_NO:
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:80
  EndWhile ; #DEBUG_LINE_NO:
  activeFollowersArrayLock = True ; #DEBUG_LINE_NO:82
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:86
  Bool returnVal = True ; #DEBUG_LINE_NO:88
  Int I = 0 ; #DEBUG_LINE_NO:94
  While I < activeFollowers.Length && returnVal == True ; #DEBUG_LINE_NO:95
    ObjectReference nearbyFollower = None ; #DEBUG_LINE_NO:96
    If activeFollowers[I].GetDistance(PlayerRef as ObjectReference) <= PollSuccess_Distance ; #DEBUG_LINE_NO:98
      PollSuccessCount += 1 ; #DEBUG_LINE_NO:99
      If PollSuccessCount >= PollSuccessesNeeded ; #DEBUG_LINE_NO:101
        PollSuccessCount = 0 ; #DEBUG_LINE_NO:102
        returnVal = False ; #DEBUG_LINE_NO:103
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:107
  EndWhile ; #DEBUG_LINE_NO:
  activeFollowersArrayLock = False ; #DEBUG_LINE_NO:112
  Return returnVal ; #DEBUG_LINE_NO:113
EndFunction

Function EvaluatePackageForAll()
  While activeFollowersArrayLock ; #DEBUG_LINE_NO:
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:120
  EndWhile ; #DEBUG_LINE_NO:
  activeFollowersArrayLock = True ; #DEBUG_LINE_NO:122
  Int I = 0 ; #DEBUG_LINE_NO:125
  While I < activeFollowers.Length ; #DEBUG_LINE_NO:126
    activeFollowers[I].EvaluatePackage(False) ; #DEBUG_LINE_NO:128
    I += 1 ; #DEBUG_LINE_NO:129
  EndWhile ; #DEBUG_LINE_NO:
  activeFollowersArrayLock = False ; #DEBUG_LINE_NO:132
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:153
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:157
EndFunction
