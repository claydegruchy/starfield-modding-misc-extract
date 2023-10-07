ScriptName MS06ResetActorsScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueECSConstant Auto Const

;-- Functions ---------------------------------------

Event OnReset()
  dialogueecsconstantquestscript questScript = DialogueECSConstant as dialogueecsconstantquestscript ; #DEBUG_LINE_NO:6
  questScript.GenericNPCs.ResetAll() ; #DEBUG_LINE_NO:8
EndEvent
