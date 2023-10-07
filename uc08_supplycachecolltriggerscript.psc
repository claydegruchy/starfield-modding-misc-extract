ScriptName UC08_SupplyCacheCollTriggerScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property AccessCachesObjIndex = 335 Auto Const
{ Objective index for the "Access the supply caches" objective. We'll turn that off when the player has no
unexplored caches }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:8
    Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:9
    If Self.GetCount() <= 0 ; #DEBUG_LINE_NO:11
      Self.GetOwningQuest().SetObjectiveDisplayed(AccessCachesObjIndex, False, False) ; #DEBUG_LINE_NO:12
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
