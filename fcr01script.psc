ScriptName FCR01Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
missionparentscript Property MissionParent Auto Const mandatory
{ mission parent quest }
Int Property AcceptStage = 50 Auto Const
{ The stage to set when mission is accepted }

;-- Functions ---------------------------------------

Event OnMissionAccepted()
  Self.HandleOnMissionAccepted() ; #DEBUG_LINE_NO:11
EndEvent

Function HandleOnMissionAccepted()
  If MissionParent.MissionBoardAcceptMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0 ; #DEBUG_LINE_NO:16
    Self.MissionAccepted(True) ; #DEBUG_LINE_NO:17
  Else ; #DEBUG_LINE_NO:
    Self.MissionAccepted(False) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MissionAccepted(Bool bAccepted)
  If bAccepted ; #DEBUG_LINE_NO:25
    wwiseevent.PlayMenuSound("UITerminalMissionBoardMissionAcceptYes") ; #DEBUG_LINE_NO:27
    Self.setstage(AcceptStage) ; #DEBUG_LINE_NO:28
  Else ; #DEBUG_LINE_NO:
    wwiseevent.PlayMenuSound("UITerminalMissionBoardMissionAcceptNo") ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndFunction
