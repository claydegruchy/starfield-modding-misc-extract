ScriptName setOutfitForRefAlias Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Outfit Property OutfitToEquip Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.getActorReference().setOutfit(OutfitToEquip, False) ; #DEBUG_LINE_NO:6
EndEvent
