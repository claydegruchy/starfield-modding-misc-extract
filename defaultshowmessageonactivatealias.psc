ScriptName DefaultShowMessageOnActivateAlias Extends ReferenceAlias Const default
{ Show the selected message when this ALIAS is activate. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  Message Property MessageToShow Auto Const mandatory
  { The message to show when I'm activated. }
EndGroup

Group Optional_Properties
  Int Property Button0StageToSet = -1 Auto Const
  { Stage you want to set when Button 0 is clicked. }
  Int Property Button1StageToSet = -1 Auto Const
  { Stage you want to set when Button 1 is clicked. }
  Int Property Button2StageToSet = -1 Auto Const
  { Stage you want to set when Button 2 is clicked. }
  Int Property Button3StageToSet = -1 Auto Const
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
  Int iButton = 0 ; #DEBUG_LINE_NO:37
  If MessageToShow ; #DEBUG_LINE_NO:39
    If MessageStage >= 0 ; #DEBUG_LINE_NO:40
      If Self.GetOwningQuest().GetStageDone(MessageStage) && ShowIfStageIsSet ; #DEBUG_LINE_NO:42
        iButton = MessageToShow.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:44
      ElseIf !Self.GetOwningQuest().GetStageDone(MessageStage) && !ShowIfStageIsSet ; #DEBUG_LINE_NO:47
        iButton = MessageToShow.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:49
      ElseIf Self.GetOwningQuest().GetStageDone(MessageStage) && !ShowIfStageIsSet ; #DEBUG_LINE_NO:52
         ; #DEBUG_LINE_NO:
      ElseIf !Self.GetOwningQuest().GetStageDone(MessageStage) && ShowIfStageIsSet ; #DEBUG_LINE_NO:56
         ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      iButton = MessageToShow.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:62
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If iButton == 0 ; #DEBUG_LINE_NO:68
    If Button0StageToSet > -1 ; #DEBUG_LINE_NO:70
      Self.GetOwningQuest().SetStage(Button0StageToSet) ; #DEBUG_LINE_NO:71
    EndIf ; #DEBUG_LINE_NO:
  ElseIf iButton == 1 ; #DEBUG_LINE_NO:73
    If Button1StageToSet > -1 ; #DEBUG_LINE_NO:75
      Self.GetOwningQuest().SetStage(Button1StageToSet) ; #DEBUG_LINE_NO:76
    EndIf ; #DEBUG_LINE_NO:
  ElseIf iButton == 2 ; #DEBUG_LINE_NO:78
    If Button2StageToSet > -1 ; #DEBUG_LINE_NO:80
      Self.GetOwningQuest().SetStage(Button2StageToSet) ; #DEBUG_LINE_NO:81
    EndIf ; #DEBUG_LINE_NO:
  ElseIf iButton == 3 ; #DEBUG_LINE_NO:83
    If Button3StageToSet > -1 ; #DEBUG_LINE_NO:85
      Self.GetOwningQuest().SetStage(Button3StageToSet) ; #DEBUG_LINE_NO:86
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
