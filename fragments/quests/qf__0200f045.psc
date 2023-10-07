ScriptName Fragments:Quests:QF__0200F045 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
Keyword Property BEDisembarkerLink Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingB Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:8
  kmyQuest.LandShip(0) ; #DEBUG_LINE_NO:11
  ObjectReference landingMarkerB = Alias_Marker_ShipLandingB.GetRef() ; #DEBUG_LINE_NO:13
  ObjectReference landingMarkerC = Alias_Marker_ShipLandingC.GetRef() ; #DEBUG_LINE_NO:14
  If landingMarkerB == None ; #DEBUG_LINE_NO:18
    Self.setstage(310) ; #DEBUG_LINE_NO:19
  ElseIf Utility.RandomInt(1, 3) == 1 ; #DEBUG_LINE_NO:22
    kmyQuest.LandShip(1) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
  If landingMarkerC == None ; #DEBUG_LINE_NO:27
    Self.setstage(410) ; #DEBUG_LINE_NO:28
  ElseIf Utility.RandomInt(1, 3) == 1 ; #DEBUG_LINE_NO:31
    kmyQuest.LandShip(2) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:42
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:43
  kmyQuest.LandShip(1) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.setstage(500) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:62
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:63
  kmyQuest.LandShip(2) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.setstage(500) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.setstage(500) ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:90
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:91
  kmyQuest.LaunchShip(0, None, False) ; #DEBUG_LINE_NO:94
  kmyQuest.LaunchShip(1, None, False) ; #DEBUG_LINE_NO:95
  kmyQuest.LaunchShip(2, None, False) ; #DEBUG_LINE_NO:96
EndFunction
