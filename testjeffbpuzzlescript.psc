ScriptName TestJeffBPuzzleScript Extends ObjectReference

;-- Variables ---------------------------------------
Int counter = 0
ObjectReference myDoor
Int myTimerID = 0
ObjectReference player
Bool timerStarted = False

;-- Properties --------------------------------------
ObjectReference Property button01 Auto Const
ObjectReference Property button02 Auto Const
ObjectReference Property button03 Auto Const
ObjectReference Property MasterButton Auto Const
Int Property NumberOfButtons Auto Const
wwiseevent Property SoundSuccessEvent Auto Const
wwiseevent Property SoundFailEvent Auto Const
Message Property myMessage Auto Const
Float Property myTimer = 10.0 Auto

;-- Functions ---------------------------------------

Event OnLoad()
  player = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:22
  myDoor = Self.getLinkedRef(None) ; #DEBUG_LINE_NO:23
  Self.RegisterForRemoteEvent(button01 as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:24
  Self.RegisterForRemoteEvent(button02 as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:25
  Self.RegisterForRemoteEvent(button03 as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:26
  Self.RegisterForRemoteEvent(MasterButton as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:27
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If akActionRef == player ; #DEBUG_LINE_NO:33
    If timerStarted == False ; #DEBUG_LINE_NO:34
      timerStarted = True ; #DEBUG_LINE_NO:35
      Self.StartTimer(myTimer, myTimerID) ; #DEBUG_LINE_NO:36
    EndIf ; #DEBUG_LINE_NO:
    If akSender == button01 ; #DEBUG_LINE_NO:39
      counter = 1 ; #DEBUG_LINE_NO:40
    ElseIf akSender == button02 ; #DEBUG_LINE_NO:41
      If counter == 1 ; #DEBUG_LINE_NO:42
        counter += 1 ; #DEBUG_LINE_NO:44
      Else ; #DEBUG_LINE_NO:
        Self.ResetPuzzle() ; #DEBUG_LINE_NO:47
      EndIf ; #DEBUG_LINE_NO:
    ElseIf akSender == button03 ; #DEBUG_LINE_NO:49
      If counter == 2 ; #DEBUG_LINE_NO:50
        counter += 1 ; #DEBUG_LINE_NO:52
      Else ; #DEBUG_LINE_NO:
        Self.ResetPuzzle() ; #DEBUG_LINE_NO:55
      EndIf ; #DEBUG_LINE_NO:
    ElseIf akSender == MasterButton ; #DEBUG_LINE_NO:57
      If counter == NumberOfButtons ; #DEBUG_LINE_NO:59
        Self.UnRegisterForRemoteEvent(button01 as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:61
        Self.UnRegisterForRemoteEvent(button02 as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:62
        Self.UnRegisterForRemoteEvent(button03 as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:63
        Self.UnRegisterForRemoteEvent(MasterButton as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:64
        Int SoundSuccessID = SoundSuccessEvent.play(myDoor, None, None) ; #DEBUG_LINE_NO:65
        myDoor.setOpen(True) ; #DEBUG_LINE_NO:66
      Else ; #DEBUG_LINE_NO:
        Int SoundFailID = SoundFailEvent.play(myDoor, None, None) ; #DEBUG_LINE_NO:68
        Self.ResetPuzzle() ; #DEBUG_LINE_NO:69
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == myTimerID ; #DEBUG_LINE_NO:78
    myMessage.show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:79
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ResetPuzzle()
  counter = 0 ; #DEBUG_LINE_NO:86
  Self.RegisterForRemoteEvent(button01 as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:87
  Self.RegisterForRemoteEvent(button02 as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:88
  Self.RegisterForRemoteEvent(button03 as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:89
EndFunction
