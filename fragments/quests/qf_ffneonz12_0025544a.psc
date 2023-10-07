ScriptName Fragments:Quests:QF_FFNeonZ12_0025544A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueFCNeon Auto Const mandatory
ReferenceAlias Property Alias_Miguel Auto Const mandatory
ActorBase Property FC_Neon_MiguelReeves Auto Const mandatory
Keyword Property AnimArchetypeConfident Auto Const mandatory
Keyword Property AnimArchetypeDepressed Auto Const mandatory
ReferenceAlias Property Alias_Booth Auto Const mandatory
ReferenceAlias Property Alias_MiguelEnhanced Auto Const mandatory
ReferenceAlias Property Miguel Auto Const mandatory
Scene Property FFNeonZ12_001_SceneOpener Auto Const mandatory
ReferenceAlias Property Alias_Booth02 Auto Const mandatory
ReferenceAlias Property Alias_Hapa Auto Const mandatory
ReferenceAlias Property Alias_Chair Auto Const mandatory
Scene Property FFNeonZ12_040_ScenePaige Auto Const mandatory
ReferenceAlias Property Alias_PaigeOverton Auto Const mandatory
Scene Property FFNeonZ12_060_ErikaScene01 Auto Const mandatory
Scene Property FFNeonZ12_060_ErikaScene03 Auto Const mandatory
ReferenceAlias Property Alias_Erika Auto Const mandatory
ReferenceAlias Property Alias_Sauvage Auto Const mandatory
Scene Property FFNeonZ12_070_MovePosition Auto Const mandatory
ReferenceAlias Property Alias_Booth03 Auto Const mandatory
ReferenceAlias Property Alias_LegrandeSpot Auto Const mandatory
Scene Property FFNeonZ12_005_SceneOpener Auto Const mandatory
ReferenceAlias Property Alias_Legrande Auto Const mandatory
Potion Property Food_RS_MSauvage_VelocityBlue Auto Const mandatory
Potion Property Food_RS_MSauvage_VelocityRed Auto Const mandatory
ReferenceAlias Property Alias_AstralCouch Auto Const mandatory
ReferenceAlias Property Alias_DancingMarker Auto Const mandatory
ReferenceAlias Property Alias_EnhanceMarker Auto Const mandatory
ReferenceAlias Property Alias_StartCouch Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Miguel.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  Self.SetStage(5) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(5) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0002_Item_00()
  FFNeonZ12_040_ScenePaige.Start() ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0003_Item_00()
  FFNeonZ12_060_ErikaScene01.Start() ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0004_Item_00()
  FFNeonZ12_070_MovePosition.Stop() ; #DEBUG_LINE_NO:42
  FFNeonZ12_060_ErikaScene03.Start() ; #DEBUG_LINE_NO:43
  Self.SetObjectiveCompleted(85, True) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0005_Item_00()
  Actor MiguelRef = Alias_Miguel.GetActorRef() ; #DEBUG_LINE_NO:54
  MiguelRef.EnableNoWait(False) ; #DEBUG_LINE_NO:56
  MiguelRef.SnapIntoInteraction(Alias_StartCouch.GetRef()) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0006_Item_00()
  FFNeonZ12_070_MovePosition.Start() ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:75
  Game.GetPlayer().MoveTo(Alias_Miguel.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(40) ; #DEBUG_LINE_NO:86
  Game.GetPlayer().MoveTo(Alias_Miguel.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:97
  Game.GetPlayer().MoveTo(Alias_PaigeOverton.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0011_Item_00()
  Self.SetStage(70) ; #DEBUG_LINE_NO:108
  Game.GetPlayer().MoveTo(Alias_MiguelEnhanced.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_0013_Item_00()
  Alias_Miguel.GetRef().MoveTo(Alias_Legrande.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0015_Item_00()
  FFNeonZ12_001_SceneOpener.Start() ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0017_Item_00()
  FFNeonZ12_005_SceneOpener.Start() ; #DEBUG_LINE_NO:133
EndFunction

Function Fragment_Stage_0018_Item_00()
  Game.GetPlayer().RemoveItem(Food_RS_MSauvage_VelocityRed as Form, 1, False, None) ; #DEBUG_LINE_NO:141
EndFunction

Function Fragment_Stage_0020_Item_00()
  Actor MiguelRef = Alias_Miguel.GetActorRef() ; #DEBUG_LINE_NO:152
  DialogueFCNeon.SetStage(583) ; #DEBUG_LINE_NO:154
  MiguelRef.RemoveKeyword(AnimArchetypeDepressed) ; #DEBUG_LINE_NO:155
  MiguelRef.AddKeyword(AnimArchetypeConfident) ; #DEBUG_LINE_NO:156
  MiguelRef.MoveTo(Alias_Booth02.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:157
  Alias_Hapa.GetRef().MoveTo(Alias_Booth02.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0021_Item_00()
  Self.SetStage(13) ; #DEBUG_LINE_NO:169
  Game.GetPlayer().MoveTo(Alias_Legrande.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:170
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_Miguel.GetRef().MoveTo(Alias_DancingMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:178
  Alias_Hapa.GetRef().MoveTo(Alias_AstralCouch.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:179
EndFunction

Function Fragment_Stage_0050_Item_00()
  ObjectReference MiguelEnhanced = Alias_MiguelEnhanced.GetRef() ; #DEBUG_LINE_NO:189
  Alias_Miguel.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:191
  MiguelEnhanced.EnableNoWait(False) ; #DEBUG_LINE_NO:192
  MiguelEnhanced.MoveTo(Alias_EnhanceMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:193
EndFunction

Function Fragment_Stage_0070_Item_00()
  Alias_MiguelEnhanced.GetRef().MoveTo(Alias_Chair.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:201
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:211
  ObjectReference ErikaRef = Alias_Erika.GetRef() ; #DEBUG_LINE_NO:212
  ErikaRef.EnableNoWait(False) ; #DEBUG_LINE_NO:213
  ErikaRef.MoveTo(Alias_Booth03.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:214
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:224
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:225
  Miguel.ForceRefTo(Alias_MiguelEnhanced.GetRef()) ; #DEBUG_LINE_NO:226
  Alias_Erika.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:227
EndFunction

Function Fragment_Stage_0095_Item_00()
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:235
  Self.Stop() ; #DEBUG_LINE_NO:236
EndFunction

Function Fragment_Stage_0098_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:244
EndFunction

Function Fragment_Stage_0099_Item_00()
  Self.SetObjectiveDisplayed(99, True, False) ; #DEBUG_LINE_NO:252
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:260
  Alias_Erika.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:261
  Self.SetObjectiveDisplayed(85, True, False) ; #DEBUG_LINE_NO:262
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor MiguelRef = Alias_Miguel.GetActorRef() ; #DEBUG_LINE_NO:272
  Alias_MiguelEnhanced.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:274
  MiguelRef.EnableNoWait(False) ; #DEBUG_LINE_NO:275
  MiguelRef.RemoveKeyword(AnimArchetypeDepressed) ; #DEBUG_LINE_NO:276
  MiguelRef.AddKeyword(AnimArchetypeConfident) ; #DEBUG_LINE_NO:277
  Self.Stop() ; #DEBUG_LINE_NO:278
EndFunction
