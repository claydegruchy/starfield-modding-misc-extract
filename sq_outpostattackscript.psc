ScriptName SQ_OutpostAttackScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
reparentscript Property RE_Parent Auto Const mandatory
ReferenceAlias Property OutpostBeacon Auto Const mandatory
{ outpost beacon that we're attacking }
ReferenceAlias Property AttackTarget Auto Const mandatory
{ created marker in case outpost is removed while quest is running }
ReferenceAlias Property Trigger Auto Const mandatory
{ trigger in landing location - may not always exist if location isn't an OE location }
RefCollectionAlias Property Attackers Auto Const mandatory
{ attackers will spawn into this collection }
Keyword Property LocTypeMajorOrbital Auto Const mandatory
ActorValue Property OutpostLastAttackTimestamp Auto Const mandatory
{ used to timestamp last outpost attack }
Bool Property IsAttackStarted = False Auto hidden
Bool Property CountsAsAttack = True Auto Const
{ if true, this is counted as an outpost attack - planet is stamped when this starts so another attack isn't triggered during the cooldown 
    if false, don't treat this as a normal attack (no timestamp) }

;-- Functions ---------------------------------------

Function HandleAttackerLocationChange(ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function HandleAttackersSpawning()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function HandleQuestShutdown()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function HandleQuestStarted()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function HandleStartAttack()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  Self.DisableTrigger(True) ; #DEBUG_LINE_NO:31
  defaultgroupspawnquestscript myDefaultGroupQuest = (Self as Quest) as defaultgroupspawnquestscript ; #DEBUG_LINE_NO:34
  If myDefaultGroupQuest ; #DEBUG_LINE_NO:35
    Self.RegisterForCustomEvent(myDefaultGroupQuest as ScriptObject, "defaultgroupspawnquestscript_SpawnEvent") ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForRemoteEvent(Attackers as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:40
EndEvent

Event OnQuestStarted()
  Self.HandleQuestStarted() ; #DEBUG_LINE_NO:45
  Self.RegisterForCustomEvent(RE_Parent as ScriptObject, "reparentscript_RECheckForCleanup") ; #DEBUG_LINE_NO:46
  Self.TimestampAttack() ; #DEBUG_LINE_NO:47
EndEvent

Event OnQuestShutdown()
  Self.DisableTrigger(False) ; #DEBUG_LINE_NO:55
  Self.HandleQuestShutdown() ; #DEBUG_LINE_NO:56
EndEvent

Function TimestampAttack()
  If CountsAsAttack ; #DEBUG_LINE_NO:64
    ObjectReference outpostRef = OutpostBeacon.GetRef() ; #DEBUG_LINE_NO:66
    If outpostRef ; #DEBUG_LINE_NO:67
      Location outpostLocation = outpostRef.GetCurrentLocation() ; #DEBUG_LINE_NO:68
      Location[] parentLocations = outpostLocation.GetParentLocations(LocTypeMajorOrbital) ; #DEBUG_LINE_NO:69
      If parentLocations ; #DEBUG_LINE_NO:70
        Location myPlanet = parentLocations[0] ; #DEBUG_LINE_NO:71
        myPlanet.SetValue(OutpostLastAttackTimestamp, Utility.GetCurrentGameTime()) ; #DEBUG_LINE_NO:72
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartAttack(Bool bSetAttackTimestamp)
  IsAttackStarted = True ; #DEBUG_LINE_NO:80
  If bSetAttackTimestamp ; #DEBUG_LINE_NO:81
    Self.TimestampAttack() ; #DEBUG_LINE_NO:82
  EndIf ; #DEBUG_LINE_NO:
  Self.HandleStartAttack() ; #DEBUG_LINE_NO:84
EndFunction

Function DisableTrigger(Bool bDisable)
  ObjectReference triggerRef = Trigger.GetRef() ; #DEBUG_LINE_NO:92
  If triggerRef ; #DEBUG_LINE_NO:93
    If bDisable ; #DEBUG_LINE_NO:94
      triggerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:95
    Else ; #DEBUG_LINE_NO:
      triggerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:97
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event DefaultGroupSpawnQuestScript.SpawnEvent(defaultgroupspawnquestscript akSender, Var[] akArgs)
  Self.HandleAttackersSpawning() ; #DEBUG_LINE_NO:104
EndEvent

Event REParentScript.RECheckForCleanup(reparentscript akSender, Var[] akArgs)
  Self.CheckForCleanup() ; #DEBUG_LINE_NO:114
EndEvent

Event RefCollectionAlias.OnLocationChange(RefCollectionAlias akSource, ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)
  Self.HandleAttackerLocationChange(akSenderRef, akOldLoc, akNewLoc) ; #DEBUG_LINE_NO:118
EndEvent

Function CheckForCleanup()
  Bool shouldShutDown = False ; #DEBUG_LINE_NO:126
  ObjectReference attackTargetRef = AttackTarget.GetRef() ; #DEBUG_LINE_NO:128
  If Attackers.GetCountDead() == Attackers.GetCount() ; #DEBUG_LINE_NO:130
    shouldShutDown = True ; #DEBUG_LINE_NO:132
  ElseIf attackTargetRef as Bool && attackTargetRef.GetCurrentPlanet() != Game.GetPlayer().GetCurrentPlanet() ; #DEBUG_LINE_NO:133
    shouldShutDown = True ; #DEBUG_LINE_NO:135
  EndIf ; #DEBUG_LINE_NO:
  If shouldShutDown ; #DEBUG_LINE_NO:137
    Self.Stop() ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
EndFunction
