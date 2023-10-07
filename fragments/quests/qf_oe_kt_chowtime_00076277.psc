ScriptName Fragments:Quests:QF_OE_KT_ChowTime_00076277 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property OE_KT_ChowTime_Scene01 Auto Const mandatory
Scene Property OE_KT_ChowTime_Scene02 Auto Const mandatory
Scene Property OE_KT_ChowTime_Scene03 Auto Const mandatory
Scene Property OE_KT_ChowTime_Scene04 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Ranger Auto Const mandatory
LeveledItem Property LL_Food_Any Auto Const mandatory
Scene Property OE_KT_MoveCustomMarkers Auto Const mandatory
Outfit Property Outfit_Freestar_Militia_Hat Auto Const mandatory
VoiceType Property MarineMale01 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Captain Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0006_Item_00()
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:7
  OE_KT_ChowTime_Scene01.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0007_Item_00()
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:16
  OE_KT_ChowTime_Scene02.Start() ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0008_Item_00()
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:25
  OE_KT_ChowTime_Scene03.Start() ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0009_Item_00()
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:34
  OE_KT_ChowTime_Scene04.Start() ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0010_Item_00()
  Game.GetPlayer().AddItem(LL_Food_Any as Form, 1, False) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0020_Item_00()
  Actor RangerRef = Alias_NPC_Ranger.GetActorRef() ; #DEBUG_LINE_NO:51
  RangerRef.SetOutfit(Outfit_Freestar_Militia_Hat, False) ; #DEBUG_LINE_NO:52
  Self.SetStage(11) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0100_Item_00()
  Int random = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:62
  If random > 0 ; #DEBUG_LINE_NO:64
    Self.SetStage(20) ; #DEBUG_LINE_NO:65
  Else ; #DEBUG_LINE_NO:
    Alias_NPC_Ranger.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:67
  EndIf ; #DEBUG_LINE_NO:
EndFunction
