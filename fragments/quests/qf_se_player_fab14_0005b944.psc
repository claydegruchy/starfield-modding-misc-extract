ScriptName Fragments:Quests:QF_SE_Player_FAB14_0005B944 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
ReferenceAlias Property Alias_AC_ShipTech Auto Const mandatory
ReferenceAlias Property Alias_CY_ShipTech Auto Const mandatory
ReferenceAlias Property Alias_Neon_ShipTech Auto Const mandatory
ReferenceAlias Property Alias_NA_ShipTech Auto Const mandatory
ReferenceAlias Property Alias_DestinationShipTech Auto Const mandatory
GlobalVariable Property SE_FAB14_DestinationGlobal Auto Const mandatory
MiscObject Property SE_FAB14_StarParcelPackage Auto Const mandatory
ReferenceAlias Property Alias_StarParcelPackage Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference sTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:8
  ActorValue avSystem = ShipSystemEngineHealth ; #DEBUG_LINE_NO:9
  sTarg.EnablePartRepair(avSystem, False) ; #DEBUG_LINE_NO:10
  sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem)) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0075_Item_00()
  Int nRand = Utility.RandomInt(1, 4) ; #DEBUG_LINE_NO:29
  Self.SetStage(400 + nRand) ; #DEBUG_LINE_NO:30
  SE_FAB14_DestinationGlobal.SetValue(nRand as Float) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:43
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:52
  sescript kmyQuest = __temp as sescript ; #DEBUG_LINE_NO:53
  Int nDest = SE_FAB14_DestinationGlobal.GetValue() as Int ; #DEBUG_LINE_NO:57
  Self.SetObjectiveDisplayed(400 + nDest, True, False) ; #DEBUG_LINE_NO:58
  Game.GetPlayer().AddAliasedItem(SE_FAB14_StarParcelPackage as Form, Alias_StarParcelPackage as Alias, 1, True) ; #DEBUG_LINE_NO:61
  If Self.GetStageDone(420) ; #DEBUG_LINE_NO:64
    Game.GetPlayer().AddItem(Credits as Form, 500, False) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0401_Item_00()
  Alias_DestinationShipTech.ForceRefTo(Alias_AC_ShipTech.GetRef()) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0402_Item_00()
  Alias_DestinationShipTech.ForceRefTo(Alias_CY_ShipTech.GetRef()) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0403_Item_00()
  Alias_DestinationShipTech.ForceRefTo(Alias_Neon_ShipTech.GetRef()) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_0404_Item_00()
  Alias_DestinationShipTech.ForceRefTo(Alias_NA_ShipTech.GetRef()) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0500_Item_00()
  Game.GetPlayer().RemoveItem(SE_FAB14_StarParcelPackage as Form, 1, False, None) ; #DEBUG_LINE_NO:111
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:114
  Self.SetStage(1000) ; #DEBUG_LINE_NO:115
EndFunction

Function Fragment_Stage_0900_Item_00()
  If !Self.GetStageDone(400) ; #DEBUG_LINE_NO:124
    Self.Stop() ; #DEBUG_LINE_NO:125
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_HailingShip.GetShipRef().DisableWithGravJump() ; #DEBUG_LINE_NO:135
  Self.Stop() ; #DEBUG_LINE_NO:136
EndFunction
