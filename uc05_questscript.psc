ScriptName UC05_QuestScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct IntercomDatum
  ReferenceAlias TargetIntercom
  { The currently active intercom }
  ReferenceAlias MatchingPowerSwitch
  { What power box this intercom is leading the player to. If it's already been thrown, we'll progress 
    to the next batch }
  Bool WaitForRestart
  { If true, don't update to the next intercom until the relevant power swtich is thrown }
  Int StageToSetOnActive = -1
  { When this intercom is the active one, and is activated, set this stage }
EndStruct


;-- Variables ---------------------------------------
Bool SkipRemoval
Bool SkipUpdates

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard IntercomStateGuard

;-- Properties --------------------------------------
Group Objects
  ReferenceAlias Property ActiveIntercom Auto Const mandatory
  { Alias to hold the currently active intercom }
  ReferenceAlias Property ActiveIntercomTrigger Auto Const mandatory
  { Alias to hold the currently active intercom trigger. When the player enters this, we update to the next intercom }
  ReferenceAlias Property IntercomAudioSource Auto Const mandatory
  { The object making the intercom audio sounds }
  ReferenceAlias Property IntercomSoundMarker Auto Const mandatory
  { Ref alias for the sound marker that we move around to create the persistent hissing }
  Scene Property UC05_Codin_LoopingIntercom Auto Const mandatory
  { Looping audio scene to draw the player towards the next marker }
  RefCollectionAlias Property Alias_VenomTreeHaze_Group01 Auto Const mandatory
  { Venom Tree Haze on the first floor tied to power switch in the meeting room }
  RefCollectionAlias Property Alias_VenomTreeHaze_Group02 Auto Const mandatory
  { Venom Tree Haze on the third floor tied to power switch in the room near the cubicles }
  RefCollectionAlias Property Shutters Auto Const mandatory
  { Ref collection for the shutters in the Cabinet chambers }
EndGroup

Group IntercomData
  uc05_questscript:intercomdatum[] Property IntercomData Auto mandatory
  { An array of ref alias pairings that manage the order on the intercoms through which the player has to run in the 
    Va'ruun embassy }
  uc05_questscript:intercomdatum[] Property IntercomDataStorage Auto mandatory
  { An array of ref aliases allowing me to store old data without throwing it all out. Not used for anything else. }
  Int Property IntercomState Auto conditional
  { A var that gets updated each time we've throw one of the power switches to allow the Ambassador's audio to get clearer }
EndGroup

Group Stages
  Int[] Property PowerSwitchStages Auto Const mandatory
  { Array of stages to check when a power switch is throw. If they're all set, set stage 600 }
  Int Property AllPowerOnStage = 600 Auto Const
  { Stage to set once all the power's back on }
  Int Property ShutdownStage = 650 Auto Const
  { Once this stage has been set, no additonal activations should do anything }
EndGroup


;-- Functions ---------------------------------------

Function UpdateActiveIntercom(ScriptObject akSourceCall, Bool bRestartChain, ReferenceAlias PowerSwitchAlias, Int PrereqStage)
  If !Self.GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:72
    uc05_questscript:intercomdatum currDatum = IntercomData[0] ; #DEBUG_LINE_NO:75
    ObjectReference currIntercom = currDatum.TargetIntercom.GetRef() ; #DEBUG_LINE_NO:76
    ObjectReference currActiveIntercom = ActiveIntercom.GetRef() ; #DEBUG_LINE_NO:77
    If PowerSwitchAlias != None ; #DEBUG_LINE_NO:80
      ObjectReference ActivatedPowerbox = PowerSwitchAlias.GetRef() ; #DEBUG_LINE_NO:81
      ObjectReference currDatumPowerSwitch = currDatum.MatchingPowerSwitch.GetRef() ; #DEBUG_LINE_NO:82
      Self.CleanUpIntercomList(PowerSwitchAlias) ; #DEBUG_LINE_NO:86
      Self.CheckForAllSwitchesSet() ; #DEBUG_LINE_NO:89
      If ActivatedPowerbox != currDatumPowerSwitch || PrereqStage > 0 && !Self.GetStageDone(PrereqStage) ; #DEBUG_LINE_NO:92
        Return  ; #DEBUG_LINE_NO:94
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If currActiveIntercom != None ; #DEBUG_LINE_NO:100
      UC05_Codin_LoopingIntercom.Stop() ; #DEBUG_LINE_NO:101
    EndIf ; #DEBUG_LINE_NO:
    ActiveIntercom.Clear() ; #DEBUG_LINE_NO:105
    ObjectReference SoundREF = IntercomSoundMarker.GetRef() ; #DEBUG_LINE_NO:106
    SoundREF.Disable(False) ; #DEBUG_LINE_NO:107
    If bRestartChain ; #DEBUG_LINE_NO:109
      currDatum = IntercomData[0] ; #DEBUG_LINE_NO:111
      currIntercom = currDatum.TargetIntercom.GetRef() ; #DEBUG_LINE_NO:112
      SkipUpdates = False ; #DEBUG_LINE_NO:113
    EndIf ; #DEBUG_LINE_NO:
    If !SkipUpdates ; #DEBUG_LINE_NO:116
      Int currStage = currDatum.StageToSetOnActive ; #DEBUG_LINE_NO:119
      If currStage >= 0 ; #DEBUG_LINE_NO:121
        (ActiveIntercom as uc05_activeintercomaliasscript).UpdateStageToSet(currStage) ; #DEBUG_LINE_NO:122
      EndIf ; #DEBUG_LINE_NO:
      ActiveIntercom.ForceRefTo(currIntercom) ; #DEBUG_LINE_NO:125
      ObjectReference SceneREF = IntercomAudioSource.GetRef() ; #DEBUG_LINE_NO:129
      SceneREF.MoveTo(currIntercom, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:130
      SoundREF.MoveTo(currIntercom, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:134
      SoundREF.Enable(False) ; #DEBUG_LINE_NO:136
      UC05_Codin_LoopingIntercom.Start() ; #DEBUG_LINE_NO:139
      If !SkipRemoval ; #DEBUG_LINE_NO:142
        IntercomData.remove(0, 1) ; #DEBUG_LINE_NO:143
      Else ; #DEBUG_LINE_NO:
        SkipRemoval = False ; #DEBUG_LINE_NO:147
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If currDatum.WaitForRestart ; #DEBUG_LINE_NO:151
      SkipUpdates = True ; #DEBUG_LINE_NO:153
      SkipRemoval = True ; #DEBUG_LINE_NO:154
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CleanUpIntercomList(ReferenceAlias akActivatedPowerSwitch)
  Int I = IntercomData.Length - 1 ; #DEBUG_LINE_NO:161
  While I >= 0 ; #DEBUG_LINE_NO:164
    uc05_questscript:intercomdatum currDatum = IntercomData[I] ; #DEBUG_LINE_NO:165
    ReferenceAlias currPowerSwitchAlias = currDatum.MatchingPowerSwitch ; #DEBUG_LINE_NO:167
    ObjectReference IntercomREF = currDatum.TargetIntercom.GetRef() ; #DEBUG_LINE_NO:168
    If currPowerSwitchAlias == akActivatedPowerSwitch ; #DEBUG_LINE_NO:171
      IntercomData.remove(I, 1) ; #DEBUG_LINE_NO:173
    EndIf ; #DEBUG_LINE_NO:
    I -= 1 ; #DEBUG_LINE_NO:176
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function DEBUGPrintIntercomArray()
  Int I = 0 ; #DEBUG_LINE_NO:181
  Int iLength = IntercomData.Length ; #DEBUG_LINE_NO:182
  While I < iLength ; #DEBUG_LINE_NO:184
    I += 1 ; #DEBUG_LINE_NO:187
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function CheckForAllSwitchesSet()
  Int I = 0 ; #DEBUG_LINE_NO:193
  Int iLength = PowerSwitchStages.Length ; #DEBUG_LINE_NO:194
  Bool bPowerSwitchesRemain = False ; #DEBUG_LINE_NO:195
  While I < iLength && !bPowerSwitchesRemain ; #DEBUG_LINE_NO:197
    Int currStage = PowerSwitchStages[I] ; #DEBUG_LINE_NO:198
    If !Self.GetStageDone(currStage) ; #DEBUG_LINE_NO:200
      bPowerSwitchesRemain = True ; #DEBUG_LINE_NO:201
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:204
  EndWhile ; #DEBUG_LINE_NO:
  If !bPowerSwitchesRemain ; #DEBUG_LINE_NO:207
    Self.SetStage(AllPowerOnStage) ; #DEBUG_LINE_NO:208
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function IncrementIntercomState(Int aiIncrementAmount)
  Guard IntercomStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:213
    IntercomState += aiIncrementAmount ; #DEBUG_LINE_NO:214
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function RemoveHaze(Int abSwitch)
  Int I = 0 ; #DEBUG_LINE_NO:219
  If abSwitch == 1 ; #DEBUG_LINE_NO:220
    ObjectReference[] VenomHazeGroupRef = Alias_VenomTreeHaze_Group01.GetArray() ; #DEBUG_LINE_NO:221
    While I < VenomHazeGroupRef.Length ; #DEBUG_LINE_NO:222
      VenomHazeGroupRef[I].PlayAnimation("stage2") ; #DEBUG_LINE_NO:223
      I += 1 ; #DEBUG_LINE_NO:224
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf abSwitch == 2 ; #DEBUG_LINE_NO:226
    ObjectReference[] venomhazegroupref = Alias_VenomTreeHaze_Group02.GetArray() ; #DEBUG_LINE_NO:227
    While I < venomhazegroupref.Length ; #DEBUG_LINE_NO:228
      venomhazegroupref[I].PlayAnimation("stage2") ; #DEBUG_LINE_NO:229
      I += 1 ; #DEBUG_LINE_NO:230
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function OpenShutters()
  Int I = 0 ; #DEBUG_LINE_NO:236
  Int iCount = Shutters.GetCount() ; #DEBUG_LINE_NO:237
  While I < iCount ; #DEBUG_LINE_NO:239
    ObjectReference currRef = Shutters.GetAt(I) ; #DEBUG_LINE_NO:240
    currRef.PlayAnimation("Open") ; #DEBUG_LINE_NO:242
    I += 1 ; #DEBUG_LINE_NO:243
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:253
EndFunction
