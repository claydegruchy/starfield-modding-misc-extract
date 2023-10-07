ScriptName Fragments:TopicInfos:TIF_Staryard_Trident_Z_Fue_002E7CA5_1 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
FormList Property Staryard_Trident_Z_FuelingGreatness_DrinkList Auto Const
GlobalVariable Property VelocityRemoved Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(Staryard_Trident_Z_FuelingGreatness_DrinkList as Form) > 0 ; #DEBUG_LINE_NO:10
    VelocityRemoved.Mod(1.0) ; #DEBUG_LINE_NO:11
    Game.GetPlayer().RemoveItem(Staryard_Trident_Z_FuelingGreatness_DrinkList as Form, 1, False, None) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndFunction
