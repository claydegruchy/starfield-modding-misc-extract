ScriptName Fragments:TopicInfos:TIF_SE_Player_BB02_002D6B80 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property InorgCommonHelium3 Auto Const
ReferenceAlias Property Alias_playerShip Auto Const
Potion Property ShipRepairKit Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().RemoveItem(ShipRepairKit as Form, 2, False, None) ; #DEBUG_LINE_NO:8
EndFunction
