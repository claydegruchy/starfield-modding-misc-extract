ScriptName CF_Main_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimeFactionUC Auto Const mandatory
Quest Property CF02 Auto Const mandatory
Quest Property CF03 Auto Const mandatory
Quest Property CF04 Auto Const mandatory
Quest Property CF05 Auto Const mandatory
Quest Property CF06 Auto Const mandatory
Quest Property CF07 Auto Const mandatory
GlobalVariable Property CF04_UCArrested Auto Const mandatory
GlobalVariable Property CF05_UCArrested Auto Const mandatory

;-- Functions ---------------------------------------

Function SendPlayerToJail()
  CrimeFactionUC.SendPlayerToJail(True, False) ; #DEBUG_LINE_NO:14
EndFunction

Function RegisterForLoadScreenEvent()
  Self.RegisterForMenuOpenCloseEvent("LoadingMenu") ; #DEBUG_LINE_NO:18
EndFunction

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If !abOpening ; #DEBUG_LINE_NO:22
    If CF04_UCArrested.GetValue() == 1.0 ; #DEBUG_LINE_NO:23
      Utility.Wait(3.0) ; #DEBUG_LINE_NO:24
      CF04.SetStage(1000) ; #DEBUG_LINE_NO:25
      Self.UnregisterForMenuOpenCloseEvent("LoadingMenu") ; #DEBUG_LINE_NO:26
    ElseIf CF05_UCArrested.GetValue() == 1.0 ; #DEBUG_LINE_NO:27
      Utility.Wait(3.0) ; #DEBUG_LINE_NO:28
      CF05.SetStage(10000) ; #DEBUG_LINE_NO:29
      Self.UnregisterForMenuOpenCloseEvent("LoadingMenu") ; #DEBUG_LINE_NO:30
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SysDefShutdown()
  If CF02.IsRunning() == True ; #DEBUG_LINE_NO:37
    CF02.SetStage(18) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
  If CF03.IsRunning() == True ; #DEBUG_LINE_NO:41
    CF03.SetStage(18) ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
  If CF04.IsRunning() == True ; #DEBUG_LINE_NO:45
    CF04.SetStage(18) ; #DEBUG_LINE_NO:46
  EndIf ; #DEBUG_LINE_NO:
  If CF05.IsRunning() == True ; #DEBUG_LINE_NO:49
    CF05.SetStage(38) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
  If CF07.IsRunning() == True ; #DEBUG_LINE_NO:53
    CF07.SetStage(18) ; #DEBUG_LINE_NO:54
  EndIf ; #DEBUG_LINE_NO:
EndFunction
