ScriptName Fragments:Quests:QF_DialogueUCVigilance_001ACBBA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Archangel Auto Const mandatory
ReferenceAlias Property Alias_Jailor Auto Const mandatory
Scene Property DialogueUCVigilance_IntroBrigScene Auto Const mandatory
ReferenceAlias Property Alias_BrigGuard Auto Const mandatory
GlobalVariable Property DialogueUCVigilance_BrigGlobal Auto Const mandatory
Scene Property DialogueUCVigilance_Jivanta_SceneTurret Auto Const mandatory
ReferenceAlias Property Alias_Jivanta Auto Const mandatory
ReferenceAlias Property Alias_JivantaInspecting Auto Const mandatory
ReferenceAlias Property Alias_AudioLogKryx Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker01 Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker02 Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker03 Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker04 Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker05 Auto Const mandatory
RefCollectionAlias Property Alias_CF07_StageActors Auto Const mandatory
ActorBase Property LvlMarine_SysDef_Officer_Male Auto Const mandatory
ActorBase Property LvlMarine_SysDef_Recruit_Male Auto Const mandatory
ActorBase Property LvlMarine_SysDef Auto Const mandatory
Keyword Property LinkCustom06 Auto Const mandatory
ActorBase Property LvlMarine_SysDef_Support Auto Const mandatory
ActorBase Property LvlMarine_SysDef_Assault Auto Const mandatory
Keyword Property LinkCustom07 Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker06 Auto Const mandatory
ReferenceAlias Property Alias_CF07_StagingMarker07 Auto Const mandatory
RefCollectionAlias Property VigilanceMainActors Auto Const mandatory
RefCollectionAlias Property Alias_OperationsActorsAll Auto Const mandatory
Faction Property CrimeFactionUCSysDef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_CF07_StagingMarker01.Clear() ; #DEBUG_LINE_NO:7
  Alias_CF07_StagingMarker02.Clear() ; #DEBUG_LINE_NO:8
  Alias_CF07_StagingMarker03.Clear() ; #DEBUG_LINE_NO:9
  Alias_CF07_StagingMarker04.Clear() ; #DEBUG_LINE_NO:10
  Alias_CF07_StagingMarker05.Clear() ; #DEBUG_LINE_NO:11
  Int I = 0 ; #DEBUG_LINE_NO:13
  Actor[] SysDefCrew = Alias_OperationsActorsAll.GetActorArray() ; #DEBUG_LINE_NO:15
  While I < SysDefCrew.Length ; #DEBUG_LINE_NO:16
    SysDefCrew[I].SetCrimeFaction(CrimeFactionUCSysDef) ; #DEBUG_LINE_NO:17
    I += 1 ; #DEBUG_LINE_NO:18
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0004_Item_00()
  Alias_CF07_StagingMarker01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:27
  Alias_CF07_StagingMarker02.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:28
  Alias_CF07_StagingMarker03.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:29
  Alias_CF07_StagingMarker04.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:30
  ObjectReference[] CF07Actors = Alias_CF07_StageActors.GetArray() ; #DEBUG_LINE_NO:32
  Int q = 0 ; #DEBUG_LINE_NO:33
  While q < CF07Actors.Length ; #DEBUG_LINE_NO:34
    VigilanceMainActors.RemoveRef(CF07Actors[q]) ; #DEBUG_LINE_NO:35
    q += 1 ; #DEBUG_LINE_NO:36
  EndWhile ; #DEBUG_LINE_NO:
  Alias_CF07_StageActors.DisableAll(False) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_CF07_StagingMarker01.RefillAlias() ; #DEBUG_LINE_NO:47
  Alias_CF07_StagingMarker02.RefillAlias() ; #DEBUG_LINE_NO:48
  Alias_CF07_StagingMarker03.RefillAlias() ; #DEBUG_LINE_NO:49
  Alias_CF07_StagingMarker04.RefillAlias() ; #DEBUG_LINE_NO:50
  Alias_CF07_StagingMarker05.RefillAlias() ; #DEBUG_LINE_NO:51
  ObjectReference Chair01Ref = Alias_CF07_StagingMarker01.GetRef() ; #DEBUG_LINE_NO:53
  Chair01Ref.EnableNoWait(False) ; #DEBUG_LINE_NO:54
  ObjectReference Marine01Ref = Chair01Ref.PlaceAtMe(LvlMarine_SysDef_Officer_Male as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:56
  Marine01Ref.SetLinkedRef(Chair01Ref, LinkCustom06, True) ; #DEBUG_LINE_NO:57
  Alias_CF07_StageActors.AddRef(Marine01Ref) ; #DEBUG_LINE_NO:58
  ObjectReference Chair02Ref = Alias_CF07_StagingMarker02.GetRef() ; #DEBUG_LINE_NO:60
  Chair02Ref.EnableNoWait(False) ; #DEBUG_LINE_NO:61
  ObjectReference Marine02Ref = Chair02Ref.PlaceAtMe(LvlMarine_SysDef_Officer_Male as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:63
  Marine02Ref.SetLinkedRef(Chair02Ref, LinkCustom06, True) ; #DEBUG_LINE_NO:64
  Alias_CF07_StageActors.AddRef(Marine01Ref) ; #DEBUG_LINE_NO:65
  ObjectReference Chair03Ref = Alias_CF07_StagingMarker03.GetRef() ; #DEBUG_LINE_NO:67
  Chair03Ref.EnableNoWait(False) ; #DEBUG_LINE_NO:68
  ObjectReference Marine03Ref = Chair03Ref.PlaceAtMe(LvlMarine_SysDef as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:70
  Marine03Ref.SetLinkedRef(Chair03Ref, LinkCustom06, True) ; #DEBUG_LINE_NO:71
  Alias_CF07_StageActors.AddRef(Marine03Ref) ; #DEBUG_LINE_NO:72
  ObjectReference Chair04Ref = Alias_CF07_StagingMarker04.GetRef() ; #DEBUG_LINE_NO:74
  Chair04Ref.EnableNoWait(False) ; #DEBUG_LINE_NO:75
  ObjectReference Marine04Ref = Chair04Ref.PlaceAtMe(LvlMarine_SysDef_Support as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:77
  Marine04Ref.SetLinkedRef(Chair04Ref, LinkCustom06, True) ; #DEBUG_LINE_NO:78
  Alias_CF07_StageActors.AddRef(Marine04Ref) ; #DEBUG_LINE_NO:79
  ObjectReference Chair05Ref = Alias_CF07_StagingMarker05.GetRef() ; #DEBUG_LINE_NO:81
  ObjectReference Marine05Ref = Chair05Ref.PlaceAtMe(LvlMarine_SysDef_Officer_Male as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:83
  Marine05Ref.SetLinkedRef(Chair05Ref, LinkCustom06, True) ; #DEBUG_LINE_NO:84
  Alias_CF07_StageActors.AddRef(Marine05Ref) ; #DEBUG_LINE_NO:85
  ObjectReference Chair06Ref = Alias_CF07_StagingMarker06.GetRef() ; #DEBUG_LINE_NO:87
  ObjectReference Marine06Ref = Chair06Ref.PlaceAtMe(LvlMarine_SysDef_Assault as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:89
  Marine06Ref.SetLinkedRef(Chair06Ref, LinkCustom07, True) ; #DEBUG_LINE_NO:90
  Alias_CF07_StageActors.AddRef(Marine06Ref) ; #DEBUG_LINE_NO:91
  ObjectReference Chair07Ref = Alias_CF07_StagingMarker07.GetRef() ; #DEBUG_LINE_NO:93
  ObjectReference Marine07Ref = Chair07Ref.PlaceAtMe(LvlMarine_SysDef_Assault as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:95
  Marine07Ref.SetLinkedRef(Chair07Ref, LinkCustom07, True) ; #DEBUG_LINE_NO:96
  Alias_CF07_StageActors.AddRef(Marine07Ref) ; #DEBUG_LINE_NO:97
  Actor[] CF07Actors = Alias_CF07_StageActors.GetActorArray() ; #DEBUG_LINE_NO:100
  Int q = 0 ; #DEBUG_LINE_NO:101
  While q < CF07Actors.Length ; #DEBUG_LINE_NO:102
    VigilanceMainActors.AddRef(CF07Actors[q] as ObjectReference) ; #DEBUG_LINE_NO:103
    CF07Actors[q].SetCrimeFaction(CrimeFactionUCSysDef) ; #DEBUG_LINE_NO:104
    q += 1 ; #DEBUG_LINE_NO:105
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveCompleted(85, True) ; #DEBUG_LINE_NO:114
  If Self.GetStageDone(85) ; #DEBUG_LINE_NO:117
    Self.SetObjectiveDisplayed(25, True, False) ; #DEBUG_LINE_NO:118
  Else ; #DEBUG_LINE_NO:
    Alias_AudioLogKryx.Clear() ; #DEBUG_LINE_NO:120
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0029_Item_00()
  Self.SetObjectiveCompleted(25, True) ; #DEBUG_LINE_NO:129
  Alias_AudioLogKryx.Clear() ; #DEBUG_LINE_NO:130
EndFunction

Function Fragment_Stage_0085_Item_00()
  Self.SetObjectiveDisplayed(85, True, False) ; #DEBUG_LINE_NO:138
  Self.SetStage(23) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0095_Item_00()
  DialogueUCVigilance_BrigGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0100_Item_00()
  DialogueUCVigilance_IntroBrigScene.Start() ; #DEBUG_LINE_NO:155
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_BrigGuard.Clear() ; #DEBUG_LINE_NO:163
EndFunction

Function Fragment_Stage_0115_Item_00()
  Alias_Jivanta.GetRef().Moveto(Alias_JivantaInspecting.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_0120_Item_00()
  DialogueUCVigilance_Jivanta_SceneTurret.Start() ; #DEBUG_LINE_NO:179
EndFunction

Function Fragment_Stage_0125_Item_00()
  DialogueUCVigilance_Jivanta_SceneTurret.Stop() ; #DEBUG_LINE_NO:187
EndFunction
