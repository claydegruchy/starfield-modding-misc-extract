ScriptName AddItemFavorite Extends ObjectReference

;-- Variables ---------------------------------------
Form ItemToFavorite

;-- Properties --------------------------------------
Int Property FavoriteSlot = -1 Auto Const
GlobalVariable Property ItemHasFavorited Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  ItemToFavorite = Self.GetBaseObject() ; #DEBUG_LINE_NO:8
EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  If akNewContainer == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:13
    Game.GetPlayer().MarkItemAsFavorite(ItemToFavorite, FavoriteSlot) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent
