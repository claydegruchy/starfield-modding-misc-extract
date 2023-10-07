ScriptName LC012NASAGravTrigger Extends ObjectReference Const
{ Set the Gravity for the cell on trigger enter }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Cell Property LC017NASA Auto Const mandatory
Float Property NewGravity Auto Const mandatory
Quest Property MQ301 Auto Const
Int Property TutorialStage = 147 Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.getplayer() as ObjectReference ; #DEBUG_LINE_NO:11
    LC017NASA.setGravityScale(NewGravity) ; #DEBUG_LINE_NO:12
    If MQ301.GetStageDone(TutorialStage) == False && NewGravity == 0.0 ; #DEBUG_LINE_NO:13
      MQ301.SetStage(TutorialStage) ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
    If NewGravity == 0.0 ; #DEBUG_LINE_NO:18
      ObjectReference DummyMarker = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:19
      ObjectReference[] LinkedRefs = None ; #DEBUG_LINE_NO:21
      LinkedRefs = DummyMarker.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:22
      Int I = 0 ; #DEBUG_LINE_NO:24
      While I < LinkedRefs.Length ; #DEBUG_LINE_NO:25
        LinkedRefs[I].ApplyHavokImpulse(Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), (LinkedRefs[I].GetMass() * Utility.RandomInt(1, 2) as Float) * 0.25) ; #DEBUG_LINE_NO:26
        I += 1 ; #DEBUG_LINE_NO:28
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
