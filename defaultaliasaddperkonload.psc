ScriptName DefaultAliasAddPerkOnLoad Extends ReferenceAlias default
{ Adds the specified perk to the actor on load. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property PerkToAdd Auto Const
{ The perk that should be added to the actor upon load. }
Bool Property doOnce = True Auto Const
{ Whether the Perk should only be added on first load. Default=TRUE }

;-- State -------------------------------------------
State Done

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Ready

  Event OnLoad()
    Actor myActor = Self.GetActorRef() ; #DEBUG_LINE_NO:12
    If myActor != None ; #DEBUG_LINE_NO:13
      myActor.AddPerk(PerkToAdd, False) ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
    If doOnce ; #DEBUG_LINE_NO:16
      Self.GoToState("Done") ; #DEBUG_LINE_NO:17
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
