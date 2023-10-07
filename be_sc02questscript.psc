ScriptName BE_SC02QuestScript Extends Quest
{ Script for BE_SC02, Mutiny. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group QuestProperties
  VoiceType[] Property MutineersWhoKillCaptain Auto Const mandatory
EndGroup

Group AutofillProperties collapsedonbase
  reparentscript Property RE_Parent Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  ReferenceAlias Property Captain Auto Const mandatory
  ReferenceAlias Property Mutineer Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function SetupCaptain()
  Actor captainRef = Captain.GetActorRef() ; #DEBUG_LINE_NO:19
  If MutineersWhoKillCaptain.find(Mutineer.GetActorRef().GetVoicetype(), 0) >= 0 ; #DEBUG_LINE_NO:20
    RE_Parent.KillWithForce(captainRef, None, True) ; #DEBUG_LINE_NO:21
  Else ; #DEBUG_LINE_NO:
    captainRef.DamageValue(Health, captainRef.GetValue(Health) - 1.0) ; #DEBUG_LINE_NO:23
    captainRef.SetRestrained(True) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndFunction
