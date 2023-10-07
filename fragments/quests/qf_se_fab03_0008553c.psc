ScriptName Fragments:Quests:QF_SE_FAB03_0008553C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
ActorValue Property ShipSystemGravDriveHealth Auto Const mandatory
ActorValue Property ShipSystemReactorHealth Auto Const mandatory
ActorValue Property ShipSystemShieldsHealth Auto Const mandatory
ActorValue Property ShipSystemWeaponGroup1Health Auto Const mandatory
ActorValue Property ShipSystemWeaponGroup2Health Auto Const mandatory
ActorValue Property ShipSystemWeaponGroup3Health Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Faction Property PPlayerEnemyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference sTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:8
  ActorValue avSystem = ShipSystemEngineHealth ; #DEBUG_LINE_NO:9
  sTarg.EnablePartRepair(avSystem, False) ; #DEBUG_LINE_NO:10
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem)) ; #DEBUG_LINE_NO:11
  avSystem = ShipSystemGravDriveHealth ; #DEBUG_LINE_NO:13
  sTarg.EnablePartRepair(avSystem, False) ; #DEBUG_LINE_NO:14
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem)) ; #DEBUG_LINE_NO:15
  avSystem = ShipSystemReactorHealth ; #DEBUG_LINE_NO:17
  sTarg.EnablePartRepair(avSystem, False) ; #DEBUG_LINE_NO:18
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem)) ; #DEBUG_LINE_NO:19
  avSystem = ShipSystemShieldsHealth ; #DEBUG_LINE_NO:21
  sTarg.EnablePartRepair(avSystem, False) ; #DEBUG_LINE_NO:22
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem)) ; #DEBUG_LINE_NO:23
  avSystem = ShipSystemWeaponGroup1Health ; #DEBUG_LINE_NO:25
  sTarg.EnablePartRepair(avSystem, False) ; #DEBUG_LINE_NO:26
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem)) ; #DEBUG_LINE_NO:27
  avSystem = ShipSystemWeaponGroup2Health ; #DEBUG_LINE_NO:29
  sTarg.EnablePartRepair(avSystem, False) ; #DEBUG_LINE_NO:30
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem)) ; #DEBUG_LINE_NO:31
  avSystem = ShipSystemWeaponGroup3Health ; #DEBUG_LINE_NO:33
  sTarg.EnablePartRepair(avSystem, False) ; #DEBUG_LINE_NO:34
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem)) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0200_Item_00()
  Utility.Wait(4.0) ; #DEBUG_LINE_NO:53
  Self.SetStage(210) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0210_Item_00()
  spaceshipreference sTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:64
  sTarg.StartCombat(Alias_playerShip.GetRef() as spaceshipreference, False) ; #DEBUG_LINE_NO:65
  sTarg.AddToFaction(PPlayerEnemyFaction) ; #DEBUG_LINE_NO:66
  ActorValue avSystem = ShipSystemEngineHealth ; #DEBUG_LINE_NO:69
  sTarg.EnablePartRepair(avSystem, True) ; #DEBUG_LINE_NO:70
  sTarg.RestoreValue(avSystem, 100.0) ; #DEBUG_LINE_NO:71
  avSystem = ShipSystemReactorHealth ; #DEBUG_LINE_NO:73
  sTarg.EnablePartRepair(avSystem, True) ; #DEBUG_LINE_NO:74
  sTarg.RestoreValue(avSystem, 100.0) ; #DEBUG_LINE_NO:75
  avSystem = ShipSystemShieldsHealth ; #DEBUG_LINE_NO:77
  sTarg.EnablePartRepair(avSystem, True) ; #DEBUG_LINE_NO:78
  sTarg.RestoreValue(avSystem, 100.0) ; #DEBUG_LINE_NO:79
  avSystem = ShipSystemWeaponGroup1Health ; #DEBUG_LINE_NO:81
  sTarg.EnablePartRepair(avSystem, True) ; #DEBUG_LINE_NO:82
  sTarg.RestoreValue(avSystem, 100.0) ; #DEBUG_LINE_NO:83
  avSystem = ShipSystemWeaponGroup2Health ; #DEBUG_LINE_NO:85
  sTarg.EnablePartRepair(avSystem, True) ; #DEBUG_LINE_NO:86
  sTarg.RestoreValue(avSystem, 100.0) ; #DEBUG_LINE_NO:87
  avSystem = ShipSystemWeaponGroup3Health ; #DEBUG_LINE_NO:89
  sTarg.EnablePartRepair(avSystem, True) ; #DEBUG_LINE_NO:90
  sTarg.RestoreValue(avSystem, 100.0) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0220_Item_00()
  spaceshipreference sTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:100
  ActorValue avSystem = ShipSystemShieldsHealth ; #DEBUG_LINE_NO:101
  sTarg.EnablePartRepair(avSystem, True) ; #DEBUG_LINE_NO:102
  sTarg.RestoreValue(avSystem, 100.0) ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:113
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:114
EndFunction
