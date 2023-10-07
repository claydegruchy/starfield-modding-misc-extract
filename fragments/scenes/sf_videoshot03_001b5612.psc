ScriptName Fragments:Scenes:SF_VideoShot03_001B5612 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property VideoDoor Auto Const
ReferenceAlias Property VideoActorRefAlias Auto Const
Armor Property Spacesuit_Constellation_Backpack Auto Const mandatory
Weapon Property Grendel Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  VideoDoor.GetRef().SetOpen(False) ; #DEBUG_LINE_NO:8
  VideoActorRefAlias.GetActorRef().EquipItem(Spacesuit_Constellation_Backpack as Form, False, False) ; #DEBUG_LINE_NO:10
  VideoActorRefAlias.GetActorRef().EquipItem(Grendel as Form, False, False) ; #DEBUG_LINE_NO:11
EndFunction
