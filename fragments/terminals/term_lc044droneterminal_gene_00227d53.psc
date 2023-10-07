ScriptName Fragments:Terminals:TERM_LC044DRONETerminal_Gene_00227D53 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property LC044DRONEEavesdroppingScene Auto Const
GlobalVariable Property LC044_DRONEDemoRunning Auto Const mandatory
Scene Property DialogueFCRyujinTower_MiniBot_DemoScene Auto Const mandatory
Quest Property RI04 Auto Const mandatory
ObjectReference Property RI_DemoMiniBotRef Auto Const mandatory
Quest Property LC044_EavesdroppingScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  LC044_DRONEDemoRunning.SetValue(1.0) ; #DEBUG_LINE_NO:7
  If RI04.GetStageDone(375) && !RI04.GetStageDone(1000) && !LC044_EavesdroppingScene.GetStageDone(100) ; #DEBUG_LINE_NO:8
    LC044_EavesdroppingScene.SetStage(100) ; #DEBUG_LINE_NO:9
  Else ; #DEBUG_LINE_NO:
    DialogueFCRyujinTower_MiniBot_DemoScene.Start() ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndFunction
