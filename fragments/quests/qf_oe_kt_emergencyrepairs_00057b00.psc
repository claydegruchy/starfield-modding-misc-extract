ScriptName Fragments:Quests:QF_OE_KT_EmergencyRepairs_00057B00 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Marker_ShipLandingA Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
LocationAlias Property Alias_ShipA_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const mandatory
ReferenceAlias Property Alias_NPC_VanguardCaptain Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ReferenceAlias Property Alias_ShipContainer Auto Const mandatory
Scene Property OE_KT_EmergencyRepairs_MoveToPostion Auto Const mandatory
GlobalVariable Property OE_KT_EmergencyRepairs_Global Auto Const mandatory
GlobalVariable Property OE_KT_EmergencyRepairs_Global02 Auto Const mandatory
GlobalVariable Property OE_KT_EmergencyRepairs_Global03 Auto Const mandatory
ReferenceAlias Property Alias_ShipLoadDoor Auto Const mandatory
LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const mandatory
Faction Property OE_ShipOwnerFaction Auto Const mandatory
GlobalVariable Property OE_KT_EmergencyRepairs_Global04 Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker00 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
LocationAlias Property Alias_OE_Location Auto Const mandatory
Keyword Property LocTypeOE_ThemeEmptyKeyword Auto Const mandatory
ReferenceAlias Property Alias_soundMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  OE_KT_EmergencyRepairs_Global.SetValue(1.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  OE_KT_EmergencyRepairs_Global02.SetValue(1.0) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0003_Item_00()
  OE_KT_EmergencyRepairs_Global03.SetValue(1.0) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0004_Item_00()
  OE_KT_EmergencyRepairs_Global04.SetValue(1.0) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0009_Item_00()
  Alias_MapMarker.TryToEnable() ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_ShipA.GetShipRef().PlayAnimation("to_ShipDamageState02") ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0019_Item_00()
  Alias_PilotSeat.GetRef().BlockActivation(True, False) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0080_Item_00()
  Alias_ShipA.GetShipRef().SetExteriorLoadDoorInaccessible(False) ; #DEBUG_LINE_NO:63
  OE_KT_EmergencyRepairs_MoveToPostion.Start() ; #DEBUG_LINE_NO:64
  Actor PilotRef = Alias_NPC_VanguardCaptain.GetActorRef() ; #DEBUG_LINE_NO:66
  Cell myShipCell = Alias_PilotSeat.GetRef().GetParentCell() ; #DEBUG_LINE_NO:68
  myShipCell.SetFactionOwner(OE_ShipOwnerFaction) ; #DEBUG_LINE_NO:69
  myShipCell.SetPublic(True) ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_0090_Item_00()
  Alias_ShipA.RefillDependentAliases() ; #DEBUG_LINE_NO:78
  Alias_soundMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0099_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:88
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:89
  Int Randomizer = Utility.RandomInt(1, 4) ; #DEBUG_LINE_NO:92
  If Randomizer == 1 ; #DEBUG_LINE_NO:94
    Self.SetStage(11) ; #DEBUG_LINE_NO:95
  ElseIf Randomizer == 2 ; #DEBUG_LINE_NO:96
    Self.SetStage(12) ; #DEBUG_LINE_NO:97
  ElseIf Randomizer == 3 ; #DEBUG_LINE_NO:98
    Self.SetStage(13) ; #DEBUG_LINE_NO:99
  ElseIf Randomizer == 4 ; #DEBUG_LINE_NO:100
    Self.SetStage(14) ; #DEBUG_LINE_NO:101
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.LandShip(-1) ; #DEBUG_LINE_NO:104
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:112
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:113
  Self.SetStage(10) ; #DEBUG_LINE_NO:116
  Int I = 0 ; #DEBUG_LINE_NO:118
  While I < 1 ; #DEBUG_LINE_NO:120
    Int Randomizer = Utility.RandomInt(1, 4) ; #DEBUG_LINE_NO:121
    If Randomizer == 1 && OE_KT_EmergencyRepairs_Global.GetValue() == 0.0 ; #DEBUG_LINE_NO:123
      Self.SetStage(11) ; #DEBUG_LINE_NO:124
      I += 1 ; #DEBUG_LINE_NO:125
    ElseIf Randomizer == 2 && OE_KT_EmergencyRepairs_Global02.GetValue() == 0.0 ; #DEBUG_LINE_NO:126
      Self.SetStage(12) ; #DEBUG_LINE_NO:127
      I += 1 ; #DEBUG_LINE_NO:128
    ElseIf Randomizer == 3 && OE_KT_EmergencyRepairs_Global03.GetValue() == 0.0 ; #DEBUG_LINE_NO:129
      Self.SetStage(13) ; #DEBUG_LINE_NO:130
      I += 1 ; #DEBUG_LINE_NO:131
    ElseIf Randomizer == 4 && OE_KT_EmergencyRepairs_Global04.GetValue() == 0.0 ; #DEBUG_LINE_NO:132
      Self.SetStage(14) ; #DEBUG_LINE_NO:133
      I += 1 ; #DEBUG_LINE_NO:134
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
  kmyQuest.LandShip(-1) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0100_Item_01()
  Self.SetStage(99) ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:155
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:156
  If Game.GetPlayer().GetDistance(Alias_ShipA_LandingDeckMarker00.GetRef()) > 10.0 ; #DEBUG_LINE_NO:159
    Alias_soundMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:160
    spaceshipreference ShipRef = Alias_ShipA.GetShipRef() ; #DEBUG_LINE_NO:161
    ShipRef.PlayAnimation("to_ShipFullHealth") ; #DEBUG_LINE_NO:162
    ShipRef.SetExteriorLoadDoorInaccessible(True) ; #DEBUG_LINE_NO:163
    kmyQuest.LaunchShip(0, None, False) ; #DEBUG_LINE_NO:164
    If Alias_OE_Location.GetLocation().HasKeyword(LocTypeOE_ThemeEmptyKeyword) ; #DEBUG_LINE_NO:165
      Alias_MapMarker.TryToDisable() ; #DEBUG_LINE_NO:166
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:176
EndFunction
