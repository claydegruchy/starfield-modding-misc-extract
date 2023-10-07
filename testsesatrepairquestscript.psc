ScriptName TestSESatRepairQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property DamagedSectionsAlias Auto

;-- Functions ---------------------------------------

Event OnQuestInit()
  Int count = 0 ; #DEBUG_LINE_NO:7
  While count < DamagedSectionsAlias.GetCount() ; #DEBUG_LINE_NO:8
    ObjectReference currentObjectReference = DamagedSectionsAlias.GetAt(count) ; #DEBUG_LINE_NO:9
    Self.RegisterForHitEvent(currentObjectReference as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:10
    Self.RegisterForRemoteEvent(currentObjectReference as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:11
    count += 1 ; #DEBUG_LINE_NO:12
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If akSender.GetScale() > 2.0 ; #DEBUG_LINE_NO:17
    akSender.SetScale(akSender.GetScale() - 0.25) ; #DEBUG_LINE_NO:18
    Self.RegisterForHitEvent(akSender as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:19
  Else ; #DEBUG_LINE_NO:
    akSender.DisableNoWait(False) ; #DEBUG_LINE_NO:22
    Self.SetStage(100) ; #DEBUG_LINE_NO:23
    Self.CheckForOneMoreRemaining() ; #DEBUG_LINE_NO:24
    If Self.CheckForAllDisabled() ; #DEBUG_LINE_NO:25
      Self.SetStage(500) ; #DEBUG_LINE_NO:27
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If akTarget.GetScale() > 2.0 ; #DEBUG_LINE_NO:33
    akTarget.SetScale(akTarget.GetScale() - 0.25) ; #DEBUG_LINE_NO:34
    Self.RegisterForHitEvent(akTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:35
  Else ; #DEBUG_LINE_NO:
    akTarget.DisableNoWait(False) ; #DEBUG_LINE_NO:38
    Self.SetStage(100) ; #DEBUG_LINE_NO:39
    Self.CheckForOneMoreRemaining() ; #DEBUG_LINE_NO:40
    If Self.CheckForAllDisabled() ; #DEBUG_LINE_NO:41
      Self.SetStage(500) ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function CheckForOneMoreRemaining()
  Int count = 0 ; #DEBUG_LINE_NO:50
  Int countDisabled = 0 ; #DEBUG_LINE_NO:51
  Int countMax = DamagedSectionsAlias.GetCount() ; #DEBUG_LINE_NO:52
  While count < countMax ; #DEBUG_LINE_NO:53
    ObjectReference currentObjectReference = DamagedSectionsAlias.GetAt(count) ; #DEBUG_LINE_NO:54
    If currentObjectReference.IsDisabled() ; #DEBUG_LINE_NO:55
      countDisabled += 1 ; #DEBUG_LINE_NO:56
    EndIf ; #DEBUG_LINE_NO:
    count += 1 ; #DEBUG_LINE_NO:58
  EndWhile ; #DEBUG_LINE_NO:
  If countDisabled == countMax - 1 ; #DEBUG_LINE_NO:61
    Self.SetStage(200) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function CheckForAllDisabled()
  Int count = 0 ; #DEBUG_LINE_NO:67
  While count < DamagedSectionsAlias.GetCount() ; #DEBUG_LINE_NO:68
    ObjectReference currentObjectReference = DamagedSectionsAlias.GetAt(count) ; #DEBUG_LINE_NO:69
    If currentObjectReference.IsDisabled() ; #DEBUG_LINE_NO:70
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Return False ; #DEBUG_LINE_NO:74
    EndIf ; #DEBUG_LINE_NO:
    count += 1 ; #DEBUG_LINE_NO:76
  EndWhile ; #DEBUG_LINE_NO:
  Return True ; #DEBUG_LINE_NO:78
EndFunction
