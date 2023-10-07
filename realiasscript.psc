ScriptName REAliasScript Extends ReferenceAlias
{ Should be attached to all aliases in Random Encounter and Overlay Encounter Quests.
	NOTE: changes here should also be made to RECollectionAliasScript }

;-- Variables ---------------------------------------
String LocalScriptName = "REAliasScript" Const

;-- Properties --------------------------------------
Group Flags
  Bool Property StartsDead = False Auto Const
  { Default = FALSE; should the actor be killed when they spawn? To be replaced by code solution. }
  Bool Property RegisterAlias = True Auto Const
  { Default = TRUE; for now, all aliases should register - this property may end up being removed }
  Bool Property TrackDeath = False Auto Const
  { Default = FALSE; set to true if you want the quest to track when this alias dies and set a stage
		NOTE: need to set GroupIndex if you are tracking multiple groups. See REScript for more details }
  Int Property GroupIndex = 0 Auto Const
  { Default = 0; used for tracking death, if you have more than one group.
		This index needs to match how you've set up DeadCounts arrays in REScript }
  Int Property OnHitStage Auto Const
  { Stage to set if actor is hit. }
  Faction Property OnHitFaction Auto Const
  { Faction of attacking actor which triggers OnHitStage. 
		Default = trigger on hit from player }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  rescript owningREScript = Self.GetOwningQuest() as rescript ; #DEBUG_LINE_NO:34
  If RegisterAlias && owningREScript as Bool ; #DEBUG_LINE_NO:37
    owningREScript.RegisterAlias(Self as ReferenceAlias) ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
  Self.CustomRegisterForHit() ; #DEBUG_LINE_NO:41
EndEvent

Event OnLoad()
  If StartsDead ; #DEBUG_LINE_NO:45
    Actor a = Self.GetActorRef() ; #DEBUG_LINE_NO:47
    If a as Bool && a.IsDead() == False ; #DEBUG_LINE_NO:48
      a.MoveToMyEditorLocation() ; #DEBUG_LINE_NO:49
      rescript owningREScript = Self.GetOwningQuest() as rescript ; #DEBUG_LINE_NO:50
      If owningREScript ; #DEBUG_LINE_NO:51
        owningREScript.RE_Parent.KillWithForce(a, None, True) ; #DEBUG_LINE_NO:52
      Else ; #DEBUG_LINE_NO:
        a.KillSilent(None) ; #DEBUG_LINE_NO:54
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:62
EndEvent

Event OnDeath(ObjectReference akKiller)
  rescript owningREScript = Self.GetOwningQuest() as rescript ; #DEBUG_LINE_NO:66
  If TrackDeath && owningREScript as Bool ; #DEBUG_LINE_NO:67
    owningREScript.IncrementDeadCount(GroupIndex) ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If OnHitStage > 0 && (akAggressor as Actor) as Bool ; #DEBUG_LINE_NO:74
    Actor attackingActor = akAggressor as Actor ; #DEBUG_LINE_NO:75
    If (OnHitFaction as Bool && attackingActor.IsInFaction(OnHitFaction)) || OnHitFaction == None && attackingActor == Game.GetPlayer() ; #DEBUG_LINE_NO:76
      Self.GetOwningQuest().SetStage(OnHitStage) ; #DEBUG_LINE_NO:77
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.CustomRegisterForHit() ; #DEBUG_LINE_NO:80
EndEvent

Function CustomRegisterForHit()
  If OnHitStage > 0 && Self.GetOwningQuest().GetStageDone(OnHitStage) == False ; #DEBUG_LINE_NO:86
    If OnHitFaction ; #DEBUG_LINE_NO:87
      Self.RegisterForHitEvent(Self as ScriptObject, OnHitFaction as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:89
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:92
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity)
  asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint ; #DEBUG_LINE_NO:103
  rescript owningREScript = Self.GetOwningQuest() as rescript ; #DEBUG_LINE_NO:104
  If owningREScript ; #DEBUG_LINE_NO:105
    owningREScript.Trace(CallingObject, asTextToPrint, aiSeverity) ; #DEBUG_LINE_NO:106
  Else ; #DEBUG_LINE_NO:
    Debug.Trace((CallingObject as String + " ") + asTextToPrint, aiSeverity) ; #DEBUG_LINE_NO:108
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function warning(ScriptObject CallingObject, String asTextToPrint, Bool DebugTrace, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint ; #DEBUG_LINE_NO:113
  rescript owningREScript = Self.GetOwningQuest() as rescript ; #DEBUG_LINE_NO:114
  If owningREScript ; #DEBUG_LINE_NO:115
    owningREScript.warning(CallingObject, asTextToPrint, False, 2, False, True, True) ; #DEBUG_LINE_NO:116
  EndIf ; #DEBUG_LINE_NO:
EndFunction
