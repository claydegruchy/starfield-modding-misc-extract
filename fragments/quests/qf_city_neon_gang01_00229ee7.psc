ScriptName Fragments:Quests:QF_City_Neon_Gang01_00229EE7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property Gang01_200a_AuraBriggsAmbient Auto Const mandatory
RefCollectionAlias Property Alias_DiscipleEnemies Auto Const mandatory
Quest Property City_Neon_Gang02 Auto Const mandatory
ReferenceAlias Property Alias_StrikersDoor Auto Const mandatory
ReferenceAlias Property Alias_Digger Auto Const mandatory
ObjectReference Property Gang01_BarMarker Auto Const mandatory
ReferenceAlias Property Alias_MadameSauvage Auto Const mandatory
ReferenceAlias Property Alias_Andrea Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
  Alias_Digger.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:9
  Gang01_BarMarker.Disable(False) ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:20
  Alias_Digger.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:22
  Gang01_BarMarker.Disable(False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:33
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:34
  Self.SetStage(210) ; #DEBUG_LINE_NO:37
  Alias_StrikersDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0210_Item_00()
  Gang01_200a_AuraBriggsAmbient.Start() ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0220_Item_00()
  Alias_Andrea.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:65
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:66
  Alias_Andrea.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:68
  Alias_DiscipleEnemies.EnableAll(False) ; #DEBUG_LINE_NO:71
  Alias_Digger.GetRef().Disable(False) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0350_Item_00()
  Alias_Andrea.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:91
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:100
  City_Neon_Gang02.SetStage(100) ; #DEBUG_LINE_NO:103
  City_Neon_Gang02.SetActive(True) ; #DEBUG_LINE_NO:104
  Gang01_BarMarker.Enable(False) ; #DEBUG_LINE_NO:105
  Self.SetStage(9000) ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:116
EndFunction
