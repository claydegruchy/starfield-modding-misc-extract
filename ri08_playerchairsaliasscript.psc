ScriptName RI08_PlayerChairsAliasScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group OnEnterFurniture_GeneralCheck
  Int Property iStageToSet01 Auto Const
  Int Property iPreReqStage01 Auto Const
  Int Property iStartSceneStage Auto Const
EndGroup

Group OnEnterFurniture_ExtraCheckForRI08
  Int Property iStageToSet02 Auto Const
  Int Property iPreReqStage02 Auto Const
  Int Property iTurnOffStage02 Auto Const
EndGroup

Group OnActivate_CombatCheckStages
  Int Property iStageToSet03 Auto Const
  Int Property iPreReqStage03 Auto Const
EndGroup

Group Scenes
  Scene Property RI08_0910_Meeting_UlaruWinsScene Auto Const mandatory
  Scene Property RI08_0910_Meeting_MasakoWinsScene Auto Const mandatory
EndGroup

Group TrackingGlobals
  GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const mandatory
  GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const mandatory
  GlobalVariable Property RI05_UlaruDead Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnEnterFurniture(ObjectReference akSenderRef, Actor akActionRef)
  Quest OwningQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:36
  If akActionRef == Game.GetPlayer() ; #DEBUG_LINE_NO:38
    If OwningQuest.GetStageDone(iPreReqStage01) ; #DEBUG_LINE_NO:39
      OwningQuest.SetStage(iStageToSet01) ; #DEBUG_LINE_NO:40
    EndIf ; #DEBUG_LINE_NO:
    If OwningQuest.GetStageDone(iPreReqStage02) && !OwningQuest.GetStageDone(iTurnOffStage02) ; #DEBUG_LINE_NO:42
      OwningQuest.SetStage(iStageToSet02) ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
    If OwningQuest.GetStageDone(iStartSceneStage) ; #DEBUG_LINE_NO:45
      If RI05_Track_PlayerSidedWithMasako.GetValue() == 1.0 ; #DEBUG_LINE_NO:46
        RI08_0910_Meeting_MasakoWinsScene.Start() ; #DEBUG_LINE_NO:47
      Else ; #DEBUG_LINE_NO:
        RI08_0910_Meeting_UlaruWinsScene.Start() ; #DEBUG_LINE_NO:49
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:58
  Quest OwningQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:59
  If akActionRef == PlayerRef as ObjectReference ; #DEBUG_LINE_NO:61
    If OwningQuest.GetStageDone(iStageToSet03) ; #DEBUG_LINE_NO:63
      (OwningQuest as ri08_questscript).FreezeControlsMeeting() ; #DEBUG_LINE_NO:64
    EndIf ; #DEBUG_LINE_NO:
    If !PlayerRef.IsInCombat() && OwningQuest.GetStageDone(iPreReqStage03) ; #DEBUG_LINE_NO:67
      OwningQuest.SetStage(iStageToSet03) ; #DEBUG_LINE_NO:68
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
