ScriptName UC06_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property SQ_PlayerShip Auto Const mandatory
{ Quest for the player's ship }
MiscObject Property UC06_OrlaseID Auto Const mandatory
{ Orlase's ID }
Int Property StageToSet = 550 Auto Const
{ Stage to set once the player has collected Orlase's ID }
ActorValue Property SpaceshipCrew Auto Const mandatory
{ Actor value used to adjust Spaceship Crew }
ActorValue Property Assistance Auto Const mandatory
{ Actor value used to adjust NPC assistance }
ActorValue Property HideShipFromHUDValue Auto Const mandatory
{ Actor value used to turn off ships in the player's HUD (used for ambush purposes) }
Faction Property PlayerFriendFaction Auto Const mandatory
{ Faction used to keep the turrets from going hostile to the player until the last possible moment }
RefCollectionAlias Property EthereaTurrets Auto Const mandatory
{ Collection of Orlase's turrets for his ambush }

;-- Functions ---------------------------------------

Function RegisterForShipItemCollection()
  ReferenceAlias PlayerShipAlias = (SQ_PlayerShip as sq_playershipscript).PlayerShip ; #DEBUG_LINE_NO:28
  If PlayerShipAlias != None ; #DEBUG_LINE_NO:31
    Self.RegisterForRemoteEvent(PlayerShipAlias as ScriptObject, "OnItemAdded") ; #DEBUG_LINE_NO:32
    Self.AddInventoryEventFilter(UC06_OrlaseID as Form) ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ReferenceAlias.OnItemAdded(ReferenceAlias akSender, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If (akBaseItem == UC06_OrlaseID as Form) && !Self.GetStageDone(StageToSet) && akSender == (SQ_PlayerShip as sq_playershipscript).PlayerShip ; #DEBUG_LINE_NO:40
    Self.RemoveAllInventoryEventFilters() ; #DEBUG_LINE_NO:42
    Self.SetStage(StageToSet) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function PrepTurrets()
  Int I = 0 ; #DEBUG_LINE_NO:48
  Int iCount = EthereaTurrets.GetCount() ; #DEBUG_LINE_NO:49
  While I < iCount ; #DEBUG_LINE_NO:51
    spaceshipreference currRef = EthereaTurrets.GetAt(I) as spaceshipreference ; #DEBUG_LINE_NO:52
    currRef.SetUnconscious(True) ; #DEBUG_LINE_NO:53
    currRef.SetValue(HideShipFromHUDValue, 1.0) ; #DEBUG_LINE_NO:54
    I += 1 ; #DEBUG_LINE_NO:57
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function DeployTurrets()
  Int I = 0 ; #DEBUG_LINE_NO:62
  Int iCount = EthereaTurrets.GetCount() ; #DEBUG_LINE_NO:63
  While I < iCount ; #DEBUG_LINE_NO:65
    spaceshipreference currRef = EthereaTurrets.GetAt(I) as spaceshipreference ; #DEBUG_LINE_NO:66
    (currRef as uc06_turretonlinescript).SetTurretOnline() ; #DEBUG_LINE_NO:67
    I += 1 ; #DEBUG_LINE_NO:69
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function DisableTurrets()
  Int I = 0 ; #DEBUG_LINE_NO:74
  Int iCount = EthereaTurrets.GetCount() ; #DEBUG_LINE_NO:75
  While I < iCount ; #DEBUG_LINE_NO:77
    spaceshipreference currRef = EthereaTurrets.GetAt(I) as spaceshipreference ; #DEBUG_LINE_NO:78
    currRef.SetUnconscious(True) ; #DEBUG_LINE_NO:79
    currRef.AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:80
    I += 1 ; #DEBUG_LINE_NO:83
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:91
EndFunction
