ScriptName Fragments:Quests:QF_City_ER_Ghost_SupportQues_0014332E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_RobotEnableMarker Auto Const mandatory
RefCollectionAlias Property Alias_PirateEnableMarkers Auto Const mandatory
GlobalVariable Property StoryManager_EleosRetreatLoad Auto Const mandatory
LocationAlias Property Alias_DR007ListeningPostLocation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_RobotEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:7
  Alias_PirateEnableMarkers.DisableAll(False) ; #DEBUG_LINE_NO:8
  StoryManager_EleosRetreatLoad.SetValue(1.0) ; #DEBUG_LINE_NO:11
  Alias_DR007ListeningPostLocation.GetLocation().SetNeverResets(True) ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:22
EndFunction
