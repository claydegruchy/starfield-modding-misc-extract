ScriptName UC02_TerrormorphScript Extends ReferenceAlias

;-- Variables ---------------------------------------
ObjectReference CurrentLureTarget
Int InspectTimerID = 1 Const

;-- Properties --------------------------------------
ReferenceAlias Property ActiveLure Auto Const mandatory
{ Ref alias for the currently active lure }
ReferenceAlias Property LurePathingTarget Auto Const mandatory
{ Ref alias for the active lure pathing target }
Int Property TriggerDistance = 3 Auto Const
{ Once the Terrormorph has gotten this close, kick off the timer for it to ignore the object }
GlobalVariable Property UC02_TerrormorphAttentionLength Auto Const mandatory
{ How long the Terrormorph will hang out here before moving on }
ReferenceAlias Property Hadrian Auto Const mandatory
{ Ref alias for Hadrian }
Int Property StageToSet = 702 Auto Const
{ Stge to set if Hadrian hits the Terrormorph at any point }
GlobalVariable Property UC02_Terrormorph_PlayerTargetPercent Auto Const mandatory
{ If the player gets added to the Morph's combat list, what's the percent chance it'll focus on the player as their target }

;-- Functions ---------------------------------------

Event OnLoad()
  If !Self.GetActorRef().IsDead() ; #DEBUG_LINE_NO:25
    Self.RegisterForHitEvent(Self.GetRef() as ScriptObject, Hadrian.GetRef() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RegisterForReachActiveLure(ObjectReference akActiveLure)
  Self.UnregisterForDistanceEvents(Self.GetRef() as ScriptObject, Self.GetRef() as ScriptObject, -1) ; #DEBUG_LINE_NO:34
  Self.RegisterForDistanceLessThanEvent(Self.GetRef() as ScriptObject, akActiveLure as ScriptObject, TriggerDistance as Float, 0) ; #DEBUG_LINE_NO:35
  CurrentLureTarget = akActiveLure ; #DEBUG_LINE_NO:36
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If !Self.GetActorRef().IsInCombat() && (akObj1 == Self.GetRef() || akObj2 == Self.GetRef()) && (akObj1 == CurrentLureTarget || (akObj2 as Bool == (akObj1 == Self.GetRef() || akObj2 == Self.GetRef()))) ; #DEBUG_LINE_NO:40
    Self.StartTimer(UC02_TerrormorphAttentionLength.GetValue(), InspectTimerID) ; #DEBUG_LINE_NO:42
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForDistanceLessThanEvent(Self.GetRef() as ScriptObject, CurrentLureTarget as ScriptObject, TriggerDistance as Float, 0) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == InspectTimerID ; #DEBUG_LINE_NO:49
    ActiveLure.Clear() ; #DEBUG_LINE_NO:51
    LurePathingTarget.Clear() ; #DEBUG_LINE_NO:52
    Self.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If akAggressor == Hadrian.GetRef() ; #DEBUG_LINE_NO:58
    If !Self.GetActorRef().IsDead() ; #DEBUG_LINE_NO:59
      Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:60
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnCombatListAdded(Actor akTarget)
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:67
  If akTarget == PlayACT ; #DEBUG_LINE_NO:68
    Int iRand = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:69
    If iRand <= UC02_Terrormorph_PlayerTargetPercent.GetValueInt() ; #DEBUG_LINE_NO:71
      Self.GetActorRef().StartCombat(PlayACT as ObjectReference, True) ; #DEBUG_LINE_NO:72
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:82
EndFunction
