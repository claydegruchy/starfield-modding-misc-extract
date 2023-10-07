ScriptName Fragments:Quests:QF_SE_Player_FAB13_0005F837 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SE_FAB13_050_SeaShanty Auto Const mandatory
ReferenceAlias Property Alias_SingingCaptain Auto Const mandatory
GlobalVariable Property SE_FAB13_SeaChanty Auto Const mandatory
Scene Property SE_FAB13_060_SeaShanty02 Auto Const mandatory
Scene Property SE_FAB13_070_SeaShanty03 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference oTarg = Alias_SingingCaptain.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:7
  oTarg.SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0040_Item_00()
  If SE_FAB13_SeaChanty.GetValue() == 0.0 ; #DEBUG_LINE_NO:18
    SE_FAB13_050_SeaShanty.Start() ; #DEBUG_LINE_NO:19
  ElseIf SE_FAB13_SeaChanty.GetValue() == 1.0 ; #DEBUG_LINE_NO:20
    SE_FAB13_060_SeaShanty02.Start() ; #DEBUG_LINE_NO:21
  Else ; #DEBUG_LINE_NO:
    SE_FAB13_070_SeaShanty03.Start() ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  If SE_FAB13_SeaChanty.GetValue() == 0.0 ; #DEBUG_LINE_NO:34
    SE_FAB13_050_SeaShanty.Start() ; #DEBUG_LINE_NO:35
  ElseIf SE_FAB13_SeaChanty.GetValue() == 1.0 ; #DEBUG_LINE_NO:36
    SE_FAB13_060_SeaShanty02.Start() ; #DEBUG_LINE_NO:37
  Else ; #DEBUG_LINE_NO:
    SE_FAB13_070_SeaShanty03.Start() ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:49
  (Alias_SingingCaptain.GetRef() as spaceshipreference).DisableWithGravJump() ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_1000_Item_00()
  If SE_FAB13_SeaChanty.GetValue() == 2.0 ; #DEBUG_LINE_NO:59
    SE_FAB13_SeaChanty.SetValue(0.0) ; #DEBUG_LINE_NO:60
  Else ; #DEBUG_LINE_NO:
    SE_FAB13_SeaChanty.Mod(1.0) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
EndFunction
