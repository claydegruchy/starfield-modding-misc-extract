ScriptName MQ404Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property HunterAppearsStage = 130 Auto Const
Int Property HunterAppearsPrereqStage = 120 Auto Const

;-- Functions ---------------------------------------

Function WaitForWorkshopMenuClose()
  Self.RegisterForMenuOpenCloseEvent("WorkshopMenu") ; #DEBUG_LINE_NO:7
EndFunction

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "WorkshopMenu" ; #DEBUG_LINE_NO:11
    If abOpening == False && Self.GetStageDone(HunterAppearsPrereqStage) ; #DEBUG_LINE_NO:12
      Self.SetStage(HunterAppearsStage) ; #DEBUG_LINE_NO:13
      Self.UnRegisterForMenuOpenCloseEvent("WorkshopMenu") ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
