ScriptName Fragments:Quests:QF_TestAudioShip_00297D8F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
Scene Property TestAudioScene Auto Const mandatory
ReferenceAlias Property TestAudioActor Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  TestAudioScene.Stop() ; #DEBUG_LINE_NO:7
  TestAudioActor.ForceRefTo((Alias_Ship01.GetRef() as spaceshipreference) as ObjectReference) ; #DEBUG_LINE_NO:8
  TestAudioScene.Start() ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference ShipREF = Alias_Ship01.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:17
  ShipREF.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:18
  ShipREF.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:19
EndFunction
