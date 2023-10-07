ScriptName TerrormorphMindControlEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Actor CastingActor
Actor OriginalTarget
Bool bEffectComplete
Int eventInstance1 = 0
Int eventInstance2 = 0
Float initialAssistance = -1.0

;-- Properties --------------------------------------
Quest Property UC_TerrormorphSupportQuest Auto Const mandatory
{ Quest to start playing if this is the player }
wwiseevent Property EventForm1 Auto Const mandatory
{ First Wwise event to play }
wwiseevent Property EventForm2 Auto Const mandatory
{ Second Wwise event to play }
String Property GlobalStateGroup Auto Const mandatory
{ State group name from Wwise. String must match what's in Wwise. }
String Property GlobalStateActive Auto Const mandatory
{ Active State name from Wwise. String must match what's in Wwise. }
String Property GlobalStateInactive Auto Const mandatory
{ Inactive State name from Wwise. String must match what's in Wwise. }
Quest Property DialogueUCFactionAlwaysOn Auto Const mandatory
{ Parent quest used to track the mind control custom event }
RefCollectionAlias Property Thralls Auto Const mandatory
{ Failsafe ref collection for the thralls to clean up their voicetype }
Bool Property DispelOnBleedout = True Auto Const
{ Set to true on NPCs you want to lose the effect on bleedout }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If !bEffectComplete ; #DEBUG_LINE_NO:41
    CastingActor = akCaster ; #DEBUG_LINE_NO:44
    Self.RegisterForRemoteEvent(CastingActor as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:45
    If DispelOnBleedout ; #DEBUG_LINE_NO:47
      Self.RegisterForRemoteEvent(CastingActor as ScriptObject, "OnEnterBleedOut") ; #DEBUG_LINE_NO:48
    EndIf ; #DEBUG_LINE_NO:
    If akTarget == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:51
      UC_TerrormorphSupportQuest.Start() ; #DEBUG_LINE_NO:52
      (UC_TerrormorphSupportQuest as uc_terrormorphsupportscript).SourceTerrormorph.ForceRefTo(CastingActor as ObjectReference) ; #DEBUG_LINE_NO:53
      wwiseevent.SetGlobalState(GlobalStateGroup, GlobalStateActive) ; #DEBUG_LINE_NO:54
    Else ; #DEBUG_LINE_NO:
      Actor TargetActor = akTarget as Actor ; #DEBUG_LINE_NO:58
      If TargetActor ; #DEBUG_LINE_NO:59
        OriginalTarget = TargetActor ; #DEBUG_LINE_NO:61
        ucparentfactionquestscript ParentQuest = DialogueUCFactionAlwaysOn as ucparentfactionquestscript ; #DEBUG_LINE_NO:63
        ParentQuest.StartMindControlBehavior(TargetActor, akCaster) ; #DEBUG_LINE_NO:64
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If !bEffectComplete ; #DEBUG_LINE_NO:72
    bEffectComplete = True ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  If akTarget == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:76
    UC_TerrormorphSupportQuest.Stop() ; #DEBUG_LINE_NO:77
    wwiseevent.SetGlobalState(GlobalStateGroup, GlobalStateInactive) ; #DEBUG_LINE_NO:78
  Else ; #DEBUG_LINE_NO:
    Actor TargetActor = akTarget as Actor ; #DEBUG_LINE_NO:81
    If TargetActor ; #DEBUG_LINE_NO:83
      (DialogueUCFactionAlwaysOn as ucparentfactionquestscript).StopMindControlBehavior(TargetActor) ; #DEBUG_LINE_NO:85
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.UnregisterForRemoteEvent(CastingActor as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:90
  Self.UnregisterForRemoteEvent(CastingActor as ScriptObject, "OnEnterBleedOut") ; #DEBUG_LINE_NO:91
  CastingActor = None ; #DEBUG_LINE_NO:92
  OriginalTarget = None ; #DEBUG_LINE_NO:93
EndEvent

Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
  If akSender == CastingActor ; #DEBUG_LINE_NO:97
    Self.CleanUpEffect() ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnEnterBleedout(Actor akSender)
  If akSender == CastingActor ; #DEBUG_LINE_NO:104
    Self.CleanUpEffect() ; #DEBUG_LINE_NO:106
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CleanUpEffect()
  If !bEffectComplete ; #DEBUG_LINE_NO:111
    bEffectComplete = True ; #DEBUG_LINE_NO:112
  EndIf ; #DEBUG_LINE_NO:
  (DialogueUCFactionAlwaysOn as ucparentfactionquestscript).StopMindControlBehavior(OriginalTarget) ; #DEBUG_LINE_NO:115
  Self.UnregisterForRemoteEvent(CastingActor as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:116
  Self.UnregisterForRemoteEvent(CastingActor as ScriptObject, "OnEnterBleedOut") ; #DEBUG_LINE_NO:117
  CastingActor = None ; #DEBUG_LINE_NO:118
  OriginalTarget = None ; #DEBUG_LINE_NO:119
  Self.Dispel() ; #DEBUG_LINE_NO:120
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:127
EndFunction
