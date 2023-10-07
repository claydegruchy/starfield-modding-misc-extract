ScriptName Fragments:Quests:QF_City_Akila_Ashta03_00212B4E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AlphaAshta Auto Const mandatory
ReferenceAlias Property Alias_Davis Auto Const mandatory
Scene Property DavisPatrolScene1 Auto Const
Scene Property DavisPatrolScene2 Auto Const
ReferenceAlias Property Alias_Keoni Auto Const mandatory
ReferenceAlias Property Alias_PlayerStartMarker Auto Const mandatory
Keyword Property AnimArchetypeDepressed Auto Const mandatory
ActorValue Property Ashta03_Foreknowledge_DavisDiesAV Auto Const mandatory
ActorValue Property Ashta03_Foreknowledge_CompletedQuestAV Auto Const mandatory
Quest Property DialogueFCAkilaCity Auto Const mandatory
Message Property City_Akila_Ashta_03_BuildRewardMsg Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_Keoni.GetReference().MoveTo(Alias_PlayerStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
  Alias_Keoni.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:8
  Game.GetPlayer().MoveTo(Alias_PlayerStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  Self.SetStage(5) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor aTarg = Alias_Keoni.GetActorRef() ; #DEBUG_LINE_NO:20
  aTarg.Enable(False) ; #DEBUG_LINE_NO:21
  DialogueFCAkilaCity.SetStage(2015) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:33
  city_akila_ashta02_script kmyQuest = __temp as city_akila_ashta02_script ; #DEBUG_LINE_NO:34
  Self.SetObjectiveDisplayed(5, True, False) ; #DEBUG_LINE_NO:37
  kmyQuest.Wait24() ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetObjectiveCompleted(5, True) ; #DEBUG_LINE_NO:48
  Self.SetObjectiveDisplayed(7, True, False) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveCompleted(7, True) ; #DEBUG_LINE_NO:57
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:66
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0030_Item_00()
  If Self.IsObjectiveDisplayed(20) ; #DEBUG_LINE_NO:75
    Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:76
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:81
  Alias_Davis.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:82
  DavisPatrolScene1.Start() ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0031_Item_00()
  Alias_Davis.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:91
  DavisPatrolScene2.Start() ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_0035_Item_00()
  Alias_Davis.GetActorRef().SetEssential(True) ; #DEBUG_LINE_NO:102
  Self.SetStage(30) ; #DEBUG_LINE_NO:105
EndFunction

Function Fragment_Stage_0090_Item_00()
  Game.ShakeCamera(None, 0.850000024, 2.0) ; #DEBUG_LINE_NO:114
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:122
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:123
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:124
  Alias_AlphaAshta.GetReference().Enable(False) ; #DEBUG_LINE_NO:125
  Alias_AlphaAshta.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:126
  If !Self.GetStageDone(35) ; #DEBUG_LINE_NO:129
    Alias_Davis.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:130
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveFailed(110, True) ; #DEBUG_LINE_NO:139
  Game.GetPlayer().SetValue(Ashta03_Foreknowledge_DavisDiesAV, 1.0) ; #DEBUG_LINE_NO:142
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:150
  If Self.GetStageDone(110) ; #DEBUG_LINE_NO:152
    Self.SetObjectiveDisplayed(160, True, False) ; #DEBUG_LINE_NO:154
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:157
    Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:158
    Alias_Davis.GetActorRef().SetEssential(True) ; #DEBUG_LINE_NO:161
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:170
  Self.SetObjectiveDisplayed(160, True, False) ; #DEBUG_LINE_NO:171
  Alias_Davis.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:172
EndFunction

Function Fragment_Stage_0180_Item_00()
  Alias_Keoni.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed) ; #DEBUG_LINE_NO:180
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:188
  City_Akila_Ashta_03_BuildRewardMsg.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:191
  Game.GetPlayer().SetValue(Ashta03_Foreknowledge_CompletedQuestAV, 1.0) ; #DEBUG_LINE_NO:194
  Self.Stop() ; #DEBUG_LINE_NO:196
EndFunction
