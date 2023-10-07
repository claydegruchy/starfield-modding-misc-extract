ScriptName TestZachDungeon Extends ObjectReference

;-- Variables ---------------------------------------
Int CurrentLength
Int TotalLength

;-- Properties --------------------------------------
ObjectReference[] Property EntranceDoors Auto
ObjectReference[] Property StartMarkers Auto

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnInit()
  Self.Reinit() ; #DEBUG_LINE_NO:9
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  Int r = Utility.RandomInt(0, CurrentLength - 1) ; #DEBUG_LINE_NO:18
  Game.GetPlayer().moveto(StartMarkers[r], 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:20
  ObjectReference h = StartMarkers[r] ; #DEBUG_LINE_NO:22
  StartMarkers.remove(r, 1) ; #DEBUG_LINE_NO:23
  StartMarkers.add(h, 1) ; #DEBUG_LINE_NO:24
  CurrentLength -= 1 ; #DEBUG_LINE_NO:25
  If CurrentLength == 0 ; #DEBUG_LINE_NO:28
    Self.Reinit() ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function Reinit()
  Int I = 0 ; #DEBUG_LINE_NO:34
  While I < EntranceDoors.Length ; #DEBUG_LINE_NO:36
    Self.RegisterForRemoteEvent(EntranceDoors[I] as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:37
    I += 1 ; #DEBUG_LINE_NO:38
  EndWhile ; #DEBUG_LINE_NO:
  TotalLength = StartMarkers.Length ; #DEBUG_LINE_NO:40
  CurrentLength = StartMarkers.Length ; #DEBUG_LINE_NO:41
EndFunction
