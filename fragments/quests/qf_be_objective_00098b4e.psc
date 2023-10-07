ScriptName Fragments:Quests:QF_BE_Objective_00098B4E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property BEObjective_OnceOnly_Global Auto Const mandatory
GlobalVariable Property BEObjective_OnceOnly_DoneGlobal Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
ActorValue Property BE_SpaceshipTakenOver Auto Const mandatory
ReferenceAlias Property Alias_enemyShip Auto Const mandatory
Message Property Tutorial_NewHomeShip Auto Const mandatory
Quest Property MQ_TutorialQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0025_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:18
  Self.SetObjectiveDisplayedAtTop(20) ; #DEBUG_LINE_NO:21
  defaultcounteraliascolincondeatha allCrewCol = Alias_AllCrew as defaultcounteraliascolincondeatha ; #DEBUG_LINE_NO:24
  If allCrewCol.GetCount() <= allCrewCol.TargetRemainingCount ; #DEBUG_LINE_NO:25
    Self.SetStage(25) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:46
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:49
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ_TutorialQuest.SetStage(300) ; #DEBUG_LINE_NO:63
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:66
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:67
  Self.SetObjectiveSkipped(40) ; #DEBUG_LINE_NO:68
  Self.CompleteQuest() ; #DEBUG_LINE_NO:69
  Self.Stop() ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0255_Item_00()
  Self.SetObjectiveSkipped(20) ; #DEBUG_LINE_NO:83
  Self.SetObjectiveSkipped(30) ; #DEBUG_LINE_NO:84
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:85
  Self.CompleteQuest() ; #DEBUG_LINE_NO:86
  Self.Stop() ; #DEBUG_LINE_NO:89
EndFunction
