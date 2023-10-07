ScriptName Fragments:Quests:QF_FFNewHomesteadR04Misc_0014629A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Turbine01 Auto Const mandatory
ReferenceAlias Property Alias_Turbine02 Auto Const mandatory
ReferenceAlias Property Alias_IceMarker01 Auto Const mandatory
ReferenceAlias Property Alias_IceMarker02 Auto Const mandatory
ReferenceAlias Property Alias_IceMarker03 Auto Const mandatory
ReferenceAlias Property Alias_IceMarker04 Auto Const mandatory
ReferenceAlias Property Alias_IceMarker05 Auto Const mandatory
ReferenceAlias[] Property QuestTurbines Auto Const
RefCollectionAlias Property Alias_AllTurbines Auto Const mandatory
ReferenceAlias Property Alias_Turbine03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  ffnewhomesteadr04miscquestscript kmyQuest = __temp as ffnewhomesteadr04miscquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.RegisterIce() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:27
  Self.Stop() ; #DEBUG_LINE_NO:28
EndFunction
