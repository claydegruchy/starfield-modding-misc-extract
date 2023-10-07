ScriptName TestJeffBLookScript Extends Actor conditional

;-- Variables ---------------------------------------
Actor player

;-- Properties --------------------------------------
Bool Property isLooking = False Auto conditional
Int Property howClose = 3000 Auto
Bool Property isClose = False Auto conditional

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForDetectionLOSGain(Game.GetPlayer(), Self as ObjectReference) ; #DEBUG_LINE_NO:10
  player = Game.GetPlayer() ; #DEBUG_LINE_NO:11
EndEvent

Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
  If Self.getDistance(player as ObjectReference) <= howClose as Float ; #DEBUG_LINE_NO:16
    isClose = True ; #DEBUG_LINE_NO:17
  Else ; #DEBUG_LINE_NO:
    isClose = False ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
  If isClose == True ; #DEBUG_LINE_NO:22
    isLooking = True ; #DEBUG_LINE_NO:23
    Self.EvaluatePackage(False) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForDetectionLOSLost(Game.GetPlayer(), Self as ObjectReference) ; #DEBUG_LINE_NO:26
EndEvent

Event OnLostLOS(ObjectReference akViewer, ObjectReference akTarget)
  If Self.getDistance(player as ObjectReference) <= howClose as Float ; #DEBUG_LINE_NO:31
    isClose = True ; #DEBUG_LINE_NO:32
  Else ; #DEBUG_LINE_NO:
    isClose = False ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
  If isClose == True ; #DEBUG_LINE_NO:37
    isLooking = False ; #DEBUG_LINE_NO:38
    Self.EvaluatePackage(False) ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForDetectionLOSGain(Game.GetPlayer(), Self as ObjectReference) ; #DEBUG_LINE_NO:41
EndEvent
