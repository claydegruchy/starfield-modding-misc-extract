ScriptName UCR04_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard CountGuard

;-- Properties --------------------------------------
Int Property NumSamplesRequired Auto
{ Local var set from the quest script so we know how many samples we need to collect this round }
GlobalVariable Property UCR04_SamplesHarvested Auto Const mandatory
{ Global var used to track the number of samples the player's collected }
Int Property AllSamplesCollectedStage = 500 Auto Const
{ Stage to set once the player's collected sufficent samples }
MiscObject Property UCR04_SpecimenSample Auto Const mandatory
{ Misc object we're watching the player collect }
Int Property SampleCollectionObj = 100 Auto Const
{ Objective index for the primary quest objective }

;-- Functions ---------------------------------------

Function ReadyPlayerAliasScript(Int iSamplesRequired)
  NumSamplesRequired = iSamplesRequired ; #DEBUG_LINE_NO:22
  Self.AddInventoryEventFilter(UCR04_SpecimenSample as Form) ; #DEBUG_LINE_NO:23
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == UCR04_SpecimenSample as Form ; #DEBUG_LINE_NO:29
    Self.ProcessNewSample() ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ProcessNewSample()
  Guard CountGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:35
    Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:36
    If OQ.ModObjectiveGlobal(1.0, UCR04_SamplesHarvested, SampleCollectionObj, NumSamplesRequired as Float, True, True, True, False) ; #DEBUG_LINE_NO:39
      Self.RemoveAllInventoryEventFilters() ; #DEBUG_LINE_NO:40
      OQ.SetStage(AllSamplesCollectedStage) ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:50
EndFunction
