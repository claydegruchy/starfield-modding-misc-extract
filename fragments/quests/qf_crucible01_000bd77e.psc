ScriptName Fragments:Quests:QF_Crucible01_000BD77E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property Crucible01_050_HolmesBark Auto Const mandatory
ObjectReference Property CrucibleMarker_CommonArea Auto Const mandatory
ReferenceAlias Property Alias_HH_Holmes Auto Const mandatory
ObjectReference Property Crucible01_InitialHolmesMarker Auto Const mandatory
Quest Property MS02 Auto Const mandatory
ActorValue Property Crucible01_ForeknowledgeAV Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
RefCollectionAlias Property Alias_ExplosiveBarrels Auto Const mandatory
ReferenceAlias Property Alias_HH_Holmes_Name Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(CrucibleMarker_CommonArea, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
  MS02.SetStage(400) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor aTarg = Alias_HH_Holmes.GetActorRef() ; #DEBUG_LINE_NO:20
  aTarg.MoveTo(Crucible01_InitialHolmesMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:21
  aTarg.EvaluatePackage(False) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:30
  Crucible01_050_HolmesBark.Start() ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:41
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:42
  Actor aTarg = Alias_HH_Holmes.GetActorRef() ; #DEBUG_LINE_NO:45
  aTarg.EvaluatePackage(False) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0110_Item_00()
  If Self.GetStageDone(120) ; #DEBUG_LINE_NO:55
    Self.SetStage(150) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0120_Item_00()
  If Self.GetStageDone(110) ; #DEBUG_LINE_NO:66
    Self.SetStage(150) ; #DEBUG_LINE_NO:67
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:76
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:85
  Game.GetPlayer().SetValue(Crucible01_ForeknowledgeAV, 1.0) ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0205_Item_00()
  Alias_HH_Holmes_Name.ForceRefTo(Alias_HH_Holmes.GetRef()) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:105
  Actor aTarg = Alias_HH_Holmes.GetActorRef() ; #DEBUG_LINE_NO:108
  aTarg.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:109
  aTarg.SetEssential(False) ; #DEBUG_LINE_NO:110
  aTarg.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:111
  aTarg.EvaluatePackage(False) ; #DEBUG_LINE_NO:112
  (Alias_ExplosiveBarrels.GetAt(0) as testexplodingbarrel).Explode() ; #DEBUG_LINE_NO:115
  (Alias_ExplosiveBarrels.GetAt(1) as testexplodingbarrel).Explode() ; #DEBUG_LINE_NO:116
  Alias_ExplosiveBarrels.GetAt(0).DamageObject(100.0) ; #DEBUG_LINE_NO:117
  Alias_ExplosiveBarrels.GetAt(1).DamageObject(100.0) ; #DEBUG_LINE_NO:118
  Self.SetStage(200) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:128
  Self.SetStage(9000) ; #DEBUG_LINE_NO:130
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:138
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:140
  Self.SetStage(9000) ; #DEBUG_LINE_NO:142
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:150
EndFunction
