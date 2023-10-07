ScriptName BE_SC04QuestScript Extends Quest
{ Script for BE_SC04, Bargaining. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties collapsedonbase
  ReferenceAlias Property Captain Auto Const mandatory
  ReferenceAlias Property CaptainEssentialAlias Auto Const mandatory
  ReferenceAlias Property TargetShip Auto Const mandatory
  ReferenceAlias Property TargetShipJumpTravelMarker Auto Const mandatory
  Static Property XMarker Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  ((Self as Quest) as bescript).WaitUntilInitialized() ; #DEBUG_LINE_NO:16
  CaptainEssentialAlias.ForceRefTo(Captain.GetRef()) ; #DEBUG_LINE_NO:17
EndEvent

Function SpawnJumpTravelMarker()
  spaceshipreference targetShipRef = TargetShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:21
  Float[] offset = new Float[6] ; #DEBUG_LINE_NO:22
  offset[0] = 250.0 ; #DEBUG_LINE_NO:23
  TargetShipJumpTravelMarker.ForceRefTo(targetShipRef.PlaceAtMe(XMarker as Form, 1, False, False, True, offset, None, True)) ; #DEBUG_LINE_NO:24
  targetShipRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:25
EndFunction
