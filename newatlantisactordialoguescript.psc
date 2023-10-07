ScriptName NewAtlantisActorDialogueScript Extends Actor conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property HoursPassed_LastInteraction Auto conditional
GlobalVariable Property HoursPassed Auto conditional Const
ActorValue Property DialogueVersion Auto conditional Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference AkActionRef)
  Int CurrentVersion = Self.GetValue(DialogueVersion) as Int ; #DEBUG_LINE_NO:12
  If HoursPassed_LastInteraction + 1.0 < HoursPassed.GetValue() ; #DEBUG_LINE_NO:14
    Self.SetValue(DialogueVersion, (CurrentVersion + 1) as Float) ; #DEBUG_LINE_NO:15
    HoursPassed_LastInteraction = HoursPassed.GetValue() ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndEvent
