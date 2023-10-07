ScriptName CompanionCrimeFactionHostilityScript Extends Actor
{ Makes Companion Crime Faction hostile if they are ever in combat with a shared crime faction which is enemy to the player because of crime }

;-- Variables ---------------------------------------
Float TimerInterval = 3.0 Const

;-- Properties --------------------------------------
Faction[] Property IgnoreSharedCrimeForAnyoneInTheseFactions Auto Const
{ Even if the companion would help them because they are in his shared crime list, ignore it if they are in this faction. }

;-- Functions ---------------------------------------

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  If aeCombatState > 0 ; #DEBUG_LINE_NO:12
    Self.StartTimer(Game.GetGameSettingFloat("fCombatYieldTime"), 0) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  Self.TestForSharedCrimeCombatants() ; #DEBUG_LINE_NO:20
  If Self.IsInCombat() ; #DEBUG_LINE_NO:22
    Self.StartTimer(TimerInterval, 0) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function TestForSharedCrimeCombatants()
  Faction myCrimeFaction = Self.GetCrimeFaction() ; #DEBUG_LINE_NO:30
  If myCrimeFaction.IsPlayerEnemy() ; #DEBUG_LINE_NO:32
    Return  ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
  Actor[] combatants = Self.GetAllCombatTargets() ; #DEBUG_LINE_NO:37
  Int I = 0 ; #DEBUG_LINE_NO:42
  Int max = combatants.Length ; #DEBUG_LINE_NO:43
  While I < max ; #DEBUG_LINE_NO:44
    Faction currentCrimeFaction = combatants[I].GetCrimeFaction() ; #DEBUG_LINE_NO:46
    If currentCrimeFaction as Bool && currentCrimeFaction.IsPlayerEnemy() ; #DEBUG_LINE_NO:50
      If myCrimeFaction.IsFactionInCrimeGroup(currentCrimeFaction) && commonarrayfunctions.CheckActorAgainstFactionArray(combatants[I], IgnoreSharedCrimeForAnyoneInTheseFactions, False) == False ; #DEBUG_LINE_NO:54
        myCrimeFaction.SetPlayerEnemy(True) ; #DEBUG_LINE_NO:59
        Return  ; #DEBUG_LINE_NO:60
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:66
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
