ScriptName Fragments:Scenes:SF_CF07_zLegacy006_Callout_H_001EB825 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
lc107questscript Property LC107 Auto Const
wwiseevent Property WwiseEvent_QST_CF07_BlackScreen Auto Const mandatory
ReferenceAlias Property CF07_LegacyVoice_Shipwide Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  CF07_LegacyVoice_Shipwide.TryToMoveTo(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Phase_03_Begin()
  LC107.StartBreachSequenceExplosions() ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Phase_04_Begin()
  WwiseEvent_QST_CF07_BlackScreen.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:23
  Self.GetOwningQuest().SetStage(395) ; #DEBUG_LINE_NO:24
EndFunction
