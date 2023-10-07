ScriptName TestVanguardCourse Extends ObjectReference

;-- Variables ---------------------------------------
Bool But1p
Bool But2p
Bool But3p
Bool ButCh
Int curTime = 0

;-- Properties --------------------------------------
ObjectReference Property Button1 Auto Const mandatory
ObjectReference Property Button2 Auto Const mandatory
ObjectReference Property Button3 Auto Const mandatory
ObjectReference Property CheatButton Auto Const mandatory
ObjectReference Property ExitDoor Auto Const mandatory

;-- Functions ---------------------------------------

Event OnInit()
  Self.RegisterForRemoteEvent(Button1 as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:16
  Self.RegisterForRemoteEvent(Button2 as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:17
  Self.RegisterForRemoteEvent(Button3 as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:18
  Self.RegisterForRemoteEvent(CheatButton as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:19
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  Self.CourseTime() ; #DEBUG_LINE_NO:24
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If akSender == Button1 && But1p == False ; #DEBUG_LINE_NO:28
    But1p = True ; #DEBUG_LINE_NO:30
    Self.exitTest() ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
  If akSender == Button2 && But2p == False ; #DEBUG_LINE_NO:33
    But2p = True ; #DEBUG_LINE_NO:35
    Self.exitTest() ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
  If akSender == Button3 && But3p == False ; #DEBUG_LINE_NO:38
    But3p = True ; #DEBUG_LINE_NO:40
    Self.exitTest() ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
  If akSender == CheatButton && ButCh == False ; #DEBUG_LINE_NO:43
    ButCh = True ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function exitTest()
  If But1p && But2p && But3p ; #DEBUG_LINE_NO:51
    ExitDoor.SetOpen(True) ; #DEBUG_LINE_NO:52
    If ButCh == True ; #DEBUG_LINE_NO:53
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CourseTime()
  While But1p == False && But2p == False && But3p == False ; #DEBUG_LINE_NO:62
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:63
    curTime += 1 ; #DEBUG_LINE_NO:64
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
