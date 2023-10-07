ScriptName RI06_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iSeanCallsSecurityStage = 1258 Auto Const
Int Property iDrLaneCallsSecurityStage = 1273 Auto Const
Int Property iPlayerCaughtStealing = 1236 Auto Const
Int Property iAllAccessGranted = 1235 Auto Const
Int Property iComputerAccessGranted = 1271 Auto Const
ReferenceAlias Property Sean Auto Const mandatory
ReferenceAlias Property DrLane Auto Const mandatory
ReferenceAlias Property GuardAlias Auto Const mandatory
ReferenceAlias Property Staff01 Auto Const mandatory
ReferenceAlias Property Staff02 Auto Const mandatory
ReferenceAlias Property DrLaneTerminal Auto Const mandatory
ReferenceAlias Property RothiciteShipment Auto Const mandatory
ReferenceAlias Property RothiciteShipmentPost Auto Const mandatory
Scene Property RI06_1258_Sean_CaughtStealingScene Auto Const mandatory
Scene Property RI06_1258_DrLane_CaughtStealingScene Auto Const mandatory
MiscObject Property RI06_RothiciteShipment Auto Const mandatory
Faction Property RI06_SecureWingFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function SeanStartTimer()
  Self.SeanTimer() ; #DEBUG_LINE_NO:28
EndFunction

Function DrLaneStartTimer()
  Self.DrLaneTimer() ; #DEBUG_LINE_NO:34
EndFunction

Function SeanRegisterLOSGain()
  Self.RegisterForDirectLOSGain(Sean.GetRef(), Game.GetPlayer() as ObjectReference, "", "") ; #DEBUG_LINE_NO:39
  Game.GetPlayer().RemoveFromFaction(RI06_SecureWingFaction) ; #DEBUG_LINE_NO:40
EndFunction

Function DrLaneRegisterLOSGain()
  Self.RegisterForDirectLOSGain(DrLane.GetRef(), Game.GetPlayer() as ObjectReference, "", "") ; #DEBUG_LINE_NO:45
  Game.GetPlayer().RemoveFromFaction(RI06_SecureWingFaction) ; #DEBUG_LINE_NO:46
EndFunction

Function SeanTimer()
  Self.StartTimer(60.0, 1) ; #DEBUG_LINE_NO:51
EndFunction

Function DrLaneTimer()
  Self.StartTimer(60.0, 2) ; #DEBUG_LINE_NO:56
EndFunction

Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
  If akViewer == Sean.GetRef() ; #DEBUG_LINE_NO:61
    Self.SetStage(iSeanCallsSecurityStage) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
  If akViewer == DrLane.GetRef() ; #DEBUG_LINE_NO:64
    Self.SetStage(iDrLaneCallsSecurityStage) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == 1 ; #DEBUG_LINE_NO:71
    If Sean.GetActorRef().HasDetectionLOS(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:73
      Self.SetStage(iSeanCallsSecurityStage) ; #DEBUG_LINE_NO:74
    Else ; #DEBUG_LINE_NO:
      Self.SeanRegisterLOSGain() ; #DEBUG_LINE_NO:76
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If aiTimerID == 2 ; #DEBUG_LINE_NO:79
    If DrLane.GetActorRef().HasDetectionLOS(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:81
      Self.SetStage(iDrLaneCallsSecurityStage) ; #DEBUG_LINE_NO:82
    Else ; #DEBUG_LINE_NO:
      Self.DrLaneRegisterLOSGain() ; #DEBUG_LINE_NO:84
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckForAccess(ObjectReference akObjectRef)
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:91
  If akObjectRef == RothiciteShipment.GetRef() ; #DEBUG_LINE_NO:92
    If !Self.GetStageDone(iAllAccessGranted) ; #DEBUG_LINE_NO:94
      Self.CheckForLOS() ; #DEBUG_LINE_NO:96
      PlayerRef.RemoveItem(RI06_RothiciteShipment as Form, 99, True, None) ; #DEBUG_LINE_NO:97
      PlayerRef.AddAliasedItem(RI06_RothiciteShipment as Form, RothiciteShipmentPost as Alias, 1, True) ; #DEBUG_LINE_NO:98
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If akObjectRef == DrLaneTerminal.GetRef() ; #DEBUG_LINE_NO:101
    If !Self.GetStageDone(iAllAccessGranted) && !Self.GetStageDone(iComputerAccessGranted) ; #DEBUG_LINE_NO:103
      Self.CheckForLOS() ; #DEBUG_LINE_NO:105
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CheckForLOS()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:115
  If Sean.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference) ; #DEBUG_LINE_NO:116
    Self.SetStage(iPlayerCaughtStealing) ; #DEBUG_LINE_NO:118
    RI06_1258_Sean_CaughtStealingScene.Start() ; #DEBUG_LINE_NO:119
  EndIf ; #DEBUG_LINE_NO:
  If DrLane.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference) ; #DEBUG_LINE_NO:121
    Self.SetStage(iPlayerCaughtStealing) ; #DEBUG_LINE_NO:123
    RI06_1258_DrLane_CaughtStealingScene.Start() ; #DEBUG_LINE_NO:124
  EndIf ; #DEBUG_LINE_NO:
  If Staff01.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference) || Staff02.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference) ; #DEBUG_LINE_NO:126
    Self.SetStage(iPlayerCaughtStealing) ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
EndFunction
