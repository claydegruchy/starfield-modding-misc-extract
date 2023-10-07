ScriptName TestE3VideoQuestScript Extends Quest

;-- Variables ---------------------------------------
ObjectReference custom05Ref

;-- Properties --------------------------------------
ObjectReference Property TestE3Custom05MarkerRef Auto Const mandatory

;-- Functions ---------------------------------------

Function SpawnCustom05(ActorBase actorToSpawn)
  If custom05Ref != None ; #DEBUG_LINE_NO:7
    custom05Ref.Disable(False) ; #DEBUG_LINE_NO:8
    custom05Ref.Delete() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
  custom05Ref = TestE3Custom05MarkerRef.PlaceActorAtMe(actorToSpawn, 4, None, False, True, True, None, True) as ObjectReference ; #DEBUG_LINE_NO:11
  custom05Ref.SetLinkedRef(TestE3Custom05MarkerRef, None, True) ; #DEBUG_LINE_NO:12
  custom05Ref.SetValue(Game.GetAggressionAV(), 0.0) ; #DEBUG_LINE_NO:13
  custom05Ref.Enable(False) ; #DEBUG_LINE_NO:14
EndFunction
