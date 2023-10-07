ScriptName MQ104BComputerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MQ104BSensorArrayMSG_01_Main Auto Const mandatory
Message Property MQ104BSensorArrayMSG_02_ReplacePowerFail Auto Const mandatory
Message Property MQ104BSensorArrayMSG_02_ReplacePowerSuccess Auto Const mandatory
Message Property MQ104BSensorArrayMSG_03_OutpostSuccess Auto Const mandatory
Message Property MQ104BSensorArrayMSG_04_InfoSuccess Auto Const mandatory
MiscObject Property Mfg_Power_Circuit Auto Const mandatory
Int Property NumReqPowerCircuit = 3 Auto Const
Int Property ReplacePowerSuccessStage = 40 Auto Const
Int Property ReplacePowerFailStage = 45 Auto Const
Int Property OutpostSuccessStage = 50 Auto Const
Int Property InfoSuccessStage = 55 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:16
    Quest MQ104B = Self.GetOwningQuest() ; #DEBUG_LINE_NO:17
    Int iButtonPressed = 0 ; #DEBUG_LINE_NO:18
    iButtonPressed = MQ104BSensorArrayMSG_01_Main.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:19
    If iButtonPressed == 1 ; #DEBUG_LINE_NO:20
      MQ104BSensorArrayMSG_02_ReplacePowerFail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:21
      MQ104B.SetStage(ReplacePowerFailStage) ; #DEBUG_LINE_NO:22
    ElseIf iButtonPressed == 2 ; #DEBUG_LINE_NO:23
      MQ104BSensorArrayMSG_03_OutpostSuccess.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:24
      MQ104B.SetStage(OutpostSuccessStage) ; #DEBUG_LINE_NO:25
    ElseIf iButtonPressed == 3 ; #DEBUG_LINE_NO:26
      MQ104BSensorArrayMSG_04_InfoSuccess.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:27
      MQ104B.SetStage(InfoSuccessStage) ; #DEBUG_LINE_NO:28
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
