ScriptName MQ101PlayerShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TheLodge Auto mandatory
Location Property SNarionA_PAnselon_MKreet Auto mandatory
Location Property KreetWorldSpaceLocation Auto mandatory
Location Property NewAtlantisLocation Auto mandatory
Location Property SAlphaCentauri_PJemison_Orbit Auto mandatory
Location Property SNarionA_PAnselon_MKreet_Orbit Auto Const mandatory
ActorValue Property SpaceshipBuildableEnginePower Auto Const mandatory
ActorValue Property SpaceshipBuildableThrusterPower Auto Const mandatory
ActorValue Property SpaceshipBuildableShieldPower Auto Const mandatory
ActorValue Property SpaceshipGravJumpPower Auto Const mandatory
ActorValue Property SpaceshipWeaponGatlingGunPower Auto Const mandatory
ActorValue Property SpaceshipWeaponGunPower Auto Const mandatory
ActorValue Property SpaceshipWeaponMissileLauncherPower Auto Const mandatory

;-- Functions ---------------------------------------

Event OnShipDock(Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  If abComplete && (akParent as ObjectReference == TheLodge.GetRef()) ; #DEBUG_LINE_NO:21
    Self.GetOwningQuest().SetStage(1500) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnShipLanding(Bool abComplete)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:27
  ObjectReference MyShip = Self.GetRef() ; #DEBUG_LINE_NO:28
  Location MyLocation = MyShip.GetCurrentLocation() ; #DEBUG_LINE_NO:29
  If MyShip.IsInLocation(SNarionA_PAnselon_MKreet) || MyShip.IsInLocation(KreetWorldSpaceLocation) ; #DEBUG_LINE_NO:31
    If abComplete == False ; #DEBUG_LINE_NO:32
      MyQuest.SetStage(610) ; #DEBUG_LINE_NO:33
    Else ; #DEBUG_LINE_NO:
      MyQuest.SetStage(615) ; #DEBUG_LINE_NO:35
    EndIf ; #DEBUG_LINE_NO:
  ElseIf MyShip.IsInLocation(NewAtlantisLocation) ; #DEBUG_LINE_NO:37
    If abComplete == False ; #DEBUG_LINE_NO:38
      MyQuest.SetStage(1305) ; #DEBUG_LINE_NO:39
    Else ; #DEBUG_LINE_NO:
      MyQuest.SetStage(1310) ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnShipSystemPowerChange(ActorValue akSystem, Bool abAddPower, Bool abDamageRelated)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:48
  If MyQuest.GetStageDone(419) && MyQuest.GetStageDone(485) == False ; #DEBUG_LINE_NO:51
    Self.CheckPowerToSystems() ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckPowerToSystems()
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:57
  ObjectReference myShipRef = Self.GetRef() ; #DEBUG_LINE_NO:58
  Float EnginePower = myShipRef.GetValue(SpaceshipBuildableEnginePower) ; #DEBUG_LINE_NO:59
  Float ShieldPower = myShipRef.GetValue(SpaceshipBuildableShieldPower) ; #DEBUG_LINE_NO:60
  Float GatlingPower = myShipRef.GetValue(SpaceshipWeaponGatlingGunPower) ; #DEBUG_LINE_NO:61
  Float GunPower = myShipRef.GetValue(SpaceshipWeaponGunPower) ; #DEBUG_LINE_NO:62
  Float MissilePower = myShipRef.GetValue(SpaceshipWeaponMissileLauncherPower) ; #DEBUG_LINE_NO:63
  Float GravJumpPower = myShipRef.GetValue(SpaceshipGravJumpPower) ; #DEBUG_LINE_NO:64
  ObjectReference myPlayerShip = Game.GetPlayer().GetSpaceShip() as ObjectReference ; #DEBUG_LINE_NO:67
  If myPlayerShip ; #DEBUG_LINE_NO:68
    If GravJumpPower > 0.0 && EnginePower > 0.0 && ShieldPower > 0.0 && (GatlingPower > 0.0 || GunPower > 0.0 || MissilePower > 0.0) ; #DEBUG_LINE_NO:70
      If MyQuest.GetStageDone(420) == True && MyQuest.GetStageDone(424) == False && MyQuest.GetStageDone(485) == False ; #DEBUG_LINE_NO:72
        MyQuest.SetStage(485) ; #DEBUG_LINE_NO:73
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnShipTakeOff(Bool abComplete)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:80
  If abComplete == True ; #DEBUG_LINE_NO:81
    If MyQuest.GetStageDone(340) == True ; #DEBUG_LINE_NO:83
      MyQuest.SetStage(400) ; #DEBUG_LINE_NO:84
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
