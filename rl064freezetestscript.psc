ScriptName RL064FreezeTestScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property IceLinked Auto
{ Linked ref from Canister to ice }
Explosion Property fragGrenadeExplosion Auto Const
{ Test Explosion that triggers on hit }
Keyword Property RL064_Freeze Auto Const
{ Keyword on linked ref to tell that ice should freeze }
Keyword Property RL064_Melt Auto Const
{ Keyword on linked ref to tell that ice should melt }
Bool Property isFreeze Auto
{ If True, ice will freeze. If false, ice will melt }

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:21
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:22
    If Self.GetLinkedRef(RL064_Freeze) ; #DEBUG_LINE_NO:25
      IceLinked = Self.GetLinkedRef(RL064_Freeze) ; #DEBUG_LINE_NO:26
      isFreeze = True ; #DEBUG_LINE_NO:27
    EndIf ; #DEBUG_LINE_NO:
    If Self.GetLinkedRef(RL064_Melt) ; #DEBUG_LINE_NO:29
      IceLinked = Self.GetLinkedRef(RL064_Melt) ; #DEBUG_LINE_NO:30
      isFreeze = False ; #DEBUG_LINE_NO:31
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:38
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.PlaceAtMe(fragGrenadeExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:44
  If isFreeze == True ; #DEBUG_LINE_NO:47
    Self.FreezeIce() ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
  If isFreeze == False ; #DEBUG_LINE_NO:50
    Self.MeltIce() ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function FreezeIce()
  Float currentScale = IceLinked.GetScale() ; #DEBUG_LINE_NO:58
  IceLinked.Enable(False) ; #DEBUG_LINE_NO:59
  IceLinked.SetScale(0.100000001) ; #DEBUG_LINE_NO:60
  While currentScale <= 0.449999988 ; #DEBUG_LINE_NO:62
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:63
    IceLinked.SetScale(currentScale * 1.200000048) ; #DEBUG_LINE_NO:64
    currentScale = IceLinked.GetScale() ; #DEBUG_LINE_NO:65
  EndWhile ; #DEBUG_LINE_NO:
  IceLinked.SetScale(0.5) ; #DEBUG_LINE_NO:68
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:69
EndFunction

Function MeltIce()
  Float currentScale = IceLinked.GetScale() ; #DEBUG_LINE_NO:74
  While currentScale >= 0.100000001 ; #DEBUG_LINE_NO:76
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:77
    IceLinked.SetScale(currentScale * 0.899999976) ; #DEBUG_LINE_NO:78
    currentScale = IceLinked.GetScale() ; #DEBUG_LINE_NO:79
  EndWhile ; #DEBUG_LINE_NO:
  IceLinked.Disable(False) ; #DEBUG_LINE_NO:82
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:83
EndFunction
