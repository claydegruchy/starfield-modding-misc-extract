ScriptName CF07_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property TalkToCompanion = 450 Auto Const
ReferenceAlias Property Companion Auto Const mandatory
GlobalVariable Property CF_SysDefShutdown Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Companion as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:9
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  If Self.GetStageDone(500) == True ; #DEBUG_LINE_NO:15
    If CF_SysDefShutdown.GetValue() == 0.0 ; #DEBUG_LINE_NO:16
      If akSender == Companion && Self.IsObjectiveCompleted(TalkToCompanion) == False ; #DEBUG_LINE_NO:17
        If Companion.GetReference() == None ; #DEBUG_LINE_NO:18
          Self.SetObjectiveDisplayed(TalkToCompanion, False, False) ; #DEBUG_LINE_NO:19
        Else ; #DEBUG_LINE_NO:
          Self.SetObjectiveDisplayed(TalkToCompanion, True, False) ; #DEBUG_LINE_NO:21
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
