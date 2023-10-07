ScriptName TerrormorphRaceEffectScript Extends ActiveMagicEffect
{ make sure Terrormorphs flee when they enter combat with an Aceles }

;-- Variables ---------------------------------------
Float fUpdateTime = 1.0 Const
Int iUpdateTimerID = 1 Const

;-- Properties --------------------------------------
Faction Property AcelesFaction Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnCombatListAdded") ; #DEBUG_LINE_NO:11
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnCombatListRemoved") ; #DEBUG_LINE_NO:12
  Self.UpdateAcelesFlee() ; #DEBUG_LINE_NO:14
EndEvent

Event Actor.OnCombatListAdded(Actor akSource, Actor akTarget)
  If akTarget as Bool && akTarget.IsInFaction(AcelesFaction) ; #DEBUG_LINE_NO:18
    Self.StartTimer(fUpdateTime, iUpdateTimerID) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnCombatListRemoved(Actor akSource, Actor akTarget)
  If akTarget as Bool && akTarget.IsInFaction(AcelesFaction) ; #DEBUG_LINE_NO:25
    Self.StartTimer(fUpdateTime, iUpdateTimerID) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iUpdateTimerID ; #DEBUG_LINE_NO:32
    Self.UpdateAcelesFlee() ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateAcelesFlee()
  Actor myCaster = Self.GetCasterActor() ; #DEBUG_LINE_NO:39
  Actor[] myTargets = myCaster.GetAllCombatTargets() ; #DEBUG_LINE_NO:40
  Actor foundAceles = None ; #DEBUG_LINE_NO:44
  If myTargets.Length > 0 ; #DEBUG_LINE_NO:46
    Int I = 0 ; #DEBUG_LINE_NO:47
    While I < myTargets.Length && foundAceles == None ; #DEBUG_LINE_NO:48
      Actor theTarget = myTargets[I] ; #DEBUG_LINE_NO:49
      If theTarget.IsDead() == False && theTarget.IsInFaction(AcelesFaction) ; #DEBUG_LINE_NO:51
        foundAceles = theTarget ; #DEBUG_LINE_NO:52
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:55
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If foundAceles ; #DEBUG_LINE_NO:59
    myCaster.SetValue(Game.GetConfidenceAV(), 0.0) ; #DEBUG_LINE_NO:61
  Else ; #DEBUG_LINE_NO:
    myCaster.SetValue(Game.GetConfidenceAV(), 4.0) ; #DEBUG_LINE_NO:64
  EndIf ; #DEBUG_LINE_NO:
  myCaster.EvaluatePackage(False) ; #DEBUG_LINE_NO:66
EndFunction
