ScriptName ENV_Hazard_InteractionActivator Extends ObjectReference Const

;-- Functions ---------------------------------------

Function PlaceObject(Form FormToSpawn, ObjectReference RefToSpawnNear)
  If RefToSpawnNear == None ; #DEBUG_LINE_NO:4
    RefToSpawnNear = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:5
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] childrenRefs = Self.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:10
  ObjectReference closestRef = Self.GetClosestFromRefArray(RefToSpawnNear, childrenRefs) ; #DEBUG_LINE_NO:12
  closestRef.PlaceAtMe(FormToSpawn, 1, False, False, True, None, None, False) ; #DEBUG_LINE_NO:14
  Self.Disable(False) ; #DEBUG_LINE_NO:17
EndFunction

ObjectReference Function GetClosestFromRefArray(ObjectReference SubjectRef, ObjectReference[] TargetsArray)
  ObjectReference closestRef = None ; #DEBUG_LINE_NO:22
  Float closestDistance = 0.0 ; #DEBUG_LINE_NO:24
  Int I = 0 ; #DEBUG_LINE_NO:26
  While I < TargetsArray.Length ; #DEBUG_LINE_NO:27
    ObjectReference currentTargetRef = TargetsArray[I] ; #DEBUG_LINE_NO:29
    If closestRef == None ; #DEBUG_LINE_NO:31
      closestRef = currentTargetRef ; #DEBUG_LINE_NO:32
      closestDistance = closestRef.GetDistance(SubjectRef) ; #DEBUG_LINE_NO:33
    ElseIf currentTargetRef.GetDistance(SubjectRef) < closestDistance ; #DEBUG_LINE_NO:34
      closestRef = currentTargetRef ; #DEBUG_LINE_NO:35
      closestDistance = closestRef.GetDistance(SubjectRef) ; #DEBUG_LINE_NO:36
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:39
  EndWhile ; #DEBUG_LINE_NO:
  Return closestRef ; #DEBUG_LINE_NO:42
EndFunction
