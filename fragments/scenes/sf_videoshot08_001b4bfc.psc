ScriptName Fragments:Scenes:SF_VideoShot08_001B4BFC Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property VideoDoor Auto Const
ReferenceAlias Property VideoActorRefAlias Auto Const
Armor Property Spacesuit_Constellation_Backpack Auto Const mandatory
Weapon Property Grendel Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  VideoActorRefAlias.GetActorRef().EquipItem(Spacesuit_Constellation_Backpack as Form, False, False) ; #DEBUG_LINE_NO:7
  VideoActorRefAlias.GetActorRef().RemoveItem(Grendel as Form, 1, False, None) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Phase_01_End()
  VideoDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:17
EndFunction
