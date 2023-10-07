ScriptName Fragments:Packages:PF_DialogueFCRyujinTower_Dem_0000BF59 Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property LC044_DRONEDemoRunning Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  LC044_DRONEDemoRunning.SetValue(0.0) ; #DEBUG_LINE_NO:7
  akActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:8
EndFunction
