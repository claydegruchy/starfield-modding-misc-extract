ScriptName Fragments:Perks:PRKF_SQ_Captive_PlayerRescue_001D3034 Extends Perk Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_captivescript Property SQ_Captive Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
  SQ_Captive.SendCaptiveSetFree(akTargetRef as Actor, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Entry_01(ObjectReference akTargetRef, Actor akActor)
  SQ_Captive.SendCaptiveSetFree(akTargetRef as Actor, True, True) ; #DEBUG_LINE_NO:15
EndFunction
