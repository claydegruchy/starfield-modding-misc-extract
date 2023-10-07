ScriptName MQ302B_HelixScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Helix_AndrejaVoice Auto Const mandatory
ReferenceAlias Property Helix_BarrettVoice Auto Const mandatory
ReferenceAlias Property Helix_SamVoice Auto Const mandatory
ReferenceAlias Property Helix_SarahVoice Auto Const mandatory
GlobalVariable Property COM_CompanionID_Andreja Auto Const mandatory
GlobalVariable Property COM_CompanionID_Barrett Auto Const mandatory
GlobalVariable Property COM_CompanionID_SamCoe Auto Const mandatory
GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const mandatory
GlobalVariable Property MQ_CompanionDead Auto Const mandatory

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForTrigger

  Event OnLoad()
    Self.gotostate("HasBeenTriggered") ; #DEBUG_LINE_NO:16
    Int iCompanionDead = MQ_CompanionDead.GetValueInt() ; #DEBUG_LINE_NO:18
    spaceshipreference HelixREF = Self.GetShipRef() ; #DEBUG_LINE_NO:19
    If iCompanionDead == COM_CompanionID_Andreja.GetValueInt() ; #DEBUG_LINE_NO:21
      Helix_AndrejaVoice.ForceRefTo(HelixREF as ObjectReference) ; #DEBUG_LINE_NO:22
    ElseIf iCompanionDead == COM_CompanionID_Barrett.GetValueInt() ; #DEBUG_LINE_NO:23
      Helix_BarrettVoice.ForceRefTo(HelixREF as ObjectReference) ; #DEBUG_LINE_NO:24
    ElseIf iCompanionDead == COM_CompanionID_SamCoe.GetValueInt() ; #DEBUG_LINE_NO:25
      Helix_SamVoice.ForceRefTo(HelixREF as ObjectReference) ; #DEBUG_LINE_NO:26
    ElseIf iCompanionDead == COM_CompanionID_SarahMorgan.GetValueInt() ; #DEBUG_LINE_NO:27
      Helix_SarahVoice.ForceRefTo(HelixREF as ObjectReference) ; #DEBUG_LINE_NO:28
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
