ScriptName Fragments:Scenes:SF_COM_Barrett_System_AngerS_01001772 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_09_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.AngerSceneCompleted() ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Phase_11_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:18
  kmyQuest.AngerSceneCompleted() ; #DEBUG_LINE_NO:21
EndFunction
