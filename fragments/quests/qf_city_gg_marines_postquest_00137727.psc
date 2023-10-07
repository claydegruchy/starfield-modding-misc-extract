ScriptName Fragments:Quests:QF_City_GG_Marines_PostQuest_00137727 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueGagarin_UC_GG Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If DialogueGagarin_UC_GG.GetStageDone(1200) ; #DEBUG_LINE_NO:7
    DialogueGagarin_UC_GG.SetStage(1205) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
  If DialogueGagarin_UC_GG.GetStageDone(1210) ; #DEBUG_LINE_NO:11
    DialogueGagarin_UC_GG.SetStage(1215) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
  If DialogueGagarin_UC_GG.GetStageDone(1220) ; #DEBUG_LINE_NO:15
    DialogueGagarin_UC_GG.SetStage(1225) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
  DialogueGagarin_UC_GG.SetStage(1230) ; #DEBUG_LINE_NO:19
  Self.Stop() ; #DEBUG_LINE_NO:21
EndFunction
