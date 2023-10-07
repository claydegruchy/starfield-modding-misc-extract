ScriptName Fragments:Quests:QF_UC08_QueenBattle_0003E832 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_ThrallWaveOne Auto Const mandatory
RefCollectionAlias Property Alias_ThrallWaveTwo Auto Const mandatory
Scene Property UC08_QueenBattle_Percival_SignalIntro Auto Const mandatory
Scene Property UC08_QueenBattle_Percival_EnemiesInbound Auto Const mandatory
Quest Property UC08 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Queen Auto Const mandatory
Scene Property UC08_QueenBattle_Hadrian_WrapUp Auto Const mandatory
RefCollectionAlias Property Alias_TowerAmbushes Auto Const mandatory
ReferenceAlias Property Alias_ActiveSignalMarker Auto Const mandatory
ReferenceAlias Property Alias_SignalMarkerStrong Auto Const mandatory
ReferenceAlias Property Alias_WaveOneAmbushTrigger Auto Const mandatory
Scene Property UC08_QueenBattle_PercivalHad_SecondSwitch Auto Const mandatory
Scene Property UC08_QueenBattle_PercivalHad_FirstSwitch Auto Const mandatory
Scene Property UC08_QueenBattle_PercivalHad_ThirdSwitch Auto Const mandatory
RefCollectionAlias Property Alias_AcelesPlantThralls Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0095_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  uc08_queenbattle_questscript kmyQuest = __temp as uc08_queenbattle_questscript ; #DEBUG_LINE_NO:8
  ObjectReference StrongREF = Alias_SignalMarkerStrong.GetRef() ; #DEBUG_LINE_NO:11
  Alias_ActiveSignalMarker.ForceRefTo(StrongREF) ; #DEBUG_LINE_NO:12
  StrongREF.Enable(False) ; #DEBUG_LINE_NO:13
  kmyQuest.CleanUpPlantThralls() ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:25
  uc08_queenbattle_questscript kmyQuest = __temp as uc08_queenbattle_questscript ; #DEBUG_LINE_NO:26
  defaultrefambushtrigger2 WaveOneRef = Alias_WaveOneAmbushTrigger.GetRef() as defaultrefambushtrigger2 ; #DEBUG_LINE_NO:30
  WaveOneRef.Enable(False) ; #DEBUG_LINE_NO:31
  Alias_ThrallWaveOne.EnableAll(False) ; #DEBUG_LINE_NO:32
  WaveOneRef.TriggerAmbush() ; #DEBUG_LINE_NO:33
  Alias_TowerAmbushes.EnableAll(False) ; #DEBUG_LINE_NO:36
  kmyQuest.StartSignalIntroTimer() ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0155_Item_00()
  If !Self.GetStageDone(900) ; #DEBUG_LINE_NO:45
    UC08_QueenBattle_Percival_SignalIntro.Start() ; #DEBUG_LINE_NO:46
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0160_Item_00()
  If !Self.GetStageDone(900) ; #DEBUG_LINE_NO:55
    UC08.SetStage(526) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  (Alias_ThrallWaveTwo as uc08_ab_hostilethrallcollscript).TriggerWave() ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:73
  uc08_queenbattle_questscript kmyQuest = __temp as uc08_queenbattle_questscript ; #DEBUG_LINE_NO:74
  Alias_ActiveSignalMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:77
  kmyQuest.RemoveMindControlSpell() ; #DEBUG_LINE_NO:79
  UC08_QueenBattle_Percival_SignalIntro.Stop() ; #DEBUG_LINE_NO:81
  UC08_QueenBattle_PercivalHad_FirstSwitch.Stop() ; #DEBUG_LINE_NO:82
  UC08_QueenBattle_PercivalHad_SecondSwitch.Stop() ; #DEBUG_LINE_NO:83
  UC08_QueenBattle_PercivalHad_ThirdSwitch.Stop() ; #DEBUG_LINE_NO:84
  If !Self.GetStageDone(531) ; #DEBUG_LINE_NO:86
    UC08_QueenBattle_Hadrian_WrapUp.Start() ; #DEBUG_LINE_NO:87
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:96
EndFunction
