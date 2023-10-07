ScriptName LC017_RobotDeath Extends Actor Const
{ Set Linked References to Unconcious On Death }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkRobotToTurret Auto Const

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  ObjectReference[] LinkedRefs = None ; #DEBUG_LINE_NO:7
  If LinkRobotToTurret ; #DEBUG_LINE_NO:8
    LinkedRefs = Self.GetLinkedRefChain(LinkRobotToTurret, 100) ; #DEBUG_LINE_NO:9
  Else ; #DEBUG_LINE_NO:
    LinkedRefs = Self.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:14
  While I < LinkedRefs.Length ; #DEBUG_LINE_NO:15
    (LinkedRefs[I] as Actor).SetUnconscious(True) ; #DEBUG_LINE_NO:16
    I += 1 ; #DEBUG_LINE_NO:17
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
