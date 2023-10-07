ScriptName MQ204VladimirScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property MQ204VladimirInjuredMarker Auto Const mandatory
Keyword Property AnimFlavorWounded Auto Const mandatory

;-- Functions ---------------------------------------

Event OnGetUp(ObjectReference akFurniture)
  If akFurniture == MQ204VladimirInjuredMarker ; #DEBUG_LINE_NO:7
    Self.GetActorRef().ChangeAnimFlavor(AnimFlavorWounded) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
