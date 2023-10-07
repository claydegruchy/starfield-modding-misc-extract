ScriptName UC01_PowerboxRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property TargetDestructionState = 1 Auto Const
{ If the object has switched to this state, disable its linked ref }
Keyword Property UC01_LaserGrid_SecondaryToggle_Keyword Auto Const mandatory
{ Keyword for if this powerbox has a secondary toggle }
Bool Property ChainDisable = False Auto Const
{ If true, this object is attached to a chain of markers and should turn all of them off }
Int Property StageToSet = -1 Auto Const
{ Is there a stage to set on UC01 once this change has been triggered? }
Int Property ShutDownStage = 401 Auto Const
{ If this stage has been set, don't set the "StageToSet" when this blows }
Quest Property UC01 Auto Const mandatory
{ UC01 quest object }

;-- Functions ---------------------------------------

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  If aiCurrentStage == TargetDestructionState ; #DEBUG_LINE_NO:23
    If ChainDisable ; #DEBUG_LINE_NO:25
      ObjectReference currLink = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:26
      currLink.Disable(False) ; #DEBUG_LINE_NO:27
      currLink.DisableLinkChain(None, False) ; #DEBUG_LINE_NO:28
    Else ; #DEBUG_LINE_NO:
      Self.GetLinkedRef(None).Disable(False) ; #DEBUG_LINE_NO:30
      ObjectReference SecondaryLink = Self.GetLinkedRef(UC01_LaserGrid_SecondaryToggle_Keyword) ; #DEBUG_LINE_NO:32
      If SecondaryLink != None ; #DEBUG_LINE_NO:33
        SecondaryLink.Disable(False) ; #DEBUG_LINE_NO:34
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If StageToSet >= 0 && !UC01.GetStageDone(ShutDownStage) ; #DEBUG_LINE_NO:38
      UC01.SetStage(StageToSet) ; #DEBUG_LINE_NO:39
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:48
EndFunction
