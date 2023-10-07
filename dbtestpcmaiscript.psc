ScriptName DBTestPCMAIScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property FoundPackins Auto Const mandatory
ReferenceAlias Property NearbyPackin Auto Const mandatory
Scene Property DBTestPCMAI_InvestigatePackinScene Auto Const mandatory
Int Property AtTargetLocationStage = 100 Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  If NearbyPackin.GetRef() == None ; #DEBUG_LINE_NO:14
    Self.CheckForNearbyPackin() ; #DEBUG_LINE_NO:16
  Else ; #DEBUG_LINE_NO:
    DBTestPCMAI_InvestigatePackinScene.Start() ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function CheckForNearbyPackin()
  FoundPackins.AddRef(NearbyPackin.GetRef()) ; #DEBUG_LINE_NO:27
  NearbyPackin.ClearAndRefillAlias() ; #DEBUG_LINE_NO:29
  If NearbyPackin.GetRef() ; #DEBUG_LINE_NO:30
    DBTestPCMAI_InvestigatePackinScene.Stop() ; #DEBUG_LINE_NO:32
    Utility.wait(1.0) ; #DEBUG_LINE_NO:33
    DBTestPCMAI_InvestigatePackinScene.Start() ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(AtTargetLocationStage) == False ; #DEBUG_LINE_NO:36
    Self.StartTimer(10.0, 0) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  If DBTestPCMAI_InvestigatePackinScene.IsPlaying() ; #DEBUG_LINE_NO:45
    Self.StartTimer(10.0, 0) ; #DEBUG_LINE_NO:47
  Else ; #DEBUG_LINE_NO:
    Self.CheckForNearbyPackin() ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndEvent
