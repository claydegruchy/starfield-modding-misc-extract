ScriptName Fragments:Scenes:SF_UC07_701_Kaiser_ProceedTo_001F428A Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property QST_Siren_Scream_WEF Auto Const mandatory
ReferenceAlias Property Unit99 Auto Const mandatory
Idle Property QuadA_IdleHowl Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_04_Begin()
  Actor NineNineREF = Unit99.GetActorRef() ; #DEBUG_LINE_NO:7
  NineNineREF.PlayIdle(QuadA_IdleHowl) ; #DEBUG_LINE_NO:8
EndFunction
