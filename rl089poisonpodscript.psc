ScriptName RL089PoisonPodScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property myCollision Auto Const mandatory
ObjectReference Property myPoison Auto Const mandatory
ObjectReference Property myPoisonEffect01 Auto Const mandatory
ObjectReference Property myPoisonEffect02 Auto Const mandatory
ObjectReference Property myTreePlatform Auto Const
ObjectReference Property myTreePlatformCollision Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:11
  myTreePlatform.SetScale(0.050000001) ; #DEBUG_LINE_NO:12
  myTreePlatformCollision.Disable(False) ; #DEBUG_LINE_NO:13
  Self.RegisterForHitEvent(myCollision as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:14
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Self.ShrinkPod() ; #DEBUG_LINE_NO:18
EndEvent

Function ShrinkPod()
  myPoison.Disable(False) ; #DEBUG_LINE_NO:23
  myPoisonEffect01.Disable(False) ; #DEBUG_LINE_NO:24
  myPoisonEffect02.Disable(False) ; #DEBUG_LINE_NO:25
  myCollision.Disable(False) ; #DEBUG_LINE_NO:26
  Self.SetScale(0.100000001) ; #DEBUG_LINE_NO:27
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:28
  Self.TreeGrowThenDie() ; #DEBUG_LINE_NO:29
EndFunction

Function TreeGrowThenDie()
  myTreePlatform.SetScale(0.200000003) ; #DEBUG_LINE_NO:33
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:34
  myTreePlatform.SetScale(0.300000012) ; #DEBUG_LINE_NO:35
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:36
  myTreePlatform.SetScale(0.400000006) ; #DEBUG_LINE_NO:37
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:38
  myTreePlatform.SetScale(0.5) ; #DEBUG_LINE_NO:39
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:40
  myTreePlatform.SetScale(0.600000024) ; #DEBUG_LINE_NO:41
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:42
  myTreePlatform.SetScale(0.699999988) ; #DEBUG_LINE_NO:43
  myTreePlatformCollision.Enable(False) ; #DEBUG_LINE_NO:44
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:45
  myTreePlatform.SetScale(0.800000012) ; #DEBUG_LINE_NO:46
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:47
  myTreePlatform.SetScale(0.899999976) ; #DEBUG_LINE_NO:48
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:49
  myTreePlatform.SetScale(1.0) ; #DEBUG_LINE_NO:50
  Utility.Wait(6.0) ; #DEBUG_LINE_NO:51
  Self.SetScale(0.200000003) ; #DEBUG_LINE_NO:52
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:53
  Self.SetScale(0.300000012) ; #DEBUG_LINE_NO:54
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:55
  Self.SetScale(0.400000006) ; #DEBUG_LINE_NO:56
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:57
  Self.SetScale(0.5) ; #DEBUG_LINE_NO:58
  myPoison.Enable(False) ; #DEBUG_LINE_NO:59
  myPoisonEffect01.Enable(False) ; #DEBUG_LINE_NO:60
  myPoisonEffect02.Enable(False) ; #DEBUG_LINE_NO:61
  myCollision.Enable(False) ; #DEBUG_LINE_NO:62
  Self.RegisterForHitEvent(myCollision as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:63
  Utility.Wait(4.5) ; #DEBUG_LINE_NO:64
  myTreePlatform.SetScale(0.800000012) ; #DEBUG_LINE_NO:65
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:66
  myTreePlatform.SetScale(0.600000024) ; #DEBUG_LINE_NO:67
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:68
  myTreePlatform.SetScale(0.400000006) ; #DEBUG_LINE_NO:69
  myTreePlatformCollision.Disable(False) ; #DEBUG_LINE_NO:70
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:71
  myTreePlatform.SetScale(0.200000003) ; #DEBUG_LINE_NO:72
  Utility.Wait(0.050000001) ; #DEBUG_LINE_NO:73
  myTreePlatform.SetScale(0.050000001) ; #DEBUG_LINE_NO:74
EndFunction
