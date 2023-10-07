ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Terror_000D249B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CreditsRewardRadiantQuestSmall Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_Predator Auto Const mandatory
ReferenceAlias Property Alias_Kieran Auto Const mandatory
ReferenceAlias Property Alias_Employee Auto Const mandatory
GlobalVariable Property CreditsRewardRadiantQuestLarge Auto Const mandatory
ReferenceAlias Property Alias_CoffeeBeans Auto Const mandatory
ReferenceAlias Property Alias_Markieff Auto Const mandatory
ReferenceAlias Property Alias_DawnsRoost Auto Const mandatory
ReferenceAlias Property Alias_SitMarker Auto Const mandatory
ActorBase Property UC_NA_MarkieffSutherland Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_02_Medium Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_03_Large Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_Markieff.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  ObjectReference MarkieffChair = Alias_SitMarker.GetRef() ; #DEBUG_LINE_NO:15
  MarkieffChair.SetActorOwner(UC_NA_MarkieffSutherland, False) ; #DEBUG_LINE_NO:16
  Alias_Markieff.GetRef().MoveTo(MarkieffChair, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveDisplayed(35, True, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetStage(30) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:41
  Alias_Predator.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:50
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:51
  Alias_Employee.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0045_Item_00()
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:60
  Self.SetObjectiveDisplayed(45, True, False) ; #DEBUG_LINE_NO:61
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:69
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:78
  Self.Stop() ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveSkipped(35) ; #DEBUG_LINE_NO:87
  Self.SetObjectiveSkipped(45) ; #DEBUG_LINE_NO:88
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:89
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:90
  PlayerRef.RemoveItem(Alias_CoffeeBeans.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:92
  If Self.GetStageDone(25) ; #DEBUG_LINE_NO:93
    PlayerRef.AddItem(Credits as Form, 4000, False) ; #DEBUG_LINE_NO:94
  Else ; #DEBUG_LINE_NO:
    PlayerRef.AddItem(Credits as Form, 2000, False) ; #DEBUG_LINE_NO:96
  EndIf ; #DEBUG_LINE_NO:
  Alias_Employee.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:107
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:108
  PlayerRef.RemoveItem(Alias_CoffeeBeans.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:110
  If Self.GetStageDone(35) ; #DEBUG_LINE_NO:112
    PlayerRef.AddItem(Credits as Form, 6000, False) ; #DEBUG_LINE_NO:113
  Else ; #DEBUG_LINE_NO:
    PlayerRef.AddItem(Credits as Form, 3000, False) ; #DEBUG_LINE_NO:115
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Employee.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:124
  Alias_SitMarker.GetRef().SetActorOwner(None, False) ; #DEBUG_LINE_NO:125
  Self.Stop() ; #DEBUG_LINE_NO:126
EndFunction
