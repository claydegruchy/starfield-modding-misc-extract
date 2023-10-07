ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_TheKin_0009BD47 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_TahirVala Auto Const mandatory
Potion Property Food_RS_Tavern_VeggieGrinder Auto Const mandatory
ReferenceAlias Property Alias_Miso Auto Const mandatory
Scene Property City_NA_Z_TKoS_End_Tahir Auto Const mandatory
Potion Property Miso_Soup_Individual Auto Const mandatory
ReferenceAlias Property Alias_UCGuard Auto Const mandatory
Scene Property City_NA_Z_TKoS_UCTahirScene Auto Const mandatory
ReferenceAlias Property Alias_TahirSeat Auto Const mandatory
GlobalVariable Property City_NAZ_TahirFollow_Global Auto Const mandatory
ReferenceAlias Property Alias_TriggerVolume Auto Const mandatory
ReferenceAlias Property Alias_TriggerVolume01 Auto Const mandatory
Quest Property City_NewAtlantis_Z_TheBoot Auto Const mandatory
ReferenceAlias Property Alias_Kay Auto Const mandatory
ReferenceAlias Property Alias_KayWait Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_02_Medium Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  City_NewAtlantis_Z_TheBoot.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_TriggerVolume.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:15
  Alias_TriggerVolume01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:16
  Actor TahirRef = Alias_TahirVala.GetActorRef() ; #DEBUG_LINE_NO:18
  ObjectReference TahirSeat = Alias_TahirSeat.GetRef() ; #DEBUG_LINE_NO:19
  SQ_Followers.SetRoleInactive(Alias_TahirVala.GetActorRef(), True, False, True) ; #DEBUG_LINE_NO:20
  City_NAZ_TahirFollow_Global.SetValue(1.0) ; #DEBUG_LINE_NO:21
  TahirRef.MoveTo(TahirSeat, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:22
  TahirRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0001_Item_01()
  Self.SetObjectiveCompleted(10, False) ; #DEBUG_LINE_NO:31
  Self.SetObjectiveDisplayed(20, False, False) ; #DEBUG_LINE_NO:32
  Self.SetObjectiveDisplayed(10, True, True) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0002_Item_00()
  SQ_Followers.SetRoleActive(Alias_TahirVala.GetActorRef(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0004_Item_00()
  City_NA_Z_TKoS_UCTahirScene.Start() ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_UCGuard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0007_Item_00()
  Actor TahirRef = Alias_TahirVala.GetActorRef() ; #DEBUG_LINE_NO:65
  SQ_Followers.SetRoleActive(TahirRef, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:66
  TahirRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:67
  Alias_TriggerVolume.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:68
  Alias_TriggerVolume01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:69
  City_NAZ_TahirFollow_Global.SetValue(0.0) ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_0007_Item_01()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:78
  Self.SetObjectiveDisplayed(20, True, True) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:87
  Alias_TahirVala.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:89
  Alias_UCGuard.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:90
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Misc_02_Medium as Form, 1, False) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:99
  If !Self.GetStageDone(50) ; #DEBUG_LINE_NO:100
    Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:101
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:103
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:105
  ObjectReference MisoRef = PlayerRef.PlaceAtMe(Miso_Soup_Individual as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:106
  Alias_Miso.ForceRefTo(MisoRef) ; #DEBUG_LINE_NO:107
  PlayerRef.AddItem(MisoRef as Form, 1, False) ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetStage(2) ; #DEBUG_LINE_NO:116
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:117
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:118
  Alias_Kay.GetRef().MoveTo(Alias_KayWait.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:127
  Game.GetPlayer().RemoveItem(Alias_Miso.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:128
EndFunction

Function Fragment_Stage_0080_Item_00()
  City_NA_Z_TKoS_End_Tahir.Start() ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_0090_Item_00()
  Actor TahirRef = Alias_TahirVala.GetActorRef() ; #DEBUG_LINE_NO:144
  If Game.GetPlayer().GetDistance(TahirRef as ObjectReference) < 12.0 ; #DEBUG_LINE_NO:146
    City_NA_Z_TKoS_End_Tahir.Start() ; #DEBUG_LINE_NO:147
  EndIf ; #DEBUG_LINE_NO:
  Alias_TriggerVolume.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:150
  Alias_TriggerVolume01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:151
  SQ_Followers.SetRoleInactive(TahirRef, True, False, True) ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:161
  Alias_Miso.Clear() ; #DEBUG_LINE_NO:162
  Alias_TahirVala.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:163
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_TahirVala.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:171
  Alias_UCGuard.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:172
  Self.Stop() ; #DEBUG_LINE_NO:173
EndFunction
