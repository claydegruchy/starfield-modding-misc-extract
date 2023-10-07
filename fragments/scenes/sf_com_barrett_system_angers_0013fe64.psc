ScriptName Fragments:Scenes:SF_COM_Barrett_System_AngerS_0013FE64 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_09_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.AngerSpeechChallengeSuccess() ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Phase_12_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:18
  kmyQuest.AngerSceneCompleted() ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Phase_15_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:29
  kmyQuest.AngerSceneCompleted() ; #DEBUG_LINE_NO:32
EndFunction
