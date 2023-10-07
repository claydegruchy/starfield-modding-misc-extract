ScriptName COM_Quest_Andreja_Q01_TomisarScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Andreja Auto Const
Quest Property COM_Quest_Andreja_Q01 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForHitEvent(Self as ScriptObject, Alias_Andreja.GetRef() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:11
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akAggressor == Alias_Andreja.GetActorRef() as ObjectReference ; #DEBUG_LINE_NO:21
    (akTarget as Actor).Kill(None) ; #DEBUG_LINE_NO:22
    COM_Quest_Andreja_Q01.SetStage(395) ; #DEBUG_LINE_NO:23
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForHitEvent(Self as ScriptObject, Alias_Andreja.GetRef() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDeath(ObjectReference AkKiller)
  If COM_Quest_Andreja_Q01.GetStageDone(395) == False ; #DEBUG_LINE_NO:35
    If COM_Quest_Andreja_Q01.GetStageDone(375) == False ; #DEBUG_LINE_NO:42
      COM_Quest_Andreja_Q01.SetStage(399) ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  COM_Quest_Andreja_Q01.SetStage(400) ; #DEBUG_LINE_NO:49
EndEvent
