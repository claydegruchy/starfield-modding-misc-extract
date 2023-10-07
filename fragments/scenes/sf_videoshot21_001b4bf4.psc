ScriptName Fragments:Scenes:SF_VideoShot21_001B4BF4 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property VideoActorRefAlias Auto Const
ReferenceAlias Property VideoDoor Auto Const
Weapon Property Grendel Auto Const mandatory
Armor Property Spacesuit_Constellation_Backpack_01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  VideoDoor.GetRef().SetOpen(False) ; #DEBUG_LINE_NO:7
  VideoActorRefAlias.GetActorRef().RemoveItem(Spacesuit_Constellation_Backpack_01 as Form, 1, False, None) ; #DEBUG_LINE_NO:8
  VideoActorRefAlias.GetActorRef().RemoveItem(Grendel as Form, 1, False, None) ; #DEBUG_LINE_NO:9
EndFunction
