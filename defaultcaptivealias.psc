ScriptName DefaultCaptiveAlias Extends ReferenceAlias default
{ Use this script to gain standard support for bound captive npcs being freed by player.

WARNING: Dual use of DefaultCaptiveAlias AND DefaultCaptiveWoundedAlias on the same NPC is not currently supported.

Let system design know if this is an important need. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutoFillProperties
  sq_captivescript Property SQ_Captive Auto Const mandatory
  Faction Property CaptiveFaction Auto Const mandatory
  Keyword Property SQ_Link_CaptiveFurniture Auto Const mandatory
  Faction Property BoundFaction Auto Const mandatory
  ActorValue Property SQ_CaptiveState Auto Const mandatory
  GlobalVariable Property SQ_CaptiveState_0_Unset Auto Const mandatory
  GlobalVariable Property SQ_CaptiveState_1_Captive Auto Const mandatory
  GlobalVariable Property SQ_CaptiveState_2_Freed Auto Const mandatory
  Keyword Property SQ_Captive_DialogueSubtype_FreedPrisonerGratitude Auto Const mandatory
  Keyword Property SQ_Captive_FurnitureType_Bound Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
EndGroup

Group MainProperties
  Bool Property StartBound = True Auto Const
  { if true, captive is bound }
  Bool Property DisableOnUnload = False Auto Const
  { after being freed, this actor will disable when unloaded }
  Bool Property AlsoRemoveFromCaptiveFaction = False Auto Const
  { after being freed, this actor will also be removed from the CaptiveFaction
		Use this for actors that will be attacked while fleeing }
EndGroup

Group SetStageProperties
  Quest Property QuestToSet Auto
  { If this is set, set the stage on this quest if StageToSetWhenFreed is not -1
		If QuestToSet is NOT set, it will try to set the stage on the owning quest }
  Int Property StageToSetWhenFreed = -1 Auto Const
  { this stage will be set when the prisoner is freed }
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
  Self.RegisterForCustomEvent(SQ_Captive as ScriptObject, "sq_captivescript_CaptiveSetFree") ; #DEBUG_LINE_NO:61
  Self.AddToFactions() ; #DEBUG_LINE_NO:63
  Self.SetState() ; #DEBUG_LINE_NO:64
EndEvent

Event OnAliasShutdown()
  Self.ClearFactions() ; #DEBUG_LINE_NO:68
  Self.ResetAVs() ; #DEBUG_LINE_NO:69
  Self.CleanupIfReady() ; #DEBUG_LINE_NO:70
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If abRemove == False ; #DEBUG_LINE_NO:75
    Self.AddToFactions() ; #DEBUG_LINE_NO:76
    Self.SetState() ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  Self.SetState() ; #DEBUG_LINE_NO:82
EndEvent

Event OnUnload()
  If DisableOnUnload ; #DEBUG_LINE_NO:88
    Self.GetReference().Disable(False) ; #DEBUG_LINE_NO:89
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function AddToFactions()
  Actor captiveActor = Self.GetActorReference() ; #DEBUG_LINE_NO:94
  If captiveActor ; #DEBUG_LINE_NO:96
    captiveActor.AddToFaction(CaptiveFaction) ; #DEBUG_LINE_NO:97
    If StartBound ; #DEBUG_LINE_NO:99
      captiveActor.AddToFaction(BoundFaction) ; #DEBUG_LINE_NO:100
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetState()
  Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:107
  If actorRef as Bool && actorRef.IsInFaction(BoundFaction) ; #DEBUG_LINE_NO:109
    actorRef.SetValue(SQ_CaptiveState, SQ_CaptiveState_1_Captive.GetValue()) ; #DEBUG_LINE_NO:110
    If actorRef.Is3DLoaded() ; #DEBUG_LINE_NO:111
      ObjectReference captiveFurniture = actorRef.GetLinkedRef(SQ_Link_CaptiveFurniture) ; #DEBUG_LINE_NO:113
      If captiveFurniture ; #DEBUG_LINE_NO:114
        actorRef.SnapIntoInteraction(captiveFurniture) ; #DEBUG_LINE_NO:115
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    actorRef.SetRestrained(True) ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event SQ_CaptiveScript.CaptiveSetFree(sq_captivescript akSender, Var[] akArgs)
  Actor captive = akArgs[0] as Actor ; #DEBUG_LINE_NO:124
  Bool playerIsLiberator = akArgs[1] as Bool ; #DEBUG_LINE_NO:125
  Bool showInventory = akArgs[2] as Bool ; #DEBUG_LINE_NO:126
  If captive as ObjectReference == Self.GetReference() ; #DEBUG_LINE_NO:128
    Self.FreePrisoner(playerIsLiberator, showInventory) ; #DEBUG_LINE_NO:129
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CleanupIfReady()
  Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:134
  If actorRef.IsInFaction(BoundFaction) == False ; #DEBUG_LINE_NO:136
    If RemoveFromFactions ; #DEBUG_LINE_NO:137
      Self.ClearFactions() ; #DEBUG_LINE_NO:138
    EndIf ; #DEBUG_LINE_NO:
    If DeleteWhenCleanedUp ; #DEBUG_LINE_NO:141
      actorRef.Disable(False) ; #DEBUG_LINE_NO:142
      actorRef.Delete() ; #DEBUG_LINE_NO:143
    EndIf ; #DEBUG_LINE_NO:
    If StageToSetOnCleanUp > -1 ; #DEBUG_LINE_NO:146
      If QuestToSet ; #DEBUG_LINE_NO:147
        QuestToSet.SetStage(StageToSetOnCleanUp) ; #DEBUG_LINE_NO:148
      Else ; #DEBUG_LINE_NO:
        Self.GetOwningQuest().SetStage(StageToSetOnCleanUp) ; #DEBUG_LINE_NO:150
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RemoveFromCaptiveFactionIfNeeded()
  Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:158
  If AlsoRemoveFromCaptiveFaction && actorRef.IsInFaction(BoundFaction) == False ; #DEBUG_LINE_NO:160
    actorRef.RemoveFromFaction(CaptiveFaction) ; #DEBUG_LINE_NO:161
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function FreePrisoner(Bool playerIsLiberator, Bool OpenPrisonerInventory)
  Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:166
  actorRef.SetValue(SQ_CaptiveState, SQ_CaptiveState_2_Freed.GetValue()) ; #DEBUG_LINE_NO:170
  actorRef.RemoveFromFaction(BoundFaction) ; #DEBUG_LINE_NO:172
  Self.RemoveFromCaptiveFactionIfNeeded() ; #DEBUG_LINE_NO:173
  actorRef.SetRestrained(False) ; #DEBUG_LINE_NO:175
  actorRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:177
  If OpenPrisonerInventory ; #DEBUG_LINE_NO:179
    actorRef.openInventory(True, None, True) ; #DEBUG_LINE_NO:180
  EndIf ; #DEBUG_LINE_NO:
  actorRef.SayCustom(SQ_Captive_DialogueSubtype_FreedPrisonerGratitude, None, False, None) ; #DEBUG_LINE_NO:183
  If StageToSetWhenFreed > -1 ; #DEBUG_LINE_NO:185
    If QuestToSet ; #DEBUG_LINE_NO:186
      QuestToSet.SetStage(StageToSetWhenFreed) ; #DEBUG_LINE_NO:187
    Else ; #DEBUG_LINE_NO:
      Self.GetOwningQuest().SetStage(StageToSetWhenFreed) ; #DEBUG_LINE_NO:189
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  actorRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:192
EndFunction

Function ClearFactions()
  Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:197
  actorRef.RemoveFromFaction(CaptiveFaction) ; #DEBUG_LINE_NO:199
  actorRef.RemoveFromFaction(BoundFaction) ; #DEBUG_LINE_NO:200
EndFunction

Function ResetAVs()
  Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:204
  actorRef.SetValue(SQ_CaptiveState, SQ_CaptiveState_0_Unset.GetValue()) ; #DEBUG_LINE_NO:206
EndFunction
