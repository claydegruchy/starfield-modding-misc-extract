ScriptName Fragments:Quests:QF_COM_Quest_SarahMorgan_Com_0027B667 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property COM_Quest_SarahMorgan_Commitment_PreCeremony Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_AjaMamasa Auto Const mandatory
ReferenceAlias Property Alias_AbigailMorgan Auto Const mandatory
ActorValue Property COM_MEM_SarahMorgan_CommitmentMother Auto Const mandatory
ReferenceAlias Property Alias_SarahMarker Auto Const mandatory
ReferenceAlias Property Alias_AjaMarker Auto Const mandatory
ReferenceAlias Property Alias_AbigailMarker Auto Const mandatory
ReferenceAlias Property Alias_AjaPostCeremonyMarker Auto Const mandatory
ReferenceAlias Property Alias_AbigailPostCeremonyMarker Auto Const mandatory
ReferenceAlias Property Alias_PlayerMarker Auto Const mandatory
sq_companionsscript Property SQ_Companions Auto Const mandatory
Activator Property COM_CQ_TxtReplace_QuestName_SarahMorgan Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  SQ_Companions.LockInCompanion(Alias_SarahMorgan.GetActorReference() as companionactorscript, True, None, COM_CQ_TxtReplace_QuestName_SarahMorgan) ; #DEBUG_LINE_NO:8
  Self.SetStage(10) ; #DEBUG_LINE_NO:10
  Actor myAja = Alias_AjaMamasa.GetActorRef() ; #DEBUG_LINE_NO:13
  myAja.MoveTo(Alias_AjaMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:14
  myAja.Enable(False) ; #DEBUG_LINE_NO:15
  If Alias_SarahMorgan.GetActorRef().GetValue(COM_MEM_SarahMorgan_CommitmentMother) == 1.0 ; #DEBUG_LINE_NO:18
    Self.SetStage(1) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0001_Item_00()
  ObjectReference myAbigail = Alias_AbigailMorgan.GetActorRef() as ObjectReference ; #DEBUG_LINE_NO:28
  myAbigail.Enable(False) ; #DEBUG_LINE_NO:29
  myAbigail.MoveTo(Alias_AbigailMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_AjaMamasa.GetActorRef().MoveTo(Alias_AjaMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:38
  Alias_AbigailMorgan.GetActorRef().MoveTo(Alias_AbigailMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:39
  Alias_SarahMorgan.GetActorRef().MoveTo(Alias_SarahMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:40
  Game.GetPlayer().MoveTo(Alias_PlayerMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:58
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:59
  Alias_AjaMamasa.GetActorRef().MoveTo(Alias_AjaMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:61
  If Self.GetStageDone(1) ; #DEBUG_LINE_NO:63
    Actor myAbigail = Alias_AbigailMorgan.GetActorRef() ; #DEBUG_LINE_NO:64
    myAbigail.Enable(False) ; #DEBUG_LINE_NO:65
    myAbigail.MoveTo(Alias_AbigailMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0031_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:75
  If Self.GetStageDone(1) ; #DEBUG_LINE_NO:79
    Self.SetStage(35) ; #DEBUG_LINE_NO:80
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(40) ; #DEBUG_LINE_NO:82
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveDisplayed(35, True, False) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0040_Item_00()
  If Self.IsObjectiveDisplayed(35) ; #DEBUG_LINE_NO:99
    Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:100
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0041_Item_00()
  COM_Quest_SarahMorgan_Commitment_PreCeremony.Start() ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:119
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:128
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:129
  Alias_SarahMorgan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:139
  comquestsarahmorgancommitmentscript kmyQuest = __temp as comquestsarahmorgancommitmentscript ; #DEBUG_LINE_NO:140
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:143
  SQ_Companions.LockInCompanion(Alias_SarahMorgan.GetActorReference() as companionactorscript, False, None, None) ; #DEBUG_LINE_NO:146
  ((kmyQuest as Quest) as com_commitmentquestscript).MakeCommitted() ; #DEBUG_LINE_NO:148
  kmyQuest.StartAbigailLeave() ; #DEBUG_LINE_NO:151
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_AjaMamasa.GetActorRef().MoveTo(Alias_AjaPostCeremonyMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:159
  If Self.GetStageDone(1) ; #DEBUG_LINE_NO:161
    Alias_AbigailMorgan.GetActorRef().MoveTo(Alias_AbigailPostCeremonyMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:162
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_10000_Item_00()
  Alias_AbigailMorgan.GetRef().Disable(False) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:179
EndFunction
