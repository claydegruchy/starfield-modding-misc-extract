ScriptName DefaultTopicInfoSetActorValue Extends TopicInfo Const default
{ Sets or mods an actor value on the topic info target and/or on the player }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Data
  Bool Property OnEnd = True Auto Const
  { Set to true if you want this to fire on the of the line. Otherwise, it'll trigger on start }
  Bool Property SetOnSpeaker = True Auto Const
  { Set to true if you want the value to be set on the line's speaker. }
  Bool Property SetOnPlayer = False Auto Const
  { Set to true if you want the value to be set on the line's player.

NOTE: topic infos in scenes will NOT have a target. }
  ActorValue Property ValueToModify Auto Const mandatory
  { The Actor Value to set }
  Float Property NewValue = 1.0 Auto Const
  { The new value for the given actor value }
  Bool Property SetActorValueToNewValue = True Auto Const
  { TRUE = will call SetValue(ValueToModify, newValue)
                FALSE = will call ModValue(ValueToModify, newValue) }
EndGroup


;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If !OnEnd ; #DEBUG_LINE_NO:31
    Self.HandleActorValueChange(akSpeakerRef) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If OnEnd ; #DEBUG_LINE_NO:38
    Self.HandleActorValueChange(akSpeakerRef) ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function HandleActorValueChange(ObjectReference akSpeakerRef)
  If SetOnSpeaker ; #DEBUG_LINE_NO:45
    Self.ChangeActorValue(akSpeakerRef) ; #DEBUG_LINE_NO:46
  EndIf ; #DEBUG_LINE_NO:
  If SetOnPlayer ; #DEBUG_LINE_NO:49
    Self.ChangeActorValue(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ChangeActorValue(ObjectReference refToModify)
  If SetActorValueToNewValue ; #DEBUG_LINE_NO:56
    refToModify.SetValue(ValueToModify, NewValue) ; #DEBUG_LINE_NO:57
  Else ; #DEBUG_LINE_NO:
    refToModify.ModValue(ValueToModify, NewValue) ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
EndFunction
