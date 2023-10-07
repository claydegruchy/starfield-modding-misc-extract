ScriptName TestJeffBExplosivoScript Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference[] myArray
ObjectReference[] myTempArray
Int numExplosionMarkers = 0

;-- Properties --------------------------------------
Explosion Property myExplosion Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  numExplosionMarkers = Self.CountLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:14
  myArray = new ObjectReference[numExplosionMarkers] ; #DEBUG_LINE_NO:15
  myTempArray = new ObjectReference[numExplosionMarkers] ; #DEBUG_LINE_NO:16
  Int I = 0 ; #DEBUG_LINE_NO:18
  While I < numExplosionMarkers ; #DEBUG_LINE_NO:19
    myArray[I] = Self.getNthLinkedRef(I + 1, None) ; #DEBUG_LINE_NO:20
    I += 1 ; #DEBUG_LINE_NO:21
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Function RandomExplosions()
  Int I = 0 ; #DEBUG_LINE_NO:57
  While I < numExplosionMarkers ; #DEBUG_LINE_NO:59
    Int rand = Utility.randomint(0, myArray.Length - 1) ; #DEBUG_LINE_NO:60
    myTempArray[I] = myArray[rand] ; #DEBUG_LINE_NO:61
    myArray.remove(rand, 1) ; #DEBUG_LINE_NO:62
    I += 1 ; #DEBUG_LINE_NO:63
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:66
  While I < numExplosionMarkers ; #DEBUG_LINE_NO:68
    myArray.add(myTempArray[I], 1) ; #DEBUG_LINE_NO:69
    I += 1 ; #DEBUG_LINE_NO:70
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State DoNothing

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.getPlayer() as ObjectReference ; #DEBUG_LINE_NO:29
      Self.GotoState("DoNothing") ; #DEBUG_LINE_NO:30
      Self.RandomExplosions() ; #DEBUG_LINE_NO:31
      Int I = 0 ; #DEBUG_LINE_NO:32
      While I < numExplosionMarkers ; #DEBUG_LINE_NO:33
        myArray[I].placeatme(myExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:34
        Float rand = Utility.RandomFloat(0.5, 3.0) ; #DEBUG_LINE_NO:35
        Utility.Wait(rand) ; #DEBUG_LINE_NO:36
        I += 1 ; #DEBUG_LINE_NO:37
      EndWhile ; #DEBUG_LINE_NO:
      Self.GotoState("Waiting") ; #DEBUG_LINE_NO:39
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
