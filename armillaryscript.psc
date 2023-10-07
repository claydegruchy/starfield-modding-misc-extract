ScriptName ArmillaryScript Extends ObjectReference

;-- Structs -----------------------------------------
Struct ArtifactStruct
  MiscObject ArtifactMiscObject
  String ArtifactAnimation = "None"
  Bool IsArtifactAdded
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
armillaryscript:artifactstruct[] Property ArtifactArray Auto
RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const mandatory
Quest Property MQ305 Auto Const mandatory
GlobalVariable Property MQArmillaryCompleteGlobal Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Location Property CityNewAtlantisLodgeLocation Auto Const mandatory
Int Property ArmillaryTogetherStage = 1635 Auto Const
Quest Property MQ00 Auto Const mandatory
ReferenceAlias Property Artifact01QuestObject Auto Const mandatory
ReferenceAlias Property Artifact02QuestObject Auto Const mandatory
conditionform Property MQ104AArtifactCollectionActivateCheck Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.IsDisabled() == False ; #DEBUG_LINE_NO:22
    Self.AssembleArmillary() ; #DEBUG_LINE_NO:23
    If Self.IsInLocation(CityNewAtlantisLodgeLocation) && MQ101.GetStageDone(ArmillaryTogetherStage) == False && MQ101.IsRunning() ; #DEBUG_LINE_NO:26
      Self.PlayAnimation("AlphaStart") ; #DEBUG_LINE_NO:27
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function AssembleArmillary()
  Self.SetAnimationVariableBool("IsInstantInit", True) ; #DEBUG_LINE_NO:36
  Int currentElement = 0 ; #DEBUG_LINE_NO:38
  Bool ArmillaryOpened = False ; #DEBUG_LINE_NO:39
  While currentElement < ArtifactArray.Length ; #DEBUG_LINE_NO:40
    String CurrentAnimation = ArtifactArray[currentElement].ArtifactAnimation ; #DEBUG_LINE_NO:41
    Bool CurrentIsArtifactAdded = ArtifactArray[currentElement].IsArtifactAdded ; #DEBUG_LINE_NO:42
    If CurrentIsArtifactAdded ; #DEBUG_LINE_NO:44
      If ArmillaryOpened == False ; #DEBUG_LINE_NO:45
        Self.PlayAnimation("AlphaStart") ; #DEBUG_LINE_NO:46
        Self.PlayAnimation("Open") ; #DEBUG_LINE_NO:47
        ArmillaryOpened = True ; #DEBUG_LINE_NO:48
      EndIf ; #DEBUG_LINE_NO:
      If CurrentAnimation != "None" ; #DEBUG_LINE_NO:50
        Self.PlayAnimation(CurrentAnimation) ; #DEBUG_LINE_NO:51
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    currentElement += 1 ; #DEBUG_LINE_NO:55
  EndWhile ; #DEBUG_LINE_NO:
  Self.SetAnimationVariableBool("IsInstantInit", False) ; #DEBUG_LINE_NO:59
EndFunction

Function BuildArmillary(Actor akActorREF, ObjectReference akMountOrScreen)
  If MQ305.IsRunning() ; #DEBUG_LINE_NO:64
    MQ305.SetStage(40) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
  Self.PlayAnimation("Open") ; #DEBUG_LINE_NO:69
  Int currentElement = 0 ; #DEBUG_LINE_NO:72
  While currentElement < ArtifactArray.Length ; #DEBUG_LINE_NO:73
    MiscObject CurrentArtifactObject = ArtifactArray[currentElement].ArtifactMiscObject ; #DEBUG_LINE_NO:74
    String CurrentAnimation = ArtifactArray[currentElement].ArtifactAnimation ; #DEBUG_LINE_NO:75
    Bool CurrentIsArtifactAdded = ArtifactArray[currentElement].IsArtifactAdded ; #DEBUG_LINE_NO:76
    If akActorREF.GetItemCount(CurrentArtifactObject as Form) >= 1 ; #DEBUG_LINE_NO:78
      Bool SkipCurrentArtifact = False ; #DEBUG_LINE_NO:79
      If !MQ104AArtifactCollectionActivateCheck.IsTrue(None, None) && ((Artifact01QuestObject.GetRef().GetBaseObject() == CurrentArtifactObject as Form) || (Artifact02QuestObject.GetRef().GetBaseObject() == CurrentArtifactObject as Form)) ; #DEBUG_LINE_NO:81
        SkipCurrentArtifact = True ; #DEBUG_LINE_NO:82
      EndIf ; #DEBUG_LINE_NO:
      If !SkipCurrentArtifact ; #DEBUG_LINE_NO:85
        akActorREF.RemoveItem(CurrentArtifactObject as Form, 9999, True, None) ; #DEBUG_LINE_NO:86
        If CurrentAnimation != "None" ; #DEBUG_LINE_NO:87
          Self.PlayAnimation(CurrentAnimation) ; #DEBUG_LINE_NO:88
        EndIf ; #DEBUG_LINE_NO:
        ArtifactArray[currentElement].IsArtifactAdded = True ; #DEBUG_LINE_NO:90
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If MQ305.IsRunning() ; #DEBUG_LINE_NO:95
      If ArtifactArray[currentElement].IsArtifactAdded == False ; #DEBUG_LINE_NO:96
        Self.PlayAnimation(CurrentAnimation) ; #DEBUG_LINE_NO:97
        ArtifactArray[currentElement].IsArtifactAdded = True ; #DEBUG_LINE_NO:98
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    currentElement += 1 ; #DEBUG_LINE_NO:102
  EndWhile ; #DEBUG_LINE_NO:
  MQ00_ArtifactsHolder.RemoveAll() ; #DEBUG_LINE_NO:104
  Self.CheckArmillaryComplete() ; #DEBUG_LINE_NO:105
  If akMountOrScreen != None ; #DEBUG_LINE_NO:106
    (MQ00 as mq00questscript).ArmillaryPlaced(Self as ObjectReference, akMountOrScreen) ; #DEBUG_LINE_NO:107
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function BuildCompleteArmillary()
  Int currentElement = 0 ; #DEBUG_LINE_NO:113
  While currentElement < ArtifactArray.Length ; #DEBUG_LINE_NO:114
    String CurrentAnimation = ArtifactArray[currentElement].ArtifactAnimation ; #DEBUG_LINE_NO:115
    Self.PlayAnimation(CurrentAnimation) ; #DEBUG_LINE_NO:116
    currentElement += 1 ; #DEBUG_LINE_NO:117
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function CheckArmillaryComplete()
  Int iArtifactsCollected = 0 ; #DEBUG_LINE_NO:123
  Int iMaxArtifacts = ArtifactArray.Length ; #DEBUG_LINE_NO:124
  Int currentElement = 0 ; #DEBUG_LINE_NO:125
  While currentElement < ArtifactArray.Length ; #DEBUG_LINE_NO:126
    Bool CurrentIsArtifactAdded = ArtifactArray[currentElement].IsArtifactAdded ; #DEBUG_LINE_NO:127
    If CurrentIsArtifactAdded ; #DEBUG_LINE_NO:129
      iArtifactsCollected += 1 ; #DEBUG_LINE_NO:130
    EndIf ; #DEBUG_LINE_NO:
    currentElement += 1 ; #DEBUG_LINE_NO:133
  EndWhile ; #DEBUG_LINE_NO:
  If iArtifactsCollected >= iMaxArtifacts ; #DEBUG_LINE_NO:136
    MQArmillaryCompleteGlobal.SetValueInt(1) ; #DEBUG_LINE_NO:138
  Else ; #DEBUG_LINE_NO:
    MQArmillaryCompleteGlobal.SetValueInt(0) ; #DEBUG_LINE_NO:140
  EndIf ; #DEBUG_LINE_NO:
  If MQ305.IsRunning() ; #DEBUG_LINE_NO:143
    Int iArmillaryComplete = MQArmillaryCompleteGlobal.GetValueInt() ; #DEBUG_LINE_NO:145
    (MQ305 as mq305script).ArmillaryPlaced(iArmillaryComplete) ; #DEBUG_LINE_NO:146
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PackupArmillary(Actor akActorREF)
  Int currentElement = 0 ; #DEBUG_LINE_NO:152
  While currentElement < ArtifactArray.Length ; #DEBUG_LINE_NO:153
    MiscObject CurrentArtifactObject = ArtifactArray[currentElement].ArtifactMiscObject ; #DEBUG_LINE_NO:154
    Bool CurrentIsArtifactAdded = ArtifactArray[currentElement].IsArtifactAdded ; #DEBUG_LINE_NO:155
    If CurrentIsArtifactAdded == True ; #DEBUG_LINE_NO:157
      akActorREF.AddAliasedItem(CurrentArtifactObject as Form, MQ00_ArtifactsHolder as Alias, 1, True) ; #DEBUG_LINE_NO:158
      ArtifactArray[currentElement].IsArtifactAdded = False ; #DEBUG_LINE_NO:159
    EndIf ; #DEBUG_LINE_NO:
    currentElement += 1 ; #DEBUG_LINE_NO:162
  EndWhile ; #DEBUG_LINE_NO:
  Self.PlayAnimation("Close") ; #DEBUG_LINE_NO:166
  MQArmillaryCompleteGlobal.SetValueInt(0) ; #DEBUG_LINE_NO:167
  (MQ00 as mq00questscript).ArmillaryRemoved() ; #DEBUG_LINE_NO:168
EndFunction

Function MQ101ArmillaryComesTogether()
  Self.PlayAnimation("Activate") ; #DEBUG_LINE_NO:173
  ArtifactArray[0].IsArtifactAdded = True ; #DEBUG_LINE_NO:175
  ArtifactArray[5].IsArtifactAdded = True ; #DEBUG_LINE_NO:176
  ArtifactArray[18].IsArtifactAdded = True ; #DEBUG_LINE_NO:177
EndFunction

Function DebugSetArtifactAdded(Int iArtifactNumber)
  ArtifactArray[iArtifactNumber].IsArtifactAdded = True ; #DEBUG_LINE_NO:181
EndFunction
