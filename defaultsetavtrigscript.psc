ScriptName DefaultSetAVTrigScript Extends ObjectReference default
{ Default trigger script that can set the Actor Values (AVs) of one (or a chain of) linked actors when a trigger is entered. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  ActorValue Property AV01 Auto Const mandatory
  { First Actor Value to set. }
  Float Property AV01_Value Auto Const mandatory
  { First Actor Value's new value. }
EndGroup

Group Optional_Properties
  ActorValue Property AV02 Auto Const
  { Second Actor Value to set. }
  Float Property AV02_Value Auto Const
  { Second Actor Value's new value. }
  ActorValue Property AV03 Auto Const
  { Third Actor Value to set. }
  Float Property AV03_Value Auto Const
  { Third Actor Value's new value. }
  ActorValue Property AV04 Auto Const
  { Fourth Actor Value to set. }
  Float Property AV04_Value Auto Const
  { Fourth Actor Value's new value. }
  ActorValue Property AV05 Auto Const
  { Fifth Actor Value to set. }
  Float Property AV05_Value Auto Const
  { Fifth Actor Value's new value. }
  Bool Property onlyPlayer = True Auto Const
  { Default=TRUE. Only accept trigger events from the player? }
  Bool Property onlyOnce = True Auto Const
  { Default=TRUE. Only set AVs once? If True, disables and deletes the trigger when done. }
  Keyword Property linkKeyword Auto Const
  { Link Keyword for the actor (or chain of actors) whose AVs we're going to set. }
  Int Property maxLinks = 25 Auto Const
  { Maximum number of actors to set AVs on. Acts as a failsafe in case the actors are linked in a loop. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log. }
EndGroup


;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If !onlyPlayer || (akActionRef == Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:51
    Self.SetActorValues(Self.GetLinkedRef(linkKeyword) as Actor) ; #DEBUG_LINE_NO:52
    If onlyOnce ; #DEBUG_LINE_NO:53
      Self.Disable(False) ; #DEBUG_LINE_NO:54
      Self.Delete() ; #DEBUG_LINE_NO:55
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetActorValues(Actor akActor)
  Actor current = akActor ; #DEBUG_LINE_NO:62
  Int I = 0 ; #DEBUG_LINE_NO:63
  While current != None && I < maxLinks ; #DEBUG_LINE_NO:64
    If AV01 != None ; #DEBUG_LINE_NO:68
      current.SetValue(AV01, AV01_Value) ; #DEBUG_LINE_NO:70
    EndIf ; #DEBUG_LINE_NO:
    If AV02 != None ; #DEBUG_LINE_NO:72
      current.SetValue(AV02, AV02_Value) ; #DEBUG_LINE_NO:74
    EndIf ; #DEBUG_LINE_NO:
    If AV03 != None ; #DEBUG_LINE_NO:76
      current.SetValue(AV03, AV03_Value) ; #DEBUG_LINE_NO:78
    EndIf ; #DEBUG_LINE_NO:
    If AV04 != None ; #DEBUG_LINE_NO:80
      current.SetValue(AV04, AV04_Value) ; #DEBUG_LINE_NO:82
    EndIf ; #DEBUG_LINE_NO:
    If AV05 != None ; #DEBUG_LINE_NO:84
      current.SetValue(AV05, AV05_Value) ; #DEBUG_LINE_NO:86
    EndIf ; #DEBUG_LINE_NO:
    current.EvaluatePackage(False) ; #DEBUG_LINE_NO:90
    I += 1 ; #DEBUG_LINE_NO:92
    current = current.GetLinkedRef(linkKeyword) as Actor ; #DEBUG_LINE_NO:93
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
