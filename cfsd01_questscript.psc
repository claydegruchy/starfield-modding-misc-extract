ScriptName CFSD01_QuestScript Extends Quest

;-- Variables ---------------------------------------
Actor PlayerRef

;-- Properties --------------------------------------
Group Autofill
  ReferenceAlias Property CFSD01_Evidence_CF01_Kemp Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF03_Carter Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF03_LockRiots Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF04_Rokov Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF04_GalbankScheme Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF05_Daiyu Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF05_ComSpike Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF06_BayuGenerdyne Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF06_AyumiKomiko Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF06_EstelleVincent Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CF07_KryxFate Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CFKeyZ01_Maddie Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_CFKeyZ02_Kirova Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_Durand Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_Voss Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_Jaso Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_Chunks Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_Chiroptera Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_HopeTown Auto Const mandatory
  ReferenceAlias Property CFSD01_Evidence_MSC_Kreet Auto Const mandatory
  ReferenceAlias Property CFSD01_AdlerKemp Auto Const mandatory
  ReferenceAlias Property CFSD01_EstelleVincent Auto Const mandatory
  ReferenceAlias Property CFSD01_LarryDumbrosky Auto Const mandatory
  ReferenceAlias Property CFSD01_HuanDaiyu Auto Const mandatory
  ReferenceAlias Property CFSD01_EvgenyRokov Auto Const mandatory
  ReferenceAlias Property CFSD01_Delgado Auto Const mandatory
  ReferenceAlias Property CFSD01_AyumiKomiko Auto Const mandatory
EndGroup

ActorValue Property CFSD01Evidence Auto Const mandatory
ActorValue Property CFSD01EvidenceTotal Auto Const mandatory
Book[] Property EvidenceList Auto Const mandatory
Quest Property LC082 Auto Const mandatory
Quest Property LC088_Key Auto Const mandatory
Quest Property CF01 Auto Const mandatory
Quest Property CF04 Auto Const mandatory
Quest Property CF05 Auto Const mandatory
Quest Property CF06 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:46
EndEvent

Function EvidenceCheck()
  Int I = 0 ; #DEBUG_LINE_NO:51
  While I < EvidenceList.Length ; #DEBUG_LINE_NO:52
    If PlayerRef.GetItemCount(EvidenceList[I] as Form) >= 1 ; #DEBUG_LINE_NO:53
      PlayerRef.SetValue(CFSD01Evidence, 1.0) ; #DEBUG_LINE_NO:54
      Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:55
      Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:56
      Return  ; #DEBUG_LINE_NO:57
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:59
  EndWhile ; #DEBUG_LINE_NO:
  PlayerRef.SetValue(CFSD01Evidence, 0.0) ; #DEBUG_LINE_NO:61
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:62
  Self.SetObjectiveDisplayed(200, False, False) ; #DEBUG_LINE_NO:63
EndFunction

Function EvidenceCounter()
  PlayerRef.ModValue(CFSD01EvidenceTotal, 1.0) ; #DEBUG_LINE_NO:68
  If PlayerRef.GetValue(CFSD01EvidenceTotal) >= 3.0 ; #DEBUG_LINE_NO:69
    Self.SetStage(310) ; #DEBUG_LINE_NO:70
  EndIf ; #DEBUG_LINE_NO:
  If PlayerRef.GetValue(CFSD01EvidenceTotal) >= 7.0 ; #DEBUG_LINE_NO:72
    Self.SetStage(330) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  If PlayerRef.GetValue(CFSD01EvidenceTotal) >= 11.0 ; #DEBUG_LINE_NO:75
    Self.SetStage(350) ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
  If PlayerRef.GetValue(CFSD01EvidenceTotal) >= 15.0 ; #DEBUG_LINE_NO:78
    Self.SetStage(1000) ; #DEBUG_LINE_NO:79
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DebugAddAll()
  PlayerRef.AddItem(CFSD01_Evidence_CF01_Kemp.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:85
  PlayerRef.AddItem(CFSD01_Evidence_CF03_Carter.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:86
  PlayerRef.AddItem(CFSD01_Evidence_CF03_LockRiots.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:87
  PlayerRef.AddItem(CFSD01_Evidence_CF04_Rokov.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:88
  PlayerRef.AddItem(CFSD01_Evidence_CF04_GalbankScheme.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:89
  PlayerRef.AddItem(CFSD01_Evidence_CF05_Daiyu.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:90
  PlayerRef.AddItem(CFSD01_Evidence_CF05_ComSpike.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:91
  PlayerRef.AddItem(CFSD01_Evidence_CF06_BayuGenerdyne.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:92
  PlayerRef.AddItem(CFSD01_Evidence_CF06_AyumiKomiko.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:93
  PlayerRef.AddItem(CFSD01_Evidence_CF06_EstelleVincent.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:94
  PlayerRef.AddItem(CFSD01_Evidence_CF07_KryxFate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:95
  PlayerRef.AddItem(CFSD01_Evidence_CFKeyZ01_Maddie.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:96
  PlayerRef.AddItem(CFSD01_Evidence_CFKeyZ02_Kirova.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:97
  PlayerRef.AddItem(CFSD01_Evidence_MSC_Durand.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:98
  PlayerRef.AddItem(CFSD01_Evidence_MSC_Voss.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:99
  PlayerRef.AddItem(CFSD01_Evidence_MSC_Jaso.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:100
  PlayerRef.AddItem(CFSD01_Evidence_MSC_Chunks.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:101
  PlayerRef.AddItem(CFSD01_Evidence_MSC_Chiroptera.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:102
  PlayerRef.AddItem(CFSD01_Evidence_MSC_HopeTown.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:103
  PlayerRef.AddItem(CFSD01_Evidence_MSC_Kreet.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:104
EndFunction

Function JailCheck()
  If Self.GetStageDone(15) == True && !Self.GetStageDone(410) && CF01.IsCompleted() ; #DEBUG_LINE_NO:110
    (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_AdlerKemp.GetActorRef(), 1) ; #DEBUG_LINE_NO:111
    Self.SetStage(410) ; #DEBUG_LINE_NO:112
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(45) == True && !Self.GetStageDone(420) && CF04.IsCompleted() ; #DEBUG_LINE_NO:115
    (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_EvgenyRokov.GetActorRef(), 2) ; #DEBUG_LINE_NO:116
    Self.SetStage(420) ; #DEBUG_LINE_NO:117
  EndIf ; #DEBUG_LINE_NO:
  If CF04.GetStageDone(158) == False ; #DEBUG_LINE_NO:120
    If Self.GetStageDone(55) == True && !Self.GetStageDone(460) && CF04.IsCompleted() ; #DEBUG_LINE_NO:121
      (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_LarryDumbrosky.GetActorRef(), 7) ; #DEBUG_LINE_NO:122
      Self.SetStage(460) ; #DEBUG_LINE_NO:123
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(65) == True && !Self.GetStageDone(430) && CF05.IsCompleted() ; #DEBUG_LINE_NO:127
    (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_HuanDaiyu.GetActorRef(), 3) ; #DEBUG_LINE_NO:128
    Self.SetStage(430) ; #DEBUG_LINE_NO:129
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(85) == True && !Self.GetStageDone(440) && CF06.IsCompleted() ; #DEBUG_LINE_NO:132
    (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_EstelleVincent.GetActorRef(), 4) ; #DEBUG_LINE_NO:133
    Self.SetStage(440) ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
  If CF06.GetStageDone(70) == False ; #DEBUG_LINE_NO:137
    If Self.GetStageDone(105) == True && !Self.GetStageDone(470) && CF06.IsCompleted() ; #DEBUG_LINE_NO:138
      (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_AyumiKomiko.GetActorRef(), 8) ; #DEBUG_LINE_NO:139
      Self.SetStage(470) ; #DEBUG_LINE_NO:140
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If LC088_Key.GetStageDone(650) == True && !Self.GetStageDone(450) ; #DEBUG_LINE_NO:144
    (LC082 as lc082_brigquestscript).AddPrisoner(CFSD01_Delgado.GetActorRef(), 5) ; #DEBUG_LINE_NO:145
    Self.SetStage(450) ; #DEBUG_LINE_NO:146
  EndIf ; #DEBUG_LINE_NO:
EndFunction
