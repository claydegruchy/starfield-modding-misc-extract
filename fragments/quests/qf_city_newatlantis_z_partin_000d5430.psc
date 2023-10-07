ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Partin_000D5430 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CreditGlobal Auto Const mandatory
Book Property UC_NA_Z_PartingGift_Book Auto Const mandatory
ReferenceAlias Property Alias_Letter Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory
ReferenceAlias Property Alias_Zawadi Auto Const mandatory
ReferenceAlias Property Alias_Hadiyah Auto Const mandatory
ReferenceAlias Property Alias_Chair Auto Const mandatory
Scene Property City_NewAtlantis_Z_PartingGift_ZawadiHaddie Auto Const mandatory
ReferenceAlias Property Alias_Couch Auto Const mandatory
ReferenceAlias Property Alias_Railing60 Auto Const mandatory
ActorBase Property UC_CY_HaddieGustavsson Auto Const mandatory
ActorBase Property UC_NA_Zawadi Auto Const mandatory
ReferenceAlias Property Alias_Railing90z Auto Const mandatory
ReferenceAlias Property Alias_Railing90h Auto Const mandatory
ObjectReference Property XmarkerHaddie Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Zawadi.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  City_NewAtlantis_Z_PartingGift_ZawadiHaddie.Start() ; #DEBUG_LINE_NO:15
  Alias_Trigger.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0004_Item_00()
  If !Self.GetStageDone(30) ; #DEBUG_LINE_NO:24
    Self.SetObjectiveFailed(10, True) ; #DEBUG_LINE_NO:25
    Self.SetStage(6) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0007_Item_00()
  Alias_Hadiyah.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:35
  Alias_Zawadi.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:36
  Self.Stop() ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:45
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:47
  ObjectReference QuestItem = PlayerRef.PlaceAtMe(UC_NA_Z_PartingGift_Book as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:48
  PlayerRef.AddItem(Credits as Form, 1000, False) ; #DEBUG_LINE_NO:50
  Alias_Letter.ForceRefTo(QuestItem) ; #DEBUG_LINE_NO:51
  PlayerRef.AddItem(QuestItem as Form, 1, False) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:60
  Game.GetPlayer().RemoveItem(UC_NA_Z_PartingGift_Book as Form, 1, False, None) ; #DEBUG_LINE_NO:61
EndFunction

Function Fragment_Stage_0039_Item_00()
  If !Self.GetStageDone(2) ; #DEBUG_LINE_NO:69
    Self.SetStage(2) ; #DEBUG_LINE_NO:70
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  Actor ZawadiRef = Alias_Zawadi.GetActorRef() ; #DEBUG_LINE_NO:79
  Actor HadiRef = Alias_Hadiyah.GetActorRef() ; #DEBUG_LINE_NO:80
  ZawadiRef.MoveTo(Alias_Chair.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:82
  ZawadiRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:83
  HadiRef.MoveTo(XmarkerHaddie, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:85
  HadiRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0055_Item_00()
  City_NewAtlantis_Z_PartingGift_ZawadiHaddie.Start() ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_0060_Item_00()
  ObjectReference HaddieRef = Alias_Hadiyah.GetRef() ; #DEBUG_LINE_NO:102
  ObjectReference ZawadiRef = Alias_Zawadi.GetRef() ; #DEBUG_LINE_NO:103
  ObjectReference HRailRef = Alias_Railing60.GetRef() ; #DEBUG_LINE_NO:104
  ObjectReference ZRailRef = Alias_Couch.GetRef() ; #DEBUG_LINE_NO:105
  HRailRef.SetActorOwner(UC_CY_HaddieGustavsson, False) ; #DEBUG_LINE_NO:107
  ZRailRef.SetActorOwner(UC_NA_Zawadi, False) ; #DEBUG_LINE_NO:108
  ZawadiRef.MoveTo(ZRailRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:110
  HaddieRef.MoveTo(HRailRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0070_Item_00()
  ObjectReference HRailRef = Alias_Railing60.GetRef() ; #DEBUG_LINE_NO:119
  ObjectReference ZRailRef = Alias_Couch.GetRef() ; #DEBUG_LINE_NO:120
  HRailRef.SetActorOwner(None, False) ; #DEBUG_LINE_NO:122
  ZRailRef.SetActorOwner(None, False) ; #DEBUG_LINE_NO:123
EndFunction

Function Fragment_Stage_0075_Item_00()
  City_NewAtlantis_Z_PartingGift_ZawadiHaddie.Start() ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0080_Item_00()
  ObjectReference HaddieRef = Alias_Hadiyah.GetRef() ; #DEBUG_LINE_NO:139
  ObjectReference ZawadiRef = Alias_Zawadi.GetRef() ; #DEBUG_LINE_NO:140
  ObjectReference HRailRef = Alias_Railing90h.GetRef() ; #DEBUG_LINE_NO:141
  ObjectReference ZRailRef = Alias_Railing90z.GetRef() ; #DEBUG_LINE_NO:142
  ZawadiRef.MoveTo(ZRailRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:144
  HaddieRef.MoveTo(HRailRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:145
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Zawadi.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:153
  Alias_Zawadi.GetRef().Delete() ; #DEBUG_LINE_NO:154
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:162
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveSkipped(10) ; #DEBUG_LINE_NO:170
  Self.SetObjectiveSkipped(20) ; #DEBUG_LINE_NO:171
  Self.Stop() ; #DEBUG_LINE_NO:172
EndFunction
