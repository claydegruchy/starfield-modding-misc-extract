ScriptName Fragments:Quests:QF_DialogueNewHomestead_00240431 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueNewHomestead_EstablishingScene01 Auto Const mandatory
ReferenceAlias Property Alias_Bill Auto Const mandatory
ReferenceAlias Property Alias_Giuliana Auto Const mandatory
ReferenceAlias Property Alias_BillIntroMarker Auto Const mandatory
ReferenceAlias Property Alias_GiulianaIntroMarker Auto Const mandatory
Quest Property FFNewHomesteadR04 Auto Const mandatory
ReferenceAlias Property Alias_Joyce Auto Const mandatory
ReferenceAlias Property Alias_Luthor Auto Const mandatory
Quest Property FFNewHomesteadR02Misc Auto Const mandatory
Quest Property FFNewHomesteadR02 Auto Const mandatory
Quest Property FFNewHomesteadR04Misc Auto Const mandatory
Quest Property FFNewHomesteadR05Misc Auto Const mandatory
Quest Property FFNewHomesteadR05 Auto Const mandatory
Keyword Property FFNewHomesteadR02QuestStartKeyword Auto Const mandatory
Keyword Property FFNewHomesteadR04QuestStartKeyword Auto Const mandatory
Keyword Property FFNewHomesteadR05QuestStartKeyword Auto Const mandatory
Weapon Property Cutter Auto Const mandatory
ActorValue Property FFNewHomesteadR05_Foreknowledge_AV Auto Const mandatory
Quest Property FFNewHomesteadZ01Misc Auto Const mandatory
Quest Property FFNewHomesteadZ01 Auto Const mandatory
Keyword Property FFNewHomesteadZ01QuestStartKeyword Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property FFNewHomesteadZ01_TourPrice Auto Const mandatory
Quest Property FFNewHomesteadZ00Misc Auto Const mandatory
Scene Property DialogueNewHomestead_GreeterGuard_IntroScene Auto Const mandatory
Book Property NH_SouvenirSlate Auto Const mandatory
Keyword Property FFNewHomesteadR04MiscQuestStartKeyword Auto Const mandatory
GlobalVariable Property NH_AdrianCredits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_Bill.GetRef().MoveTo(Alias_BillIntroMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
  Alias_Giuliana.GetRef().MoveTo(Alias_GiulianaIntroMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
  DialogueNewHomestead_EstablishingScene01.Start() ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0004_Item_00()
  FFNewHomesteadR04MiscQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0050_Item_00()
  DialogueNewHomestead_GreeterGuard_IntroScene.Start() ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0051_Item_00()
  FFNewHomesteadZ00Misc.Start() ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0100_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:41
  myPlayer.MoveTo(Alias_Bill.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:42
  DialogueNewHomestead_EstablishingScene01.Stop() ; #DEBUG_LINE_NO:43
  Self.SetStage(15) ; #DEBUG_LINE_NO:44
  Self.SetStage(20) ; #DEBUG_LINE_NO:45
  myPlayer.AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0101_Item_00()
  If !FFNewHomesteadZ01.IsRunning() && !FFNewHomesteadZ01.IsCompleted() ; #DEBUG_LINE_NO:54
    FFNewHomesteadZ01Misc.Start() ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0102_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:64
  If !Self.GetStageDone(120) ; #DEBUG_LINE_NO:65
    myPlayer.RemoveItem(Credits as Form, FFNewHomesteadZ01_TourPrice.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
  FFNewHomesteadZ01.Start() ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0200_Item_00()
  DialogueNewHomestead_EstablishingScene01.Stop() ; #DEBUG_LINE_NO:76
  Game.GetPlayer().MoveTo(Alias_Giuliana.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0201_Item_00()
  If !FFNewHomesteadR02.IsRunning() && !FFNewHomesteadR02.IsCompleted() ; #DEBUG_LINE_NO:85
    FFNewHomesteadR02Misc.Start() ; #DEBUG_LINE_NO:86
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0202_Item_00()
  FFNewHomesteadR02QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0400_Item_00()
  Game.GetPlayer().MoveTo(Alias_Joyce.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0401_Item_00()
  If !FFNewHomesteadR04.IsRunning() && !FFNewHomesteadR04.IsCompleted() ; #DEBUG_LINE_NO:111
    FFNewHomesteadR04Misc.SetStage(100) ; #DEBUG_LINE_NO:112
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0402_Item_00()
  FFNewHomesteadR04QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:121
EndFunction

Function Fragment_Stage_0411_Item_00()
  FFNewHomesteadR04QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:129
EndFunction

Function Fragment_Stage_0413_Item_00()
  Game.GetPlayer().AddItem(Cutter as Form, 1, False) ; #DEBUG_LINE_NO:137
  FFNewHomesteadR04QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:138
EndFunction

Function Fragment_Stage_0500_Item_00()
  Game.GetPlayer().MoveTo(Alias_Luthor.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:146
EndFunction

Function Fragment_Stage_0501_Item_00()
  If !FFNewHomesteadR05.IsRunning() && !FFNewHomesteadR05.IsCompleted() ; #DEBUG_LINE_NO:154
    FFNewHomesteadR05Misc.Start() ; #DEBUG_LINE_NO:155
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0502_Item_00()
  FFNewHomesteadR05QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:164
EndFunction

Function Fragment_Stage_0599_Item_00()
  Game.GetPlayer().SetValue(FFNewHomesteadR05_Foreknowledge_AV, 1.0) ; #DEBUG_LINE_NO:172
EndFunction

Function Fragment_Stage_1610_Item_00()
  Game.GetPlayer().AddItem(NH_SouvenirSlate as Form, 1, False) ; #DEBUG_LINE_NO:180
EndFunction

Function Fragment_Stage_1711_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NH_AdrianCredits.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:188
EndFunction
