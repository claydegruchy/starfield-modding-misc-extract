ScriptName RI07_DeMarcusAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iStageToSet Auto Const
Int Property iPreReqStage Auto Const
Int Property iTurnOffStage Auto Const
MagicEffect Property SocialSkill_Manipulation Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForMagicEffectApplyEvent(Self as ScriptObject, None, SocialSkill_Manipulation as Form, True) ; #DEBUG_LINE_NO:10
EndEvent

Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)
  If akEffect == SocialSkill_Manipulation ; #DEBUG_LINE_NO:15
    Quest OwningQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:17
    If OwningQuest.GetStageDone(iPreReqStage) && !OwningQuest.GetStageDone(iTurnOffStage) ; #DEBUG_LINE_NO:19
      OwningQuest.SetStage(iStageToSet) ; #DEBUG_LINE_NO:20
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
