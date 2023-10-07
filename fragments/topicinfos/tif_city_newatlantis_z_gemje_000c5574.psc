ScriptName Fragments:TopicInfos:TIF_City_NewAtlantis_Z_GemJe_000C5574 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Guillaume Auto Const
ReferenceAlias Property Alias_Gem Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().RemoveItem(Alias_Gem.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:10
  Alias_Guillaume.GetActorRef().AddItem(Alias_Gem.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:11
EndFunction
