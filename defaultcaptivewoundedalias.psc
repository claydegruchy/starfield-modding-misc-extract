ScriptName DefaultCaptiveWoundedAlias Extends ReferenceAlias
{ Use this script to gain standard support for wounded captive npcs being healed by player.

WARNING: Dual use of DefaultCaptiveAlias AND DefaultCaptiveWoundedAlias on the same NPC is not currently supported.

Let system design know if this is an important need. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutoFillProperties
  sq_captivescript Property SQ_Captive Auto Const mandatory
  Faction Property CaptiveFaction Auto Const mandatory
  Keyword Property SQ_Link_CaptiveFurniture Auto Const mandatory
  Faction Property WoundedFaction Auto Const mandatory
  ActorValue Property SQ_WoundedState Auto Const mandatory
  GlobalVariable Property SQ_WoundedState_0_Unset Auto Const mandatory
  GlobalVariable Property SQ_WoundedState_1_Wounded Auto Const mandatory
  GlobalVariable Property SQ_WoundedState_2_Healed Auto Const mandatory
  Keyword Property SQ_Wounded_DialogueSubtype_HealedActorGratitude Auto Const mandatory
  Keyword Property SQ_Captive_FurnitureType_Wounded Auto Const mandatory
EndGroup

Group MainProperties
  Bool Property StartWounded = True Auto Const
  { if true, captive is wounded }
  Bool Property DisableOnUnload = False Auto Const
  { after being freed, this actor will disable when unloaded }
  Bool Property AlsoRemoveFromCaptiveFaction = False Auto Const
  { after being freed, this actor will also be removed from the CaptiveFaction
		Use this for actors that will be attacked while fleeing }
EndGroup

Group SetStageProperties
  Quest Property QuestToSet Auto
  { If this is set, set the stage on this quest if StageToSetWhenHealed is not -1
		If QuestToSet is NOT set, it will try to set the stage on the owning quest }
  Int Property StageToSetWhenHealed = -1 Auto Const
  { this stage will be set when the victim is healed }
  Int Property StageToSetOnCleanUp = -1 Auto Const
  { this stage will be set when we try to clean up the actor }
EndGroup

Group CleanUpProperties
  Bool Property RemoveFromFactions = True Auto Const
  { if true (default), will remove from factions added by this script when cleaned up }
  Bool Property DeleteWhenCleanedUp = False Auto Const
  { if true, will delete when cleaned up }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForCustomEvent(SQ_Captive as ScriptObject, "sq_captivescript_WoundedActorHealed") ; #DEBUG_LINE_NO:60
  Self.AddToFactions() ; #DEBUG_LINE_NO:62
  Self.SetState() ; #DEBUG_LINE_NO:63
EndEvent

Event OnAliasShutdown()
  Self.ClearFactions() ; #DEBUG_LINE_NO:67
  Self.ResetAVs() ; #DEBUG_LINE_NO:68
  Self.CleanupIfReady() ; #DEBUG_LINE_NO:69
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If abRemove == False ; #DEBUG_LINE_NO:74
    Self.AddToFactions() ; #DEBUG_LINE_NO:75
    Self.SetState() ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  Self.SetState() ; #DEBUG_LINE_NO:81
EndEvent

Event OnUnload()
  If DisableOnUnload ; #DEBUG_LINE_NO:87
    Self.GetReference().Disable(False) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function AddToFactions()
  Actor captiveActor = Self.GetActorReference() ; #DEBUG_LINE_NO:93
  If captiveActor ; #DEBUG_LINE_NO:95
    captiveActor.AddToFaction(CaptiveFaction) ; #DEBUG_LINE_NO:96
    If StartWounded ; #DEBUG_LINE_NO:98
      captiveActor.AddToFaction(WoundedFaction) ; #DEBUG_LINE_NO:99
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetState()
  Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:106
  If actorRef.IsInFaction(WoundedFaction) ; #DEBUG_LINE_NO:109
    actorRef.SetValue(SQ_WoundedState, SQ_WoundedState_1_Wounded.GetValue()) ; #DEBUG_LINE_NO:110
    If actorRef.Is3DLoaded() ; #DEBUG_LINE_NO:111
      ObjectReference captiveFurniture = actorRef.GetLinkedRef(SQ_Link_CaptiveFurniture) ; #DEBUG_LINE_NO:113
      If captiveFurniture ; #DEBUG_LINE_NO:115
        actorRef.SnapIntoInteraction(captiveFurniture) ; #DEBUG_LINE_NO:116
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    actorRef.SetRestrained(True) ; #DEBUG_LINE_NO:119
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event SQ_CaptiveScript.WoundedActorHealed(sq_captivescript akSender, Var[] akArgs)
  Actor woundedActor = akArgs[0] as Actor ; #DEBUG_LINE_NO:124
  Bool playerIsHealer = akArgs[1] as Bool ; #DEBUG_LINE_NO:125
  Bool showInventory = akArgs[2] as Bool ; #DEBUG_LINE_NO:126
  If woundedActor as ObjectReference == Self.GetReference() ; #DEBUG_LINE_NO:128
    Self.HealActor(playerIsHealer) ; #DEBUG_LINE_NO:129
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CleanupIfReady()
  Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:135
  If actorRef.IsInFaction(WoundedFaction) == False ; #DEBUG_LINE_NO:137
    If RemoveFromFactions ; #DEBUG_LINE_NO:138
      Self.ClearFactions() ; #DEBUG_LINE_NO:139
    EndIf ; #DEBUG_LINE_NO:
    If DeleteWhenCleanedUp ; #DEBUG_LINE_NO:142
      actorRef.Disable(False) ; #DEBUG_LINE_NO:143
      actorRef.Delete() ; #DEBUG_LINE_NO:144
    EndIf ; #DEBUG_LINE_NO:
    If StageToSetOnCleanUp > -1 ; #DEBUG_LINE_NO:147
      If QuestToSet ; #DEBUG_LINE_NO:148
        QuestToSet.SetStage(StageToSetOnCleanUp) ; #DEBUG_LINE_NO:149
      Else ; #DEBUG_LINE_NO:
        Self.GetOwningQuest().SetStage(StageToSetOnCleanUp) ; #DEBUG_LINE_NO:151
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RemoveFromCaptiveFactionIfNeeded()
  Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:159
  If AlsoRemoveFromCaptiveFaction && actorRef.IsInFaction(WoundedFaction) == False ; #DEBUG_LINE_NO:161
    actorRef.RemoveFromFaction(CaptiveFaction) ; #DEBUG_LINE_NO:162
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HealActor(Bool playerIsHealer)
  Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:167
  actorRef.SetValue(SQ_WoundedState, SQ_WoundedState_2_Healed.GetValue()) ; #DEBUG_LINE_NO:171
  actorRef.RemoveFromFaction(WoundedFaction) ; #DEBUG_LINE_NO:173
  Self.RemoveFromCaptiveFactionIfNeeded() ; #DEBUG_LINE_NO:174
  actorRef.SetRestrained(False) ; #DEBUG_LINE_NO:176
  actorRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:178
  actorRef.SayCustom(SQ_Wounded_DialogueSubtype_HealedActorGratitude, None, False, None) ; #DEBUG_LINE_NO:180
  If StageToSetWhenHealed > -1 ; #DEBUG_LINE_NO:182
    If QuestToSet ; #DEBUG_LINE_NO:183
      QuestToSet.SetStage(StageToSetWhenHealed) ; #DEBUG_LINE_NO:184
    Else ; #DEBUG_LINE_NO:
      Self.GetOwningQuest().SetStage(StageToSetWhenHealed) ; #DEBUG_LINE_NO:186
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  actorRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:189
EndFunction

Function ClearFactions()
  Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:195
  actorRef.RemoveFromFaction(CaptiveFaction) ; #DEBUG_LINE_NO:197
  actorRef.RemoveFromFaction(WoundedFaction) ; #DEBUG_LINE_NO:198
EndFunction

Function ResetAVs()
  Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:202
  actorRef.SetValue(SQ_WoundedState, SQ_WoundedState_0_Unset.GetValue()) ; #DEBUG_LINE_NO:204
EndFunction
