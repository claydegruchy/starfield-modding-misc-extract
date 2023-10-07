ScriptName UC07_HeatleechCollAliasScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property DMP_AmbushMarker Auto Const mandatory
{ Keyword linking the leeches to their furnitures }
Int Property ShutdownStage = 440 Auto Const
{ Once this stage has been set, don't worry about this anymore }

;-- Functions ---------------------------------------

Event OnLoad(ObjectReference akSenderRef)
  Actor currACT = akSenderRef as Actor ; #DEBUG_LINE_NO:10
  If (!Self.GetOwningQuest().GetStageDone(ShutdownStage) && currACT as Bool) && currACT.IsEnabled() && !currACT.IsDead() ; #DEBUG_LINE_NO:13
    ObjectReference currFurn = currACT.GetLinkedRef(DMP_AmbushMarker) ; #DEBUG_LINE_NO:14
    currACT.SnapintoInteraction(currFurn) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:24
EndFunction
