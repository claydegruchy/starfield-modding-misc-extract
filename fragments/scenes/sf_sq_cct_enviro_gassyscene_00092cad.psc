ScriptName Fragments:Scenes:SF_SQ_CCT_Enviro_GassyScene_00092CAD Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  cct_enviro_behaviorscript kmyQuest = Self.GetOwningQuest() as cct_enviro_behaviorscript ; #DEBUG_LINE_NO:7
  kmyQuest.ApplyBehaviorAbility(False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Phase_02_Begin()
  cct_enviro_behaviorscript kmyQuest = Self.GetOwningQuest() as cct_enviro_behaviorscript ; #DEBUG_LINE_NO:19
  kmyQuest.ApplyBehaviorAbility(True) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Phase_02_End()
  cct_enviro_behaviorscript kmyQuest = Self.GetOwningQuest() as cct_enviro_behaviorscript ; #DEBUG_LINE_NO:30
  kmyQuest.ApplyBehaviorAbility(False) ; #DEBUG_LINE_NO:33
EndFunction
