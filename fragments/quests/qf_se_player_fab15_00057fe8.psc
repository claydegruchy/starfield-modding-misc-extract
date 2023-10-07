ScriptName Fragments:Quests:QF_SE_Player_FAB15_00057FE8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SE_FAB15_100_MantisRecognized Auto Const mandatory
ReferenceAlias Property Alias_Spacer01 Auto Const mandatory
ReferenceAlias Property Alias_Spacer02 Auto Const mandatory
ReferenceAlias Property Alias_Spacer03 Auto Const mandatory
ReferenceAlias Property Alias_Merchant Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:8
  SE_FAB15_100_MantisRecognized.Start() ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0150_Item_00()
  spaceshipreference srTarg = Alias_Spacer01.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:18
  srTarg.AddToFaction(CaptiveFaction) ; #DEBUG_LINE_NO:19
  srTarg.StopCombat() ; #DEBUG_LINE_NO:20
  srTarg = Alias_Spacer02.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:22
  srTarg.AddToFaction(CaptiveFaction) ; #DEBUG_LINE_NO:23
  srTarg.StopCombat() ; #DEBUG_LINE_NO:24
  srTarg = Alias_Spacer03.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:26
  srTarg.AddToFaction(CaptiveFaction) ; #DEBUG_LINE_NO:27
  srTarg.StopCombat() ; #DEBUG_LINE_NO:28
  srTarg = Alias_Merchant.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:30
  srTarg.AddToFaction(CaptiveFaction) ; #DEBUG_LINE_NO:31
  srTarg.StopCombat() ; #DEBUG_LINE_NO:32
  srTarg.SetEssential(False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference srTarg = Alias_Spacer01.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:42
  srTarg.DisableWithGravJumpNoWait() ; #DEBUG_LINE_NO:43
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:45
  srTarg = Alias_Spacer02.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:47
  srTarg.DisableWithGravJumpNoWait() ; #DEBUG_LINE_NO:48
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:50
  srTarg = Alias_Spacer03.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:52
  srTarg.DisableWithGravJumpNoWait() ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference srTarg = Alias_Merchant.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:62
  srTarg.DisableWithGravJumpNoWait() ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0350_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 300, False) ; #DEBUG_LINE_NO:71
EndFunction
