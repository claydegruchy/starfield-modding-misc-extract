ScriptName DebugLocationMarkupMainSwitchScript Extends ObjectReference

;-- Variables ---------------------------------------
String ThisButtonsName = "Start All Quests"

;-- Properties --------------------------------------
FormList Property FormlistOfQuestsToStart Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Int numQuestsFailedToStart = 0 ; #DEBUG_LINE_NO:7
  Int formlistCount = 0 ; #DEBUG_LINE_NO:8
  Int formlistSize = FormlistOfQuestsToStart.GetSize() ; #DEBUG_LINE_NO:9
  While formlistCount < formlistSize ; #DEBUG_LINE_NO:10
    Quest currentQuest = FormlistOfQuestsToStart.GetAt(formlistCount) as Quest ; #DEBUG_LINE_NO:11
    If !(FormlistOfQuestsToStart.GetAt(formlistCount) as Quest).Start() ; #DEBUG_LINE_NO:12
      numQuestsFailedToStart += 1 ; #DEBUG_LINE_NO:13
    EndIf ; #DEBUG_LINE_NO:
    formlistCount += 1 ; #DEBUG_LINE_NO:15
  EndWhile ; #DEBUG_LINE_NO:
  If numQuestsFailedToStart < 1 ; #DEBUG_LINE_NO:18
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
