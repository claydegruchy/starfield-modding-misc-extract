ScriptName SQ_PlayerShipArmillaryScreenScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MQAlllowArmillaryGravDrive Auto Const mandatory
Message Property MQPlaceArmillaryShipScreenMSGBox Auto Const mandatory
Message Property MQRemoveArmillaryShipScreenMSGBox Auto Const mandatory
Message Property MQBlockArmillaryShipScreenMSGBox Auto Const mandatory
ReferenceAlias Property PlayerShipArmillary Auto Const mandatory
ReferenceAlias Property MQ00_Armillary Auto Const mandatory
Quest Property MQ204 Auto Const mandatory
Quest Property MQ404 Auto Const mandatory
Quest Property MQ305 Auto Const mandatory
Int Property MQ204_PlayerSecuresArmillaryStage = 620 Auto Const
Int Property MQ404_PlayerSecuresArmillaryStage = 120 Auto Const
Quest Property MQ00 Auto Const mandatory
ReferenceAlias Property MQ00_ArmillaryMountOrScreen Auto Const mandatory
Keyword Property ObjectTypeMQArtifact Auto Const mandatory
Message Property ArmillaryNoArtifactsAddedMSG Auto Const mandatory
ReferenceAlias Property HomeShipArmillaryScreen Auto Const mandatory
Furniture Property PilotSeatStarborn Auto Const mandatory
{ the ship armillary screen on a starborn ship is the pilot seat }
wwiseevent Property WwiseEvent_AMBArtifactArmillaryShipInstall Auto Const mandatory
wwiseevent Property WwiseEvent_AMBArtifactArmillaryShipUninstall Auto Const mandatory
wwiseevent Property WwiseEvent_AMBArtifactArmillaryShipAddArtifact Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference ArmillaryREF = PlayerShipArmillary.GetRef() ; #DEBUG_LINE_NO:28
  ObjectReference ArmillaryScreenTriggerREF = Self.GetRef() ; #DEBUG_LINE_NO:29
  ObjectReference HomeShipArmillaryScreenREF = HomeShipArmillaryScreen.GetRef() ; #DEBUG_LINE_NO:30
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:31
  If ArmillaryREF.IsEnabled() ; #DEBUG_LINE_NO:32
    If HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn as Form ; #DEBUG_LINE_NO:33
      HomeShipArmillaryScreenREF.PlayAnimation("Play01") ; #DEBUG_LINE_NO:34
    Else ; #DEBUG_LINE_NO:
      HomeShipArmillaryScreenREF.PlayAnimation("Stage2") ; #DEBUG_LINE_NO:36
    EndIf ; #DEBUG_LINE_NO:
  ElseIf MQ00_Armillary.GetRef() == ArmillaryREF ; #DEBUG_LINE_NO:38
    ArmillaryREF.Enable(False) ; #DEBUG_LINE_NO:39
    If HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn as Form ; #DEBUG_LINE_NO:40
      HomeShipArmillaryScreenREF.PlayAnimation("Play01") ; #DEBUG_LINE_NO:41
    Else ; #DEBUG_LINE_NO:
      HomeShipArmillaryScreenREF.PlayAnimation("Stage2") ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
  ElseIf HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn as Form ; #DEBUG_LINE_NO:46
    HomeShipArmillaryScreenREF.PlayAnimation("Play02") ; #DEBUG_LINE_NO:47
  Else ; #DEBUG_LINE_NO:
    HomeShipArmillaryScreenREF.PlayAnimation("Stage1") ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
  If MQAlllowArmillaryGravDrive.GetValueInt() >= 1 && ArmillaryScreenTriggerREF.IsDisabled() ; #DEBUG_LINE_NO:54
    ArmillaryScreenTriggerREF.Enable(False) ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function PlaceArmillaryMessage()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:85
  Int ButtonPressed = MQPlaceArmillaryShipScreenMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:86
  ObjectReference ArmillaryREF = PlayerShipArmillary.GetRef() ; #DEBUG_LINE_NO:87
  ObjectReference HomeShipArmillaryScreenREF = HomeShipArmillaryScreen.GetRef() ; #DEBUG_LINE_NO:88
  If ButtonPressed == 1 ; #DEBUG_LINE_NO:89
    WwiseEvent_AMBArtifactArmillaryShipInstall.Play(PlayerREF as ObjectReference, None, None) ; #DEBUG_LINE_NO:90
    If HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn as Form ; #DEBUG_LINE_NO:91
      HomeShipArmillaryScreenREF.PlayAnimation("Play01") ; #DEBUG_LINE_NO:92
    Else ; #DEBUG_LINE_NO:
      HomeShipArmillaryScreenREF.PlayAnimation("Stage2") ; #DEBUG_LINE_NO:94
    EndIf ; #DEBUG_LINE_NO:
    ArmillaryREF.Enable(False) ; #DEBUG_LINE_NO:96
    (ArmillaryREF as armillaryscript).BuildArmillary(PlayerREF, Self.GetRef()) ; #DEBUG_LINE_NO:97
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ArmillaryInShipMessage()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:102
  Int ButtonPressed = MQRemoveArmillaryShipScreenMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:103
  ObjectReference ArmillaryREF = PlayerShipArmillary.GetRef() ; #DEBUG_LINE_NO:104
  ObjectReference HomeShipArmillaryScreenREF = HomeShipArmillaryScreen.GetRef() ; #DEBUG_LINE_NO:105
  If ButtonPressed == 1 ; #DEBUG_LINE_NO:106
    WwiseEvent_AMBArtifactArmillaryShipAddArtifact.Play(PlayerREF as ObjectReference, None, None) ; #DEBUG_LINE_NO:107
    If PlayerREF.GetItemCount(ObjectTypeMQArtifact as Form) > 0 ; #DEBUG_LINE_NO:108
      (ArmillaryREF as armillaryscript).BuildArmillary(PlayerREF, Self.GetRef()) ; #DEBUG_LINE_NO:109
    Else ; #DEBUG_LINE_NO:
      ArmillaryNoArtifactsAddedMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:111
    EndIf ; #DEBUG_LINE_NO:
  ElseIf ButtonPressed == 2 ; #DEBUG_LINE_NO:113
    WwiseEvent_AMBArtifactArmillaryShipUninstall.Play(PlayerREF as ObjectReference, None, None) ; #DEBUG_LINE_NO:114
    If HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn as Form ; #DEBUG_LINE_NO:115
      HomeShipArmillaryScreenREF.PlayAnimation("Play02") ; #DEBUG_LINE_NO:116
    Else ; #DEBUG_LINE_NO:
      HomeShipArmillaryScreenREF.PlayAnimation("Stage1") ; #DEBUG_LINE_NO:118
    EndIf ; #DEBUG_LINE_NO:
    (ArmillaryREF as armillaryscript).PackupArmillary(PlayerREF) ; #DEBUG_LINE_NO:120
    ArmillaryREF.Disable(False) ; #DEBUG_LINE_NO:121
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
Auto State AllowInputState

  Event OnActivate(ObjectReference akActionRef)
    Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:62
    ObjectReference ArmillaryMountOrScreenREF = MQ00_ArmillaryMountOrScreen.GetRef() ; #DEBUG_LINE_NO:63
    ObjectReference mySelfREF = Self.GetRef() ; #DEBUG_LINE_NO:64
    If akActionRef == PlayerREF as ObjectReference ; #DEBUG_LINE_NO:65
      If ArmillaryMountOrScreenREF == None ; #DEBUG_LINE_NO:66
        Self.PlaceArmillaryMessage() ; #DEBUG_LINE_NO:67
      ElseIf ArmillaryMountOrScreenREF == mySelfREF ; #DEBUG_LINE_NO:68
        Self.ArmillaryInShipMessage() ; #DEBUG_LINE_NO:69
      Else ; #DEBUG_LINE_NO:
        MQBlockArmillaryShipScreenMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:71
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.GotoState("AllowInputState") ; #DEBUG_LINE_NO:74
  EndEvent
EndState

;-- State -------------------------------------------
State ProcessingState

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState
