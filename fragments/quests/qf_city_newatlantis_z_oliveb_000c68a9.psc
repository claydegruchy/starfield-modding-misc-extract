ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_OliveB_000C68A9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property City_NA_Z_OliveBranch_Seed Auto Const mandatory
ReferenceAlias Property Alias_Seeds Auto Const mandatory
Scene Property City_NewAtlantis_Z_OliveBranch_Guard Auto Const mandatory
ReferenceAlias Property Alias_SeedMarker Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
ReferenceAlias Property Alias_GuardMarker Auto Const mandatory
ReferenceAlias Property Alias_Nilesh Auto Const mandatory
Faction Property GuardFaction Auto Const mandatory
Message Property City_Z_OliveBranch_NoActivate Auto Const mandatory
Scene Property City_NewAtlantis_Z_OliveBranch_GuardDistraction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Nilesh.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  Alias_Guard.GetActorRef().RemoveFromFaction(GuardFaction) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0003_Item_00()
  City_NewAtlantis_Z_OliveBranch_GuardDistraction.Stop() ; #DEBUG_LINE_NO:23
  Alias_Guard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_Guard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetObjectiveSkipped(20) ; #DEBUG_LINE_NO:40
  Self.SetObjectiveSkipped(25) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:49
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:50
  Alias_SeedMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:51
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:53
  ObjectReference SeedRef = PlayerRef.PlaceAtMe(City_NA_Z_OliveBranch_Seed as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:54
  Alias_Seeds.ForceRefTo(SeedRef) ; #DEBUG_LINE_NO:56
  PlayerRef.AddItem(SeedRef as Form, 1, False) ; #DEBUG_LINE_NO:57
  ObjectReference GuardRef = Alias_Guard.GetRef() ; #DEBUG_LINE_NO:59
  ObjectReference GuardMarkerRef = Alias_GuardMarker.GetRef() ; #DEBUG_LINE_NO:60
  If GuardRef.GetDistance(GuardMarkerRef) > 10.0 ; #DEBUG_LINE_NO:62
    GuardRef.MoveTo(GuardMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveDisplayed(25, True, False) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0020_Item_00()
  City_Z_OliveBranch_NoActivate.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0020_Item_01()
  City_NewAtlantis_Z_OliveBranch_Guard.Start() ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0020_Item_02()
  If Game.GetPlayer().IsDetectedBy(Alias_Guard.GetActorRef()) ; #DEBUG_LINE_NO:96
    City_NewAtlantis_Z_OliveBranch_Guard.Start() ; #DEBUG_LINE_NO:97
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(30) ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0021_Item_00()
  Self.SetObjectiveSkipped(10) ; #DEBUG_LINE_NO:108
  Self.SetObjectiveSkipped(25) ; #DEBUG_LINE_NO:109
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:110
  Game.GetPlayer().RemoveItem(City_NA_Z_OliveBranch_Seed as Form, 1, False, None) ; #DEBUG_LINE_NO:111
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:112
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveCompleted(25, True) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_SeedMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:128
  Game.GetPlayer().RemoveItem(City_NA_Z_OliveBranch_Seed as Form, 1, False, None) ; #DEBUG_LINE_NO:129
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:130
  Self.SetObjectiveSkipped(20) ; #DEBUG_LINE_NO:131
  If !Self.GetStageDone(25) ; #DEBUG_LINE_NO:132
    Self.SetObjectiveSkipped(25) ; #DEBUG_LINE_NO:133
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:135
EndFunction

Function Fragment_Stage_0066_Item_00()
  Alias_SeedMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:143
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:144
  Self.Stop() ; #DEBUG_LINE_NO:145
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Guard.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:161
  Self.Stop() ; #DEBUG_LINE_NO:162
EndFunction
