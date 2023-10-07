ScriptName Fragments:Quests:QF_OE_AustinF_HeatLeechRobot_000F31DC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HeatLeech_A1 Auto Const mandatory
ReferenceAlias Property Alias_HeatLeech_A3 Auto Const mandatory
ReferenceAlias Property Alias_HeatLeech_B1 Auto Const mandatory
ReferenceAlias Property Alias_HeatLeech_B3 Auto Const mandatory
ReferenceAlias Property Alias_Robot Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_Robot.GetActorRef().SetUnconscious(True) ; #DEBUG_LINE_NO:15
  Alias_HeatLeech_A1.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:16
  Alias_HeatLeech_A3.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:17
  Alias_HeatLeech_B1.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:18
  Alias_HeatLeech_B3.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Robot.GetActorRef().SetUnconscious(True) ; #DEBUG_LINE_NO:27
  Self.SetStage(150) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0150_Item_00()
  If Utility.RandomInt(0, 100) < Game.GetPlayer().GetLevel() ; #DEBUG_LINE_NO:37
    Alias_HeatLeech_A1.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
  If Utility.RandomInt(0, 100) < Game.GetPlayer().GetLevel() ; #DEBUG_LINE_NO:41
    Alias_HeatLeech_B1.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Robot.GetActorRef().SetUnconscious(False) ; #DEBUG_LINE_NO:51
  Alias_Robot.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:52
  Self.SetStage(250) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Utility.RandomInt(0, 100) < Game.GetPlayer().GetLevel() ; #DEBUG_LINE_NO:62
    Alias_HeatLeech_A3.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
  Alias_HeatLeech_B3.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:66
EndFunction
