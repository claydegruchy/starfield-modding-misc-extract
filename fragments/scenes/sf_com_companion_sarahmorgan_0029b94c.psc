ScriptName Fragments:Scenes:SF_COM_Companion_SarahMorgan_0029B94C Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_06_End()
  com_convoquestscript kmyQuest = Self.GetOwningQuest() as com_convoquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.SceneCompleted() ; #DEBUG_LINE_NO:10
EndFunction
