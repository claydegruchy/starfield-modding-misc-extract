ScriptName Fragments:TopicInfos:TIF_FFNeonZ06_00082D1B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Rusty Auto Const
Faction Property PlayerEnemyFaction Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Rusty.GetActorRef().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:8
  Rusty.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:9
  Rusty.GetActorRef().setvalue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:10
EndFunction
