ScriptName TestBleedoutRecovery Extends Actor

;-- Variables ---------------------------------------
Bool bDownNPC

;-- Properties --------------------------------------
ActorValue Property Health Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If !bDownNPC ; #DEBUG_LINE_NO:8
    Self.SetNoBleedoutRecovery(False) ; #DEBUG_LINE_NO:9
    Self.DamageValue(Health, 10000.0) ; #DEBUG_LINE_NO:10
    bDownNPC = True ; #DEBUG_LINE_NO:11
  Else ; #DEBUG_LINE_NO:
    bDownNPC = False ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndEvent
