ScriptName RI07_PlayerChairsAliasScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group OnEnterFurniture_GeneralCheck
  Int Property iStageToSet01 Auto Const
  Int Property iPreReqStage01 Auto Const
  Int Property iStartSceneStage Auto Const
EndGroup

Group OnActivate_CombatCheckStages
  Int Property iStageToSet03 Auto Const
  Int Property iPreReqStage03 Auto Const
EndGroup

Group Scenes
  Scene Property RI07_0400_Dalton_ConferenceRoomBScene Auto Const mandatory
  Scene Property RI07_0400_Dalton_ConferenceRoomACScene Auto Const mandatory
EndGroup

Group TrackingGlobals
  GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const mandatory
  GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const mandatory
  GlobalVariable Property RI05_UlaruDead Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnEnterFurniture(ObjectReference akSenderRef, Actor akActionRef)
  Quest OwningQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:24
  If akActionRef == Game.GetPlayer() ; #DEBUG_LINE_NO:26
    If OwningQuest.GetStageDone(iPreReqStage01) ; #DEBUG_LINE_NO:27
      OwningQuest.SetStage(iStageToSet01) ; #DEBUG_LINE_NO:28
    EndIf ; #DEBUG_LINE_NO:
    If OwningQuest.GetStageDone(iStartSceneStage) ; #DEBUG_LINE_NO:31
      If RI05_Track_PlayerSidedWithMasako.GetValue() == 1.0 && RI05_UlaruDead.GetValue() == 0.0 || RI05_Track_PlayerSidedWithUlaru.GetValue() == 1.0 ; #DEBUG_LINE_NO:32
        RI07_0400_Dalton_ConferenceRoomACScene.Start() ; #DEBUG_LINE_NO:33
      EndIf ; #DEBUG_LINE_NO:
      If RI05_Track_PlayerSidedWithMasako.GetValue() == 1.0 && RI05_UlaruDead.GetValue() == 1.0 ; #DEBUG_LINE_NO:36
        RI07_0400_Dalton_ConferenceRoomBScene.Start() ; #DEBUG_LINE_NO:37
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:47
  Quest OwningQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:48
  If akActionRef == PlayerRef as ObjectReference ; #DEBUG_LINE_NO:50
    If OwningQuest.GetStageDone(iStageToSet03) ; #DEBUG_LINE_NO:52
      (OwningQuest as ri07_questscript).FreezeControlsMeeting() ; #DEBUG_LINE_NO:53
    EndIf ; #DEBUG_LINE_NO:
    If !PlayerRef.IsInCombat() && OwningQuest.GetStageDone(iPreReqStage03) ; #DEBUG_LINE_NO:56
      OwningQuest.SetStage(iStageToSet03) ; #DEBUG_LINE_NO:57
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
