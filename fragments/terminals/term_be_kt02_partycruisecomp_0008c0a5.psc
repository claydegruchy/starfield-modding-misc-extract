ScriptName Fragments:Terminals:TERM_BE_KT02_PartyCruiseComp_0008C0A5 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
bescript Property BE_KT02 Auto Const mandatory
wwiseevent Property SoundEffect Auto Const mandatory
ReferenceAlias Property Alias_EnableMarker Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  BE_KT02.SetShipGravity(0.0) ; #DEBUG_LINE_NO:7
  SoundEffect.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:8
  Alias_EnableMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  BE_KT02.SetShipGravity(1.0) ; #DEBUG_LINE_NO:17
  SoundEffect.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:18
  Alias_EnableMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:19
  Alias_AllCrew.EvaluateAll() ; #DEBUG_LINE_NO:20
EndFunction
