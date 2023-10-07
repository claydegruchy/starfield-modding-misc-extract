ScriptName Fragments:TopicInfos:TIF_SE_DB_04_005F18DD Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  se_db_04_script kmyQuest = Self.GetOwningQuest() as se_db_04_script ; #DEBUG_LINE_NO:8
  kmyQuest.DropLoot() ; #DEBUG_LINE_NO:11
EndFunction
