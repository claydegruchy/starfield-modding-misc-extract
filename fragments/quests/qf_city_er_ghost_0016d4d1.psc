ScriptName Fragments:Quests:QF_City_ER_Ghost_0016D4D1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property ER_DEBUG_Ghost_Enemies Auto Const mandatory
ObjectReference Property DR007MapMarkerHeadingRef Auto Const mandatory
ObjectReference Property City_ER_Ghost_DebugMarker02 Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory
Quest Property City_ER_Exorcism Auto Const mandatory
ReferenceAlias Property Alias_DR007DebugMarker01 Auto Const mandatory
Book Property ER_Ghost_TrackerSlate Auto Const mandatory
Quest Property DialogueEleosRetreat Auto Const mandatory
Scene Property DialogueEleosRetreat_OpeningScene Auto Const mandatory
ReferenceAlias Property Alias_Sloan Auto Const mandatory
ReferenceAlias Property Alias_Nevan Auto Const mandatory
ReferenceAlias Property Alias_Petra Auto Const mandatory
ObjectReference Property ER_Ghost_Scene300_Marker_Petra Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  DialogueEleosRetreat.SetStage(25) ; #DEBUG_LINE_NO:7
  DialogueEleosRetreat.SetStage(40) ; #DEBUG_LINE_NO:8
  DialogueEleosRetreat.SetStage(50) ; #DEBUG_LINE_NO:9
  DialogueEleosRetreat_OpeningScene.Stop() ; #DEBUG_LINE_NO:10
  Game.GetPlayer().Moveto(Alias_DR007DebugMarker01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0002_Item_00()
  DialogueEleosRetreat.SetStage(25) ; #DEBUG_LINE_NO:19
  DialogueEleosRetreat.SetStage(40) ; #DEBUG_LINE_NO:20
  DialogueEleosRetreat.SetStage(50) ; #DEBUG_LINE_NO:21
  DialogueEleosRetreat_OpeningScene.Stop() ; #DEBUG_LINE_NO:22
  Game.GetPlayer().Moveto(Alias_DR007DebugMarker01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
  Game.GetPlayer().AddItem(Alias_Slate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:24
  Self.SetStage(300) ; #DEBUG_LINE_NO:25
  Game.GetPlayer().Moveto(City_ER_Ghost_DebugMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:26
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:27
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().AddItem(ER_Ghost_TrackerSlate as Form, 1, False) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:44
  Self.SetActive(True) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0200_Item_00()
  If !Self.GetStageDone(300) ; #DEBUG_LINE_NO:53
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:54
    Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:64
  uc09questscript kmyQuest = __temp as uc09questscript ; #DEBUG_LINE_NO:65
  kmyQuest.GetNPCsInPlace() ; #DEBUG_LINE_NO:68
  Alias_Petra.GetRef().Moveto(ER_Ghost_Scene300_Marker_Petra, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:70
  Alias_Sloan.GetRef().Moveto(ER_Ghost_Scene300_Marker_Petra, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:71
  Alias_Nevan.GetRef().Moveto(ER_Ghost_Scene300_Marker_Petra, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:72
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:74
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:75
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0305_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:84
  Self.SetObjectiveDisplayed(305, True, False) ; #DEBUG_LINE_NO:85
  Game.GetPlayer().RemoveItem(Alias_Slate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_1000_Item_00()
  City_ER_Exorcism.Start() ; #DEBUG_LINE_NO:94
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:95
  Self.Stop() ; #DEBUG_LINE_NO:96
EndFunction
