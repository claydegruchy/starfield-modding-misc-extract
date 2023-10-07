ScriptName MissionBoardSupplyActivatorScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_outpostcargolinkscript Property SQ_OutpostCargoLink Auto Const mandatory
Keyword Property LinkOutpostCargoLink Auto Const mandatory
{ keyword to find linked ref of my cargo link }
Keyword Property OutpostCargoLinkFueledKeyword Auto Const mandatory
{ keyword to find fueled cargo links }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  missionquestscript myQuest = Self.GetOwningQuest() as missionquestscript ; #DEBUG_LINE_NO:12
  If myQuest.PlayerAcceptedQuest ; #DEBUG_LINE_NO:13
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:14
      ObjectReference myCargoLink = Self.GetRef().GetLinkedRef(LinkOutpostCargoLink) ; #DEBUG_LINE_NO:15
      If myCargoLink ; #DEBUG_LINE_NO:17
        Self.RegisterForRemoteEvent(myCargoLink as ScriptObject, "OnWorkshopCargoLinkChanged") ; #DEBUG_LINE_NO:19
        myCargoLink.ShowWorkshopTargetMenu(True, None, True, OutpostCargoLinkFueledKeyword) ; #DEBUG_LINE_NO:21
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnWorkshopCargoLinkChanged(ObjectReference akSource, ObjectReference akOldTarget, ObjectReference akNewTarget)
  If akNewTarget == None ; #DEBUG_LINE_NO:29
    (Self.GetOwningQuest() as missionsupplyscript).CargoLinkCleared() ; #DEBUG_LINE_NO:31
  ElseIf akNewTarget != akOldTarget ; #DEBUG_LINE_NO:32
    (Self.GetOwningQuest() as missionsupplyscript).CargoLinkEstablished(akNewTarget) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akActionRef)
  (Self.GetOwningQuest() as missionsupplyscript).CargoLinkCleared() ; #DEBUG_LINE_NO:40
EndEvent
