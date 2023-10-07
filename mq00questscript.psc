ScriptName MQ00QuestScript Extends Quest

;-- Structs -----------------------------------------
Struct VisionStruct
  wwiseevent VisionWWiseEvent
  String VisionBink
EndStruct


;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ArmillaryPlacedOrRemovedGuardWorkshop

;-- Properties --------------------------------------
Quest Property MQ204 Auto Const mandatory
Quest Property MQ404 Auto Const mandatory
Quest Property MQ305 Auto Const mandatory
Int Property MQ204_PlayerSecuresArmillaryStage = 620 Auto Const
Int Property MQ204_PlayerSecuresArmillaryPrereqStage = 510 Auto Const
Int Property MQ404_PlayerSecuresArmillaryStage = 120 Auto Const
Int Property MQ404_PlayerSecuresArmillaryPrereqStage = 110 Auto Const
ReferenceAlias Property MQ00_Armillary Auto Const mandatory
ReferenceAlias Property MQ00_ArmillaryMountOrScreen Auto Const mandatory
ReferenceAlias Property MQ00_ArmillaryWorkshop Auto Const mandatory
ActorValue Property MQ_ArmillaryResourceAV Auto Const mandatory
Int Property ArmillaryTimerID = 20 Auto Const
GlobalVariable Property MQArmillaryLocation Auto Const mandatory
GlobalVariable Property ArtifactVisionNumber Auto Const mandatory
Int Property MQ104ATimerID = 30 Auto Const
Int Property MQ104BTimerID = 40 Auto Const
Int Property MQ201TimerID = 50 Auto Const
Int Property MQ207BTimerID = 60 Auto Const
Quest Property MQ102 Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
Quest Property MQ104B Auto Const mandatory
Quest Property MQ106 Auto Const mandatory
Quest Property MQ201 Auto Const mandatory
Quest Property MQ207 Auto Const mandatory
Quest Property MQ207B Auto Const mandatory
Float Property QuestCheckTimerLength = 3.0 Auto Const
mq00questscript:visionstruct[] Property VisionArray Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTimer(Int aiTimerID)
  If aiTimerID == ArmillaryTimerID ; #DEBUG_LINE_NO:39
    ObjectReference ArmillaryWorkshopREF = MQ00_ArmillaryWorkshop.GetRef() ; #DEBUG_LINE_NO:41
    ObjectReference[] ArmillaryObjects = ArmillaryWorkshopREF.GetWorkshopResourceObjects(MQ_ArmillaryResourceAV, 0) ; #DEBUG_LINE_NO:42
    Self.ArmillaryPlacedOrRemoved(ArmillaryObjects[0], ArmillaryWorkshopREF) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
  If aiTimerID == MQ104ATimerID ; #DEBUG_LINE_NO:47
    Self.MQ00QuestFailsafe(MQ104A, MQ104ATimerID) ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
  If aiTimerID == MQ104BTimerID ; #DEBUG_LINE_NO:51
    Self.MQ00QuestFailsafe(MQ104B, MQ104BTimerID) ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
  If aiTimerID == MQ201TimerID ; #DEBUG_LINE_NO:55
    Self.MQ00QuestFailsafe(MQ201, MQ201TimerID) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
  If aiTimerID == MQ207BTimerID ; #DEBUG_LINE_NO:59
    Self.MQ00QuestFailsafe(MQ207B, MQ207BTimerID) ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function MQ00QuestFailsafe(Quest QuestToStart, Int iQuestTimer)
  If QuestToStart.IsCompleted() == False && QuestToStart.IsRunning() == False ; #DEBUG_LINE_NO:66
    Bool bQuestHasStarted = QuestToStart.Start() ; #DEBUG_LINE_NO:67
    If bQuestHasStarted == False ; #DEBUG_LINE_NO:68
      Self.StartTimer(QuestCheckTimerLength, iQuestTimer) ; #DEBUG_LINE_NO:70
    Else ; #DEBUG_LINE_NO:
      QuestToStart.SetStage(10) ; #DEBUG_LINE_NO:73
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartArmillaryTimer(ObjectReference akReference)
  MQ00_ArmillaryWorkshop.ForceRefTo(akReference) ; #DEBUG_LINE_NO:79
  Self.StartTimer(0.5, ArmillaryTimerID) ; #DEBUG_LINE_NO:80
EndFunction

Function StartMQ104AFailsafeTimer()
  Self.StartTimer(QuestCheckTimerLength, MQ104ATimerID) ; #DEBUG_LINE_NO:84
EndFunction

Function StartMQ104BFailsafeTimer()
  Self.StartTimer(QuestCheckTimerLength, MQ104BTimerID) ; #DEBUG_LINE_NO:88
EndFunction

Function StartMQ201FailsafeTimer()
  Self.StartTimer(QuestCheckTimerLength, MQ201TimerID) ; #DEBUG_LINE_NO:92
EndFunction

Function StartMQ207BFailsafeTimer()
  Self.StartTimer(QuestCheckTimerLength, MQ207BTimerID) ; #DEBUG_LINE_NO:96
EndFunction

Function ArmillaryPlacedOrRemoved(ObjectReference akReference, ObjectReference akWorkshopRef)
  Guard ArmillaryPlacedOrRemovedGuardWorkshop ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:101
    If akWorkshopRef.GetValue(MQ_ArmillaryResourceAV) == 0.0 ; #DEBUG_LINE_NO:103
      Self.ArmillaryRemoved() ; #DEBUG_LINE_NO:104
    Else ; #DEBUG_LINE_NO:
      Self.ArmillaryPlaced(akReference.GetLinkedRef(None), akReference) ; #DEBUG_LINE_NO:106
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function ArmillaryRemoved()
  spaceshipreference ArmillaryShipREF = MQ00_Armillary.GetRef().GetCurrentShipRef() ; #DEBUG_LINE_NO:112
  Self.UnRegisterForRemoteEvent(ArmillaryShipREF as ScriptObject, "OnShipSold") ; #DEBUG_LINE_NO:113
  Self.UnRegisterForRemoteEvent(ArmillaryShipREF as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:114
  MQ00_ArmillaryMountOrScreen.GetRef().PlayAnimation("Play02") ; #DEBUG_LINE_NO:116
  MQ00_Armillary.Clear() ; #DEBUG_LINE_NO:118
  MQ00_ArmillaryMountOrScreen.Clear() ; #DEBUG_LINE_NO:119
  If MQ305.IsRunning() ; #DEBUG_LINE_NO:121
    (MQ305 as mq305script).ArmillaryRemoved() ; #DEBUG_LINE_NO:122
  EndIf ; #DEBUG_LINE_NO:
  MQArmillaryLocation.SetValueInt(0) ; #DEBUG_LINE_NO:124
EndFunction

Function ArmillaryPlaced(ObjectReference akArmillary, ObjectReference akMountOrScreen)
  MQ00_Armillary.ForceRefTo(akArmillary) ; #DEBUG_LINE_NO:130
  MQ00_ArmillaryMountOrScreen.ForceRefTo(akMountOrScreen) ; #DEBUG_LINE_NO:131
  If akMountOrScreen.GetCurrentShipRef() != None ; #DEBUG_LINE_NO:134
    MQArmillaryLocation.SetValueInt(1) ; #DEBUG_LINE_NO:135
  Else ; #DEBUG_LINE_NO:
    MQArmillaryLocation.SetValueInt(2) ; #DEBUG_LINE_NO:137
  EndIf ; #DEBUG_LINE_NO:
  If MQ204.IsRunning() && MQ204.GetStageDone(MQ204_PlayerSecuresArmillaryStage) == False && MQ204.GetStageDone(MQ204_PlayerSecuresArmillaryPrereqStage) == True ; #DEBUG_LINE_NO:141
    MQ204.SetStage(MQ204_PlayerSecuresArmillaryStage) ; #DEBUG_LINE_NO:142
  EndIf ; #DEBUG_LINE_NO:
  If MQ404.IsRunning() && MQ404.GetStageDone(MQ204_PlayerSecuresArmillaryStage) == False && MQ404.GetStageDone(MQ404_PlayerSecuresArmillaryPrereqStage) == True ; #DEBUG_LINE_NO:146
    MQ404.SetStage(MQ404_PlayerSecuresArmillaryStage) ; #DEBUG_LINE_NO:147
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PlayArtifactVision()
  Int iVisionsDone = ArtifactVisionNumber.GetValueInt() ; #DEBUG_LINE_NO:153
  wwiseevent myAudio = VisionArray[iVisionsDone].VisionWWiseEvent ; #DEBUG_LINE_NO:154
  String myBink = VisionArray[iVisionsDone].VisionBink ; #DEBUG_LINE_NO:155
  myAudio.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:157
  Game.PlayBink(myBink, False, False, False, True, False) ; #DEBUG_LINE_NO:158
  iVisionsDone += 1 ; #DEBUG_LINE_NO:160
  ArtifactVisionNumber.SetValueInt(iVisionsDone) ; #DEBUG_LINE_NO:161
EndFunction

Function PlayArtifactVisionNoWait()
  Int iVisionsDone = ArtifactVisionNumber.GetValueInt() ; #DEBUG_LINE_NO:165
  wwiseevent myAudio = VisionArray[iVisionsDone].VisionWWiseEvent ; #DEBUG_LINE_NO:166
  String myBink = VisionArray[iVisionsDone].VisionBink ; #DEBUG_LINE_NO:167
  myAudio.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:169
  Game.PlayBinkNoWait(myBink, False, False, False, True, False, True) ; #DEBUG_LINE_NO:170
  iVisionsDone += 1 ; #DEBUG_LINE_NO:172
  ArtifactVisionNumber.SetValueInt(iVisionsDone) ; #DEBUG_LINE_NO:173
EndFunction
