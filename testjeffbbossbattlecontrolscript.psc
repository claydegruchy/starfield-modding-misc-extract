ScriptName TestJeffBBossBattleControlScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool StopTeleporting = False
Bool foundLocation = False
ObjectReference[] myLocations
Int myPreviousLocation = 0
Int myTimerID = 0
Int rand

;-- Properties --------------------------------------
testjeffbbossbattlescript Property myBoss Auto Const
Float Property myTimer = 5.0 Auto Const
Explosion Property myExplosion Auto Const
Explosion Property myTeleportFX Auto Const
wwiseevent Property mySoundEvent Auto Const
Float Property myScale = 2.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  myLocations = Self.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:22
  Self.RegisterForCustomEvent(myBoss as ScriptObject, "testjeffbbossbattlescript_ScaleBoss") ; #DEBUG_LINE_NO:23
  Self.RegisterForCustomEvent(myBoss as ScriptObject, "testjeffbbossbattlescript_StartTeleporting") ; #DEBUG_LINE_NO:24
  Self.RegisterForCustomEvent(myBoss as ScriptObject, "testjeffbbossbattlescript_StopTeleporting") ; #DEBUG_LINE_NO:25
EndEvent

Event TestJeffBBossBattleScript.ScaleBoss(testjeffbbossbattlescript akSender, Var[] akArgs)
  Self.UnregisterForCustomEvent(myBoss as ScriptObject, "testjeffbbossbattlescript_ScaleBoss") ; #DEBUG_LINE_NO:31
  myBoss.setScale(myScale) ; #DEBUG_LINE_NO:32
EndEvent

Event TestJeffBBossBattleScript.StartTeleporting(testjeffbbossbattlescript akSender, Var[] akArgs)
  Self.UnregisterForCustomEvent(myBoss as ScriptObject, "testjeffbbossbattlescript_StartTeleporting") ; #DEBUG_LINE_NO:38
  Self.MoveBoss() ; #DEBUG_LINE_NO:39
EndEvent

Event TestJeffBBossBattleScript.StopTeleporting(testjeffbbossbattlescript akSender, Var[] akArgs)
  Self.UnregisterForCustomEvent(myBoss as ScriptObject, "testjeffbbossbattlescript_StopTeleporting") ; #DEBUG_LINE_NO:45
  StopTeleporting = True ; #DEBUG_LINE_NO:46
  Self.CancelTimer(myTimerID) ; #DEBUG_LINE_NO:47
  myBoss.moveto(myBoss.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:48
  mySoundEvent.PlayAndWait(myBoss as ObjectReference, None, None) ; #DEBUG_LINE_NO:49
  myBoss.PlaceAtMe(myExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:51
  myBoss.DisableNoWait(False) ; #DEBUG_LINE_NO:52
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == myTimerID && StopTeleporting == False ; #DEBUG_LINE_NO:58
    foundLocation = False ; #DEBUG_LINE_NO:59
    Self.MoveBoss() ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function MoveBoss()
  While foundLocation == False ; #DEBUG_LINE_NO:68
    rand = Utility.RandomInt(1, myLocations.Length) ; #DEBUG_LINE_NO:69
    If rand != myPreviousLocation ; #DEBUG_LINE_NO:70
      foundLocation = True ; #DEBUG_LINE_NO:71
      If StopTeleporting == False ; #DEBUG_LINE_NO:72
        myBoss.PlaceAtMe(myTeleportFX as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:73
        myBoss.moveto(myLocations[rand], 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:74
        myBoss.PlaceAtMe(myTeleportFX as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:75
        Self.StartTimer(myTimer, myTimerID) ; #DEBUG_LINE_NO:76
      EndIf ; #DEBUG_LINE_NO:
      myPreviousLocation = rand ; #DEBUG_LINE_NO:78
    Else ; #DEBUG_LINE_NO:
      Utility.wait(0.01) ; #DEBUG_LINE_NO:80
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
