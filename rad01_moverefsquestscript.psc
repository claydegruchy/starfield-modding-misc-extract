ScriptName Rad01_MoveRefsQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct EnableStateDatum
  ReferenceAlias AliasToSetEnableState
  Bool ShouldBeEnabled
EndStruct

Struct ForceAliasDatum
  Alias SourceAlias
  Alias TargetAlias
EndStruct

Struct MoveToDatum
  ReferenceAlias AliasToMove
  ReferenceAlias AliasToMoveTo
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
rad01_moverefsquestscript:forcealiasdatum[] Property ForceAliasData Auto Const mandatory
rad01_moverefsquestscript:movetodatum[] Property MoveToData Auto Const mandatory
rad01_moverefsquestscript:enablestatedatum[] Property EnableStateData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.ForceAliases() ; #DEBUG_LINE_NO:26
  Self.MoveAliases() ; #DEBUG_LINE_NO:27
  Self.EnableDisableAliases() ; #DEBUG_LINE_NO:28
EndEvent

Function ForceAliases()
  Int I = 0 ; #DEBUG_LINE_NO:36
  While I < ForceAliasData.Length ; #DEBUG_LINE_NO:37
    rad01_moverefsquestscript:forcealiasdatum currentDatum = ForceAliasData[I] ; #DEBUG_LINE_NO:38
    Bool copied = currentDatum.SourceAlias.CopyIntoAlias(currentDatum.TargetAlias, True, True) ; #DEBUG_LINE_NO:41
    If copied == False ; #DEBUG_LINE_NO:42
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:46
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function MoveAliases()
  Int I = 0 ; #DEBUG_LINE_NO:52
  I = 0 ; #DEBUG_LINE_NO:53
  While I < MoveToData.Length ; #DEBUG_LINE_NO:54
    rad01_moverefsquestscript:movetodatum currentDatum = MoveToData[I] ; #DEBUG_LINE_NO:55
    ObjectReference refToMove = currentDatum.AliasToMove.GetReference() ; #DEBUG_LINE_NO:58
    ObjectReference refToMoveTo = currentDatum.AliasToMoveTo.GetReference() ; #DEBUG_LINE_NO:59
    If refToMove as Bool && refToMoveTo as Bool ; #DEBUG_LINE_NO:61
      refToMove.MoveTo(refToMoveTo, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:62
    EndIf ; #DEBUG_LINE_NO:
    Actor ActorToMove = refToMove as Actor ; #DEBUG_LINE_NO:68
    If ActorToMove ; #DEBUG_LINE_NO:69
      If refToMoveTo.GetBaseObject() is Furniture ; #DEBUG_LINE_NO:70
        ActorToMove.SnapIntoInteraction(refToMoveTo) ; #DEBUG_LINE_NO:71
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:75
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function EnableDisableAliases()
  Int I = 0 ; #DEBUG_LINE_NO:81
  While I < EnableStateData.Length ; #DEBUG_LINE_NO:82
    rad01_moverefsquestscript:enablestatedatum currentDatum = EnableStateData[I] ; #DEBUG_LINE_NO:83
    If currentDatum.ShouldBeEnabled ; #DEBUG_LINE_NO:86
      currentDatum.AliasToSetEnableState.TryToEnableNoWait() ; #DEBUG_LINE_NO:87
    Else ; #DEBUG_LINE_NO:
      currentDatum.AliasToSetEnableState.TryToDisableNoWait() ; #DEBUG_LINE_NO:89
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:91
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:99
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:103
EndFunction
