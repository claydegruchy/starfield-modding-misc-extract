ScriptName RL083_AssemblyLine Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property PanelTop01 Auto Const
ObjectReference Property PanelTop02 Auto Const
ObjectReference Property PanelSideL01 Auto Const
ObjectReference Property PanelSideL02 Auto Const
ObjectReference Property PanelSideL03 Auto Const
ObjectReference Property PanelSideL04 Auto Const
ObjectReference Property PanelSideL05 Auto Const
ObjectReference Property PanelSideR01 Auto Const
ObjectReference Property PanelSideR02 Auto Const
ObjectReference Property PanelSideR03 Auto Const
ObjectReference Property PanelSideR04 Auto Const
ObjectReference Property PanelSideR05 Auto Const
ObjectReference Property PanelFront Auto Const
ObjectReference Property WelderBot01 Auto Const
ObjectReference Property WelderBot02 Auto Const
ObjectReference Property WelderBot03 Auto Const
ObjectReference Property WelderBot04 Auto Const
ObjectReference Property HatchDoor Auto Const

;-- Functions ---------------------------------------

Function StartConstruct()
  WelderBot01.PlayAnimation("Play01") ; #DEBUG_LINE_NO:23
  WelderBot02.PlayAnimation("Play01") ; #DEBUG_LINE_NO:24
  WelderBot03.PlayAnimation("Play01") ; #DEBUG_LINE_NO:25
  WelderBot04.PlayAnimation("Play01") ; #DEBUG_LINE_NO:26
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:28
  PanelTop01.PlayAnimation("Play01") ; #DEBUG_LINE_NO:29
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:30
  PanelTop02.PlayAnimation("Play01") ; #DEBUG_LINE_NO:31
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:32
  PanelSideL01.PlayAnimation("Play01") ; #DEBUG_LINE_NO:33
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:34
  PanelSideL02.PlayAnimation("Play01") ; #DEBUG_LINE_NO:35
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:36
  PanelSideL03.PlayAnimation("Play01") ; #DEBUG_LINE_NO:37
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:38
  PanelSideL04.PlayAnimation("Play01") ; #DEBUG_LINE_NO:39
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:40
  PanelSideL05.PlayAnimation("Play01") ; #DEBUG_LINE_NO:41
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:42
  PanelSideR01.PlayAnimation("Play01") ; #DEBUG_LINE_NO:43
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:44
  PanelSideR02.PlayAnimation("Play01") ; #DEBUG_LINE_NO:45
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:46
  PanelSideR03.PlayAnimation("Play01") ; #DEBUG_LINE_NO:47
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:48
  PanelSideR04.PlayAnimation("Play01") ; #DEBUG_LINE_NO:49
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:50
  PanelSideR05.PlayAnimation("Play01") ; #DEBUG_LINE_NO:51
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:52
  PanelFront.PlayAnimation("Play01") ; #DEBUG_LINE_NO:53
  Utility.Wait(13.0) ; #DEBUG_LINE_NO:54
  WelderBot01.PlayAnimation("Play02") ; #DEBUG_LINE_NO:56
  WelderBot02.PlayAnimation("Play02") ; #DEBUG_LINE_NO:57
  WelderBot03.PlayAnimation("Play02") ; #DEBUG_LINE_NO:58
  WelderBot04.PlayAnimation("Play02") ; #DEBUG_LINE_NO:59
  HatchDoor.SetOpen(True) ; #DEBUG_LINE_NO:60
EndFunction
