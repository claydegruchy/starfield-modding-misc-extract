ScriptName MS06_PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
FormList Property MS06_ResourceTypes Auto Const mandatory

;-- Functions ---------------------------------------

Function RegisterPlayerForResourceTracking()
  Self.AddInventoryEventFilter(MS06_ResourceTypes as Form) ; #DEBUG_LINE_NO:7
  Self.RunCheckResources() ; #DEBUG_LINE_NO:8
EndFunction

Function RunCheckResources()
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:14
  ms06_questscript myQIScript = myQuest as ms06_questscript ; #DEBUG_LINE_NO:15
  myQIScript.ResourceCheck() ; #DEBUG_LINE_NO:16
EndFunction

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:27
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Self.RunCheckResources() ; #DEBUG_LINE_NO:31
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  Self.RunCheckResources() ; #DEBUG_LINE_NO:35
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:39
  ms06_questscript myQIScript = myQuest as ms06_questscript ; #DEBUG_LINE_NO:40
  If auiStageID == myQIScript.GatherResourcesStage ; #DEBUG_LINE_NO:42
    Self.RegisterPlayerForResourceTracking() ; #DEBUG_LINE_NO:43
  ElseIf auiStageID == myQIScript.ResourcesCompletedStage ; #DEBUG_LINE_NO:44
    Self.RemoveInventoryEventFilter(MS06_ResourceTypes as Form) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndEvent
