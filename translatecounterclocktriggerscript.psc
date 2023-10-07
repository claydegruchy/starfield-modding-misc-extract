ScriptName TranslateCounterClockTriggerScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool PlayerInTrigger = True

;-- Properties --------------------------------------
ObjectReference Property myRing Auto Const mandatory
ObjectReference Property Ring2 Auto Const mandatory
ObjectReference Property Ring3 Auto Const mandatory
ObjectReference Property sSuccessMarker Auto Const mandatory
ObjectReference Property Ramp Auto Const mandatory
ObjectReference Property RampPositionMarker Auto Const mandatory
ObjectReference Property RingsTranslateToMarker Auto Const
ObjectReference Property SPDoorTop Auto Const
ObjectReference Property SPDoorBottom Auto Const
ObjectReference Property SPDoorTopMoveToMarker Auto Const
ObjectReference Property SPDoorBottomMoveToMarker Auto Const
wwiseevent Property sSuccess Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  PlayerInTrigger = True ; #DEBUG_LINE_NO:19
  While PlayerInTrigger ; #DEBUG_LINE_NO:
    Float currentAngleX = myRing.GetAngleX() ; #DEBUG_LINE_NO:21
    Float currentAngleY = myRing.GetAngleY() ; #DEBUG_LINE_NO:22
    Float currentAngleZ = myRing.GetAngleZ() ; #DEBUG_LINE_NO:23
    Float currentPositionX = myRing.GetPositionX() ; #DEBUG_LINE_NO:24
    Float currentPositionY = myRing.GetPositionY() ; #DEBUG_LINE_NO:25
    Float currentPositionZ = myRing.GetPositionZ() ; #DEBUG_LINE_NO:26
    myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX, currentAngleY, currentAngleZ - 0.200000003, 250.0, 0.0) ; #DEBUG_LINE_NO:27
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:28
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  PlayerInTrigger = False ; #DEBUG_LINE_NO:32
  myRing.StopTranslation() ; #DEBUG_LINE_NO:33
  Self.CheckPositions() ; #DEBUG_LINE_NO:34
EndEvent

Function CheckPositions()
  If myRing.GetAngleZ() <= 2.0 && myRing.GetAngleZ() >= -2.0 && Ring2.GetAngleZ() <= 2.0 && Ring2.GetAngleZ() >= -2.0 && Ring3.GetAngleZ() <= 2.0 && Ring3.GetAngleZ() >= -2.0 ; #DEBUG_LINE_NO:38
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:39
    sSuccess.Play(sSuccessMarker, None, None) ; #DEBUG_LINE_NO:40
    Ramp.TranslateToRef(RampPositionMarker, 1.0, 0.0) ; #DEBUG_LINE_NO:41
    myRing.SetScale(0.899999976) ; #DEBUG_LINE_NO:42
    myRing.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0) ; #DEBUG_LINE_NO:43
    Ring2.SetScale(1.100000024) ; #DEBUG_LINE_NO:44
    Ring2.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0) ; #DEBUG_LINE_NO:45
    Ring3.SetScale(0.800000012) ; #DEBUG_LINE_NO:46
    Ring3.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0) ; #DEBUG_LINE_NO:47
    SPDoorTop.TranslateToRef(SPDoorTopMoveToMarker, 10.0, 0.0) ; #DEBUG_LINE_NO:48
    SPDoorBottom.TranslateToRef(SPDoorBottomMoveToMarker, 10.0, 0.0) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndFunction
