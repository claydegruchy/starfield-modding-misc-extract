ScriptName DefaultCrowdEventManager Extends Quest
{ Handles sending events to crowds to get them to "ooh" and "ahh"

See also:
DefaultCrowdEventSenderAliasScript }

;-- Structs -----------------------------------------
Struct CrowdEventData
  Keyword EventKeyword
  ObjectReference EventRef1
  ObjectReference EventRef2
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group CrowdData
  Keyword Property CrowdEventMember Auto Const
  { AUTOFILL THIS -- which keyword will be used to find actors to make the crowd? }
  RefCollectionAlias Property RefCollection Auto Const
  { which Reference Collection should the crowd members be put in? }
  ReferenceAlias Property FindOrigin Auto Const
  { Which ref alias should be the origin for the find radius in which to find the crowd? }
  Int Property FindRadius = 5000 Auto Const
  { Default: 5000, How big a radius around the FindOriginAlias should we look for crowd members? }
EndGroup

Group CommonEventKeywords
  Keyword Property CrowdEvent_OnHit Auto Const
  { Autofill }
  Int Property StopSendingOnHitAfterStage Auto Const
  { After this stage or higher, stop sending this event }
  Keyword Property CrowdEvent_OnCripple Auto Const
  { Autofill }
  Int Property StopSendingOnCrippleAfterStage Auto Const
  { After this stage or higher, stop sending this event }
  Keyword Property CrowdEvent_OnDeath Auto Const
  { Autofill }
  Int Property StopSendingOnDeathAfterStage Auto Const
  { After this stage or higher, stop sending this event }
EndGroup

Group CommonEventSenders
  ReferenceAlias[] Property OnHitEventSenders Auto Const
  { Aliases that should send the CrowdEvent_OnHit to crowd members }
  ReferenceAlias[] Property OnCrippleEventSenders Auto Const
  { Aliases that should send the CrowdEvent_OnCripple to crowd members }
  ReferenceAlias[] Property OnDeathEventSenders Auto Const
  { Aliases that should send the CrowdEvent_OnDeath to crowd members }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  Self.RegisterForOnHitEvents() ; #DEBUG_LINE_NO:74
  Int I = 0 ; #DEBUG_LINE_NO:76
  I = 0 ; #DEBUG_LINE_NO:78
  While I < OnCrippleEventSenders.Length ; #DEBUG_LINE_NO:79
    Self.RegisterForRemoteEvent(OnCrippleEventSenders[I] as ScriptObject, "OnCripple") ; #DEBUG_LINE_NO:80
    I += 1 ; #DEBUG_LINE_NO:81
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:84
  While I < OnDeathEventSenders.Length ; #DEBUG_LINE_NO:85
    Self.RegisterForRemoteEvent(OnDeathEventSenders[I] as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:86
    I += 1 ; #DEBUG_LINE_NO:87
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If Self.GetStage() < StopSendingOnHitAfterStage ; #DEBUG_LINE_NO:96
    Self.SendCrowdEvent(CrowdEvent_OnHit, akTarget, akAggressor) ; #DEBUG_LINE_NO:98
    Self.RegisterForOnHitEvents() ; #DEBUG_LINE_NO:99
  Else ; #DEBUG_LINE_NO:
    Self.UnregisterForOnHitEvents() ; #DEBUG_LINE_NO:102
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnCripple(ReferenceAlias akSender, ActorValue akActorValue, Bool abCrippled)
  If Self.GetStage() < StopSendingOnCrippleAfterStage ; #DEBUG_LINE_NO:110
    Self.SendCrowdEvent(CrowdEvent_OnCripple, akSender.GetReference(), None) ; #DEBUG_LINE_NO:111
  Else ; #DEBUG_LINE_NO:
    Int I = 0 ; #DEBUG_LINE_NO:114
    While I < OnCrippleEventSenders.Length ; #DEBUG_LINE_NO:115
      Self.UnregisterForRemoteEvent(OnCrippleEventSenders[I] as ScriptObject, "OnCripple") ; #DEBUG_LINE_NO:116
      I += 1 ; #DEBUG_LINE_NO:117
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnDeath(ReferenceAlias akSender, ObjectReference akKiller)
  If Self.GetStage() < StopSendingOnDeathAfterStage ; #DEBUG_LINE_NO:126
    Self.SendCrowdEvent(CrowdEvent_OnDeath, akSender.GetReference(), akKiller) ; #DEBUG_LINE_NO:127
  Else ; #DEBUG_LINE_NO:
    Int I = 0 ; #DEBUG_LINE_NO:130
    While I < OnDeathEventSenders.Length ; #DEBUG_LINE_NO:131
      Self.UnregisterForRemoteEvent(OnDeathEventSenders[I] as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:132
      I += 1 ; #DEBUG_LINE_NO:133
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RegisterForOnHitEvents()
  Int I = 0 ; #DEBUG_LINE_NO:143
  While I < OnHitEventSenders.Length ; #DEBUG_LINE_NO:144
    Self.RegisterForHitEvent(OnHitEventSenders[I] as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:145
    I += 1 ; #DEBUG_LINE_NO:146
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function UnregisterForOnHitEvents()
  Int I = 0 ; #DEBUG_LINE_NO:151
  While I < OnHitEventSenders.Length ; #DEBUG_LINE_NO:152
    Self.UnregisterForHitEvent(OnHitEventSenders[I] as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:153
    I += 1 ; #DEBUG_LINE_NO:154
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SendCrowdEvent(Keyword EventToSend, ObjectReference EventRef1, ObjectReference EventRef2)
  Var[] args = new Var[1] ; #DEBUG_LINE_NO:160
  defaultcrowdeventmanager:crowdeventdata myCrowdEventData = new defaultcrowdeventmanager:crowdeventdata ; #DEBUG_LINE_NO:162
  myCrowdEventData.EventKeyword = EventToSend ; #DEBUG_LINE_NO:163
  myCrowdEventData.EventRef1 = EventRef1 ; #DEBUG_LINE_NO:164
  myCrowdEventData.EventRef2 = EventRef2 ; #DEBUG_LINE_NO:165
  args[0] = myCrowdEventData as Var ; #DEBUG_LINE_NO:167
  Self.SendCustomEvent("defaultcrowdeventmanager_CrowdEvent", args) ; #DEBUG_LINE_NO:169
EndFunction

Function CreateCrowdInLoadedArea()
  Location OriginLocation = FindOrigin.GetReference().GetCurrentLocation() ; #DEBUG_LINE_NO:177
  Int SecondsToBailout = 5 ; #DEBUG_LINE_NO:178
  Int waitingFor = 0 ; #DEBUG_LINE_NO:179
  While OriginLocation.IsLoaded() == False && waitingFor < SecondsToBailout ; #DEBUG_LINE_NO:180
    Utility.wait(1.0) ; #DEBUG_LINE_NO:181
    waitingFor += 1 ; #DEBUG_LINE_NO:182
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] foundRefs = FindOrigin.GetReference().FindAllReferencesWithKeyword(CrowdEventMember as Form, FindRadius as Float) ; #DEBUG_LINE_NO:186
  RefCollection.RemoveAll() ; #DEBUG_LINE_NO:188
  Int r = 0 ; #DEBUG_LINE_NO:190
  While r < foundRefs.Length ; #DEBUG_LINE_NO:191
    RefCollection.AddRef(foundRefs[r]) ; #DEBUG_LINE_NO:192
    r += 1 ; #DEBUG_LINE_NO:194
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
