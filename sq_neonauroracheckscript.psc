ScriptName SQ_NeonAuroraCheckScript Extends Quest
{ watch for player to have or pick up Aurora while in Neon }

;-- Variables ---------------------------------------
Int CheckForAuroraTimerID = 1 Const
inputenablelayer myEnableLayer

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard CheckForAuroraGuard

;-- Properties --------------------------------------
Location Property CityNeonLocation Auto Const mandatory
Keyword Property LocTypeSettlement Auto Const mandatory
Potion Property Drug_Aurora Auto Const mandatory
ReferenceAlias Property ActiveCompanion Auto Const mandatory
{ companion alias - from SQ_Companion }
ReferenceAlias Property PlayerShip Auto Const mandatory
{ current ship - from SQ_PlayerShip }
ReferenceAlias Property Player Auto Const mandatory
{ player alias }
ActorValue Property AuroraBlockingFastTravel Auto Const mandatory
{ use to give custom fast travel blocked message for this situation }

;-- Functions ---------------------------------------

Event OnQuestInit()
  myEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:28
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:29
  Self.StartAuroraCheck(True) ; #DEBUG_LINE_NO:30
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  Bool newLocationInNeon = akNewLoc.IsSameLocation(CityNeonLocation, LocTypeSettlement) ; #DEBUG_LINE_NO:36
  If newLocationInNeon == False ; #DEBUG_LINE_NO:37
    Self.StartAuroraCheck(False) ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartAuroraCheck(Bool bStart)
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:46
  Actor companionRef = ActiveCompanion.GetActorRef() ; #DEBUG_LINE_NO:47
  If bStart ; #DEBUG_LINE_NO:49
    Self.CheckForAurora() ; #DEBUG_LINE_NO:50
    Self.AddInventoryEventFilter(Drug_Aurora as Form) ; #DEBUG_LINE_NO:51
    Self.RegisterForRemoteEvent(Player as ScriptObject, "OnItemAdded") ; #DEBUG_LINE_NO:52
    Self.RegisterForRemoteEvent(Player as ScriptObject, "OnItemRemoved") ; #DEBUG_LINE_NO:53
    Self.RegisterForRemoteEvent(ActiveCompanion as ScriptObject, "OnItemAdded") ; #DEBUG_LINE_NO:54
    Self.RegisterForRemoteEvent(ActiveCompanion as ScriptObject, "OnItemRemoved") ; #DEBUG_LINE_NO:55
  Else ; #DEBUG_LINE_NO:
    Self.BlockFastTravel(playerRef, False) ; #DEBUG_LINE_NO:57
    myEnableLayer.Delete() ; #DEBUG_LINE_NO:58
    myEnableLayer = None ; #DEBUG_LINE_NO:59
    Self.Stop() ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ReferenceAlias.OnItemAdded(ReferenceAlias akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Self.StartTimer(0.5, CheckForAuroraTimerID) ; #DEBUG_LINE_NO:66
EndEvent

Event ReferenceAlias.OnItemRemoved(ReferenceAlias akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  Self.StartTimer(0.5, CheckForAuroraTimerID) ; #DEBUG_LINE_NO:71
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == CheckForAuroraTimerID ; #DEBUG_LINE_NO:75
    Self.CheckForAurora() ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckForAurora()
  Guard CheckForAuroraGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:84
    Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:85
    Actor companionRef = ActiveCompanion.GetActorRef() ; #DEBUG_LINE_NO:86
    If playerRef.GetItemCount(Drug_Aurora as Form) > 0 || (companionRef as Bool && companionRef.GetItemCount(Drug_Aurora as Form) > 0) ; #DEBUG_LINE_NO:88
      Self.BlockFastTravel(playerRef, True) ; #DEBUG_LINE_NO:90
    Else ; #DEBUG_LINE_NO:
      Self.BlockFastTravel(playerRef, False) ; #DEBUG_LINE_NO:93
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function BlockFastTravel(Actor playerRef, Bool shouldBlock)
  If shouldBlock ; #DEBUG_LINE_NO:99
    myEnableLayer.EnableFastTravel(False) ; #DEBUG_LINE_NO:100
    playerRef.SetValue(AuroraBlockingFastTravel, 1.0) ; #DEBUG_LINE_NO:101
  Else ; #DEBUG_LINE_NO:
    myEnableLayer.EnableFastTravel(True) ; #DEBUG_LINE_NO:103
    playerRef.SetValue(AuroraBlockingFastTravel, 0.0) ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
EndFunction
