ScriptName SpaceportLandingPadScript Extends ObjectReference
{ Script for driving the animation of both the main elevator and the exit lounges. }

;-- Variables ---------------------------------------
ObjectReference LastRaisedExit
Bool elevatorIsUp = True
Activator selfAsActivator

;-- Properties --------------------------------------
Float Property OffsetDistance = 8.0 Auto Const
Static Property xMarker Auto Const
ObjectReference Property elevatorRef Auto Const

;-- Functions ---------------------------------------

Event onTriggerEnter(ObjectReference triggerRef)
  selfAsActivator = Self.GetBaseObject() as Activator ; #DEBUG_LINE_NO:15
  If triggerRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:19
    ObjectReference bestExit = Self.GetBestExitLounge() ; #DEBUG_LINE_NO:20
    If bestExit == LastRaisedExit ; #DEBUG_LINE_NO:25
      bestExit.PlayAnimation("Stage1") ; #DEBUG_LINE_NO:26
      LastRaisedExit = None ; #DEBUG_LINE_NO:27
    ElseIf LastRaisedExit ; #DEBUG_LINE_NO:
      bestExit.PlayAnimation("Stage2") ; #DEBUG_LINE_NO:29
      LastRaisedExit.PlayAnimation("Stage1") ; #DEBUG_LINE_NO:30
      LastRaisedExit = bestExit ; #DEBUG_LINE_NO:31
    Else ; #DEBUG_LINE_NO:
      bestExit.PlayAnimation("Stage2") ; #DEBUG_LINE_NO:33
      LastRaisedExit = bestExit ; #DEBUG_LINE_NO:34
    EndIf ; #DEBUG_LINE_NO:
    If elevatorIsUp == True ; #DEBUG_LINE_NO:37
      elevatorIsUp = False ; #DEBUG_LINE_NO:38
      elevatorRef.PlayAnimation("Stage2") ; #DEBUG_LINE_NO:39
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

ObjectReference Function GetBestExitLounge()
  ObjectReference[] LinkedRefs = Self.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:47
  ObjectReference player = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:48
  ObjectReference markerLocation = player.PlaceAtMe(xMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:49
  Float posX = player.GetPositionX() ; #DEBUG_LINE_NO:51
  Float posY = player.GetPositionY() ; #DEBUG_LINE_NO:52
  Float playerAngle = player.GetAngleZ() ; #DEBUG_LINE_NO:53
  markerLocation.SetPosition(posX + Math.sin(playerAngle) * OffsetDistance, posY + Math.cos(playerAngle) * OffsetDistance, player.GetPositionZ()) ; #DEBUG_LINE_NO:55
  Int j = LinkedRefs.Length - 1 ; #DEBUG_LINE_NO:59
  While j >= 0 ; #DEBUG_LINE_NO:60
    Bool isRemoved = False ; #DEBUG_LINE_NO:61
    If LinkedRefs[j].GetTriggerObjectCount() > 0 ; #DEBUG_LINE_NO:62
      LinkedRefs.remove(j, 1) ; #DEBUG_LINE_NO:63
      isRemoved = True ; #DEBUG_LINE_NO:64
    EndIf ; #DEBUG_LINE_NO:
    j -= 1 ; #DEBUG_LINE_NO:67
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference ClosestRef = LinkedRefs[0] ; #DEBUG_LINE_NO:70
  Int I = 1 ; #DEBUG_LINE_NO:72
  While I < LinkedRefs.Length ; #DEBUG_LINE_NO:73
    ClosestRef = Self.CloserOfTwo(markerLocation, LinkedRefs[I], ClosestRef) ; #DEBUG_LINE_NO:75
    I += 1 ; #DEBUG_LINE_NO:76
  EndWhile ; #DEBUG_LINE_NO:
  Return ClosestRef ; #DEBUG_LINE_NO:78
  markerLocation.Delete() ; #DEBUG_LINE_NO:80
EndFunction

ObjectReference Function CloserOfTwo(ObjectReference TestRef, ObjectReference a, ObjectReference b)
  Float distA = TestRef.GetDistance(a) ; #DEBUG_LINE_NO:93
  If Math.Min(distA, TestRef.GetDistance(b)) == distA ; #DEBUG_LINE_NO:94
    Return a ; #DEBUG_LINE_NO:95
  Else ; #DEBUG_LINE_NO:
    Return b ; #DEBUG_LINE_NO:97
  EndIf ; #DEBUG_LINE_NO:
EndFunction
