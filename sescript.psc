ScriptName SEScript Extends rescript

;-- Variables ---------------------------------------
Int FallbackHailTimerID = 2
Int GlobalHailTimerID = 1

;-- Properties --------------------------------------
Group SE_Properties
  ReferenceAlias Property PlayerShip Auto Const mandatory
  { player ship alias }
  LocationAlias Property OrbitLocation Auto Const mandatory
  { orbit location for this SE }
  Bool Property StopQuestWhenPlayerLeavesSystem = True Auto
  { Default = true, once player leaves system, quest should stop }
  LocationAlias Property LocationShutdownOnExit Auto Const
  { OPTIONAL: shutdown this quest when player ship exits this location }
  Bool Property SetStageOnInSameLocation = False Auto Const
  { Set a stage when the player is in the same location as this SE }
  Bool Property UseGlobalHailTimer = False Auto Const
  { If you want this script to handle triggering the hail for this SE }
  GlobalVariable Property SEGlobalHailTimer Auto Const mandatory
  { Global variable for the initial hail }
  Int Property HailTimerModifier = 0 Auto Const
  { Increases or decreases the default SeGlobalHailTimer by HailTimerModifier seconds }
  Int Property HailingStage = 50 Auto Const
  { Stage that starts the hail }
  Int Property HailingDoneStage = 100 Auto Const
  { Stage that tracks if the hailing scene has already been run }
  Int Property stageToSetOnInSameLocation Auto Const
  { stage to set when the ship is in this location }
  ReferenceAlias Property HailingShip Auto Const
  { hailing ship alias }
  Bool Property enableMapMarkerOnStart Auto Const
  { enable mapmarker for POI SEs so the banner doesn't show on arrival for player SEs }
  Int Property FallBackTimerAdded = 5 Auto Const
  { Additional buffer time for backup timer for the automatic hail. }
  Bool Property setCooldownOnShutdown = False Auto Const
  { if true, will set cooldown timer on quest stoppage. For Player encounters where change location cooldown is invalid }
EndGroup


;-- Functions ---------------------------------------

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestStarted()
  If (LocationShutdownOnExit as Bool || StopQuestWhenPlayerLeavesSystem) || UseGlobalHailTimer ; #DEBUG_LINE_NO:57
    Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:58
    Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipGravJump") ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
  bFinishedOnStoryEvent = True ; #DEBUG_LINE_NO:62
  If enableMapMarkerOnStart ; #DEBUG_LINE_NO:64
    MapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
  If Self.CheckLocation() && UseGlobalHailTimer ; #DEBUG_LINE_NO:68
    Self.RegisterForMenuOpenCloseEvent("FaderMenu") ; #DEBUG_LINE_NO:69
    Self.StartFallbackHailTimer() ; #DEBUG_LINE_NO:70
  EndIf ; #DEBUG_LINE_NO:
  Parent.OnQuestStarted() ; #DEBUG_LINE_NO:73
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  Bool shouldShutdown = False ; #DEBUG_LINE_NO:84
  If setCooldownOnLoad ; #DEBUG_LINE_NO:86
    Location orbitLoc = OrbitLocation.GetLocation() ; #DEBUG_LINE_NO:87
    If akNewLoc == orbitLoc || orbitLoc.IsChild(akNewLoc) ; #DEBUG_LINE_NO:88
      Self.SetCooldown() ; #DEBUG_LINE_NO:90
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If SetStageOnInSameLocation ; #DEBUG_LINE_NO:94
    Location orbitloc = OrbitLocation.GetLocation() ; #DEBUG_LINE_NO:95
    If akNewLoc == orbitloc || orbitloc.IsChild(akNewLoc) ; #DEBUG_LINE_NO:96
      Self.SetStage(stageToSetOnInSameLocation) ; #DEBUG_LINE_NO:97
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If LocationShutdownOnExit ; #DEBUG_LINE_NO:102
    Location shutdownLocation = LocationShutdownOnExit.GetLocation() ; #DEBUG_LINE_NO:103
    If shutdownLocation ; #DEBUG_LINE_NO:105
      If akNewLoc == None || akNewLoc != shutdownLocation || shutdownLocation.IsChild(akNewLoc) == False ; #DEBUG_LINE_NO:110
        shouldShutdown = True ; #DEBUG_LINE_NO:112
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If shouldShutdown == False && StopQuestWhenPlayerLeavesSystem ; #DEBUG_LINE_NO:117
    Location myOrbitLocation = OrbitLocation.GetLocation() ; #DEBUG_LINE_NO:119
    If (myOrbitLocation as Bool && akNewLoc as Bool) && myOrbitLocation.HasCommonParent(akNewLoc, RE_Parent.LocTypeStarSystem) == False ; #DEBUG_LINE_NO:120
      shouldShutdown = True ; #DEBUG_LINE_NO:123
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If shouldShutdown ; #DEBUG_LINE_NO:128
    Self.Shutdown() ; #DEBUG_LINE_NO:129
  EndIf ; #DEBUG_LINE_NO:
  If Self.CheckLocation() && UseGlobalHailTimer ; #DEBUG_LINE_NO:132
    Self.RegisterForMenuOpenCloseEvent("FaderMenu") ; #DEBUG_LINE_NO:134
    Self.StartFallbackHailTimer() ; #DEBUG_LINE_NO:135
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSender, Location aDestination, Int aState)
  If aState == 1 ; #DEBUG_LINE_NO:141
    If StopQuestWhenPlayerLeavesSystem ; #DEBUG_LINE_NO:143
      Self.Shutdown() ; #DEBUG_LINE_NO:145
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestShutdown()
  If setCooldownOnShutdown == True ; #DEBUG_LINE_NO:151
    Self.SetCooldown() ; #DEBUG_LINE_NO:152
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function RemoveItemFromPlayerOrShip(Form itemToRemove, Int countToRemove, Int stageToSetOnSuccess, Bool preferShipInventory)
  spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:161
  ObjectReference playerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:162
  Bool success = False ; #DEBUG_LINE_NO:164
  If preferShipInventory ; #DEBUG_LINE_NO:166
    success = Self.TryToRemoveItem(itemToRemove, countToRemove, playerShipRef as ObjectReference) ; #DEBUG_LINE_NO:167
  Else ; #DEBUG_LINE_NO:
    success = Self.TryToRemoveItem(itemToRemove, countToRemove, playerRef) ; #DEBUG_LINE_NO:169
  EndIf ; #DEBUG_LINE_NO:
  If success == False ; #DEBUG_LINE_NO:172
    If preferShipInventory ; #DEBUG_LINE_NO:174
      success = Self.TryToRemoveItem(itemToRemove, countToRemove, playerRef) ; #DEBUG_LINE_NO:175
    Else ; #DEBUG_LINE_NO:
      success = Self.TryToRemoveItem(itemToRemove, countToRemove, playerShipRef as ObjectReference) ; #DEBUG_LINE_NO:177
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If success && stageToSetOnSuccess > -1 ; #DEBUG_LINE_NO:181
    Self.SetStage(stageToSetOnSuccess) ; #DEBUG_LINE_NO:182
  EndIf ; #DEBUG_LINE_NO:
  Return success ; #DEBUG_LINE_NO:184
EndFunction

Bool Function TryToRemoveItem(Form itemToRemove, Int countToRemove, ObjectReference refToRemoveFrom)
  Bool success = False ; #DEBUG_LINE_NO:189
  If refToRemoveFrom as Bool && refToRemoveFrom.GetItemCount(itemToRemove) >= countToRemove ; #DEBUG_LINE_NO:190
    success = True ; #DEBUG_LINE_NO:191
    refToRemoveFrom.RemoveItem(itemToRemove, countToRemove, False, None) ; #DEBUG_LINE_NO:192
  EndIf ; #DEBUG_LINE_NO:
  Return success ; #DEBUG_LINE_NO:194
EndFunction

Bool Function CheckLocation()
  Location orbitLoc = OrbitLocation.GetLocation() ; #DEBUG_LINE_NO:199
  If PlayerShip.GetRef().IsinLocation(orbitLoc) ; #DEBUG_LINE_NO:200
    Return True ; #DEBUG_LINE_NO:201
  Else ; #DEBUG_LINE_NO:
    Return False ; #DEBUG_LINE_NO:203
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "FaderMenu" ; #DEBUG_LINE_NO:209
    If !abOpening ; #DEBUG_LINE_NO:210
      Self.StartGlobalHailTimer() ; #DEBUG_LINE_NO:212
      Self.UnRegisterForMenuOpenCloseEvent("FaderMenu") ; #DEBUG_LINE_NO:213
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartGlobalHailTimer()
  Self.StartTimer(SEGlobalHailTimer.GetValue() + HailTimerModifier as Float, GlobalHailTimerID) ; #DEBUG_LINE_NO:222
EndFunction

Function StartFallbackHailTimer()
  Self.StartTimer((SEGlobalHailTimer.GetValue() + HailTimerModifier as Float) + FallBackTimerAdded as Float, FallbackHailTimerID) ; #DEBUG_LINE_NO:229
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == GlobalHailTimerID || aiTimerID == FallbackHailTimerID ; #DEBUG_LINE_NO:234
    If Self.GetStageDone(HailingDoneStage) == False && Self.CheckLocation() ; #DEBUG_LINE_NO:235
      Self.SetStage(HailingStage) ; #DEBUG_LINE_NO:236
      Self.UnRegisterForMenuOpenCloseEvent("FaderMenu") ; #DEBUG_LINE_NO:237
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function DebugPOI()
{ Debug function to cqf for testing. }
  ObjectReference testmapmarker = MapMarker.GetRef() ; #DEBUG_LINE_NO:246
  ObjectReference XMarker = MapMarker.GetRef().GetLinkedRef(None) ; #DEBUG_LINE_NO:247
  Game.GetPlayer().moveto(XMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:248
EndFunction
