ScriptName Fragments:Scenes:SF_DialogueNewHomestead_Giul_004168D0 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFNewHomesteadR02QuestStartKeyword Auto Const mandatory
Keyword Property FFNewHomesteadR02MiscQuestStartKeyword Auto Const mandatory
Quest Property FFNewHomesteadR02Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  If !FFNewHomesteadR02Misc.IsRunning() ; #DEBUG_LINE_NO:7
    FFNewHomesteadR02MiscQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndFunction
