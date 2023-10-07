ScriptName UC06_VVRemoteActivate Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property VaeVictis Auto Const mandatory
{ Alias for Vae Victis NPC }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor PlayerAct = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  If akActionRef == PlayerAct as ObjectReference ; #DEBUG_LINE_NO:8
    VaeVictis.GetRef().Activate(PlayerAct as ObjectReference, False) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
