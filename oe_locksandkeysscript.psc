ScriptName OE_LocksAndKeysScript Extends Quest

;-- Structs -----------------------------------------
Struct LockedObjectDatum
  ReferenceAlias LockedObjectAlias
  { the ReferenceAlias with the container or terminal that should be locked and needs a key/password }
  RefCollectionAlias PossibleKeySpawnMarkersAlias
  { Ref Collection holding all the possible Spawn Markers (we will need to test if they are LinkedRef after the quest starts and everything is persisting) }
  ReferenceAlias KeySpawnMarkerAlias
  { the ReferenceAlias with the marker where the key/password should be placed (will pick one of the refs in PossibleKeySpawnMarkersAlias that is linked Ref to the LockedObjectAlias ref) }
  ReferenceAlias KeyAlias
  { the ReferenceAlias that will have the created key/password forced into it }
  Bool EnableIfPlaceKeyFails = True
  { if true (default), even if we can't place the key, still enable LockedObjectAlias. }
  Bool LockIfPlaceKeyFails = True
  { if true (default), even if we can't place the key, still lock LockedObjectAlias. }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
oe_locksandkeysscript:lockedobjectdatum[] Property LockedObjectData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Int I = 0 ; #DEBUG_LINE_NO:29
  While I < LockedObjectData.Length ; #DEBUG_LINE_NO:30
    oe_locksandkeysscript:lockedobjectdatum currentLockedObjectDatum = LockedObjectData[I] ; #DEBUG_LINE_NO:31
    ObjectReference lockedRef = currentLockedObjectDatum.LockedObjectAlias.GetReference() ; #DEBUG_LINE_NO:33
    ReferenceAlias KeyAlias = currentLockedObjectDatum.KeyAlias ; #DEBUG_LINE_NO:34
    ObjectReference spawnMarkerRef = None ; #DEBUG_LINE_NO:36
    ObjectReference[] possibleKeySpawnMarkerRefs = currentLockedObjectDatum.PossibleKeySpawnMarkersAlias.GetArray() ; #DEBUG_LINE_NO:37
    Int j = 0 ; #DEBUG_LINE_NO:39
    While spawnMarkerRef == None && j < possibleKeySpawnMarkerRefs.Length ; #DEBUG_LINE_NO:40
      ObjectReference currentRef = possibleKeySpawnMarkerRefs[j] ; #DEBUG_LINE_NO:41
      If currentRef.GetLinkedRef(None) == lockedRef ; #DEBUG_LINE_NO:43
        spawnMarkerRef = currentRef ; #DEBUG_LINE_NO:44
      EndIf ; #DEBUG_LINE_NO:
      j += 1 ; #DEBUG_LINE_NO:47
    EndWhile ; #DEBUG_LINE_NO:
    If spawnMarkerRef == None ; #DEBUG_LINE_NO:50
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    ObjectReference keyRef = None ; #DEBUG_LINE_NO:58
    If (lockedRef as Bool && spawnMarkerRef as Bool) && KeyAlias as Bool ; #DEBUG_LINE_NO:60
      currentLockedObjectDatum.KeySpawnMarkerAlias.ForceRefTo(spawnMarkerRef) ; #DEBUG_LINE_NO:61
      keyRef = spawnMarkerRef.PlaceLockedRefKeyAtMe(lockedRef, 1, False, False, True) ; #DEBUG_LINE_NO:62
      KeyAlias.ForceRefTo(keyRef) ; #DEBUG_LINE_NO:66
    EndIf ; #DEBUG_LINE_NO:
    If keyRef as Bool || currentLockedObjectDatum.EnableIfPlaceKeyFails ; #DEBUG_LINE_NO:69
      lockedRef.Enable(False) ; #DEBUG_LINE_NO:70
    EndIf ; #DEBUG_LINE_NO:
    If keyRef as Bool || currentLockedObjectDatum.LockIfPlaceKeyFails ; #DEBUG_LINE_NO:73
      lockedRef.Lock(True, False, True) ; #DEBUG_LINE_NO:74
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:77
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Function DebugMoveToKey(Int keyIndex)
  Game.GetPlayer().MoveTo(LockedObjectData[keyIndex].KeyAlias.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:82
EndFunction

Function DebugMoveToLockedObject(Int objectIndex)
  Game.GetPlayer().MoveTo(LockedObjectData[objectIndex].LockedObjectAlias.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:86
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:94
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:98
EndFunction
