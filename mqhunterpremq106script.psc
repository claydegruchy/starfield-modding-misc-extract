ScriptName MQHunterPreMQ106Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property QuestInitStage = 10 Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.SetStage(QuestInitStage) ; #DEBUG_LINE_NO:6
EndEvent
