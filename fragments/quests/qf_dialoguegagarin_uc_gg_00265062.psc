ScriptName Fragments:Quests:QF_DialogueGagarin_UC_GG_00265062 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueGagarin_GG_IntroScene_TakeTwo Auto Const mandatory
ReferenceAlias Property Alias_Dalitso Auto Const mandatory
ReferenceAlias Property Alias_Bonifac Auto Const mandatory
ReferenceAlias Property Alias_Lawan Auto Const mandatory
Perk Property BackgroundHunter Auto Const mandatory
GlobalVariable Property UC_GG_Bet_PlayerNegotiatedBonus Auto Const mandatory
Quest Property City_GG_Bet Auto Const mandatory
MiscObject Property UC_GG_Bet_Liquor Auto Const mandatory
Perk Property BackgroundExplorer Auto Const mandatory
ReferenceAlias Property Alias_DalitsoPoster Auto Const mandatory
ReferenceAlias Property Alias_EllieYankton Auto Const mandatory
ReferenceAlias Property Alias_KealaPoster Auto Const mandatory
ReferenceAlias Property Alias_LizziePoster Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddPerk(BackgroundHunter, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().AddPerk(BackgroundExplorer, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0010_Item_00()
  DialogueGagarin_GG_IntroScene_TakeTwo.Start() ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_Dalitso.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:31
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:32
  Alias_Lawan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:33
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:34
  Alias_Bonifac.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0220_Item_00()
  UC_GG_Bet_PlayerNegotiatedBonus.SetValue(1.0) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0230_Item_00()
  Game.GetPlayer().RemoveItem(UC_GG_Bet_Liquor as Form, 1, False, None) ; #DEBUG_LINE_NO:59
  Self.SetStage(220) ; #DEBUG_LINE_NO:60
  City_GG_Bet.SetStage(100) ; #DEBUG_LINE_NO:61
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:62
  City_GG_Bet.SetStage(1000) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0800_Item_00()
  If DialogueGagarin_GG_IntroScene_TakeTwo.IsPlaying() ; #DEBUG_LINE_NO:71
    DialogueGagarin_GG_IntroScene_TakeTwo.Stop() ; #DEBUG_LINE_NO:72
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1101_Item_00()
  Self.SetStage(1100) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_1102_Item_00()
  Self.SetStage(1100) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_1103_Item_00()
  Self.SetStage(1100) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_1205_Item_00()
  Alias_DalitsoPoster.GetRef().Enable(False) ; #DEBUG_LINE_NO:105
EndFunction

Function Fragment_Stage_1215_Item_00()
  Alias_KealaPoster.GetRef().Enable(False) ; #DEBUG_LINE_NO:113
EndFunction

Function Fragment_Stage_1225_Item_00()
  Alias_LizziePoster.GetRef().Enable(False) ; #DEBUG_LINE_NO:121
EndFunction
