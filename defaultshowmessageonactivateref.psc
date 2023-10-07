ScriptName DefaultShowMessageOnActivateRef Extends ObjectReference Const default
{ Show the selected message when this REFERENCE is activate. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  Message Property MessageToShow Auto Const mandatory
  { The message to show when I'm activated. }
EndGroup

Group Optional_Properties
  Quest Property QuestToSet Auto Const
  { The quest who's stage we will check to see if the message should show or not.
	ALSO, the quest we will set stages on if a specific button is checked. }
  Int Property Button0StageToSet Auto Const
  { Stage you want to set when Button 0 is clicked. }
  Int Property Button1StageToSet Auto Const
  { Stage you want to set when Button 1 is clicked. }
  Int Property Button2StageToSet Auto Const
  { Stage you want to set when Button 2 is clicked. }
  Int Property Button3StageToSet Auto Const
  { Stage you want to set when Button 3 is clicked. }
  Int Property MessageStage = -1 Auto Const
  { Stage that must be set for this script's functionality to execute (ie show MessageBox) }
  Bool Property ShowIfStageIsSet = False Auto Const
  { (Default: false) If true, will show message if stage is set. If false will show message until stage is set. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Int iButton = 0 ; #DEBUG_LINE_NO:40
  If MessageToShow ; #DEBUG_LINE_NO:42
    If QuestToSet as Bool && MessageStage > -1 ; #DEBUG_LINE_NO:43
      If QuestToSet.GetStageDone(MessageStage) && ShowIfStageIsSet ; #DEBUG_LINE_NO:46
        iButton = MessageToShow.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:48
      ElseIf !QuestToSet.GetStageDone(MessageStage) && !ShowIfStageIsSet ; #DEBUG_LINE_NO:50
        iButton = MessageToShow.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:52
      ElseIf QuestToSet.GetStageDone(MessageStage) && !ShowIfStageIsSet ; #DEBUG_LINE_NO:54
         ; #DEBUG_LINE_NO:
      ElseIf !QuestToSet.GetStageDone(MessageStage) && ShowIfStageIsSet ; #DEBUG_LINE_NO:57
         ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      iButton = MessageToShow.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:63
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If QuestToSet ; #DEBUG_LINE_NO:69
    If iButton == 0 ; #DEBUG_LINE_NO:70
      QuestToSet.SetStage(Button0StageToSet) ; #DEBUG_LINE_NO:72
    ElseIf iButton == 1 ; #DEBUG_LINE_NO:73
      QuestToSet.SetStage(Button1StageToSet) ; #DEBUG_LINE_NO:75
    ElseIf iButton == 2 ; #DEBUG_LINE_NO:76
      QuestToSet.SetStage(Button2StageToSet) ; #DEBUG_LINE_NO:78
    ElseIf iButton == 3 ; #DEBUG_LINE_NO:79
      QuestToSet.SetStage(Button3StageToSet) ; #DEBUG_LINE_NO:81
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
