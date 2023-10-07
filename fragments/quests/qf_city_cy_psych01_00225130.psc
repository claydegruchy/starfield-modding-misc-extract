ScriptName Fragments:Quests:QF_City_CY_Psych01_00225130 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AndresAnswers01 Auto Const mandatory
ReferenceAlias Property Alias_AndresAnswers02 Auto Const mandatory
ReferenceAlias Property Alias_AndresAnswers03 Auto Const mandatory
ReferenceAlias Property Alias_AndresAnswers04 Auto Const mandatory
ReferenceAlias Property Alias_HankAnswers Auto Const mandatory
ReferenceAlias Property Alias_LeonaAnswers Auto Const mandatory
ReferenceAlias Property Alias_SamundAnswers Auto Const mandatory
ReferenceAlias Property Alias_AndresQuestions Auto Const mandatory
ReferenceAlias Property Alias_HankQuestions Auto Const mandatory
ReferenceAlias Property Alias_LeonaQuestions Auto Const mandatory
ReferenceAlias Property Alias_SamundQuestions Auto Const mandatory
GlobalVariable Property City_CY_RedTape02Request01 Auto Const mandatory
Quest Property City_CY_RedTape03 Auto Const mandatory
conditionform Property City_CY_RedTape03_HankGoneConditionForm Auto Const mandatory
conditionform Property City_CY_Psych01_CheckStagesConditionForm Auto Const mandatory
conditionform Property City_CY_Psych01_CheckStagesNoHankConditionForm Auto Const mandatory
Quest Property City_CY_Psych01Misc Auto Const mandatory
Topic Property City_CY_Psych01_0201_Leona Auto Const mandatory
ReferenceAlias Property Alias_Andres Auto Const mandatory
ReferenceAlias Property Alias_Hank Auto Const mandatory
ReferenceAlias Property Alias_Leona Auto Const mandatory
ReferenceAlias Property Alias_Samund Auto Const mandatory
Float[] Property MarkerOffset Auto Const
ReferenceAlias Property Alias_SlateMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().MoveTo(Alias_Andres.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Game.GetPlayer().MoveTo(Alias_Hank.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().MoveTo(Alias_Leona.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0040_Item_00()
  Game.GetPlayer().MoveTo(Alias_Samund.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0100_Item_00()
  If City_CY_Psych01Misc.IsRunning() ; #DEBUG_LINE_NO:40
    City_CY_Psych01Misc.SetStage(1000) ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:44
  myPlayer.AddItem(Alias_AndresQuestions.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:45
  myPlayer.AddItem(Alias_LeonaQuestions.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:46
  myPlayer.AddItem(Alias_SamundQuestions.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:47
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:48
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:49
  Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:50
  If !City_CY_RedTape03_HankGoneConditionForm.IsTrue(None, None) ; #DEBUG_LINE_NO:53
    Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:54
    myPlayer.AddItem(Alias_HankQuestions.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:64
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:66
  Float myRequestValue = City_CY_RedTape02Request01.GetValue() ; #DEBUG_LINE_NO:67
  Bool myHankBool = City_CY_RedTape03_HankGoneConditionForm.IsTrue(None, None) ; #DEBUG_LINE_NO:68
  myPlayer.RemoveItem(Alias_AndresQuestions.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:70
  If myRequestValue == 0.0 && myHankBool == False ; #DEBUG_LINE_NO:72
    myPlayer.AddItem(Alias_AndresAnswers01.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:73
  ElseIf myRequestValue == 1.0 && myHankBool == False ; #DEBUG_LINE_NO:75
    myPlayer.AddItem(Alias_AndresAnswers02.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:76
  ElseIf myRequestValue == 0.0 && myHankBool == True ; #DEBUG_LINE_NO:78
    myPlayer.AddItem(Alias_AndresAnswers03.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:79
  ElseIf myRequestValue == 1.0 && myHankBool == True ; #DEBUG_LINE_NO:81
    myPlayer.AddItem(Alias_AndresAnswers04.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:82
  EndIf ; #DEBUG_LINE_NO:
  If myHankBool ; #DEBUG_LINE_NO:86
    If City_CY_Psych01_CheckStagesNoHankConditionForm.IsTrue(None, None) ; #DEBUG_LINE_NO:87
      Self.SetStage(200) ; #DEBUG_LINE_NO:88
    EndIf ; #DEBUG_LINE_NO:
  ElseIf City_CY_Psych01_CheckStagesConditionForm.IsTrue(None, None) ; #DEBUG_LINE_NO:91
    Self.SetStage(200) ; #DEBUG_LINE_NO:92
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:102
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:104
  myPlayer.RemoveItem(Alias_HankQuestions.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:105
  myPlayer.AddItem(Alias_HankAnswers.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:106
  If City_CY_Psych01_CheckStagesConditionForm.IsTrue(None, None) ; #DEBUG_LINE_NO:109
    Self.SetStage(200) ; #DEBUG_LINE_NO:110
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0121_Item_00()
  Self.SetObjectiveDisplayed(120, False, False) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:127
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:129
  myPlayer.RemoveItem(Alias_LeonaQuestions.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:130
  myPlayer.AddItem(Alias_LeonaAnswers.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:131
  If City_CY_RedTape03_HankGoneConditionForm.IsTrue(None, None) ; #DEBUG_LINE_NO:134
    If City_CY_Psych01_CheckStagesNoHankConditionForm.IsTrue(None, None) ; #DEBUG_LINE_NO:135
      Self.SetStage(200) ; #DEBUG_LINE_NO:136
    EndIf ; #DEBUG_LINE_NO:
  ElseIf City_CY_Psych01_CheckStagesConditionForm.IsTrue(None, None) ; #DEBUG_LINE_NO:139
    Self.SetStage(200) ; #DEBUG_LINE_NO:140
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:150
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:152
  myPlayer.RemoveItem(Alias_SamundQuestions.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:153
  myPlayer.AddItem(Alias_SamundAnswers.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:154
  If City_CY_RedTape03_HankGoneConditionForm.IsTrue(None, None) ; #DEBUG_LINE_NO:157
    If City_CY_Psych01_CheckStagesNoHankConditionForm.IsTrue(None, None) ; #DEBUG_LINE_NO:158
      Self.SetStage(200) ; #DEBUG_LINE_NO:159
    EndIf ; #DEBUG_LINE_NO:
  ElseIf City_CY_Psych01_CheckStagesConditionForm.IsTrue(None, None) ; #DEBUG_LINE_NO:162
    Self.SetStage(200) ; #DEBUG_LINE_NO:163
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:173
EndFunction

Function Fragment_Stage_0201_Item_00()
  Alias_Leona.GetActorRef().Say(City_CY_Psych01_0201_Leona, None, False, None) ; #DEBUG_LINE_NO:181
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:189
  myPlayer.RemoveItem(Alias_HankQuestions.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:190
  myPlayer.RemoveItem(Alias_AndresAnswers01.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:192
  myPlayer.RemoveItem(Alias_AndresAnswers02.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:193
  myPlayer.RemoveItem(Alias_AndresAnswers03.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:194
  myPlayer.RemoveItem(Alias_AndresAnswers04.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:195
  myPlayer.RemoveItem(Alias_HankAnswers.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:196
  myPlayer.RemoveItem(Alias_LeonaAnswers.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:197
  myPlayer.RemoveItem(Alias_SamundAnswers.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:198
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:201
  Self.Stop() ; #DEBUG_LINE_NO:202
EndFunction
