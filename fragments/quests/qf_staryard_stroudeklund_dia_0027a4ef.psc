ScriptName Fragments:Quests:QF_Staryard_StroudEklund_Dia_0027A4EF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SY_StroudEklund_100_Intro Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  SY_StroudEklund_100_Intro.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0900_Item_00()
  If SY_StroudEklund_100_Intro.IsPlaying() ; #DEBUG_LINE_NO:18
    SY_StroudEklund_100_Intro.Stop() ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndFunction
