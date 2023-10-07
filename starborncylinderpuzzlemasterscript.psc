ScriptName StarbornCylinderPuzzleMasterScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool PlayerInTrigger = False
Float currentAngleX
Float currentAngleY
Float currentAngleZ
Float currentPositionX
Float currentPositionY
Float currentPositionZ

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
wwiseevent Property Tone1Event Auto Const
wwiseevent Property Tone2Event Auto Const
wwiseevent Property Tone3Event Auto Const
Bool Property bCounterClockwise = False Auto Const
Bool Property bCylinderPuzzle = False Auto Const
Bool Property bVertRingsPuzzle = False Auto Const
Bool Property bFiveRingsSuccess = False Auto Const
wwiseevent Property sSuccessEvent Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  PlayerInTrigger = True ; #DEBUG_LINE_NO:36
  While PlayerInTrigger ; #DEBUG_LINE_NO:
    currentAngleY = myRing.GetAngleY() ; #DEBUG_LINE_NO:38
    currentAngleX = myRing.GetAngleX() ; #DEBUG_LINE_NO:39
    currentAngleZ = myRing.GetAngleZ() ; #DEBUG_LINE_NO:40
    currentPositionX = myRing.GetPositionX() ; #DEBUG_LINE_NO:41
    currentPositionY = myRing.GetPositionY() ; #DEBUG_LINE_NO:42
    currentPositionZ = myRing.GetPositionZ() ; #DEBUG_LINE_NO:43
    If bCylinderPuzzle ; #DEBUG_LINE_NO:44
      If bCounterClockwise == True ; #DEBUG_LINE_NO:45
        myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX, currentAngleY - 0.5, currentAngleZ, 0.0, 1.0) ; #DEBUG_LINE_NO:46
      Else ; #DEBUG_LINE_NO:
        myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX, currentAngleY + 0.5, currentAngleZ, 0.0, 1.0) ; #DEBUG_LINE_NO:48
      EndIf ; #DEBUG_LINE_NO:
    ElseIf bVertRingsPuzzle == True ; #DEBUG_LINE_NO:50
      If bCounterClockwise ; #DEBUG_LINE_NO:51
        myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX - 0.400000006, currentAngleY, currentAngleZ, 100.0, 0.0) ; #DEBUG_LINE_NO:52
      Else ; #DEBUG_LINE_NO:
        myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX + 0.400000006, currentAngleY, currentAngleZ, 100.0, 0.0) ; #DEBUG_LINE_NO:54
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Utility.Wait(0.200000003) ; #DEBUG_LINE_NO:57
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  PlayerInTrigger = False ; #DEBUG_LINE_NO:62
  myRing.StopTranslation() ; #DEBUG_LINE_NO:63
  If bVertRingsPuzzle ; #DEBUG_LINE_NO:64
    Self.VRingsCheckPosition() ; #DEBUG_LINE_NO:65
  ElseIf bCylinderPuzzle && bFiveRingsSuccess ; #DEBUG_LINE_NO:66
    Self.FiveRingsCheckPosition() ; #DEBUG_LINE_NO:67
  ElseIf bCylinderPuzzle ; #DEBUG_LINE_NO:
    Self.CylinderCheckPosition() ; #DEBUG_LINE_NO:69
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CylinderCheckPosition()
  If myRing.GetAngleY() <= 2.0 && myRing.GetAngleY() >= -2.0 && Ring2.GetAngleY() <= 2.0 && Ring2.GetAngleY() >= -2.0 && Ring3.GetAngleY() <= 2.0 && Ring3.GetAngleY() >= -2.0 ; #DEBUG_LINE_NO:75
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:76
    Tone1Event.Play(sSuccessMarker, None, None) ; #DEBUG_LINE_NO:77
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:78
    Tone2Event.Play(sSuccessMarker, None, None) ; #DEBUG_LINE_NO:79
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:80
    Tone3Event.Play(sSuccessMarker, None, None) ; #DEBUG_LINE_NO:81
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:82
    sSuccessEvent.Play(sSuccessMarker, None, None) ; #DEBUG_LINE_NO:83
    Ramp.TranslateToRef(RampPositionMarker, 1.0, 0.0) ; #DEBUG_LINE_NO:84
    myRing.SetScale(0.899999976) ; #DEBUG_LINE_NO:85
    myRing.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0) ; #DEBUG_LINE_NO:86
    Ring2.SetScale(1.100000024) ; #DEBUG_LINE_NO:87
    Ring2.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0) ; #DEBUG_LINE_NO:88
    Ring3.SetScale(0.800000012) ; #DEBUG_LINE_NO:89
    Ring3.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0) ; #DEBUG_LINE_NO:90
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function VRingsCheckPosition()
  If myRing.GetAngleX() <= 2.0 && myRing.GetAngleX() >= -2.0 && Ring2.GetAngleX() <= 2.0 && Ring2.GetAngleX() >= -2.0 && Ring3.GetAngleX() <= 2.0 && Ring3.GetAngleX() >= -2.0 ; #DEBUG_LINE_NO:95
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:96
    sSuccessEvent.Play(sSuccessMarker, None, None) ; #DEBUG_LINE_NO:97
    SPDoorTop.TranslateToRef(SPDoorTopMoveToMarker, 10.0, 0.0) ; #DEBUG_LINE_NO:98
    SPDoorBottom.TranslateToRef(SPDoorBottomMoveToMarker, 10.0, 0.0) ; #DEBUG_LINE_NO:99
    Ramp.TranslateToRef(RampPositionMarker, 8.0, 0.0) ; #DEBUG_LINE_NO:100
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function FiveRingsCheckPosition()
  If myRing.GetAngleY() <= 2.0 && myRing.GetAngleY() >= -2.0 && Ring2.GetAngleY() <= 2.0 && Ring2.GetAngleY() >= -2.0 && Ring3.GetAngleY() <= 2.0 && Ring3.GetAngleY() >= -2.0 ; #DEBUG_LINE_NO:105
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:106
    sSuccessEvent.Play(sSuccessMarker, None, None) ; #DEBUG_LINE_NO:107
    myRing.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0) ; #DEBUG_LINE_NO:108
    Ring2.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0) ; #DEBUG_LINE_NO:109
    Ring3.TranslateToRef(RingsTranslateToMarker, 1.0, 0.0) ; #DEBUG_LINE_NO:110
  EndIf ; #DEBUG_LINE_NO:
EndFunction
