ScriptName MQ301ReleaseArtifactSwitchScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Key Property MQ301PrototypeKey Auto Const mandatory
Message Property MQ301_ReleaseSwitchActivateMSG Auto Const mandatory
Message Property MQ301_ReleaseSwitchNotification Auto Const mandatory
Message Property MQ301_ReleaseSwitchNameMSG Auto Const mandatory
Int Property ReleaseArtifactStage = 160 Auto Const

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State waitingforPlayer

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:
      If akActionRef.GetItemCount(MQ301PrototypeKey as Form) >= 1 ; #DEBUG_LINE_NO:
        Self.GotoState("HasBeenTriggered") ; #DEBUG_LINE_NO:
        ObjectReference mySelfREF = Self.GetRef() ; #DEBUG_LINE_NO:
        mySelfREF.Activate(akActionRef, True) ; #DEBUG_LINE_NO:
        mySelfREF.BlockActivation(True, True) ; #DEBUG_LINE_NO:
        Self.GetOwningQuest().SetStage(ReleaseArtifactStage) ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        MQ301_ReleaseSwitchNotification.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    ObjectReference mySelfREF = Self.GetRef() ; #DEBUG_LINE_NO:11
    mySelfREF.BlockActivation(True, False) ; #DEBUG_LINE_NO:12
    mySelfREF.SetActivateTextOverride(MQ301_ReleaseSwitchActivateMSG) ; #DEBUG_LINE_NO:13
    mySelfREF.SetOverrideName(MQ301_ReleaseSwitchNameMSG) ; #DEBUG_LINE_NO:14
  EndEvent
EndState
