ScriptName UC01_PilotExamSeatScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC01 Auto Const mandatory
{ Property for the UC01 quest }
Int Property AccessStage = 410 Auto Const
{ Once the player has completed this stage in UC01, they can access this }
Quest Property UC01_ShipSimulatorHelperQuest Auto Const mandatory
{ Helper quest that handles getting the player into the sim }
Scene Property DialogueUCFaction_Recruitment_999_PilotSeat Auto Const mandatory
{ Scene to play if the player gets here early }

;-- Functions ---------------------------------------

Event OnLoad()
  If !UC01.GetStageDone(AccessStage) ; #DEBUG_LINE_NO:16
    Self.BlockActivation(True, True) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:22
    If UC01.GetStageDone(410) ; #DEBUG_LINE_NO:23
      Utility.Wait(0.5) ; #DEBUG_LINE_NO:24
      UC01_ShipSimulatorHelperQuest.Start() ; #DEBUG_LINE_NO:25
    ElseIf !DialogueUCFaction_Recruitment_999_PilotSeat.IsPlaying() ; #DEBUG_LINE_NO:27
      DialogueUCFaction_Recruitment_999_PilotSeat.Start() ; #DEBUG_LINE_NO:28
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
