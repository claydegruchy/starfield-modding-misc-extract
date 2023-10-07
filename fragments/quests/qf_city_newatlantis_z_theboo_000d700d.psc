ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_TheBoo_000D700D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Antonio Auto Const mandatory
ReferenceAlias Property Alias_Altagracia Auto Const mandatory
ReferenceAlias Property Alias_AntonioStart Auto Const mandatory
ReferenceAlias Property Alias_AltaStart Auto Const mandatory
Scene Property City_NewAtlantis_Z_TheBoot_Intro Auto Const mandatory
ReferenceAlias Property Alias_Buyer Auto Const mandatory
GlobalVariable Property CreditsRewardMiscQuestSmall Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionSmall Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionMedium Auto Const mandatory
ReferenceAlias Property Alias_Crate Auto Const mandatory
ReferenceAlias Property Alias_CrateActivator Auto Const mandatory
MiscObject Property UC_Den_Z_TheBoot_Boots Auto Const mandatory
ReferenceAlias Property Alias_Boots Auto Const mandatory
Scene Property City_NewAtlantis_Z_TheBoot_Buyer Auto Const mandatory
ReferenceAlias Property Alias_MarkerFlip Auto Const mandatory
Quest Property City_NewAtlantis_Z_TheKindnessOfStrangers Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Antonio.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
  Self.SetStage(20) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 500, False) ; #DEBUG_LINE_NO:16
  Self.SetStage(3) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 1000, False) ; #DEBUG_LINE_NO:25
  Self.SetStage(3) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().RemoveItem(UC_Den_Z_TheBoot_Boots as Form, 1, False, None) ; #DEBUG_LINE_NO:34
  Self.SetStage(75) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0004_Item_00()
  City_NewAtlantis_Z_TheKindnessOfStrangers.Start() ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0020_Item_00()
  Actor AltaRef = Alias_Altagracia.GetActorRef() ; #DEBUG_LINE_NO:51
  Alias_Antonio.GetRef().MoveTo(Alias_AntonioStart.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:53
  AltaRef.MoveTo(Alias_AltaStart.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:54
  AltaRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0030_Item_00()
  City_NewAtlantis_Z_TheBoot_Intro.Start() ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0035_Item_00()
  City_NewAtlantis_Z_TheBoot_Buyer.Start() ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0040_Item_00()
  Actor AltaRef = Alias_Altagracia.GetActorRef() ; #DEBUG_LINE_NO:79
  AltaRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:80
  AltaRef.SetEssential(False) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:89
  Actor Buyer = Alias_Buyer.GetActorRef() ; #DEBUG_LINE_NO:90
  ObjectReference Seat = Buyer.GetLinkedRef(None) ; #DEBUG_LINE_NO:91
  Buyer.EnableNoWait(False) ; #DEBUG_LINE_NO:93
  Buyer.SnapIntoInteraction(Seat) ; #DEBUG_LINE_NO:94
  Alias_CrateActivator.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:95
  Alias_Crate.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:96
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:98
  ObjectReference BootsRef = PlayerRef.PlaceAtMe(UC_Den_Z_TheBoot_Boots as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:99
  Alias_Boots.ForceRefTo(BootsRef) ; #DEBUG_LINE_NO:101
  PlayerRef.AddItem(BootsRef as Form, 1, False) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0055_Item_00()
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:118
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0065_Item_00()
  Self.SetObjectiveCompleted(60, False) ; #DEBUG_LINE_NO:127
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:128
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:136
  Self.SetObjectiveSkipped(70) ; #DEBUG_LINE_NO:137
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:138
  Alias_CrateActivator.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:139
  Game.GetPlayer().RemoveItem(Alias_Boots.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0075_Item_00()
  Self.SetObjectiveSkipped(60) ; #DEBUG_LINE_NO:148
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:149
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:150
  Alias_CrateActivator.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:151
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:159
  If Self.GetStageDone(75) ; #DEBUG_LINE_NO:160
    Alias_MarkerFlip.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:161
  EndIf ; #DEBUG_LINE_NO:
  Alias_Buyer.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:163
EndFunction

Function Fragment_Stage_1000_Item_00()
  If !Self.GetStageDone(75) ; #DEBUG_LINE_NO:171
    Self.Stop() ; #DEBUG_LINE_NO:172
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_MarkerFlip.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:181
  Self.Stop() ; #DEBUG_LINE_NO:182
EndFunction
