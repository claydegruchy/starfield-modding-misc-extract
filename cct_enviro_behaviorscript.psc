ScriptName CCT_Enviro_BehaviorScript Extends Quest Const
{ optional script for CCT_Enviro quests }

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard abilityGuard

;-- Properties --------------------------------------
ReferenceAlias Property BehaviorActor Auto Const mandatory
{ behavior actor alias }
Spell Property BehaviorAbility Auto Const
{ optional ability to apply via function call }

;-- Functions ---------------------------------------

Function ApplyBehaviorAbility(Bool bApply)
  If BehaviorAbility ; #DEBUG_LINE_NO:13
    Guard abilityGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:14
      Actor behaviorActorRef = BehaviorActor.GetActorRef() ; #DEBUG_LINE_NO:15
      If bApply ; #DEBUG_LINE_NO:16
        behaviorActorRef.AddSpell(BehaviorAbility, True) ; #DEBUG_LINE_NO:17
      Else ; #DEBUG_LINE_NO:
        behaviorActorRef.RemoveSpell(BehaviorAbility) ; #DEBUG_LINE_NO:19
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
