ScriptName Alias Extends ScriptObject Native hidden

;-- Functions ---------------------------------------

Quest Function GetOwningQuest() Native

Event OnAliasInit()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAliasReset()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAliasShutdown()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAliasStarted()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function RefillAlias() Native

Function RefillDependentAliases() Native

Function StartObjectProfiling() Native

Function StopObjectProfiling() Native

Bool Function IsFilled()
  If Self is ReferenceAlias ; #DEBUG_LINE_NO:42
    Return (Self as ReferenceAlias).GetReference() != None ; #DEBUG_LINE_NO:43
  ElseIf Self is RefCollectionAlias ; #DEBUG_LINE_NO:44
    Return (Self as RefCollectionAlias).GetCount() > 0 ; #DEBUG_LINE_NO:45
  ElseIf Self is LocationAlias ; #DEBUG_LINE_NO:46
    Return (Self as LocationAlias).GetLocation() != None ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:50
EndFunction

Bool Function IsSameType(Alias AliasToCheck)
  If Self is ReferenceAlias ; #DEBUG_LINE_NO:57
    Return AliasToCheck is ReferenceAlias ; #DEBUG_LINE_NO:58
  ElseIf Self is RefCollectionAlias ; #DEBUG_LINE_NO:59
    Return AliasToCheck is RefCollectionAlias ; #DEBUG_LINE_NO:60
  ElseIf Self is LocationAlias ; #DEBUG_LINE_NO:61
    Return AliasToCheck is LocationAlias ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:65
EndFunction

Bool Function CopyIntoAlias(Alias TargetAlias, Bool SkipIfEmpty, Bool CopyOver)
  If Self.IsSameType(TargetAlias) ; #DEBUG_LINE_NO:75
    If SkipIfEmpty == False || Self.IsFilled() ; #DEBUG_LINE_NO:76
      If CopyOver || TargetAlias.IsFilled() == False ; #DEBUG_LINE_NO:77
        ReferenceAlias targetReferenceAlias = TargetAlias as ReferenceAlias ; #DEBUG_LINE_NO:79
        If targetReferenceAlias ; #DEBUG_LINE_NO:80
          targetReferenceAlias.ForceRefTo((Self as ReferenceAlias).GetReference()) ; #DEBUG_LINE_NO:81
          Return True ; #DEBUG_LINE_NO:82
        EndIf ; #DEBUG_LINE_NO:
        RefCollectionAlias targetRefCollectionAlias = TargetAlias as RefCollectionAlias ; #DEBUG_LINE_NO:85
        If targetRefCollectionAlias ; #DEBUG_LINE_NO:86
          targetRefCollectionAlias.RemoveAll() ; #DEBUG_LINE_NO:87
          targetRefCollectionAlias.AddRefCollection(Self as RefCollectionAlias) ; #DEBUG_LINE_NO:88
          Return True ; #DEBUG_LINE_NO:89
        EndIf ; #DEBUG_LINE_NO:
        LocationAlias targetLocationAlias = TargetAlias as LocationAlias ; #DEBUG_LINE_NO:92
        If targetLocationAlias ; #DEBUG_LINE_NO:93
          targetLocationAlias.ForceLocationTo((Self as LocationAlias).GetLocation()) ; #DEBUG_LINE_NO:94
          Return True ; #DEBUG_LINE_NO:95
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:102
EndFunction
