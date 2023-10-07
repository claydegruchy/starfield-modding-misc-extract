ScriptName Fragments:Quests:QF_RL066_Quest_0027A895 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property MachineSound Auto Const
wwiseevent Property wwe_Machine Auto Const
ObjectReference Property enableMarker Auto Const
ObjectReference Property LC178_Sound01 Auto Const
ObjectReference Property LC178_Sound02 Auto Const
ObjectReference Property LC178_Sound03 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0015_Item_00()
  LC178_Sound02.Enable(False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0020_Item_00()
  LC178_Sound01.Enable(False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0025_Item_00()
  LC178_Sound03.Enable(False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0050_Item_00()
  MachineSound.Disable(False) ; #DEBUG_LINE_NO:41
  Utility.wait(3.0) ; #DEBUG_LINE_NO:44
  enableMarker.Disable(False) ; #DEBUG_LINE_NO:45
  Self.Setstage(100) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:54
EndFunction
