ScriptName Fragments:Scenes:SF_COM_SamCoe_Story_SG08a_0023DF81 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.StoryGateSceneCompleted(True) ; #DEBUG_LINE_NO:10
EndFunction
