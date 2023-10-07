ScriptName SetStageOnPowered Extends ObjectReference Const
{ Set a quest stage when all linked elements are powered. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property myQuest Auto Const mandatory
Int Property questStage Auto Const mandatory
Int Property prereqQuestStage = -1 Auto Const
Keyword Property LinkToPoweredReferences Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad()
  ObjectReference[] refsLinkedToMe = Self.GetRefsLinkedToMe(LinkToPoweredReferences, None) ; #DEBUG_LINE_NO:10
  Int I = 0 ; #DEBUG_LINE_NO:11
  While I < refsLinkedToMe.Length ; #DEBUG_LINE_NO:12
    Self.RegisterForRemoteEvent(refsLinkedToMe[I] as ScriptObject, "OnPowerOn") ; #DEBUG_LINE_NO:13
    I += 1 ; #DEBUG_LINE_NO:14
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnPowerOn(ObjectReference akSender, ObjectReference akPowerGenerator)
  Bool allPowered = True ; #DEBUG_LINE_NO:20
  Int I = 0 ; #DEBUG_LINE_NO:21
  ObjectReference[] refsLinkedToMe = Self.GetRefsLinkedToMe(LinkToPoweredReferences, None) ; #DEBUG_LINE_NO:22
  While I < refsLinkedToMe.Length ; #DEBUG_LINE_NO:23
    If refsLinkedToMe[I] ; #DEBUG_LINE_NO:24
      If refsLinkedToMe[I].IsPowered() == False ; #DEBUG_LINE_NO:25
        allPowered = False ; #DEBUG_LINE_NO:27
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:32
  EndWhile ; #DEBUG_LINE_NO:
  If allPowered == True ; #DEBUG_LINE_NO:34
    If prereqQuestStage == -1 || myQuest.GetStageDone(prereqQuestStage) ; #DEBUG_LINE_NO:35
      myQuest.SetStage(questStage) ; #DEBUG_LINE_NO:36
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.UnregisterForAllEvents() ; #DEBUG_LINE_NO:43
EndEvent
