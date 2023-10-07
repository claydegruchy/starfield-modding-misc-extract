ScriptName TargetingSkillPlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard MyGuard

;-- Properties --------------------------------------
ActorValue Property TargetCountAV Auto Const mandatory

;-- Functions ---------------------------------------

Bool Function TryToModifyTargetCount(Int targetCountModifier, Int MaxTargetCount)
  Guard MyGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:8
    Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:10
    Float currentCount = player.GetValue(TargetCountAV) ; #DEBUG_LINE_NO:11
    Bool shouldmodify = True ; #DEBUG_LINE_NO:12
    If targetCountModifier > 0 ; #DEBUG_LINE_NO:14
      shouldmodify = currentCount < MaxTargetCount as Float ; #DEBUG_LINE_NO:15
    Else ; #DEBUG_LINE_NO:
      shouldmodify = currentCount > 0.0 ; #DEBUG_LINE_NO:17
    EndIf ; #DEBUG_LINE_NO:
    If shouldmodify ; #DEBUG_LINE_NO:20
      player.SetValue(TargetCountAV, currentCount + targetCountModifier as Float) ; #DEBUG_LINE_NO:21
    EndIf ; #DEBUG_LINE_NO:
    Return shouldmodify ; #DEBUG_LINE_NO:24
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction
