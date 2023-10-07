ScriptName RobotPodScript Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property isInPod = True Auto conditional
{ Set to FALSE to have Robot start on its patrol. TRUE to start inside of pod }
Keyword Property DMP_LinkRobotPod Auto Const mandatory
{ Robot Pod Link Keyword }

;-- Functions ---------------------------------------

Function SendRobotToPod()
  If Self.IsDead() == False ; #DEBUG_LINE_NO:12
    ObjectReference myPod = Self.GetLinkedRef(DMP_LinkRobotPod) ; #DEBUG_LINE_NO:13
    If myPod ; #DEBUG_LINE_NO:14
      isInPod = True ; #DEBUG_LINE_NO:15
      Self.EvaluatePackage(False) ; #DEBUG_LINE_NO:16
    Else ; #DEBUG_LINE_NO:
      Self.SetUnconscious(True) ; #DEBUG_LINE_NO:19
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function WakeRobotFromPod()
  If Self.IsDead() == False ; #DEBUG_LINE_NO:27
    Self.SetUnconscious(False) ; #DEBUG_LINE_NO:29
    ObjectReference myPod = Self.GetLinkedRef(DMP_LinkRobotPod) ; #DEBUG_LINE_NO:31
    If myPod ; #DEBUG_LINE_NO:32
      isInPod = False ; #DEBUG_LINE_NO:33
      Self.EvaluatePackage(False) ; #DEBUG_LINE_NO:34
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnSit(ObjectReference akFurniture)
  If akFurniture == Self.GetLinkedRef(DMP_LinkRobotPod) ; #DEBUG_LINE_NO:42
    Self.SetUnconscious(True) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function HasPod()
  Return Self.GetLinkedRef(DMP_LinkRobotPod) != None ; #DEBUG_LINE_NO:48
EndFunction
