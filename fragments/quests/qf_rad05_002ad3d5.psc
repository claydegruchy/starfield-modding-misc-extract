ScriptName Fragments:Quests:QF_RAD05_002AD3D5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_target Auto Const mandatory
ReferenceAlias Property Alias_LandryHollifeld Auto Const mandatory
MiscObject Property pCredits Auto Const mandatory
GlobalVariable Property RAD05_NumTimesCompleted Auto Const mandatory
GlobalVariable Property RAD05_TargetVariant Auto Const mandatory
GlobalVariable Property RAD05_QuestVariant Auto Const mandatory
RefCollectionAlias Property Alias_Guards01_Dieter Auto Const mandatory
Quest Property RAD05_Space_PirateEnc Auto Const mandatory
ReferenceAlias Property Alias_Tar01_PirateShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property PirateFaction Auto Const mandatory
ReferenceAlias Property Alias_FinalMapMarker Auto Const mandatory
ReferenceAlias Property Alias_01_Dieter Auto Const mandatory
Quest Property DialogueUCNewAtlantis_LandryHollifeld Auto Const
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Loc03_Friendly_Overlay Auto Const mandatory
ReferenceAlias Property Alias_SpaceMapMarker Auto Const mandatory
LeveledItem Property LL_Weapon_Reward_RAD05_Solace Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor aLandry = Alias_LandryHollifeld.GetActorRef() ; #DEBUG_LINE_NO:8
  Game.GetPlayer().MoveTo(aLandry as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0001_Item_00()
  If RAD05_TargetVariant.GetValue() == 1.0 ; #DEBUG_LINE_NO:18
    Self.SetStage(145) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
  If RAD05_QuestVariant.GetValue() == 2.0 ; #DEBUG_LINE_NO:24
    Actor aTarg = Alias_target.GetActorRef() ; #DEBUG_LINE_NO:25
    Actor aPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:26
    aTarg.SetValue(Game.GetAggressionAV(), 2.0) ; #DEBUG_LINE_NO:27
    aTarg.RemoveFromAllFactions() ; #DEBUG_LINE_NO:28
    aTarg.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:29
    aTarg.AddToFaction(PirateFaction) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  If RAD05_TargetVariant.GetValue() == 1.0 ; #DEBUG_LINE_NO:40
    Self.SetObjectiveDisplayed(145, True, False) ; #DEBUG_LINE_NO:42
    Alias_SpaceMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:45
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
  If RAD05_QuestVariant.GetValue() == 0.0 ; #DEBUG_LINE_NO:51
    Alias_01_Dieter.GetRef().MoveTo(Alias_FinalMapMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
  If RAD05_QuestVariant.GetValue() == 3.0 && RAD05_TargetVariant.GetValue() == 1.0 ; #DEBUG_LINE_NO:56
    Alias_Loc03_Friendly_Overlay.GetRef().Disable(False) ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0145_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0150_Item_00()
  RAD05_Space_PirateEnc.Start() ; #DEBUG_LINE_NO:75
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:77
  ObjectReference oPirate = Alias_Tar01_PirateShip.GetRef() ; #DEBUG_LINE_NO:81
  Alias_target.ForceRefTo(oPirate) ; #DEBUG_LINE_NO:82
  (oPirate as Actor).StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:93
  Self.SetObjectiveCompleted(145, True) ; #DEBUG_LINE_NO:94
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0205_Item_00()
  Actor aTarg = Alias_target.GetActorRef() ; #DEBUG_LINE_NO:104
  Actor aPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:105
  aTarg.RemoveFromAllFactions() ; #DEBUG_LINE_NO:107
  aTarg.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:108
  aTarg.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:109
  aTarg.StartCombat(aPlayer as ObjectReference, False) ; #DEBUG_LINE_NO:110
  If RAD05_NumTimesCompleted.GetValue() == 0.0 ; #DEBUG_LINE_NO:113
    Alias_Guards01_Dieter.StartCombatAll(aPlayer as ObjectReference) ; #DEBUG_LINE_NO:114
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:123
EndFunction

Function Fragment_Stage_0250_Item_00()
  Game.GetPlayer().AddItem(pCredits as Form, 100, False) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0260_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:140
  Game.GetPlayer().AddItem(LL_Weapon_Reward_RAD05_Solace as Form, 1, False) ; #DEBUG_LINE_NO:143
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:151
  Float fTemp = RAD05_NumTimesCompleted.GetValue() ; #DEBUG_LINE_NO:154
  RAD05_NumTimesCompleted.SetValue(fTemp + 1.0) ; #DEBUG_LINE_NO:155
  Float fRandom = Utility.RandomInt(1, 3) as Float ; #DEBUG_LINE_NO:164
  RAD05_TargetVariant.SetValue(RAD05_NumTimesCompleted.GetValue()) ; #DEBUG_LINE_NO:175
  fRandom = Utility.RandomInt(1, 2) as Float ; #DEBUG_LINE_NO:177
  RAD05_QuestVariant.SetValue(1.0) ; #DEBUG_LINE_NO:178
  Self.SetStage(9000) ; #DEBUG_LINE_NO:181
EndFunction

Function Fragment_Stage_8900_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:189
  Self.SetStage(9000) ; #DEBUG_LINE_NO:191
EndFunction

Function Fragment_Stage_9000_Item_00()
  If RAD05_NumTimesCompleted.GetValue() < 4.0 ; #DEBUG_LINE_NO:204
    (DialogueUCNewAtlantis_LandryHollifeld as landyscript).RestartRAD05() ; #DEBUG_LINE_NO:205
  EndIf ; #DEBUG_LINE_NO:
EndFunction
