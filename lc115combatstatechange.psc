ScriptName LC115CombatStateChange Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group QuestStages_Properties
  Int Property iLC115Hostile = 10 Auto Const
  Int Property iLC115Shutdown = 1000 Auto Const
  Int Property iRI05FindImogene = 600 Auto Const
  Int Property iRI05TalkToDalton = 1200 Auto Const
EndGroup

Quest Property RI05 Auto Const mandatory
GlobalVariable Property RI05_LC115PreviouslyExplored Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad(ObjectReference akSenderRef)
  Self.RegisterForRemoteEvent(Self as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:14
EndEvent

Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState > 0 ; #DEBUG_LINE_NO:18
    If RI05.GetStageDone(iRI05FindImogene) && !RI05.GetStageDone(iRI05TalkToDalton) ; #DEBUG_LINE_NO:19
      Self.GetOwningQuest().SetStage(iLC115Hostile) ; #DEBUG_LINE_NO:20
    Else ; #DEBUG_LINE_NO:
      RI05_LC115PreviouslyExplored.SetValue(1.0) ; #DEBUG_LINE_NO:22
      Self.GetOwningQuest().SetStage(iLC115Shutdown) ; #DEBUG_LINE_NO:23
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
