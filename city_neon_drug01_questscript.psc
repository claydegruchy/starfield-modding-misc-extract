ScriptName City_Neon_Drug01_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Drug01_NesharAlias Auto Const
ReferenceAlias Property Drug01_NeonJailDoor Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Drug01_NeonJailDoor as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:7
EndEvent

Event ReferenceAlias.OnActivate(ReferenceAlias source, ObjectReference akActivator)
  If source == Drug01_NeonJailDoor && (akActivator == Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:11
    Drug01_NesharAlias.GetActorRef().Activate(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UnregisterForExteriorDoorEvents()
  Self.UnregisterForRemoteEvent(Drug01_NeonJailDoor as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:17
EndFunction
