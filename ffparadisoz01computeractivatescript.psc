ScriptName FFParadisoZ01ComputerActivateScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property FixComputerStage = 300 Auto Const
Int Property ComputerFixedStage = 460 Auto Const
Perk Property Security Auto Const mandatory
Quest Property FFParadisoZ01 Auto Const mandatory
Message Property FFParadisoZ01_ComputerMSG Auto Const mandatory
Message Property FFParadisoZ01_ComputerMSGFail Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If FFParadisoZ01.GetStageDone(FixComputerStage) && !FFParadisoZ01.GetStageDone(ComputerFixedStage) ; #DEBUG_LINE_NO:11
    Self.BlockActivation(False, False) ; #DEBUG_LINE_NO:12
  Else ; #DEBUG_LINE_NO:
    Self.BlockActivation(True, True) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If Game.GetPlayer().HasPerk(Security) && FFParadisoZ01.GetStageDone(FixComputerStage) && !FFParadisoZ01.GetStageDone(ComputerFixedStage) ; #DEBUG_LINE_NO:19
    FFParadisoZ01_ComputerMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:20
  Else ; #DEBUG_LINE_NO:
    FFParadisoZ01_ComputerMSGFail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndEvent
