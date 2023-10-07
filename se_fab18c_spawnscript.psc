ScriptName SE_FAB18c_SpawnScript Extends Quest

;-- Variables ---------------------------------------
Int iTimerID = 1 Const

;-- Properties --------------------------------------
Quest Property SE_Player_FAB18c Auto Const mandatory
GlobalVariable Property MS02_GenghisSpawnChance Auto Const mandatory
GlobalVariable Property MS02_GenghisReactivity Auto Const mandatory
GlobalVariable Property MS02_Genghis_SE_ID Auto Const mandatory
Float Property SE_ID Auto Const
Float Property TimeToWait Auto Const
Float Property FallbackTimer = 7.0 Auto Const
ReferenceAlias Property ShipToCheck Auto Const
ReferenceAlias Property PlayerShip Auto Const

;-- Functions ---------------------------------------

Event OnQuestStarted()
  If MS02_GenghisReactivity.GetValue() == 3.0 ; #DEBUG_LINE_NO:4
    Float fRoll = Utility.RandomInt(1, 100) as Float ; #DEBUG_LINE_NO:6
    If fRoll <= MS02_GenghisSpawnChance.GetValue() ; #DEBUG_LINE_NO:7
      If ShipToCheck.GetRef() != None ; #DEBUG_LINE_NO:8
        Self.RegisterForDistanceLessThanEvent(PlayerShip as ScriptObject, ShipToCheck as ScriptObject, 2000.0, 0) ; #DEBUG_LINE_NO:9
      Else ; #DEBUG_LINE_NO:
        Self.StartTimer(FallbackTimer, iTimerID) ; #DEBUG_LINE_NO:11
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.SpawnGenghisShip() ; #DEBUG_LINE_NO:18
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTimerID ; #DEBUG_LINE_NO:22
    Self.SpawnGenghisShip() ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SpawnGenghisShip()
  Utility.Wait(TimeToWait) ; #DEBUG_LINE_NO:28
  MS02_Genghis_SE_ID.SetValue(SE_ID) ; #DEBUG_LINE_NO:29
  SE_Player_FAB18c.Start() ; #DEBUG_LINE_NO:31
EndFunction
