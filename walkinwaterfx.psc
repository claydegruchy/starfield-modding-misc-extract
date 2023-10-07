ScriptName WalkInWaterFX Extends ObjectReference
{ Add an fx when in the water }

;-- Variables ---------------------------------------
ObjectReference mySplash
Bool playFX = False
Actor primeIntrigger

;-- Properties --------------------------------------
Activator Property pLibertyPrimeWaterSplash Auto Const
Race Property LibertyPrimeRace Auto Const
Int Property WaterHeight = 450 Auto

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If (akActionRef as Actor).GetRace() == LibertyPrimeRace && playFX == False ; #DEBUG_LINE_NO:18
    primeIntrigger = akActionRef as Actor ; #DEBUG_LINE_NO:19
    playFX = True ; #DEBUG_LINE_NO:20
    mySplash = primeIntrigger.placeatme(pLibertyPrimeWaterSplash as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
  While playFX == True ; #DEBUG_LINE_NO:24
    mySplash.SetPosition(primeIntrigger.GetPositionX(), primeIntrigger.GetPositionY(), WaterHeight as Float) ; #DEBUG_LINE_NO:25
    Utility.wait(0.050000001) ; #DEBUG_LINE_NO:26
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If (akActionRef as Actor).GetRace() == LibertyPrimeRace && playFX == True ; #DEBUG_LINE_NO:32
    playFX = False ; #DEBUG_LINE_NO:33
    mySplash.playAnimation("StopEffect") ; #DEBUG_LINE_NO:34
    Utility.wait(0.300000012) ; #DEBUG_LINE_NO:35
    mySplash = None ; #DEBUG_LINE_NO:36
    mySplash.delete() ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndEvent
