ScriptName Fragments:Quests:QF_FFNewAtlantis03_000A47F2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FFNewAtlantis03_Scene01 Auto Const mandatory
ReferenceAlias Property Alias_Functionary Auto Const mandatory
ReferenceAlias Property Alias_Chisolm Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
ReferenceAlias Property Alias_Wilkes Auto Const mandatory
Quest Property FFNewAtlantis01 Auto Const mandatory
ReferenceAlias Property Alias_HelenaChambers Auto Const mandatory
ReferenceAlias Property Alias_RicardoBosch Auto Const mandatory
ReferenceAlias Property Alias_BobbyKatz Auto Const mandatory
ReferenceAlias Property Alias_RicardoMarker Auto Const mandatory
ReferenceAlias Property Alias_BobbyMarker Auto Const mandatory
ReferenceAlias Property Alias_HelenaPQMarker Auto Const mandatory
Outfit Property Outfit_Clothes_Service_Uniform_Terrabrew Auto Const mandatory
ActorBase Property UC_NA_HelenaChambers Auto Const mandatory
ReferenceAlias Property Alias_TerraManager Auto Const mandatory
ReferenceAlias Property Alias_SweepMarker Auto Const mandatory
Scene Property FFNewAtlantis03B_Helena_Scene01 Auto Const mandatory
ReferenceAlias Property Alias_BobbyPQMarker Auto Const mandatory
ReferenceAlias Property Alias_BobbyDad Auto Const mandatory
ReferenceAlias Property Alias_BobbyMom Auto Const mandatory
ReferenceAlias Property Alias_RicardoPQMarker Auto Const mandatory
Scene Property FFNewAtlantis03B_Helena_Scene02 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
Quest Property City_NewAtlantis_Z_OliveBranch Auto Const mandatory
Quest Property FFNewAtlantis01TopLevels Auto Const mandatory
Quest Property City_NewAtlantis_Z_PartingGift Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1) ; #DEBUG_LINE_NO:8
  Self.SetStage(10) ; #DEBUG_LINE_NO:9
  Self.SetStage(20) ; #DEBUG_LINE_NO:10
  Self.SetStage(30) ; #DEBUG_LINE_NO:11
  Self.SetStage(40) ; #DEBUG_LINE_NO:12
  Self.SetStage(100) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_BobbyKatz.GetRef().MoveTo(Alias_BobbyMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:21
  Alias_RicardoBosch.GetRef().MoveTo(Alias_RicardoMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0001_Item_01()
  City_NewAtlantis_Z_OliveBranch.Start() ; #DEBUG_LINE_NO:30
  FFNewAtlantis01TopLevels.Start() ; #DEBUG_LINE_NO:31
  City_NewAtlantis_Z_PartingGift.Start() ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0002_Item_00()
  FFNewAtlantis03B_Helena_Scene01.Stop() ; #DEBUG_LINE_NO:40
  FFNewAtlantis03B_Helena_Scene02.Start() ; #DEBUG_LINE_NO:41
  Alias_SweepMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:42
  Alias_TerraManager.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0003_Item_00()
  Alias_TerraManager.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:51
  Alias_TerraManager.GetRef().Delete() ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0004_Item_00()
  If Self.GetStageDone(300) ; #DEBUG_LINE_NO:60
    Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:61
    Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_TerraManager.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:71
  Alias_BobbyMom.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:72
  Alias_BobbyDad.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0009_Item_00()
  FFNewAtlantis03_Scene01.Start() ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0010_Item_00()
  FFNewAtlantis03_Scene01.Start() ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0020_Item_00()
  FFNewAtlantis03_Scene01.Stop() ; #DEBUG_LINE_NO:97
  Alias_Functionary.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:98
  Alias_HelenaChambers.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0050_Item_00()
  FFNewAtlantis03B_Helena_Scene01.Start() ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_0099_Item_00()
  Alias_HelenaChambers.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:115
EndFunction

Function Fragment_Stage_0100_Item_00()
  ObjectReference HelenaRef = Alias_HelenaChambers.GetRef() ; #DEBUG_LINE_NO:123
  UC_NA_HelenaChambers.SetOutfit(Outfit_Clothes_Service_Uniform_Terrabrew, False) ; #DEBUG_LINE_NO:125
  Alias_HelenaChambers.GetActorRef().SetOutfit(Outfit_Clothes_Service_Uniform_Terrabrew, False) ; #DEBUG_LINE_NO:126
  HelenaRef.MoveTo(Alias_HelenaPQMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:128
  HelenaRef.DisableNoWait(False) ; #DEBUG_LINE_NO:129
  Alias_BobbyKatz.GetRef().MoveTo(Alias_BobbyPQMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:131
  Alias_RicardoBosch.GetRef().MoveTo(Alias_RicardoPQMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:132
  Self.SetStage(5) ; #DEBUG_LINE_NO:134
  Alias_Functionary.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:136
  Alias_Functionary.GetRef().Delete() ; #DEBUG_LINE_NO:137
  Alias_Guard.Clear() ; #DEBUG_LINE_NO:138
  FFNewAtlantis01.Start() ; #DEBUG_LINE_NO:139
  FFNewAtlantis03_Scene01.Stop() ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0300_Item_00()
  If !Self.GetStageDone(4) ; #DEBUG_LINE_NO:148
    Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:149
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:151
  EndIf ; #DEBUG_LINE_NO:
  Alias_MapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:161
EndFunction
