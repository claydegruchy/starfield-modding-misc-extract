ScriptName Fragments:Packages:PF_DialogueFCRyujinTower_Dem_0000BF5B Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property LC044_DRONEDemoRunning Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  akActor.SetUnconscious(True) ; #DEBUG_LINE_NO:7
  LC044_DRONEDemoRunning.SetValue(0.0) ; #DEBUG_LINE_NO:8
EndFunction
