ScriptName Fragments:Scenes:SF_VideoShot10_001B4BFA Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property VideoDoor Auto Const
ReferenceAlias Property VideoActorRefAlias Auto Const
Armor Property Spacesuit_Constellation_Backpack Auto Const mandatory
Weapon Property Grendel Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  VideoDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:7
  VideoActorRefAlias.GetActorRef().UnEquipItem(Spacesuit_Constellation_Backpack as Form, False, False) ; #DEBUG_LINE_NO:8
  VideoActorRefAlias.GetActorRef().RemoveItem(Spacesuit_Constellation_Backpack as Form, 999, False, None) ; #DEBUG_LINE_NO:9
  VideoActorRefAlias.GetActorRef().RemoveItem(Grendel as Form, 999, False, None) ; #DEBUG_LINE_NO:10
EndFunction
