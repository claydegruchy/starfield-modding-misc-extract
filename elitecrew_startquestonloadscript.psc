ScriptName EliteCrew_StartQuestonLoadScript Extends Actor
{ Script to start Elite Crew quests on load }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property ECQuest Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnLoad()
    Self.goToState("Done") ; #DEBUG_LINE_NO:9
    ECQuest.Start() ; #DEBUG_LINE_NO:10
  EndEvent
EndState
