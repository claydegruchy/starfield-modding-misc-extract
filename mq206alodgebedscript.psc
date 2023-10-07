ScriptName MQ206ALodgeBedScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MessageToShow Auto Const mandatory
Int Property Button1StageToSet = 17 Auto Const
Int Property PrereqStageDone = 15 Auto Const
Int Property TurnOffStageDone = 20 Auto Const
Int Property TurnOffStageDone02 = 30 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:15
    Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:16
    If myQuest.GetStageDone(PrereqStageDone) && myQuest.GetStageDone(TurnOffStageDone) == False && myQuest.GetStageDone(TurnOffStageDone02) == False ; #DEBUG_LINE_NO:17
      Int iButton = MessageToShow.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:18
      If iButton == 1 ; #DEBUG_LINE_NO:19
        myQuest.SetStage(Button1StageToSet) ; #DEBUG_LINE_NO:20
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
