ScriptName Fragments:Scenes:SF_CF05_SuspiciousMarineAtta_00090E5E Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF05_Alarm Auto Const mandatory
ReferenceAlias Property Alias_CF05_AlertedGuard_ForceGreeter03 Auto Const mandatory
Scene Property CF05_SuspiciousMarineAttackScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_04_Begin()
  CF05_Alarm.SetStage(60) ; #DEBUG_LINE_NO:7
  Alias_CF05_AlertedGuard_ForceGreeter03.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:8
  CF05_SuspiciousMarineAttackScene.Stop() ; #DEBUG_LINE_NO:9
EndFunction
