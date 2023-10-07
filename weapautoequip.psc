ScriptName WeapAutoEquip Extends ObjectReference

;-- Variables ---------------------------------------
Form WeaponToEquip

;-- Properties --------------------------------------
GlobalVariable Property WeaponHasAutoEquipped Auto Const
Int Property FavoriteSlot = -1 Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  WeaponToEquip = Self.GetBaseObject() ; #DEBUG_LINE_NO:11
EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  If akNewContainer == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:19
    If WeaponHasAutoEquipped.GetValue() == 0.0 ; #DEBUG_LINE_NO:20
      WeaponHasAutoEquipped.SetValue(1.0) ; #DEBUG_LINE_NO:22
      Game.GetPlayer().EquipItem(WeaponToEquip, False, False) ; #DEBUG_LINE_NO:25
      Game.GetPlayer().MarkItemAsFavorite(WeaponToEquip, FavoriteSlot) ; #DEBUG_LINE_NO:28
      Utility.wait(0.5) ; #DEBUG_LINE_NO:31
      Game.GetPlayer().DrawWeapon() ; #DEBUG_LINE_NO:32
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
