ScriptName Fragments:TopicInfos:TIF_City_NewAtlantis_Z_GemJe_000C557F Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_George Auto Const
ReferenceAlias Property Alias_Plate Auto Const
ReferenceAlias Property Alias_Gem Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Alias_George.GetActorRef().RemoveItem(Alias_Gem.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:10
  Game.GetPlayer().RemoveItem(Alias_Plate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:11
  Alias_George.GetActorRef().AddItem(Alias_Plate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:13
  Game.GetPlayer().AddItem(Alias_Gem.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:14
EndFunction
