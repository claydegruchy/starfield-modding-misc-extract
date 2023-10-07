ScriptName SQ_EarthquakeOnLoadScript Extends ObjectReference
{ does an "earthquake" effect on load, and disables itself }

;-- Variables ---------------------------------------
Int earthquakeTimerID = 1 Const
Int numQuakes = 0
Int numRevealCave = 0
Int numStaggers = 0
ObjectReference rockfallFXRef
Int rockfallFXTimerID = 2 Const
Float staggerTime = 0.0
Int staggerTimerID = 3 Const

;-- Properties --------------------------------------
Group CaveRevealData
  Bool Property HasCaveReveal = True Auto Const
  { set to true if there's a cave to reveal (FX will play)
      set to false if this should only play earthquake FX }
  Explosion Property RockfallExplosion Auto Const mandatory
  { rockfall explosion }
  movablestatic Property RockfallFX Auto Const mandatory
  { place some FX at me for a bit }
  Float Property RockfallFXTime = 10.0 Auto Const
  { how long to leave RockfallFX enabled? }
EndGroup

Float Property EarthquakePercentChance = 50.0 Auto Const
{ percent chance the earthquake is triggered onLoad }
Float Property timeBetweenQuakesMin = 5.0 Auto Const
Float Property timeBetweenQuakesMax = 15.0 Auto Const
Float Property earthquakeDurationMin = 2.5 Auto Const
Float Property earthquakeDurationMax = 7.0 Auto Const
Float Property earthquakeStaggerMinTime = 3.0 Auto Const
{ min amount of time between casting the stagger spell }
Int Property minQuakes = 2 Auto Const
Int Property maxQuakes = 5 Auto Const
wwiseevent Property OE_EarthquakeSound Auto Const mandatory
{ sound the earthquake makes }
wwiseevent Property WwiseEvent_ShakeController_p5_p5_05 Auto Const mandatory
{ controller shake }
wwiseevent Property WwiseEvent_ShakeController_p25_p25_03 Auto Const mandatory
{ controller shake }
Spell Property SQ_EarthquakeStagger Auto Const mandatory
{ spell to stagger actors in loaded area }
Keyword[] Property EarthquakeTraits Auto Const
{ array of planet traits that allow earthquakes - if this is on a planet without earthquakes, immediately do the cave reveal (if any) and shut down }
String Property jumpAnimVariableName = "iSyncJumpState" Auto Const
{ used to check player's jump state }
Keyword Property PCM_Request_BlockCreation Auto Const mandatory
{ used to check if being placed by quest/scan request }

;-- Functions ---------------------------------------

Function Earthquake()
  Float duration = Utility.RandomFloat(earthquakeDurationMin, earthquakeDurationMax) ; #DEBUG_LINE_NO:138
  Game.ShakeCamera(None, 0.25, duration) ; #DEBUG_LINE_NO:139
  If duration < 5.0 ; #DEBUG_LINE_NO:140
    WwiseEvent_ShakeController_p25_p25_03.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:141
  Else ; #DEBUG_LINE_NO:
    WwiseEvent_ShakeController_p5_p5_05.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:143
  EndIf ; #DEBUG_LINE_NO:
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:145
  OE_EarthquakeSound.Play(playerRef as ObjectReference, None, None) ; #DEBUG_LINE_NO:146
  Bool isJumping = playerRef.GetAnimationVariableBool(jumpAnimVariableName) ; #DEBUG_LINE_NO:147
  If isJumping == False ; #DEBUG_LINE_NO:149
    SQ_EarthquakeStagger.Cast(Self as ObjectReference, playerRef as ObjectReference) ; #DEBUG_LINE_NO:150
  EndIf ; #DEBUG_LINE_NO:
  If duration > earthquakeStaggerMinTime ; #DEBUG_LINE_NO:153
    staggerTime = Utility.RandomFloat(earthquakeStaggerMinTime, duration) ; #DEBUG_LINE_NO:154
    numStaggers = Math.Floor(duration / staggerTime) ; #DEBUG_LINE_NO:155
  EndIf ; #DEBUG_LINE_NO:
  If HasCaveReveal && numQuakes <= numRevealCave && Self.IsDisabled() == False ; #DEBUG_LINE_NO:160
    Utility.wait(1.0) ; #DEBUG_LINE_NO:162
    Self.Disable(False) ; #DEBUG_LINE_NO:163
    Self.StartTimer(RockfallFXTime, rockfallFXTimerID) ; #DEBUG_LINE_NO:164
  EndIf ; #DEBUG_LINE_NO:
  numQuakes -= 1 ; #DEBUG_LINE_NO:167
  If numQuakes > 0 ; #DEBUG_LINE_NO:168
    Float timeToNextQuake = Utility.RandomFloat(timeBetweenQuakesMin, timeBetweenQuakesMax) ; #DEBUG_LINE_NO:169
    Self.StartTimer(timeToNextQuake, earthquakeTimerID) ; #DEBUG_LINE_NO:170
  Else ; #DEBUG_LINE_NO:
    Self.GotoState("Done") ; #DEBUG_LINE_NO:172
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == earthquakeTimerID ; #DEBUG_LINE_NO:177
    Self.Earthquake() ; #DEBUG_LINE_NO:178
  ElseIf aiTimerID == rockfallFXTimerID ; #DEBUG_LINE_NO:179
    If rockfallFXRef ; #DEBUG_LINE_NO:180
      rockfallFXRef.Disable(False) ; #DEBUG_LINE_NO:181
      rockfallFXRef = None ; #DEBUG_LINE_NO:182
    EndIf ; #DEBUG_LINE_NO:
  ElseIf aiTimerID == staggerTimerID ; #DEBUG_LINE_NO:184
    numStaggers -= 1 ; #DEBUG_LINE_NO:185
    SQ_EarthquakeStagger.Cast(Self as ObjectReference, Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:186
    If numStaggers > 0 ; #DEBUG_LINE_NO:187
      Self.StartTimer(staggerTime, staggerTimerID) ; #DEBUG_LINE_NO:188
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.CancelTimer(earthquakeTimerID) ; #DEBUG_LINE_NO:195
  Self.CancelTimer(rockfallFXTimerID) ; #DEBUG_LINE_NO:196
  Self.CancelTimer(staggerTimerID) ; #DEBUG_LINE_NO:197
EndEvent

;-- State -------------------------------------------
State Done

  Event OnBeginState(String asOldState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State Earthquake

  Event OnBeginState(String asOldState)
    numQuakes = Utility.RandomInt(minQuakes, maxQuakes) ; #DEBUG_LINE_NO:120
    numRevealCave = Utility.RandomInt(1, numQuakes) ; #DEBUG_LINE_NO:121
    Float timeToNextQuake = Utility.RandomFloat(timeBetweenQuakesMin, timeBetweenQuakesMax) ; #DEBUG_LINE_NO:123
    Self.StartTimer(timeToNextQuake, earthquakeTimerID) ; #DEBUG_LINE_NO:125
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnLoad()
    If Self.IsDisabled() == False ; #DEBUG_LINE_NO:
      If HasCaveReveal || Game.GetDieRollSuccess(EarthquakePercentChance as Int, 1, 100, -1, -1) ; #DEBUG_LINE_NO:
        Self.GotoState("Earthquake") ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnInit()
    planet myPlanet = Self.GetCurrentPlanet() ; #DEBUG_LINE_NO:73
    If myPlanet ; #DEBUG_LINE_NO:74
      Int I = 0 ; #DEBUG_LINE_NO:75
      Bool traitFound = False ; #DEBUG_LINE_NO:76
      Location myLocation = Self.GetCurrentLocation() ; #DEBUG_LINE_NO:78
      If myLocation == None || myLocation.HasKeyword(PCM_Request_BlockCreation) ; #DEBUG_LINE_NO:80
        While I < EarthquakeTraits.Length && traitFound == False ; #DEBUG_LINE_NO:81
          traitFound = myPlanet.HasKeyword(EarthquakeTraits[I]) ; #DEBUG_LINE_NO:82
          I += 1 ; #DEBUG_LINE_NO:83
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If traitFound == False ; #DEBUG_LINE_NO:87
        Self.GotoState("Done") ; #DEBUG_LINE_NO:90
      ElseIf HasCaveReveal == False || Game.GetDieRollSuccess(EarthquakePercentChance as Int, 1, 100, -1, -1) ; #DEBUG_LINE_NO:93
        Self.EnableNoWait(False) ; #DEBUG_LINE_NO:95
      Else ; #DEBUG_LINE_NO:
        Self.GotoState("Done") ; #DEBUG_LINE_NO:99
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
