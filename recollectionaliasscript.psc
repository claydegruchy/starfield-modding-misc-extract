ScriptName RECollectionAliasScript Extends RefCollectionAlias
{ Should be attached to all ref collection aliases in Random Encounter quests.
 NOTE: changes here should also be made to REAliasScript }

;-- Variables ---------------------------------------
String LocalScriptName = "RECollectionAliasScript" Const

;-- Properties --------------------------------------
Group Flags
  Bool Property StartsDead = False Auto Const
  { Default = FALSE; should the actor be killed when they spawn? To be replaced by code solution. }
  Bool Property RegisterAlias = True Auto Const
  { Default = TRUE; for now, all aliases should register - this property may end up being removed }
  Bool Property TrackDeath = False Auto Const
  { Default = FALSE; set to true if you want the quest to track when this alias dies and set a stage
	 NOTE: need to set GroupIndex if you are tracking multiple groups. See REScript for more details }
  Bool Property TrackOnDying = False Auto Const
  { Default = FALSE; set to true to fire when actors startdying instead of at the end of dying
	 NOTE: need to set GroupIndex if you are tracking multiple groups. See REScript for more details }
  Int Property RequiredStageToFireTrackDeath = -1 Auto Const
  { If -1 does nothing, otherwise only sends TrackDeath updates when the quest is set to this stage, 
	this is useful for using in conjunction witht he encounter wave setup that populates a RE RefCol }
  Bool Property ForceRefsToEnable = True Auto Const
  { When set to False, if the Reference Collection Alias is set to Initially Disabled then this script will not force them to become enabled. }
EndGroup

Group DeadCountGroups
  Int Property GroupIndex = 0 Auto Const
  { Default = 0; used for tracking death, if you have more than one group.
	This index needs to match how you've set up DeadCounts arrays in REScript }
  Bool Property AddCollectionSizeToGroupSize = False Auto Const
  { if TRUE, will automatically add the collection's size to the group count size }
EndGroup

Group OnHit
  Int Property OnHitStage Auto Const
  { stage to set if actor is hit }
  Faction Property OnHitFaction Auto Const
  { faction of attacking actor which triggers OnHitStage
	 Default = trigger on hit from player }
EndGroup

Group Randomize
  Int Property minimumCount = 0 Auto Const
  { if you want to randomize the number that actually appear, set a minimumCount less than the collection size
	  when the quest starts, the number that actually appear will be between minimumCount and the total collection size
	  (the others will be disabled and killed) }
  Bool Property RemoveUnusedRefs = False Auto Const
  { when set to True, any actors that are "unused" will also be removed from the ref collection 
	  this is mainly to allow BE quests to handle disembarking these actors correctly }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  rescript owningREScript = Self.GetOwningQuest() as rescript ; #DEBUG_LINE_NO:64
  If RegisterAlias && owningREScript as Bool ; #DEBUG_LINE_NO:66
    owningREScript.RegisterCollectionAlias(Self as RefCollectionAlias) ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
  Self.CustomRegisterForHit() ; #DEBUG_LINE_NO:70
  Int maxCount = Self.GetCount() ; #DEBUG_LINE_NO:73
  If AddCollectionSizeToGroupSize && GroupIndex > -1 && owningREScript as Bool ; #DEBUG_LINE_NO:74
    owningREScript.AdjustDeadCounts(GroupIndex, maxCount) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
  Int numberToEnable = maxCount ; #DEBUG_LINE_NO:79
  If minimumCount > 0 && minimumCount < maxCount ; #DEBUG_LINE_NO:80
    numberToEnable = Utility.RandomInt(minimumCount, maxCount) ; #DEBUG_LINE_NO:81
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] refsToEnable = new ObjectReference[0] ; #DEBUG_LINE_NO:85
  Int I = maxCount - 1 ; #DEBUG_LINE_NO:87
  While I > -1 ; #DEBUG_LINE_NO:88
    ObjectReference theRef = Self.GetAt(I) ; #DEBUG_LINE_NO:89
    If theRef ; #DEBUG_LINE_NO:90
      If I < numberToEnable ; #DEBUG_LINE_NO:91
        refsToEnable.add(theRef, 1) ; #DEBUG_LINE_NO:92
      Else ; #DEBUG_LINE_NO:
        theRef.Disable(False) ; #DEBUG_LINE_NO:94
        If theRef is Actor ; #DEBUG_LINE_NO:95
          (theRef as Actor).Kill(None) ; #DEBUG_LINE_NO:96
        ElseIf theRef is spaceshipreference ; #DEBUG_LINE_NO:97
          (theRef as spaceshipreference).Kill(None) ; #DEBUG_LINE_NO:98
        EndIf ; #DEBUG_LINE_NO:
        If RemoveUnusedRefs ; #DEBUG_LINE_NO:100
          Self.RemoveRef(theRef) ; #DEBUG_LINE_NO:101
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += -1 ; #DEBUG_LINE_NO:105
  EndWhile ; #DEBUG_LINE_NO:
  If ForceRefsToEnable ; #DEBUG_LINE_NO:108
    If refsToEnable.Length > 0 ; #DEBUG_LINE_NO:109
      Int enableIndex = 0 ; #DEBUG_LINE_NO:110
      While enableIndex < refsToEnable.Length ; #DEBUG_LINE_NO:111
        refsToEnable[enableIndex].Enable(False) ; #DEBUG_LINE_NO:112
        enableIndex += 1 ; #DEBUG_LINE_NO:114
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad(ObjectReference akSenderRef)
  If StartsDead ; #DEBUG_LINE_NO:121
    Actor a = akSenderRef as Actor ; #DEBUG_LINE_NO:122
    If a as Bool && a.IsDead() == False ; #DEBUG_LINE_NO:123
      a.MoveToMyEditorLocation() ; #DEBUG_LINE_NO:124
      rescript owningREScript = Self.GetOwningQuest() as rescript ; #DEBUG_LINE_NO:126
      If owningREScript ; #DEBUG_LINE_NO:127
        owningREScript.RE_Parent.KillWithForce(a, None, True) ; #DEBUG_LINE_NO:128
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  If TrackDeath ; #DEBUG_LINE_NO:136
    rescript owningREScript = Self.GetOwningQuest() as rescript ; #DEBUG_LINE_NO:137
    If owningREScript as Bool && (RequiredStageToFireTrackDeath == -1 || RequiredStageToFireTrackDeath == Self.GetOwningQuest().GetStage()) ; #DEBUG_LINE_NO:138
      owningREScript.IncrementDeadCount(GroupIndex) ; #DEBUG_LINE_NO:139
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)
  If TrackOnDying ; #DEBUG_LINE_NO:145
    rescript owningREScript = Self.GetOwningQuest() as rescript ; #DEBUG_LINE_NO:146
    If owningREScript as Bool && (RequiredStageToFireTrackDeath == -1 || RequiredStageToFireTrackDeath == Self.GetOwningQuest().GetStage()) ; #DEBUG_LINE_NO:147
      owningREScript.IncrementDeadCount(GroupIndex) ; #DEBUG_LINE_NO:148
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akSenderRef, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If OnHitStage > 0 && (akAggressor as Actor) as Bool ; #DEBUG_LINE_NO:154
    Actor attackingActor = akAggressor as Actor ; #DEBUG_LINE_NO:156
    If (OnHitFaction as Bool && attackingActor.IsInFaction(OnHitFaction)) || OnHitFaction == None && attackingActor == Game.GetPlayer() ; #DEBUG_LINE_NO:157
      Self.GetOwningQuest().SetStage(OnHitStage) ; #DEBUG_LINE_NO:159
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.CustomRegisterForHit() ; #DEBUG_LINE_NO:162
EndEvent

Function CustomRegisterForHit()
  If OnHitStage > 0 && Self.GetOwningQuest().GetStageDone(OnHitStage) == False ; #DEBUG_LINE_NO:167
    If OnHitFaction ; #DEBUG_LINE_NO:168
      Self.RegisterForHitEvent(Self as ScriptObject, OnHitFaction as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:169
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:171
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity)
  asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint ; #DEBUG_LINE_NO:182
  rescript owningREScript = Self.GetOwningQuest() as rescript ; #DEBUG_LINE_NO:183
  If owningREScript ; #DEBUG_LINE_NO:184
    owningREScript.Trace(CallingObject, asTextToPrint, aiSeverity) ; #DEBUG_LINE_NO:185
    Debug.Trace((CallingObject as String + " ") + asTextToPrint, aiSeverity) ; #DEBUG_LINE_NO:186
  Else ; #DEBUG_LINE_NO:
    Debug.Trace((CallingObject as String + " ") + asTextToPrint, aiSeverity) ; #DEBUG_LINE_NO:188
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function warning(ScriptObject CallingObject, String asTextToPrint, Bool DebugTrace, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint ; #DEBUG_LINE_NO:193
  rescript owningREScript = Self.GetOwningQuest() as rescript ; #DEBUG_LINE_NO:194
  If owningREScript ; #DEBUG_LINE_NO:195
    owningREScript.warning(CallingObject, asTextToPrint, False, 2, False, True, True) ; #DEBUG_LINE_NO:196
  EndIf ; #DEBUG_LINE_NO:
EndFunction
