ScriptName TestExplodingSeedPodTriggerScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool bPlayerInTrigger = False

;-- Properties --------------------------------------
ActorValue Property SpeedMult Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  bPlayerInTrigger = True ; #DEBUG_LINE_NO:8
  Self.AffectPlayer() ; #DEBUG_LINE_NO:9
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  bPlayerInTrigger = False ; #DEBUG_LINE_NO:13
  Self.AffectPlayer() ; #DEBUG_LINE_NO:14
EndEvent

Function AffectPlayer()
  inputenablelayer myLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:19
  If bPlayerInTrigger ; #DEBUG_LINE_NO:20
    Game.GetPlayer().SetValue(SpeedMult, 30.0) ; #DEBUG_LINE_NO:21
  ElseIf bPlayerInTrigger == False ; #DEBUG_LINE_NO:23
    Game.GetPlayer().SetValue(SpeedMult, 100.0) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndFunction
