ScriptName StarbornPuzzleScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property FirstPositionMarker Auto Const mandatory
ObjectReference Property SecondPositionMarker Auto Const mandatory
ObjectReference Property ThirdPositionMarker Auto Const mandatory
ObjectReference Property FourthPositionMarker Auto Const mandatory
ObjectReference Property Ring Auto Const mandatory
ObjectReference Property OtherRing1 Auto Const mandatory
ObjectReference Property OtherRing2 Auto Const mandatory
ObjectReference Property mySoundMarker Auto Const mandatory
ObjectReference Property MasterDummy Auto Const mandatory
wwiseevent Property sTurning Auto Const mandatory
Int Property iCurrentPosition = 1 Auto

;-- Functions ---------------------------------------

Function Shake()
  Game.ShakeCamera(None, 0.200000003, 3.0) ; #DEBUG_LINE_NO:76
EndFunction

Function ShrinkOtherRings()
  OtherRing1.SetScale(0.980000019) ; #DEBUG_LINE_NO:81
  OtherRing2.SetScale(0.980000019) ; #DEBUG_LINE_NO:82
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:83
  OtherRing1.SetScale(0.959999979) ; #DEBUG_LINE_NO:84
  OtherRing2.SetScale(0.959999979) ; #DEBUG_LINE_NO:85
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:86
  OtherRing1.SetScale(0.939999998) ; #DEBUG_LINE_NO:87
  OtherRing2.SetScale(0.939999998) ; #DEBUG_LINE_NO:88
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:89
  OtherRing1.SetScale(0.920000017) ; #DEBUG_LINE_NO:90
  OtherRing2.SetScale(0.920000017) ; #DEBUG_LINE_NO:91
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:92
  OtherRing1.SetScale(0.899999976) ; #DEBUG_LINE_NO:93
  OtherRing2.SetScale(0.899999976) ; #DEBUG_LINE_NO:94
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:95
EndFunction

Function GrowOtherRings()
  OtherRing1.SetScale(0.920000017) ; #DEBUG_LINE_NO:99
  OtherRing2.SetScale(0.920000017) ; #DEBUG_LINE_NO:100
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:101
  OtherRing1.SetScale(0.939999998) ; #DEBUG_LINE_NO:102
  OtherRing2.SetScale(0.939999998) ; #DEBUG_LINE_NO:103
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:104
  OtherRing1.SetScale(0.959999979) ; #DEBUG_LINE_NO:105
  OtherRing2.SetScale(0.959999979) ; #DEBUG_LINE_NO:106
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:107
  OtherRing1.SetScale(0.980000019) ; #DEBUG_LINE_NO:108
  OtherRing2.SetScale(0.980000019) ; #DEBUG_LINE_NO:109
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:110
  OtherRing1.SetScale(1.0) ; #DEBUG_LINE_NO:111
  OtherRing2.SetScale(1.0) ; #DEBUG_LINE_NO:112
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:113
EndFunction

;-- State -------------------------------------------
Auto State FirstPosition

  Event OnActivate(ObjectReference akActionRef)
    iCurrentPosition = 2 ; #DEBUG_LINE_NO:20
    Self.GotoState("Waiting") ; #DEBUG_LINE_NO:21
    Ring.TranslateToRef(SecondPositionMarker, 20.0, 20.0) ; #DEBUG_LINE_NO:23
    Self.Shake() ; #DEBUG_LINE_NO:24
    sTurning.Play(mySoundMarker, None, None) ; #DEBUG_LINE_NO:25
    Utility.Wait(4.5) ; #DEBUG_LINE_NO:26
    Self.GotoState("SecondPosition") ; #DEBUG_LINE_NO:28
  EndEvent
EndState

;-- State -------------------------------------------
State FourthPosition

  Event OnActivate(ObjectReference akActionRef)
    iCurrentPosition = 1 ; #DEBUG_LINE_NO:59
    Self.GotoState("Waiting") ; #DEBUG_LINE_NO:60
    Ring.TranslateToRef(FirstPositionMarker, 20.0, 20.0) ; #DEBUG_LINE_NO:62
    Self.Shake() ; #DEBUG_LINE_NO:63
    sTurning.Play(mySoundMarker, None, None) ; #DEBUG_LINE_NO:64
    Utility.Wait(4.5) ; #DEBUG_LINE_NO:65
    Self.GotoState("FirstPosition") ; #DEBUG_LINE_NO:67
  EndEvent
EndState

;-- State -------------------------------------------
State SecondPosition

  Event OnActivate(ObjectReference akActionRef)
    iCurrentPosition = 3 ; #DEBUG_LINE_NO:33
    Self.GotoState("Waiting") ; #DEBUG_LINE_NO:34
    Ring.TranslateToRef(ThirdPositionMarker, 20.0, 20.0) ; #DEBUG_LINE_NO:36
    Self.Shake() ; #DEBUG_LINE_NO:37
    sTurning.Play(mySoundMarker, None, None) ; #DEBUG_LINE_NO:38
    Utility.Wait(4.5) ; #DEBUG_LINE_NO:39
    Self.GotoState("ThirdPosition") ; #DEBUG_LINE_NO:41
  EndEvent
EndState

;-- State -------------------------------------------
State ThirdPosition

  Event OnActivate(ObjectReference akActionRef)
    iCurrentPosition = 4 ; #DEBUG_LINE_NO:46
    Self.GotoState("Waiting") ; #DEBUG_LINE_NO:47
    Ring.TranslateToRef(FourthPositionMarker, 20.0, 20.0) ; #DEBUG_LINE_NO:49
    Self.Shake() ; #DEBUG_LINE_NO:50
    sTurning.Play(mySoundMarker, None, None) ; #DEBUG_LINE_NO:51
    Utility.Wait(4.5) ; #DEBUG_LINE_NO:52
    Self.GotoState("FourthPosition") ; #DEBUG_LINE_NO:54
  EndEvent
EndState

;-- State -------------------------------------------
State Waiting
EndState
