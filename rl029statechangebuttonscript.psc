ScriptName RL029StateChangeButtonScript Extends ObjectReference
{ Script for the tree state change in RL029. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property EnableMarkerRef1 Auto Const mandatory
ObjectReference Property EnableMarkerRef2 Auto Const mandatory
ObjectReference Property EnableMarkerRef3 Auto Const mandatory
ObjectReference Property PipeRef Auto Const mandatory
ObjectReference Property SoundLocPump Auto Const mandatory
ObjectReference Property SoundLocBig1 Auto Const mandatory
ObjectReference Property SoundLocBig2 Auto Const mandatory
ObjectReference Property SoundLocSmall1 Auto Const mandatory
ObjectReference Property SoundLocSmall2 Auto Const mandatory
wwiseevent Property WiseEventWaterPump Auto Const mandatory
wwiseevent Property WiseEventBigTree1 Auto Const mandatory
wwiseevent Property WiseEventBigTree2 Auto Const mandatory
wwiseevent Property WiseEventSmallTree1 Auto Const mandatory
wwiseevent Property WiseEventSmallTree2 Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GoToState("Done") ; #DEBUG_LINE_NO:22
    PipeRef.DamageObject(2000.0) ; #DEBUG_LINE_NO:24
    Utility.wait(1.0) ; #DEBUG_LINE_NO:26
    WiseEventWaterPump.Play(SoundLocPump, None, None) ; #DEBUG_LINE_NO:27
    EnableMarkerRef1.Enable(False) ; #DEBUG_LINE_NO:28
    EnableMarkerRef3.Enable(False) ; #DEBUG_LINE_NO:29
    Utility.wait(2.0) ; #DEBUG_LINE_NO:31
    EnableMarkerRef2.Enable(False) ; #DEBUG_LINE_NO:32
    Utility.wait(3.0) ; #DEBUG_LINE_NO:34
    WiseEventBigTree1.Play(SoundLocBig1, None, None) ; #DEBUG_LINE_NO:35
    Game.ShakeCamera(None, 0.5, 0.0) ; #DEBUG_LINE_NO:36
    Utility.wait(2.0) ; #DEBUG_LINE_NO:38
    Game.ShakeCamera(None, 0.5, 0.0) ; #DEBUG_LINE_NO:39
    Utility.wait(4.0) ; #DEBUG_LINE_NO:41
    WiseEventBigTree2.Play(SoundLocBig2, None, None) ; #DEBUG_LINE_NO:42
    Game.ShakeCamera(None, 0.5, 0.0) ; #DEBUG_LINE_NO:43
    Utility.wait(10.0) ; #DEBUG_LINE_NO:45
    WiseEventSmallTree1.Play(SoundLocSmall1, None, None) ; #DEBUG_LINE_NO:46
    Utility.wait(7.0) ; #DEBUG_LINE_NO:48
    WiseEventSmallTree2.Play(SoundLocSmall2, None, None) ; #DEBUG_LINE_NO:49
  EndEvent
EndState
