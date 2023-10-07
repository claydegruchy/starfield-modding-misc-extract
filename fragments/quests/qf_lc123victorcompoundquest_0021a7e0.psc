ScriptName Fragments:Quests:QF_LC123VictorCompoundQuest_0021A7E0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property LC123CoraMessage1 Auto Const
Message Property LC123CoraMessage2 Auto Const
Scene Property LC123VictorCompoundQuest_CoraCommentScene1 Auto Const
Scene Property LC123VictorCompoundQuest_CoraCommentScene2 Auto Const
Scene Property LC123VictorCompoundQuest_CoraCommentScene3 Auto Const
Scene Property LC123VictorCompoundQuest_CoraCommentScene4 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If Self.GetStageDone(5) == True ; #DEBUG_LINE_NO:7
    LC123VictorCompoundQuest_CoraCommentScene1.Start() ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0015_Item_00()
  If Self.GetStageDone(5) == True ; #DEBUG_LINE_NO:17
    LC123VictorCompoundQuest_CoraCommentScene4.Start() ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.GetStageDone(5) == True ; #DEBUG_LINE_NO:27
    LC123VictorCompoundQuest_CoraCommentScene2.Start() ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0030_Item_00()
  If Self.GetStageDone(5) == True ; #DEBUG_LINE_NO:37
    LC123VictorCompoundQuest_CoraCommentScene3.Start() ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndFunction
