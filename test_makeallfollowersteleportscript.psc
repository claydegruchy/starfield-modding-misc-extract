ScriptName Test_MakeAllFollowersTeleportScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool toggle

;-- Properties --------------------------------------
sq_followersscript Property SQ_Followers Auto Const mandatory
Bool Property SkipWaitingFollowersObjective = False Auto
Bool Property IncludeWaitingFollowers = True Auto

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor[] teleportedFollowers = None ; #DEBUG_LINE_NO:12
  If toggle == False ; #DEBUG_LINE_NO:14
    teleportedFollowers = SQ_Followers.TeleportFollowers(Self.GetLinkedRef(None), None, True, IncludeWaitingFollowers, False, True, SkipWaitingFollowersObjective) ; #DEBUG_LINE_NO:16
    toggle = True ; #DEBUG_LINE_NO:17
  ElseIf toggle == True ; #DEBUG_LINE_NO:19
    SQ_Followers.TeleportFollowers(Game.GetPlayer() as ObjectReference, teleportedFollowers, True, True, False, False, False) ; #DEBUG_LINE_NO:21
    toggle = False ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndEvent
