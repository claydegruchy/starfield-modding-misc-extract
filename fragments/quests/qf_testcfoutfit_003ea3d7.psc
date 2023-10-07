ScriptName Fragments:Quests:QF_TestCFOutfit_003EA3D7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Delgado Auto Const mandatory
ReferenceAlias Property Alias_Estelle Auto Const mandatory
ReferenceAlias Property Alias_Mathis Auto Const mandatory
ReferenceAlias Property Alias_Rokov Auto Const mandatory
ReferenceAlias Property Alias_Huan Auto Const mandatory
ReferenceAlias Property Alias_Adler Auto Const mandatory
ReferenceAlias Property Alias_Naeva Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
ActorBase Property RokovBase Auto Const mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_03 Auto Const mandatory
ReferenceAlias Property Alias_SysDef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_SysDef.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().AddtoFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:8
  Alias_Delgado.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  Alias_Mathis.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:10
  Alias_Naeva.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  Alias_Estelle.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:12
  Alias_Estelle.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:13
  Alias_Huan.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:14
  Alias_Huan.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
  Alias_Adler.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:16
  Alias_Adler.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:17
  Alias_Rokov.GetActorRef().SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_03, False) ; #DEBUG_LINE_NO:19
  Alias_Rokov.GetRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:20
  Alias_Rokov.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:21
  Alias_Rokov.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:22
EndFunction
