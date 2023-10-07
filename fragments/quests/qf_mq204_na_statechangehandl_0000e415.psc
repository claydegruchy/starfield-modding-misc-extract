ScriptName Fragments:Quests:QF_MQ204_NA_StateChangeHandl_0000E415 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Activator Property UC04_PlayerOnly_WeatherTrigger Auto Const mandatory
GlobalVariable Property UC04_DisableSpaceportCrowds Auto Const mandatory
ObjectReference Property UC04_Spaceport_WarningSign_EnableMarker Auto Const mandatory
ObjectReference Property UC03_Spaceport_EnableMarker Auto Const mandatory
Scene Property MQ204_NA_StateChangeHandlerScene Auto Const mandatory
MusicType Property _MUSExplore_WwiseSilence Auto Const mandatory
ObjectReference Property MQ204_Spaceport_EnableMarker_Actors Auto Const mandatory
Quest Property FFNewAtlantis01 Auto Const mandatory
ReferenceAlias Property Alias_TommyBitlow Auto Const mandatory
GlobalVariable Property UC04_AttackActive Auto Const mandatory
Quest Property CF05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  UC04_DisableSpaceportCrowds.SetValueInt(1) ; #DEBUG_LINE_NO:11
  UC04_Spaceport_WarningSign_EnableMarker.disable(False) ; #DEBUG_LINE_NO:14
  UC03_Spaceport_EnableMarker.disable(False) ; #DEBUG_LINE_NO:17
  MQ204_Spaceport_EnableMarker_Actors.disable(False) ; #DEBUG_LINE_NO:20
  If FFNewAtlantis01.IsRunning() ; #DEBUG_LINE_NO:23
    FFNewAtlantis01.SetStage(2) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
  Actor TommyREF = Alias_TommyBitlow.GetActorRef() ; #DEBUG_LINE_NO:28
  TommyREF.DisableNoWait(False) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ204_NA_StateChangeHandlerScene.Start() ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0100_Item_00()
  If UC04_AttackActive.GetValueInt() == 0 ; #DEBUG_LINE_NO:45
    UC04_DisableSpaceportCrowds.SetValueInt(0) ; #DEBUG_LINE_NO:47
    UC04_Spaceport_WarningSign_EnableMarker.Enable(False) ; #DEBUG_LINE_NO:49
    UC03_Spaceport_EnableMarker.Enable(False) ; #DEBUG_LINE_NO:51
    MQ204_Spaceport_EnableMarker_Actors.Enable(False) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0200_Item_00()
  _MUSExplore_WwiseSilence.Remove() ; #DEBUG_LINE_NO:65
  If FFNewAtlantis01.IsRunning() ; #DEBUG_LINE_NO:68
    FFNewAtlantis01.SetStage(3) ; #DEBUG_LINE_NO:69
  EndIf ; #DEBUG_LINE_NO:
  If CF05.GetStageDone(703) ; #DEBUG_LINE_NO:72
    CF05.SetStage(704) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  Actor TommyREF = Alias_TommyBitlow.GetActorRef() ; #DEBUG_LINE_NO:77
  TommyREF.EnableNoWait(False) ; #DEBUG_LINE_NO:78
EndFunction
