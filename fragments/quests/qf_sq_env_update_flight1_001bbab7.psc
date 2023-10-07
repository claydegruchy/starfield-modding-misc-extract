ScriptName Fragments:Quests:QF_SQ_ENV_Update_Flight1_001BBAB7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_envscript Property SQ_ENV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0999_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  While SQ_ENV.IsRunning() == False ; #DEBUG_LINE_NO:10
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:11
  EndWhile ; #DEBUG_LINE_NO:
  SQ_ENV.Player.RefillAlias() ; #DEBUG_LINE_NO:24
  Self.stop() ; #DEBUG_LINE_NO:27
EndFunction
