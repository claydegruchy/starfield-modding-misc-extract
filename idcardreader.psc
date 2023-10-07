ScriptName IDCardReader Extends ObjectReference
{ Script for ID Card Readers }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group RequiredProperties
  Key Property IDCard Auto Const
  { The ID Card required by this card reader. If not present, all activations will fail. }
EndGroup

Group OptionalProperties
  Bool Property ShouldAutoReset = False Auto Const
  { Default=False. If true, return to the Waiting state after a successful activation, instead of remaining in the Success state. }
  Bool Property ShouldDisplaySuccessMessage = False Auto Const
  { Default=False. If true, display IDCardReaderSuccessMessage when used successfully. }
  Quest Property QuestToCheck Auto Const
  { Default=None. If set, QuestToCheck's PrereqStage must be set in order for activation to succeed. }
  Int Property PrereqStage = -1 Auto Const
  { Default=-1. If set, QuestToCheck's PrereqStage must be set in order for activation to succeed. }
EndGroup

Group AutofillProperties collapsedonbase
  Keyword Property LinkIDReader Auto Const mandatory
  Message Property IDCardReaderSuccessMessage Auto Const mandatory
  Message Property IDCardReaderFailMissingCardMessage Auto Const mandatory
  Message Property IDCardReaderFailMissingPrereqMessage Auto Const mandatory
  Message Property IDCardReaderNotRespondingMessage Auto Const mandatory
EndGroup

Bool Property bDoorOpen Auto

;-- Functions ---------------------------------------

Function IDReaderOpenDoor(Bool shouldBeOpen)
  ObjectReference linkedRef = Self.GetLinkedRef(LinkIDReader) ; #DEBUG_LINE_NO:108
  Int openState = linkedRef.GetOpenState() ; #DEBUG_LINE_NO:109
  If openState == 1 || openState == 2 ; #DEBUG_LINE_NO:110
    linkedRef.SetOpen(False) ; #DEBUG_LINE_NO:111
  ElseIf openState == 3 || openState == 4 ; #DEBUG_LINE_NO:112
    linkedRef.SetOpen(True) ; #DEBUG_LINE_NO:113
  EndIf ; #DEBUG_LINE_NO:
  linkedRef.lock(!shouldBeOpen, False, True) ; #DEBUG_LINE_NO:116
EndFunction

Function GotoSuccessState()
  Self.PlayAnimation("Play01") ; #DEBUG_LINE_NO:122
  Self.IDReaderOpenDoor(True) ; #DEBUG_LINE_NO:123
  Self.GotoState("SuccessIDReaderState") ; #DEBUG_LINE_NO:124
EndFunction

Function ResetIDCardReader()
  Self.PlayAnimation("StateA_Idle") ; #DEBUG_LINE_NO:128
  Self.IDReaderOpenDoor(False) ; #DEBUG_LINE_NO:129
  Self.GotoState("IDReaderWaiting") ; #DEBUG_LINE_NO:130
EndFunction

Function GotoWaitState()
  Self.GotoState("IDReaderWaiting") ; #DEBUG_LINE_NO:134
EndFunction

Function GotoLockdownState()
  Self.PlayAnimation("StateC_Idle") ; #DEBUG_LINE_NO:138
  Self.GotoState("LockdownIDReaderState") ; #DEBUG_LINE_NO:139
EndFunction

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
State IDReaderWaiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Busy") ; #DEBUG_LINE_NO:47
    Var[] kargs = new Var[1] ; #DEBUG_LINE_NO:48
    kargs[0] = akActionRef as Var ; #DEBUG_LINE_NO:49
    Self.SendCustomEvent("idcardreader_IDReaderActivated", kargs) ; #DEBUG_LINE_NO:50
    If IDCard == None || akActionRef.GetItemCount(IDCard as Form) == 0 ; #DEBUG_LINE_NO:51
      Self.SendCustomEvent("idcardreader_IDReaderActivatedFailure", kargs) ; #DEBUG_LINE_NO:53
      If IDCardReaderFailMissingCardMessage != None ; #DEBUG_LINE_NO:54
        Self.PlayAnimation("StateD_Play") ; #DEBUG_LINE_NO:55
        If akActionRef == Game.getplayer() as ObjectReference ; #DEBUG_LINE_NO:56
          IDCardReaderFailMissingCardMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:57
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      Self.GotoState("IDReaderWaiting") ; #DEBUG_LINE_NO:60
    ElseIf QuestToCheck != None && PrereqStage >= 0 && !QuestToCheck.GetStageDone(PrereqStage) ; #DEBUG_LINE_NO:61
      Self.SendCustomEvent("idcardreader_IDReaderActivatedFailure", kargs) ; #DEBUG_LINE_NO:63
      If IDCardReaderFailMissingPrereqMessage != None && (akActionRef == Game.getplayer() as ObjectReference) ; #DEBUG_LINE_NO:64
        IDCardReaderFailMissingPrereqMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:65
      EndIf ; #DEBUG_LINE_NO:
      Self.GotoState("IDReaderWaiting") ; #DEBUG_LINE_NO:67
    Else ; #DEBUG_LINE_NO:
      Self.SendCustomEvent("idcardreader_IDReaderActivatedSuccess", kargs) ; #DEBUG_LINE_NO:70
      Self.PlayAnimationAndWait("Play01", "Done") ; #DEBUG_LINE_NO:71
      If ShouldDisplaySuccessMessage && IDCardReaderSuccessMessage != None && (akActionRef == Game.getplayer() as ObjectReference) ; #DEBUG_LINE_NO:72
        IDCardReaderSuccessMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:73
      EndIf ; #DEBUG_LINE_NO:
      If ShouldAutoReset ; #DEBUG_LINE_NO:75
        Self.GotoState("IDReaderWaiting") ; #DEBUG_LINE_NO:76
      Else ; #DEBUG_LINE_NO:
        Self.GotoState("SuccessIDReaderState") ; #DEBUG_LINE_NO:78
      EndIf ; #DEBUG_LINE_NO:
      Self.IDReaderOpenDoor(True) ; #DEBUG_LINE_NO:80
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State LockdownIDReaderState

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Busy") ; #DEBUG_LINE_NO:93
    If IDCardReaderNotRespondingMessage != None ; #DEBUG_LINE_NO:94
      Self.PlayAnimationAndWait("Play04", "Done") ; #DEBUG_LINE_NO:95
      If akActionRef == Game.getplayer() as ObjectReference ; #DEBUG_LINE_NO:96
        IDCardReaderNotRespondingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:97
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.GotoState("LockdownIDReaderState") ; #DEBUG_LINE_NO:100
  EndEvent
EndState

;-- State -------------------------------------------
State SuccessIDReaderState

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForInit

  Event OnLoad()
    Self.BlockActivation(True, False) ; #DEBUG_LINE_NO:39
    Self.GotoState("IDReaderWaiting") ; #DEBUG_LINE_NO:40
  EndEvent
EndState
