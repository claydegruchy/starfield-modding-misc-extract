ScriptName MQ206BScorpiusPuzzleControlScript Extends ObjectReference
{ Master Functions for the Scorpius Puzzle sequence. Puzzle is controlled by 4 buttons that moves a beam of light into the correct position to solve. }

;-- Variables ---------------------------------------
ObjectReference ButtonDownREF
ObjectReference ButtonLeftREF
ObjectReference ButtonRightREF
ObjectReference ButtonUpREF
Float fCurrentPosition_LeftRight
Float fCurrentPosition_UpDown

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard BeamPositionGuard
Guard PuzzleSetupGuard

;-- Properties --------------------------------------
Keyword Property MQ206BScorpius_BeamAnimHelper Auto Const mandatory
Keyword Property MQ206BScorpius_ButtonDown Auto Const mandatory
Keyword Property MQ206BScorpius_ButtonLeft Auto Const mandatory
Keyword Property MQ206BScorpius_ButtonRight Auto Const mandatory
Keyword Property MQ206BScorpius_ButtonUp Auto Const mandatory
Keyword Property MQ206BScorpius_Statue Auto Const mandatory
Keyword Property MQ206BScorpius_Trigger Auto Const mandatory
Keyword Property MQ206BScorpius_BeamLight Auto Const mandatory
Keyword Property MQ206BScorpius_LensFlareFX Auto Const mandatory
String Property sBeamOpacity = "Amount" Auto Const
Float Property fBeamStrength_Start = 0.5 Auto Const
Float Property fBeamStrength_Reset = 0.0 Auto Const
Float Property fBeamStrength_Full = 1.0 Auto Const
String Property sMovement_LeftRight = "Rotation" Auto Const
String Property sMovement_UpDown = "Position" Auto Const
Float Property fMovement_Initial = 0.5 Auto Const
Float Property fMovementUpDown_Initial = 0.5 Auto Const
String Property sStatuePuzzleAnim_Start = "Play01" Auto Const
String Property sStatuePuzzleAnim_Reset = "Reset" Auto Const
String Property sPuzzleSolutionAnim = "Stage2" Auto Const
String Property sPuzzleSolutionAnim_Reset = "Stage1" Auto Const
Float Property fSolutionPosition_LeftRight = 0.200000003 Auto Const
Float Property fSolutionPosition_UpDown = 0.400000006 Auto Const
Float Property ButtonMoveAmount = 0.100000001 Auto Const
Quest Property MQ206B Auto Const mandatory
Int Property MQ206BCompleteStage = 800 Auto Const
Int Property MQ206BPuzzleStartedStage = 720 Auto Const
wwiseevent Property WwiseEvent_QST_ScorpiusStatue_Beam_Move Auto Const mandatory
wwiseevent Property WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Down Auto Const mandatory
wwiseevent Property WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Left Auto Const mandatory
wwiseevent Property WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Right Auto Const mandatory
wwiseevent Property WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Up Auto Const mandatory
wwiseevent Property WwiseEvent_QST_ScorpiusStatue_Success Auto Const mandatory

;-- Functions ---------------------------------------

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.ResetPuzzle() ; #DEBUG_LINE_NO:106
EndEvent

Function StartPuzzle()
  Guard PuzzleSetupGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:123
    ObjectReference StatueREF = Self.GetLinkedRef(MQ206BScorpius_Statue) ; #DEBUG_LINE_NO:124
    ObjectReference BeamLightREF = Self.GetLinkedRef(MQ206BScorpius_BeamLight) ; #DEBUG_LINE_NO:125
    ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper) ; #DEBUG_LINE_NO:126
    ButtonLeftREF = Self.GetLinkedRef(MQ206BScorpius_ButtonLeft) ; #DEBUG_LINE_NO:128
    ButtonRightREF = Self.GetLinkedRef(MQ206BScorpius_ButtonRight) ; #DEBUG_LINE_NO:129
    ButtonUpREF = Self.GetLinkedRef(MQ206BScorpius_ButtonUp) ; #DEBUG_LINE_NO:130
    ButtonDownREF = Self.GetLinkedRef(MQ206BScorpius_ButtonDown) ; #DEBUG_LINE_NO:131
    Self.RegisterForRemoteEvent(ButtonLeftREF as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:134
    Self.RegisterForRemoteEvent(ButtonRightREF as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:135
    Self.RegisterForRemoteEvent(ButtonUpREF as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:136
    Self.RegisterForRemoteEvent(ButtonDownREF as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:137
    StatueREF.PlayAnimation(sStatuePuzzleAnim_Start) ; #DEBUG_LINE_NO:140
    BeamLightREF.PlayAnimation(sStatuePuzzleAnim_Start) ; #DEBUG_LINE_NO:141
    BeamHelperREF.SetAnimationVariableFloat(sMovement_LeftRight, fMovement_Initial) ; #DEBUG_LINE_NO:144
    BeamHelperREF.SetAnimationVariableFloat(sMovement_UpDown, fMovementUpDown_Initial) ; #DEBUG_LINE_NO:145
    BeamLightREF.SetAnimationVariableFloat(sBeamOpacity, fBeamStrength_Start) ; #DEBUG_LINE_NO:148
    Guard BeamPositionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:151
      fCurrentPosition_LeftRight = fMovement_Initial ; #DEBUG_LINE_NO:152
      fCurrentPosition_UpDown = fMovementUpDown_Initial ; #DEBUG_LINE_NO:153
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  Self.GoToState("IdleState") ; #DEBUG_LINE_NO:156
EndFunction

Function ResetPuzzle()
  Guard PuzzleSetupGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:161
    Self.GoToState("WaitingToStart") ; #DEBUG_LINE_NO:162
    ObjectReference StatueREF = Self.GetLinkedRef(MQ206BScorpius_Statue) ; #DEBUG_LINE_NO:163
    ObjectReference BeamLightREF = Self.GetLinkedRef(MQ206BScorpius_BeamLight) ; #DEBUG_LINE_NO:164
    ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper) ; #DEBUG_LINE_NO:165
    ButtonLeftREF = Self.GetLinkedRef(MQ206BScorpius_ButtonLeft) ; #DEBUG_LINE_NO:167
    ButtonRightREF = Self.GetLinkedRef(MQ206BScorpius_ButtonRight) ; #DEBUG_LINE_NO:168
    ButtonUpREF = Self.GetLinkedRef(MQ206BScorpius_ButtonUp) ; #DEBUG_LINE_NO:169
    ButtonDownREF = Self.GetLinkedRef(MQ206BScorpius_ButtonDown) ; #DEBUG_LINE_NO:170
    Self.UnRegisterForRemoteEvent(ButtonLeftREF as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:173
    Self.UnRegisterForRemoteEvent(ButtonRightREF as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:174
    Self.UnRegisterForRemoteEvent(ButtonUpREF as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:175
    Self.UnRegisterForRemoteEvent(ButtonDownREF as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:176
    ButtonLeftREF = None ; #DEBUG_LINE_NO:178
    ButtonRightREF = None ; #DEBUG_LINE_NO:179
    ButtonUpREF = None ; #DEBUG_LINE_NO:180
    ButtonDownREF = None ; #DEBUG_LINE_NO:181
    StatueREF.PlayAnimation(sStatuePuzzleAnim_Reset) ; #DEBUG_LINE_NO:184
    BeamLightREF.PlayAnimation(sStatuePuzzleAnim_Reset) ; #DEBUG_LINE_NO:185
    BeamLightREF.SetAnimationVariableFloat(sBeamOpacity, fBeamStrength_Reset) ; #DEBUG_LINE_NO:188
    BeamHelperREF.SetAnimationVariableFloat(sMovement_LeftRight, fMovement_Initial) ; #DEBUG_LINE_NO:189
    BeamHelperREF.SetAnimationVariableFloat(sMovement_UpDown, fMovement_Initial) ; #DEBUG_LINE_NO:190
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function MoveBeamLeft()
  Guard BeamPositionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:195
    ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper) ; #DEBUG_LINE_NO:196
    fCurrentPosition_LeftRight -= ButtonMoveAmount ; #DEBUG_LINE_NO:198
    If fCurrentPosition_LeftRight < 0.0 ; #DEBUG_LINE_NO:200
      fCurrentPosition_LeftRight = 0.0 ; #DEBUG_LINE_NO:201
    ElseIf fCurrentPosition_LeftRight > 1.0 ; #DEBUG_LINE_NO:202
      fCurrentPosition_LeftRight = 1.0 ; #DEBUG_LINE_NO:203
    EndIf ; #DEBUG_LINE_NO:
    WwiseEvent_QST_ScorpiusStatue_Beam_Move.Play(BeamHelperREF, None, None) ; #DEBUG_LINE_NO:205
    BeamHelperREF.SetAnimationVariableFloat(sMovement_LeftRight, fCurrentPosition_LeftRight) ; #DEBUG_LINE_NO:206
    Self.CheckSolutionPosition() ; #DEBUG_LINE_NO:207
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function MoveBeamRight()
  Guard BeamPositionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:212
    ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper) ; #DEBUG_LINE_NO:213
    fCurrentPosition_LeftRight += ButtonMoveAmount ; #DEBUG_LINE_NO:215
    If fCurrentPosition_LeftRight < 0.0 ; #DEBUG_LINE_NO:217
      fCurrentPosition_LeftRight = 0.0 ; #DEBUG_LINE_NO:218
    ElseIf fCurrentPosition_LeftRight > 1.0 ; #DEBUG_LINE_NO:219
      fCurrentPosition_LeftRight = 1.0 ; #DEBUG_LINE_NO:220
    EndIf ; #DEBUG_LINE_NO:
    WwiseEvent_QST_ScorpiusStatue_Beam_Move.Play(BeamHelperREF, None, None) ; #DEBUG_LINE_NO:222
    BeamHelperREF.SetAnimationVariableFloat(sMovement_LeftRight, fCurrentPosition_LeftRight) ; #DEBUG_LINE_NO:223
    Self.CheckSolutionPosition() ; #DEBUG_LINE_NO:224
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function MoveBeamUp()
  Guard BeamPositionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:229
    ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper) ; #DEBUG_LINE_NO:230
    fCurrentPosition_UpDown += ButtonMoveAmount ; #DEBUG_LINE_NO:232
    If fCurrentPosition_UpDown < 0.0 ; #DEBUG_LINE_NO:234
      fCurrentPosition_UpDown = 0.0 ; #DEBUG_LINE_NO:235
    ElseIf fCurrentPosition_UpDown > 1.0 ; #DEBUG_LINE_NO:236
      fCurrentPosition_UpDown = 1.0 ; #DEBUG_LINE_NO:237
    EndIf ; #DEBUG_LINE_NO:
    WwiseEvent_QST_ScorpiusStatue_Beam_Move.Play(BeamHelperREF, None, None) ; #DEBUG_LINE_NO:239
    BeamHelperREF.SetAnimationVariableFloat(sMovement_UpDown, fCurrentPosition_UpDown) ; #DEBUG_LINE_NO:240
    Self.CheckSolutionPosition() ; #DEBUG_LINE_NO:241
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function MoveBeamDown()
  Guard BeamPositionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:246
    ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper) ; #DEBUG_LINE_NO:247
    fCurrentPosition_UpDown -= ButtonMoveAmount ; #DEBUG_LINE_NO:249
    If fCurrentPosition_UpDown < 0.0 ; #DEBUG_LINE_NO:251
      fCurrentPosition_UpDown = 0.0 ; #DEBUG_LINE_NO:252
    ElseIf fCurrentPosition_UpDown > 1.0 ; #DEBUG_LINE_NO:253
      fCurrentPosition_UpDown = 1.0 ; #DEBUG_LINE_NO:254
    EndIf ; #DEBUG_LINE_NO:
    WwiseEvent_QST_ScorpiusStatue_Beam_Move.Play(BeamHelperREF, None, None) ; #DEBUG_LINE_NO:256
    BeamHelperREF.SetAnimationVariableFloat(sMovement_UpDown, fCurrentPosition_UpDown) ; #DEBUG_LINE_NO:257
    Self.CheckSolutionPosition() ; #DEBUG_LINE_NO:258
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function CheckSolutionPosition()
  If fCurrentPosition_LeftRight == fSolutionPosition_LeftRight && fCurrentPosition_UpDown == fSolutionPosition_UpDown ; #DEBUG_LINE_NO:263
    ObjectReference BeamLightREF = Self.GetLinkedRef(MQ206BScorpius_BeamLight) ; #DEBUG_LINE_NO:264
    ObjectReference StatueREF = Self.GetLinkedRef(MQ206BScorpius_Statue) ; #DEBUG_LINE_NO:265
    WwiseEvent_QST_ScorpiusStatue_Success.Play(StatueREF, None, None) ; #DEBUG_LINE_NO:268
    BeamLightREF.SetAnimationVariableFloat(sBeamOpacity, fBeamStrength_Full) ; #DEBUG_LINE_NO:271
    Self.GetLinkedRef(MQ206BScorpius_LensFlareFX).PlayAnimation("Stage2") ; #DEBUG_LINE_NO:274
    StatueREF.PlayAnimation(sPuzzleSolutionAnim) ; #DEBUG_LINE_NO:277
    MQ206B.SetStage(MQ206BCompleteStage) ; #DEBUG_LINE_NO:280
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:284
EndFunction

;-- State -------------------------------------------
State IdleState

  Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    If akSender == ButtonLeftREF ; #DEBUG_LINE_NO:82
      Self.GoToState("MovingBeamState") ; #DEBUG_LINE_NO:83
      WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Left.Play(ButtonLeftREF, None, None) ; #DEBUG_LINE_NO:84
      Self.MoveBeamLeft() ; #DEBUG_LINE_NO:85
    ElseIf akSender == ButtonRightREF ; #DEBUG_LINE_NO:86
      Self.GoToState("MovingBeamState") ; #DEBUG_LINE_NO:87
      WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Right.Play(ButtonRightREF, None, None) ; #DEBUG_LINE_NO:88
      Self.MoveBeamRight() ; #DEBUG_LINE_NO:89
    ElseIf akSender == ButtonUpREF ; #DEBUG_LINE_NO:90
      Self.GoToState("MovingBeamState") ; #DEBUG_LINE_NO:91
      WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Up.Play(ButtonUpREF, None, None) ; #DEBUG_LINE_NO:92
      Self.MoveBeamUp() ; #DEBUG_LINE_NO:93
    ElseIf akSender == ButtonDownREF ; #DEBUG_LINE_NO:94
      Self.GoToState("MovingBeamState") ; #DEBUG_LINE_NO:95
      WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Down.Play(ButtonDownREF, None, None) ; #DEBUG_LINE_NO:96
      Self.MoveBeamDown() ; #DEBUG_LINE_NO:97
    EndIf ; #DEBUG_LINE_NO:
    Self.GoToState("IdleState") ; #DEBUG_LINE_NO:101
  EndEvent
EndState

;-- State -------------------------------------------
Auto State InitialLoadState

  Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
    ObjectReference StatueTriggerREF = Self.GetLinkedRef(MQ206BScorpius_Trigger) ; #DEBUG_LINE_NO:
    If akSender == StatueTriggerREF && (akActionRef == Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:
      Self.UnRegisterForRemoteEvent(StatueTriggerREF as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:
      Self.StartPuzzle() ; #DEBUG_LINE_NO:
      MQ206B.SetStage(MQ206BPuzzleStartedStage) ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    ObjectReference StatueTriggerREF = Self.GetLinkedRef(MQ206BScorpius_Trigger) ; #DEBUG_LINE_NO:59
    Self.RegisterForRemoteEvent(StatueTriggerREF as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:60
  EndEvent
EndState

;-- State -------------------------------------------
State MovingBeamState
EndState

;-- State -------------------------------------------
State WaitingToStart

  Event OnLoad()
    Self.StartPuzzle() ; #DEBUG_LINE_NO:76
  EndEvent
EndState
