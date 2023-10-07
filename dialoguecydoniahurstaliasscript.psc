ScriptName DialogueCydoniaHurstAliasScript Extends ReferenceAlias
{ Used when the player has turned in evidence against Hurst to make him disable the next time they leave }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StagePrereq = 510 Auto Const
Int Property RedTapeStagePrereq = 900 Auto Const
Quest Property City_CY_RedTape02 Auto Const mandatory
GlobalVariable Property CY_HurstGone Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.GetOwningQuest().GetStageDone(StagePrereq) && City_CY_RedTape02.GetStageDone(RedTapeStagePrereq) ; #DEBUG_LINE_NO:10
    Self.GetRef().Disable(False) ; #DEBUG_LINE_NO:11
    CY_HurstGone.SetValue(1.0) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent
