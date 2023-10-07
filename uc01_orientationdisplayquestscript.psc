ScriptName UC01_OrientationDisplayQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TualaReads Auto mandatory
{ Alias used to manage Commander Tuala looking at his slate while the UCR quests spool up }
ReferenceAlias Property Tuala Auto Const mandatory
{ Ref alias for Commander Tuala }

;-- Functions ---------------------------------------

Function StartTualaAnimState()
  Actor TAct = Tuala.GetActorRef() ; #DEBUG_LINE_NO:10
  TualaReads.ForceRefTo(TAct as ObjectReference) ; #DEBUG_LINE_NO:11
  TAct.EvaluatePackage(False) ; #DEBUG_LINE_NO:12
EndFunction

Function SendHaltScenes(ObjectReference akSceneTarget)
  Var[] kargs = new Var[1] ; #DEBUG_LINE_NO:18
  kargs[0] = akSceneTarget as Var ; #DEBUG_LINE_NO:19
  Self.SendCustomEvent("uc01_orientationdisplayquestscript_HaltOrientationScenes", kargs) ; #DEBUG_LINE_NO:20
EndFunction
