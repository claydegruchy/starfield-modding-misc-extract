ScriptName LC102CrowdAudioScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property CrowdAudioMarkerKeyword Auto Const
Keyword Property CrowdFleeAudioMarkerKeyword Auto Const
Int Property MinCrowdPopulation = 10 Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:8
  Self.RegisterForRemoteEvent(player as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:9
  Int playerCombatState = player.GetCombatState() ; #DEBUG_LINE_NO:11
  If playerCombatState == 0 ; #DEBUG_LINE_NO:13
    Self.DisableFleeAudio() ; #DEBUG_LINE_NO:14
    Self.EvaluateActorPopulation() ; #DEBUG_LINE_NO:15
  ElseIf playerCombatState == 1 ; #DEBUG_LINE_NO:16
    Self.DisableCrowdAudio() ; #DEBUG_LINE_NO:17
    Self.EnableFleeAudio() ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:23
  Self.UnregisterForRemoteEvent(player as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:24
EndEvent

Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState == 0 ; #DEBUG_LINE_NO:28
    Self.DisableFleeAudio() ; #DEBUG_LINE_NO:29
    Self.EvaluateActorPopulation() ; #DEBUG_LINE_NO:30
  ElseIf aeCombatState == 1 ; #DEBUG_LINE_NO:31
    Self.DisableCrowdAudio() ; #DEBUG_LINE_NO:32
    Self.EnableFleeAudio() ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function EvaluateActorPopulation()
  Int objCount = Self.GetTriggerObjectCount() ; #DEBUG_LINE_NO:38
  If objCount < MinCrowdPopulation ; #DEBUG_LINE_NO:40
    Self.DisableCrowdAudio() ; #DEBUG_LINE_NO:41
  Else ; #DEBUG_LINE_NO:
    Self.EnableCrowdAudio() ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function EnableCrowdAudio()
  ObjectReference crowdAudioMarkerRef = Self.GetLinkedRef(CrowdAudioMarkerKeyword) ; #DEBUG_LINE_NO:48
  If crowdAudioMarkerRef != None && crowdAudioMarkerRef.IsEnabled() == False ; #DEBUG_LINE_NO:50
    crowdAudioMarkerRef.Enable(False) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DisableCrowdAudio()
  ObjectReference crowdAudioMarkerRef = Self.GetLinkedRef(CrowdAudioMarkerKeyword) ; #DEBUG_LINE_NO:56
  If crowdAudioMarkerRef != None && crowdAudioMarkerRef.IsEnabled() == True ; #DEBUG_LINE_NO:58
    crowdAudioMarkerRef.Disable(False) ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function EnableFleeAudio()
  ObjectReference crowdFleeAudioMarkerRef = Self.GetLinkedRef(CrowdFleeAudioMarkerKeyword) ; #DEBUG_LINE_NO:64
  If crowdFleeAudioMarkerRef != None && crowdFleeAudioMarkerRef.IsEnabled() == False ; #DEBUG_LINE_NO:66
    crowdFleeAudioMarkerRef.Enable(False) ; #DEBUG_LINE_NO:67
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DisableFleeAudio()
  ObjectReference crowdFleeAudioMarkerRef = Self.GetLinkedRef(CrowdFleeAudioMarkerKeyword) ; #DEBUG_LINE_NO:72
  If crowdFleeAudioMarkerRef != None && crowdFleeAudioMarkerRef.IsEnabled() == True ; #DEBUG_LINE_NO:74
    crowdFleeAudioMarkerRef.Disable(False) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
EndFunction
