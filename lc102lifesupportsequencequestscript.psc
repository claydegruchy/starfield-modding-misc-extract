ScriptName LC102LifeSupportSequenceQuestScript Extends Quest
{ Quest for life support sequence in CF04. Controls FX for the LC102 life support machines, and the state change for the lockdown sequence. }

;-- Variables ---------------------------------------
Int lifeSupportMachineActivations = 0
Int maxLifeSupportMachineActivations = 3

;-- Properties --------------------------------------
Group AutofillProperties
  ReferenceAlias Property Alias_LifeSupportMachine01_FXEnableMarker Auto Const mandatory
  ReferenceAlias Property Alias_LifeSupportMachine02_FXEnableMarker Auto Const mandatory
  ReferenceAlias Property Alias_LifeSupportMachine03_FXEnableMarker Auto Const mandatory
  ReferenceAlias Property Alias_LockdownEnableMarker Auto Const mandatory
  ReferenceAlias Property Alias_LifeSupportMachine01Activator Auto Const mandatory
  ReferenceAlias Property Alias_LifeSupportMachine02Activator Auto Const mandatory
  ReferenceAlias Property Alias_LifeSupportMachine03Activator Auto Const mandatory
EndGroup

Group TimingProperties
  Float Property LockdownWaitSeconds = 2.0 Auto Const mandatory
EndGroup

Group QuestProperties
  Quest Property CF04 Auto Const mandatory
  Int Property stageToSetOnMachine01Disabled = 121 Auto Const mandatory
  Int Property stageToSetOnMachine02Disabled = 122 Auto Const mandatory
  Int Property stageToSetOnMachine03Disabled = 123 Auto Const mandatory
  Int Property stageToSetOnInitiateLockdown = 130 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function IncrementLifeSupportMachineActivations()
  lifeSupportMachineActivations += 1 ; #DEBUG_LINE_NO:30
EndFunction

Function RegisterForLifeSupportMachineActivations()
  ObjectReference lifeSupportMachine01Activator = Alias_LifeSupportMachine01Activator.GetRef() ; #DEBUG_LINE_NO:34
  ObjectReference lifeSupportMachine02Activator = Alias_LifeSupportMachine02Activator.GetRef() ; #DEBUG_LINE_NO:35
  ObjectReference lifeSupportMachine03Activator = Alias_LifeSupportMachine03Activator.GetRef() ; #DEBUG_LINE_NO:36
  Self.RegisterForRemoteEvent(lifeSupportMachine01Activator as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:38
  Self.RegisterForRemoteEvent(lifeSupportMachine02Activator as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:39
  Self.RegisterForRemoteEvent(lifeSupportMachine03Activator as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:40
EndFunction

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  ObjectReference lifeSupportMachine01Activator = Alias_LifeSupportMachine01Activator.GetRef() ; #DEBUG_LINE_NO:44
  ObjectReference lifeSupportMachine02Activator = Alias_LifeSupportMachine02Activator.GetRef() ; #DEBUG_LINE_NO:45
  ObjectReference lifeSupportMachine03Activator = Alias_LifeSupportMachine03Activator.GetRef() ; #DEBUG_LINE_NO:46
  If akSender == lifeSupportMachine01Activator ; #DEBUG_LINE_NO:48
    Self.DeactivateLifeSupportMachine(akSender, Alias_LifeSupportMachine01_FXEnableMarker.GetRef(), stageToSetOnMachine01Disabled) ; #DEBUG_LINE_NO:49
  ElseIf akSender == lifeSupportMachine02Activator ; #DEBUG_LINE_NO:50
    Self.DeactivateLifeSupportMachine(akSender, Alias_LifeSupportMachine02_FXEnableMarker.GetRef(), stageToSetOnMachine02Disabled) ; #DEBUG_LINE_NO:51
  ElseIf akSender == lifeSupportMachine03Activator ; #DEBUG_LINE_NO:52
    Self.DeactivateLifeSupportMachine(akSender, Alias_LifeSupportMachine03_FXEnableMarker.GetRef(), stageToSetOnMachine03Disabled) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function DeactivateLifeSupportMachine(ObjectReference lifeSupportMachineActivator, ObjectReference lifeSupportMachine_FXEnableMarker, Int stageToSet)
  Self.UnregisterForRemoteEvent(lifeSupportMachineActivator as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:58
  lifeSupportMachine_FXEnableMarker.Disable(False) ; #DEBUG_LINE_NO:60
  Self.IncrementLifeSupportMachineActivations() ; #DEBUG_LINE_NO:62
  CF04.SetStage(stageToSet) ; #DEBUG_LINE_NO:64
  If lifeSupportMachineActivations == maxLifeSupportMachineActivations ; #DEBUG_LINE_NO:66
    Self.InitiateLockdown() ; #DEBUG_LINE_NO:67
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function InitiateLockdown()
  Utility.Wait(LockdownWaitSeconds) ; #DEBUG_LINE_NO:72
  Alias_LockdownEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:74
  CF04.SetStage(stageToSetOnInitiateLockdown) ; #DEBUG_LINE_NO:76
EndFunction
