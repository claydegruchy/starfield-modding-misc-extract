ScriptName ScanTempleScript Extends Quest
{ prototyping temple scanning via imod }

;-- Variables ---------------------------------------
Float AngleDiff
Float DistanceDiff
ObjectReference currentTarget
Actor playerRef
Int scanTempleTimerID = 1 Const
Float scanTempleTimerSeconds = 0.5 Const
Bool usingHandscanner = False

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard handscannerGuard

;-- Properties --------------------------------------
ImageSpaceModifier Property TestScanTempleImod Auto Const mandatory
Float Property MinAngle = 10.0 Auto Const
Float Property MaxAngle = 90.0 Auto Const
Float Property MinDistance = 200.0 Auto Const
Float Property MaxDistance = 1000.0 Auto Const

;-- Functions ---------------------------------------

Function StartTempleScanning(ObjectReference targetRef)
  playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:23
  DistanceDiff = MaxDistance - MinDistance ; #DEBUG_LINE_NO:24
  AngleDiff = MaxAngle - MinAngle ; #DEBUG_LINE_NO:25
  Self.RegisterForMenuOpenCloseEvent("MonocleMenu") ; #DEBUG_LINE_NO:27
  currentTarget = targetRef ; #DEBUG_LINE_NO:28
EndFunction

Function StopTempleScanning()
  Self.UnRegisterForMenuOpenCloseEvent("MonocleMenu") ; #DEBUG_LINE_NO:32
  currentTarget = None ; #DEBUG_LINE_NO:33
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == scanTempleTimerID ; #DEBUG_LINE_NO:37
    Self.UpdateTempleScan() ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "MonocleMenu" ; #DEBUG_LINE_NO:45
    Guard handscannerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:46
      usingHandscanner = abOpening ; #DEBUG_LINE_NO:47
      If abOpening ; #DEBUG_LINE_NO:48
        Self.StartTimer(scanTempleTimerSeconds, scanTempleTimerID) ; #DEBUG_LINE_NO:49
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateTempleScan()
  If usingHandscanner ; #DEBUG_LINE_NO:56
    Float zAngle = playerRef.GetHeadingAngle(currentTarget) ; #DEBUG_LINE_NO:58
    Float angleExtent = Self.GetAngleExtent() ; #DEBUG_LINE_NO:61
    Float currentMaxAngle = angleExtent / 2.0 ; #DEBUG_LINE_NO:62
    Float currentMinAngle = currentMaxAngle * -1.0 ; #DEBUG_LINE_NO:63
    If zAngle >= currentMinAngle && zAngle <= currentMaxAngle ; #DEBUG_LINE_NO:66
      TestScanTempleImod.Apply(1.0) ; #DEBUG_LINE_NO:68
    Else ; #DEBUG_LINE_NO:
      TestScanTempleImod.Remove() ; #DEBUG_LINE_NO:70
    EndIf ; #DEBUG_LINE_NO:
    Self.StartTimer(scanTempleTimerSeconds, scanTempleTimerID) ; #DEBUG_LINE_NO:73
  Else ; #DEBUG_LINE_NO:
    TestScanTempleImod.Remove() ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Float Function GetAngleExtent()
  Float distance = Math.Clamp(playerRef.GetDistance(currentTarget), MinDistance, MaxDistance) ; #DEBUG_LINE_NO:82
  Float distanceMult = (distance - MinDistance) / DistanceDiff ; #DEBUG_LINE_NO:85
  Float angleExtent = MinAngle + distanceMult * AngleDiff ; #DEBUG_LINE_NO:88
  Return angleExtent ; #DEBUG_LINE_NO:90
EndFunction
