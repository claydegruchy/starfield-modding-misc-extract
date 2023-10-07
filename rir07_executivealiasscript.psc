ScriptName RIR07_ExecutiveAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property CrimeFactionNeon_Keyword Auto Const mandatory
Keyword Property CrimeFactionFreestar_Keyword Auto Const mandatory
Keyword Property CrimeFactionUC_Keyword Auto Const mandatory
Keyword Property CrimeFactionParadiso_Keyword Auto Const mandatory
Keyword Property CrimeFactionHopeTown_Keyword Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimeFactionParadiso Auto Const mandatory
Outfit Property Outfit_Clothes_Neon_BusinessSuit_02 Auto Const mandatory
Outfit Property Outfit_Clothes_Business_Any_NoRyujin Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Actor Executive = Self.GetActorRef() ; #DEBUG_LINE_NO:19
  Location MyLocation = Self.GetRef().GetCurrentLocation() ; #DEBUG_LINE_NO:20
  If MyLocation.HasKeyword(CrimeFactionNeon_Keyword) ; #DEBUG_LINE_NO:22
    Executive.SetOutfit(Outfit_Clothes_Neon_BusinessSuit_02, False) ; #DEBUG_LINE_NO:23
    Executive.AddToFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:24
    Executive.SetCrimeFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword) || MyLocation.HasKeyword(CrimeFactionHopeTown_Keyword) ; #DEBUG_LINE_NO:28
    Executive.SetOutfit(Outfit_Clothes_Business_Any_NoRyujin, False) ; #DEBUG_LINE_NO:29
    Executive.AddToFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:30
    Executive.SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionUC_Keyword) ; #DEBUG_LINE_NO:34
    Executive.SetOutfit(Outfit_Clothes_Business_Any_NoRyujin, False) ; #DEBUG_LINE_NO:35
    Executive.AddToFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:36
    Executive.SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionParadiso_Keyword) ; #DEBUG_LINE_NO:40
    Executive.SetOutfit(Outfit_Clothes_Business_Any_NoRyujin, False) ; #DEBUG_LINE_NO:41
    Executive.AddToFaction(CrimeFactionParadiso) ; #DEBUG_LINE_NO:42
    Executive.SetCrimeFaction(CrimeFactionParadiso) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndEvent
