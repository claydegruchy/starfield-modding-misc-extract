ScriptName Fragments:Quests:QF_FFNeonZ10_002E8297 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Thug01 Auto Const mandatory
Scene Property FFNeonZ10_020_TL_ThugScene Auto Const mandatory
ReferenceAlias Property Alias_FrankContainer Auto Const mandatory
ReferenceAlias Property Alias_Contraband Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Thug02 Auto Const mandatory
ReferenceAlias Property Alias_Thug03 Auto Const mandatory
Quest Property City_Neon_Gang03 Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property CreditsRewardMinorExtortion Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionMedium Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionSmall Auto Const mandatory
Quest Property FFNeonGuardPointer_Z10 Auto Const mandatory
ReferenceAlias Property Alias_Manaia Auto Const mandatory
GlobalVariable Property FFNeonZ10_SidestarValue Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_Manaia.GetReF().EnableNoWait(False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0005_Item_00()
  If City_Neon_Gang03.IsRunning() ; #DEBUG_LINE_NO:17
    Alias_Thug01.GetReF().DisableNoWait(False) ; #DEBUG_LINE_NO:18
  Else ; #DEBUG_LINE_NO:
    FFNeonZ10_020_TL_ThugScene.Start() ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:29
  Actor Thug01 = Alias_Thug01.GetActorRef() ; #DEBUG_LINE_NO:30
  If !City_Neon_Gang03.IsRunning() ; #DEBUG_LINE_NO:33
    Thug01.EnableNoWait(False) ; #DEBUG_LINE_NO:34
    Thug01.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:35
    Alias_Thug02.GetActorRef().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:36
    Alias_Thug03.GetActorRef().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
  FFNeonGuardPointer_Z10.SetStage(200) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:51
  Self.SetObjectiveDisplayed(20, True, True) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:60
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:61
  Game.GetPlayer().RemoveItem(Alias_Contraband.GetReF() as Form, 1, False, None) ; #DEBUG_LINE_NO:64
  If Self.GetStageDone(40) ; #DEBUG_LINE_NO:66
    Game.GetPlayer().AddItem(Credits as Form, Trait_Credit_ExtortionMedium.GetValueInt(), False) ; #DEBUG_LINE_NO:67
  Else ; #DEBUG_LINE_NO:
    Game.GetPlayer().AddItem(Credits as Form, FFNeonZ10_SidestarValue.GetValueInt(), False) ; #DEBUG_LINE_NO:69
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Manaia.GetReF().DisableNoWait(False) ; #DEBUG_LINE_NO:86
  Self.Stop() ; #DEBUG_LINE_NO:87
EndFunction
