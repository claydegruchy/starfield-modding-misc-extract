ScriptName UCParentFactionQuestScript Extends Quest

;-- Variables ---------------------------------------
Int iTimerID = 1 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard MindControlGuard

;-- Properties --------------------------------------
GlobalVariable Property UC04_ReconstructionStateTimerLength Auto Const mandatory
{ Global var used to determine how long we wait before trying to turn off the New Atlantis "reconstruction" state }
Location Property CityNewAtlantisLocation Auto Const mandatory
{ New Atlantis city location used to make sure we're not turning off the state change while the player's around }
Int Property FailsafeTimerLength = 60 Auto Const
{ If the player is in New Atlantis when we try to clean up this state change, use this timer length to wait and check again }
Int Property StageToSet = 1000 Auto Const
{ Stage to set once enough time has elapsed and the player's no longer on New Atlantis to clean up the reconstruction }
RefCollectionAlias Property Thralls Auto Const mandatory
{ Collection used to handle any human thralls and cleaning up their voicetypes }
VoiceType Property NPCFTerrormorphThrall Auto Const mandatory
{ Female Terrormorph Thrall voicetype }
VoiceType Property NPCMTerrormorphThrall Auto Const mandatory
{ Male Terrormorph Thrall voicetype }
Race Property HumanRace Auto Const mandatory
{ Used to know if we should override the NPC's voicetype }
Float Property AggressionOverride = 2.0 Auto Const
{ What we set the mind controlled NPCs aggression to }
ActorValue Property Aggression Auto Const mandatory
{ AV used to make the NPCs hostile }
ActorValue Property UC_MindControl_InitialAggression Auto Const mandatory
{ The NPCs mind control value when the moment starts }
Topic Property Thrall_TakeOverStart Auto Const mandatory
{ Topic to play when a human NPC is initially taken over by a Terrormorph }
Keyword Property UC_MindControlledNPC Auto Const mandatory
{ Keyword applied to Mind Controlled NPC's }

;-- Functions ---------------------------------------

Function SendNPCSuccessfullyMindControledEvent(Actor akSourceTerrormorph, Actor akMindControlTarget)
  Var[] akargs = new Var[2] ; #DEBUG_LINE_NO:53
  akargs[0] = akSourceTerrormorph as Var ; #DEBUG_LINE_NO:54
  akargs[1] = akMindControlTarget as Var ; #DEBUG_LINE_NO:55
  Self.SendCustomEvent("ucparentfactionquestscript_MindControlTriggered", akargs) ; #DEBUG_LINE_NO:58
EndFunction

Function SendUCR04SampleCollectedEvent(Actor akTargetActor)
  Var[] akargs = new Var[1] ; #DEBUG_LINE_NO:62
  akargs[0] = akTargetActor as Var ; #DEBUG_LINE_NO:63
  Self.SendCustomEvent("ucparentfactionquestscript_UCR04SampleCollected", akargs) ; #DEBUG_LINE_NO:66
EndFunction

Function BeginStateChangeTimer()
  Self.StartTimer(UC04_ReconstructionStateTimerLength.GetValue(), iTimerID) ; #DEBUG_LINE_NO:71
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTimerID ; #DEBUG_LINE_NO:76
    Location CurrLoc = Game.GetPlayer().GetCurrentLocation() ; #DEBUG_LINE_NO:77
    If CurrLoc != CityNewAtlantisLocation && !CityNewAtlantisLocation.IsChild(CurrLoc) ; #DEBUG_LINE_NO:79
      Self.SetStage(StageToSet) ; #DEBUG_LINE_NO:80
    Else ; #DEBUG_LINE_NO:
      Self.StartTimer(FailsafeTimerLength as Float, iTimerID) ; #DEBUG_LINE_NO:83
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartThrallTimer()
  (Thralls as thrallcollvocleanupscript).StartCheck() ; #DEBUG_LINE_NO:90
EndFunction

Function StartMindControlBehavior(Actor TargetActor, Actor akCaster)
  Guard MindControlGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:94
    Thralls.AddRef(TargetActor as ObjectReference) ; #DEBUG_LINE_NO:98
    Float currAggression = TargetActor.GetValue(Aggression) ; #DEBUG_LINE_NO:101
    If TargetActor.GetBaseValue(Aggression) == currAggression ; #DEBUG_LINE_NO:104
      If currAggression < AggressionOverride ; #DEBUG_LINE_NO:107
        TargetActor.AddKeyword(UC_MindControlledNPC) ; #DEBUG_LINE_NO:110
        TargetActor.SetValue(UC_MindControl_InitialAggression, currAggression) ; #DEBUG_LINE_NO:113
        TargetActor.SetValue(Aggression, AggressionOverride) ; #DEBUG_LINE_NO:116
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If TargetActor.GetRace() == HumanRace ; #DEBUG_LINE_NO:123
      VoiceType OverrideVoiceType = None ; #DEBUG_LINE_NO:124
      ActorBase TargetBase = TargetActor.GetBaseObject() as ActorBase ; #DEBUG_LINE_NO:125
      If TargetBase ; #DEBUG_LINE_NO:128
        If TargetBase.GetSex() == 0 ; #DEBUG_LINE_NO:129
          OverrideVoiceType = NPCMTerrormorphThrall ; #DEBUG_LINE_NO:130
        Else ; #DEBUG_LINE_NO:
          OverrideVoiceType = NPCFTerrormorphThrall ; #DEBUG_LINE_NO:132
        EndIf ; #DEBUG_LINE_NO:
        If OverrideVoiceType != None && TargetActor.GetVoiceType() != OverrideVoiceType ; #DEBUG_LINE_NO:137
          TargetActor.SetOverrideVoiceType(OverrideVoiceType) ; #DEBUG_LINE_NO:138
          TargetActor.Say(Thrall_TakeOverStart, None, False, None) ; #DEBUG_LINE_NO:140
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.SendNPCSuccessfullyMindControledEvent(akCaster, TargetActor) ; #DEBUG_LINE_NO:147
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function StopMindControlBehavior(Actor OriginalTarget)
  Guard MindControlGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:153
    Float currAggression = OriginalTarget.GetValue(Aggression) ; #DEBUG_LINE_NO:156
    Float SavedAggression = OriginalTarget.GetValue(UC_MindControl_InitialAggression) ; #DEBUG_LINE_NO:157
    Float BaseAggression = OriginalTarget.GetBaseValue(Aggression) ; #DEBUG_LINE_NO:158
    If currAggression != SavedAggression && BaseAggression == AggressionOverride ; #DEBUG_LINE_NO:163
      OriginalTarget.SetValue(Aggression, SavedAggression) ; #DEBUG_LINE_NO:164
      OriginalTarget.SetValue(UC_MindControl_InitialAggression, 0.0) ; #DEBUG_LINE_NO:167
    EndIf ; #DEBUG_LINE_NO:
    OriginalTarget.StopCombat() ; #DEBUG_LINE_NO:172
    If OriginalTarget.GetVoiceType() == NPCFTerrormorphThrall || OriginalTarget.GetVoiceType() == NPCMTerrormorphThrall ; #DEBUG_LINE_NO:177
      OriginalTarget.SetOverrideVoiceType(None) ; #DEBUG_LINE_NO:179
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:190
EndFunction
