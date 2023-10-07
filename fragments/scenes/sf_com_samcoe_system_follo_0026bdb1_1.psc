ScriptName Fragments:Scenes:SF_COM_SamCoe_System_Follo_0026BDB1_1 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.FollowSceneEnded() ; #DEBUG_LINE_NO:10
EndFunction
