ScriptName UC04_ThrallAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage = 575 Auto Const
{ Don't register for events until this stage is set }
Int Property ShutdownStage = 610 Auto Const
{ If this stage is set, shut all this behavior down }
Int Property StageToSet = 582 Auto Const
{ Stage to set if the player shoots an NPC }
conditionform Property UC04_WeaponIsTypeEM Auto Const mandatory
{ Condition form used to check if the player's using EM weapons }
ReferenceAlias Property TriggerStationInterior Auto Const mandatory
{ Trigger that wraps the interior of the NAT train station }
Keyword Property UC04_Thrall_TeleportMarker_LinkedRef Auto Const mandatory
{ Keyword to find the proper linked ref for the thralls to teleport to }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:23
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage ; #DEBUG_LINE_NO:28
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:30
    Self.RegisterForHitEvent(Self.GetRef() as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:31
  ElseIf auiStageID == ShutdownStage ; #DEBUG_LINE_NO:32
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:34
    Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If !Self.GetOwningQuest().GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:41
    If (akAggressor == Game.GetPlayer() as ObjectReference) && !UC04_WeaponIsTypeEM.IsTrue(None, None) ; #DEBUG_LINE_NO:42
      Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:44
      Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:45
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForHitEvent(Game.GetPlayer() as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:47
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:50
    Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnCellLoad()
  ObjectReference currREF = Self.GetRef() ; #DEBUG_LINE_NO:56
  If !currREF.IsInTrigger(TriggerStationInterior.GetRef()) && !Game.GetPlayer().HasDetectionLOS(currREF) ; #DEBUG_LINE_NO:58
    ObjectReference TeleportMarker = currREF.GetLinkedRef(UC04_Thrall_TeleportMarker_LinkedRef) ; #DEBUG_LINE_NO:59
    If TeleportMarker ; #DEBUG_LINE_NO:62
      currREF.MoveTo(TeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:64
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:73
EndFunction
