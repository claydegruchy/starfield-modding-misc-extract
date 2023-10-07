ScriptName Fragments:Quests:QF_Patch_Hotfix_002058DE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ103 Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
Quest Property MQ104B Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
Quest Property FC03 Auto Const mandatory
Quest Property FC04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If MQ103.IsCompleted() && MQ104A.IsCompleted() && MQ104B.IsCompleted() ; #DEBUG_LINE_NO:8
    If MQ105.IsCompleted() == False && MQ105.IsRunning() == False ; #DEBUG_LINE_NO:9
      MQ105.SetStage(10) ; #DEBUG_LINE_NO:10
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If FC03.IsCompleted() && FC04.IsRunning() == False ; #DEBUG_LINE_NO:15
    FC04.SetStage(40) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndFunction
