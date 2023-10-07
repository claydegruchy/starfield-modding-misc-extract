ScriptName StarbornPuzzleMasterScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property AMBStarbornTempleTestTone_A1_D_p0Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_A1_D_p1Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_A1_D_p2Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_A1_D_p3Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_B2_Fs_p0Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_B2_Fs_p1Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_B2_Fs_p2Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_B2_Fs_p3Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_C3_A_p0Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_C3_A_p1Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_C3_A_p2Event Auto Const mandatory
wwiseevent Property AMBStarbornTempleTestTone_C3_A_p3Event Auto Const mandatory
ObjectReference Property Ring1Dummy Auto Const mandatory
ObjectReference Property Ring2Dummy Auto Const mandatory
ObjectReference Property Ring3Dummy Auto Const mandatory
ObjectReference Property CompletionSoundMarker Auto Const mandatory
ObjectReference Property CompletionSoundMarker2 Auto Const mandatory
ObjectReference Property PuzzleOpenMarker Auto Const mandatory
ObjectReference Property RampMoveMarker Auto Const mandatory
ObjectReference Property Ramp Auto Const mandatory
ObjectReference Property BottomRing Auto Const mandatory
Int Property Ring1Solution = 1 Auto Const mandatory
{ this is the position ring 1 needs to be in to solve this puzzle }
Int Property Ring2Solution = 1 Auto Const mandatory
{ this is the position ring 2 needs to be in to solve this puzzle }
Int Property Ring3Solution = 1 Auto Const mandatory
{ this is the position ring 3 needs to be in to solve this puzzle }
wwiseevent Property AMBStarbornTempleTestPuzzleSuccessEvent Auto Const mandatory
wwiseevent Property sFailureEvent Auto Const mandatory
wwiseevent Property sWallOpeningEvent Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  (Ring1Dummy as starbornpuzzlescript).iCurrentPosition ; #DEBUG_LINE_NO:44
  (Ring2Dummy as starbornpuzzlescript).iCurrentPosition ; #DEBUG_LINE_NO:45
  (Ring3Dummy as starbornpuzzlescript).iCurrentPosition ; #DEBUG_LINE_NO:46
  Self.PlayTones() ; #DEBUG_LINE_NO:47
  If (Ring1Dummy as starbornpuzzlescript).iCurrentPosition == 1 && (Ring2Dummy as starbornpuzzlescript).iCurrentPosition == 1 && (Ring3Dummy as starbornpuzzlescript).iCurrentPosition == 1 ; #DEBUG_LINE_NO:48
    Self.CorrectPattern() ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function PlayTones()
  Int iCurrentFirstTone = 1 ; #DEBUG_LINE_NO:57
  Int iCurrentSecondTone = 1 ; #DEBUG_LINE_NO:58
  Int iCurrentThirdTone = 1 ; #DEBUG_LINE_NO:59
  If (Ring1Dummy as starbornpuzzlescript).iCurrentPosition == 1 ; #DEBUG_LINE_NO:60
    iCurrentFirstTone = 1 ; #DEBUG_LINE_NO:61
    AMBStarbornTempleTestTone_A1_D_p0Event.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:62
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
  If (Ring1Dummy as starbornpuzzlescript).iCurrentPosition == 2 ; #DEBUG_LINE_NO:65
    iCurrentFirstTone = 2 ; #DEBUG_LINE_NO:66
    AMBStarbornTempleTestTone_A1_D_p1Event.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:67
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
  If (Ring1Dummy as starbornpuzzlescript).iCurrentPosition == 3 ; #DEBUG_LINE_NO:70
    iCurrentFirstTone = 3 ; #DEBUG_LINE_NO:71
    AMBStarbornTempleTestTone_A1_D_p2Event.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:72
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  If (Ring1Dummy as starbornpuzzlescript).iCurrentPosition == 4 ; #DEBUG_LINE_NO:75
    iCurrentFirstTone = 4 ; #DEBUG_LINE_NO:76
    AMBStarbornTempleTestTone_A1_D_p3Event.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:77
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
  If (Ring2Dummy as starbornpuzzlescript).iCurrentPosition == 1 ; #DEBUG_LINE_NO:80
    iCurrentSecondTone = 1 ; #DEBUG_LINE_NO:81
    AMBStarbornTempleTestTone_B2_Fs_p0Event.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:82
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:83
  EndIf ; #DEBUG_LINE_NO:
  If (Ring2Dummy as starbornpuzzlescript).iCurrentPosition == 2 ; #DEBUG_LINE_NO:85
    iCurrentSecondTone = 2 ; #DEBUG_LINE_NO:86
    AMBStarbornTempleTestTone_A1_D_p1Event.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:87
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
  If (Ring2Dummy as starbornpuzzlescript).iCurrentPosition == 3 ; #DEBUG_LINE_NO:90
    iCurrentSecondTone = 3 ; #DEBUG_LINE_NO:91
    AMBStarbornTempleTestTone_A1_D_p2Event.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:92
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
  If (Ring2Dummy as starbornpuzzlescript).iCurrentPosition == 4 ; #DEBUG_LINE_NO:95
    iCurrentSecondTone = 4 ; #DEBUG_LINE_NO:96
    AMBStarbornTempleTestTone_A1_D_p3Event.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:97
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:98
  EndIf ; #DEBUG_LINE_NO:
  If (Ring3Dummy as starbornpuzzlescript).iCurrentPosition == 1 ; #DEBUG_LINE_NO:100
    iCurrentThirdTone = 1 ; #DEBUG_LINE_NO:101
    AMBStarbornTempleTestTone_C3_A_p0Event.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:102
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:103
  EndIf ; #DEBUG_LINE_NO:
  If (Ring3Dummy as starbornpuzzlescript).iCurrentPosition == 2 ; #DEBUG_LINE_NO:105
    iCurrentThirdTone = 2 ; #DEBUG_LINE_NO:106
    AMBStarbornTempleTestTone_A1_D_p1Event.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:107
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:108
  EndIf ; #DEBUG_LINE_NO:
  If (Ring3Dummy as starbornpuzzlescript).iCurrentPosition == 3 ; #DEBUG_LINE_NO:110
    iCurrentThirdTone = 3 ; #DEBUG_LINE_NO:111
    AMBStarbornTempleTestTone_A1_D_p2Event.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:112
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:113
  EndIf ; #DEBUG_LINE_NO:
  If (Ring3Dummy as starbornpuzzlescript).iCurrentPosition == 4 ; #DEBUG_LINE_NO:115
    iCurrentThirdTone = 4 ; #DEBUG_LINE_NO:116
    AMBStarbornTempleTestTone_A1_D_p3Event.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:117
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CorrectPattern()
  AMBStarbornTempleTestPuzzleSuccessEvent.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:127
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:128
  BottomRing.TranslateToRef(PuzzleOpenMarker, 1.0, 30.0) ; #DEBUG_LINE_NO:129
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:131
  Ramp.TranslateToRef(RampMoveMarker, 1.0, 0.0) ; #DEBUG_LINE_NO:132
EndFunction

Function IncorrectPattern()
  sFailureEvent.Play(CompletionSoundMarker, None, None) ; #DEBUG_LINE_NO:136
EndFunction
