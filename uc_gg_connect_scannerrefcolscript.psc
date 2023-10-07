ScriptName UC_GG_Connect_ScannerRefColScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property UC_GG_Connect_ActiveScanner_Unscanned_Keyword Auto Const mandatory
{ Check to see if this scanner is one of the ones that the courier failed to hit on his earlier trip }
Keyword Property UC_GG_Connect_ActiveScanner_Objective_Keyword Auto Const mandatory
{ Used to check if this scanner is still in the ref collection that grants the objectives }
Topic Property UC_GG_CheckIn_Scanned Auto Const mandatory
{ Topic to fire if this is one of the scanners the player or courier have not yet hit }
Topic Property UC_GG_CheckIn_Unscanned Auto Const mandatory
{ Topic to fire if this is one of the scanners the player or courier have hit already }
RefCollectionAlias Property UnvisitedScanPoints Auto Const mandatory
{ Ref collection containing the scan points that the courier never reached before their murder }
RefCollectionAlias Property ScanTargetsObjectives Auto Const mandatory
{ Ref collection containing the scan points that the courier never reached before their murder }
GlobalVariable Property UC_GG_Connect_StopsCompleted Auto Const mandatory
{ Global used to track how many triggers the player's entered }
Int Property ObjectiveIndex = 200 Auto Const
{ Objective index we're modifying as each one of these scanners is updated }
Int Property PrereqStage = 200 Auto Const
{ Only start allowing activation once this stage is set }
Int Property ShutdownStage = 350 Auto Const
{ Once this stage is set, we can stop checking (because the player's already found the right one) }

;-- Functions ---------------------------------------

Function BlockScannerState(Bool bEnable)
  Int I = 0 ; #DEBUG_LINE_NO:34
  Int iCount = Self.GetCount() ; #DEBUG_LINE_NO:35
  ObjectReference currRef = None ; #DEBUG_LINE_NO:36
  While I < iCount ; #DEBUG_LINE_NO:38
    currRef = Self.GetAt(I) ; #DEBUG_LINE_NO:39
    currRef.BlockActivation(bEnable, bEnable) ; #DEBUG_LINE_NO:40
    I += 1 ; #DEBUG_LINE_NO:42
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:47
    Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:48
    If OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:50
      If akSenderRef.HasKeyword(UC_GG_Connect_ActiveScanner_Objective_Keyword) ; #DEBUG_LINE_NO:52
        Int iObjIndex = ScanTargetsObjectives.Find(akSenderRef) ; #DEBUG_LINE_NO:53
        ObjectReference currObjScan = ScanTargetsObjectives.GetAt(iObjIndex) ; #DEBUG_LINE_NO:54
        If currObjScan != None ; #DEBUG_LINE_NO:56
          ScanTargetsObjectives.RemoveRef(currObjScan) ; #DEBUG_LINE_NO:57
          OQ.ModObjectiveGlobal(1.0, UC_GG_Connect_StopsCompleted, ObjectiveIndex, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:58
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If akSenderRef.HasKeyword(UC_GG_Connect_ActiveScanner_Unscanned_Keyword) ; #DEBUG_LINE_NO:63
      Int iScanIndex = UnvisitedScanPoints.Find(akSenderRef) ; #DEBUG_LINE_NO:64
      ObjectReference currScan = UnvisitedScanPoints.GetAt(iScanIndex) ; #DEBUG_LINE_NO:65
      If currScan != None ; #DEBUG_LINE_NO:67
        UnvisitedScanPoints.RemoveRef(currScan) ; #DEBUG_LINE_NO:68
      EndIf ; #DEBUG_LINE_NO:
      akSenderRef.Say(UC_GG_CheckIn_Unscanned, None, False, None) ; #DEBUG_LINE_NO:71
    Else ; #DEBUG_LINE_NO:
      akSenderRef.Say(UC_GG_CheckIn_Scanned, None, False, None) ; #DEBUG_LINE_NO:73
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
