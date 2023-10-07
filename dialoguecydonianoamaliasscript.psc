ScriptName DialogueCydoniaNoamAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Health Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Actor myActor = Self.GetActorRef() ; #DEBUG_LINE_NO:6
  myActor.SetEssential(True) ; #DEBUG_LINE_NO:7
  myActor.SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:8
  myActor.AllowBleedoutDialogue(True) ; #DEBUG_LINE_NO:9
  Float fHealth = myActor.GetValue(Health) ; #DEBUG_LINE_NO:10
  myActor.DamageValue(Health, fHealth + 100.0) ; #DEBUG_LINE_NO:11
EndEvent
