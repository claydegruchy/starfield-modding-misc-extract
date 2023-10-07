ScriptName Fragments:Quests:QF__01000D1A Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Int SelectedScene = Utility.RandomInt(1, 10) ; #DEBUG_LINE_NO:15
  If SelectedScene <= 2 ; #DEBUG_LINE_NO:17
    Self.SetStage(110) ; #DEBUG_LINE_NO:18
  ElseIf SelectedScene <= 6 ; #DEBUG_LINE_NO:19
    Self.SetStage(120) ; #DEBUG_LINE_NO:20
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(130) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:31
  oescript kmyQuest = __temp as oescript ; #DEBUG_LINE_NO:32
EndFunction
