ScriptName CF03LockDoorAliasScript Extends ReferenceAlias
{ Dismiss the player's follower when they enter the Lock. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property CF03_PlayerShipPilotSeat Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActivator)
  If akActivator == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:9
    SQ_Followers.AllFollowersWait(CF03_PlayerShipPilotSeat.GetRef(), True, False) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndEvent
