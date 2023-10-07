ScriptName Fragments:Quests:QF_TraitQuest_001687DB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property TRAIT_KidStuff Auto Const mandatory
Quest Property TraitKidStuff Auto Const mandatory
Quest Property TraitUnwantedHero Auto Const mandatory
Quest Property TraitWanted Auto Const mandatory
Perk Property TRAIT_AlienDNA Auto Const mandatory
Perk Property TRAIT_StarterHome Auto Const mandatory
Quest Property TraitStarterHome Auto Const mandatory
Perk Property TRAIT_Extrovert Auto Const mandatory
Perk Property TRAIT_Introvert Auto Const mandatory
Perk Property TRAIT_RaisedUniversal Auto Const mandatory
Perk Property TRAIT_Taskmaster Auto Const mandatory
Perk Property TRAIT_FreestarCollectiveSettler Auto Const mandatory
Perk Property TRAIT_SerpentsEmbrace Auto Const mandatory
Perk Property TRAIT_UnitedColoniesNative Auto Const mandatory
Perk Property TRAIT_NeonStreetRat Auto Const mandatory
ReferenceAlias Property Alias_MayorCartwright_FC Auto Const mandatory
ReferenceAlias Property Alias_AdministratorRookes_UC Auto Const mandatory
ReferenceAlias Property Alias_MadameSauvage Auto Const mandatory
ReferenceAlias Property Alias_Mirza Auto Const mandatory
ReferenceAlias Property Alias_KeeperAquilus Auto Const mandatory
Perk Property TRAIT_RaisedEnlightened Auto Const mandatory
ReferenceAlias Property Alias_AndySingh Auto Const mandatory
Quest[] Property CREW_EliteQuests Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Actor aPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  Bool bExtrovert = aPlayer.HasPerk(TRAIT_Extrovert) ; #DEBUG_LINE_NO:8
  Bool bIntrovert = aPlayer.HasPerk(TRAIT_Introvert) ; #DEBUG_LINE_NO:9
  Bool bUniversal = aPlayer.HasPerk(TRAIT_RaisedUniversal) ; #DEBUG_LINE_NO:10
  Bool bEnlightened = aPlayer.HasPerk(TRAIT_RaisedEnlightened) ; #DEBUG_LINE_NO:11
  Bool bTaskmaster = aPlayer.HasPerk(TRAIT_Taskmaster) ; #DEBUG_LINE_NO:12
  Bool bFC = aPlayer.HasPerk(TRAIT_FreestarCollectiveSettler) ; #DEBUG_LINE_NO:13
  Bool bSerpent = aPlayer.HasPerk(TRAIT_SerpentsEmbrace) ; #DEBUG_LINE_NO:14
  Bool bUC = aPlayer.HasPerk(TRAIT_UnitedColoniesNative) ; #DEBUG_LINE_NO:15
  Bool bNeon = aPlayer.HasPerk(TRAIT_NeonStreetRat) ; #DEBUG_LINE_NO:16
  If !bExtrovert && !bIntrovert && !bTaskmaster && !bUniversal ; #DEBUG_LINE_NO:19
    Alias_KeeperAquilus.Clear() ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
  If !bExtrovert && !bIntrovert && !bTaskmaster && !bEnlightened ; #DEBUG_LINE_NO:24
    Alias_AndySingh.Clear() ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
  If !bSerpent ; #DEBUG_LINE_NO:29
    Alias_Mirza.Clear() ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
  If !bNeon ; #DEBUG_LINE_NO:34
    Alias_MadameSauvage.Clear() ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
  If !bFC ; #DEBUG_LINE_NO:39
    Alias_MayorCartwright_FC.Clear() ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
  If !bUC ; #DEBUG_LINE_NO:44
    Alias_AdministratorRookes_UC.Clear() ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(100) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Game.GetPlayer().HasPerk(TRAIT_KidStuff) ; #DEBUG_LINE_NO:57
    TraitKidStuff.Start() ; #DEBUG_LINE_NO:58
  EndIf ; #DEBUG_LINE_NO:
  If Game.GetPlayer().HasPerk(TRAIT_StarterHome) ; #DEBUG_LINE_NO:62
    TraitStarterHome.Start() ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_01()
  TraitUnwantedHero.Start() ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0100_Item_02()
  TraitWanted.Start() ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0110_Item_00()
  Game.GetPlayer().RemovePerk(TRAIT_AlienDNA) ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0120_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:96
  While I < CREW_EliteQuests.Length ; #DEBUG_LINE_NO:97
    If CREW_EliteQuests[I].GetStageDone(100) ; #DEBUG_LINE_NO:98
      (CREW_EliteQuests[I] as crew_elitecrewquestscript).SetCostMultAndUpdateCost(0.5) ; #DEBUG_LINE_NO:99
    ElseIf CREW_EliteQuests[I].IsRunning() ; #DEBUG_LINE_NO:100
      (CREW_EliteQuests[I] as crew_elitecrewquestscript).SetCostMultAndUpdateCost(1.0) ; #DEBUG_LINE_NO:101
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:103
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
