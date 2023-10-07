ScriptName SBTempleDoorScript Extends ObjectReference
{ Script for Starborn Temple doors.
 Robot followers can't enter Temples because they can't operate in ZeroG, so force them to wait outside. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  sq_followersscript Property SQ_Followers Auto Const mandatory
  ActorValue Property SBTempleDoorWaiting Auto Const mandatory
  Keyword Property ActorTypeRobot Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  Actor[] allFollowers = SQ_Followers.GetFollowers(True, True) ; #DEBUG_LINE_NO:13
  Int I = 0 ; #DEBUG_LINE_NO:14
  While I < allFollowers.Length ; #DEBUG_LINE_NO:15
    Actor current = allFollowers[I] ; #DEBUG_LINE_NO:16
    If current.GetValue(SBTempleDoorWaiting) > 0.0 ; #DEBUG_LINE_NO:17
      current.SetValue(SBTempleDoorWaiting, 0.0) ; #DEBUG_LINE_NO:18
      SQ_Followers.CommandFollow(current) ; #DEBUG_LINE_NO:19
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:21
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActivator)
  If akActivator == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:26
    Actor[] activeFollowers = SQ_Followers.GetFollowers(True, False) ; #DEBUG_LINE_NO:27
    Int I = 0 ; #DEBUG_LINE_NO:28
    While I < activeFollowers.Length ; #DEBUG_LINE_NO:29
      Actor current = activeFollowers[I] ; #DEBUG_LINE_NO:30
      If current.HasKeyword(ActorTypeRobot) ; #DEBUG_LINE_NO:31
        current.SetValue(SBTempleDoorWaiting, 1.0) ; #DEBUG_LINE_NO:32
        SQ_Followers.CommandWait(current, None) ; #DEBUG_LINE_NO:33
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:35
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
