ScriptName Fragments:Quests:QF_CF04_GalbankArchivesAmbus_0009C424 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF04 Auto Const mandatory
RefCollectionAlias Property Alias_GalbankEclipticActors Auto Const
ReferenceAlias Property Alias_GalbankEclipticBoss Auto Const mandatory
Location Property CityNewAtlantisGalBankArchivesLocation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CityNewAtlantisGalBankArchivesLocation.Reset() ; #DEBUG_LINE_NO:9
  Alias_GalbankEclipticBoss.TryToReset() ; #DEBUG_LINE_NO:10
  Alias_GalbankEclipticActors.ResetAll() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:19
  cf04galbankarchivesambushquestscript kmyQuest = __temp as cf04galbankarchivesambushquestscript ; #DEBUG_LINE_NO:20
  kmyQuest.OnGalbankArchivesTriggerEntered() ; #DEBUG_LINE_NO:23
  CF04.SetStage(350) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0200_Item_00()
  CF04.SetStage(370) ; #DEBUG_LINE_NO:32
EndFunction
