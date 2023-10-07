ScriptName DR009_MalfunctioningPlatformScript Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference[] travelPositions
Int travelSoundEventInstanceID = -1
Int waitTimerID = 0

;-- Properties --------------------------------------
Float Property MovementSpeed Auto Const
Float Property MinWaitSeconds Auto Const
Float Property MaxWaitSeconds Auto Const
wwiseevent Property TravelSoundEvent Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  travelPositions = Self.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:14
  Self.TravelToRandomPosition() ; #DEBUG_LINE_NO:16
EndEvent

Event OnUnload()
  If travelSoundEventInstanceID != -1 && TravelSoundEvent != None ; #DEBUG_LINE_NO:20
    wwiseevent.StopInstance(travelSoundEventInstanceID) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTranslationComplete()
  If TravelSoundEvent != None ; #DEBUG_LINE_NO:26
    wwiseevent.StopInstance(travelSoundEventInstanceID) ; #DEBUG_LINE_NO:27
    travelSoundEventInstanceID = -1 ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
  Self.WaitRandomSeconds() ; #DEBUG_LINE_NO:31
EndEvent

Function TravelToRandomPosition()
  Int travelPostionIndex = Utility.RandomInt(0, travelPositions.Length - 1) ; #DEBUG_LINE_NO:35
  ObjectReference travelPosition = travelPositions[travelPostionIndex] ; #DEBUG_LINE_NO:36
  Self.TranslateToRef(travelPosition, MovementSpeed, 0.0) ; #DEBUG_LINE_NO:38
  If travelSoundEventInstanceID == -1 && TravelSoundEvent != None ; #DEBUG_LINE_NO:40
    travelSoundEventInstanceID = TravelSoundEvent.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function WaitRandomSeconds()
  Float waitSeconds = Utility.RandomFloat(MinWaitSeconds, MaxWaitSeconds) ; #DEBUG_LINE_NO:46
  Self.StartTimer(waitSeconds, waitTimerID) ; #DEBUG_LINE_NO:48
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == waitTimerID ; #DEBUG_LINE_NO:52
    Self.TravelToRandomPosition() ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
EndEvent
