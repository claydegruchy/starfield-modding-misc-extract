ScriptName RIR06_OperativeAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property CrimeFactionNeon_Keyword Auto Const mandatory
Keyword Property CrimeFactionFreestar_Keyword Auto Const mandatory
Keyword Property CrimeFactionUC_Keyword Auto Const mandatory
Keyword Property CrimeFactionParadiso_Keyword Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimeFactionParadiso Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Actor Operative = Self.GetActorRef() ; #DEBUG_LINE_NO:15
  Location MyLocation = Self.GetRef().GetCurrentLocation() ; #DEBUG_LINE_NO:16
  If MyLocation.HasKeyword(CrimeFactionNeon_Keyword) ; #DEBUG_LINE_NO:18
    Operative.AddToFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:19
    Operative.SetCrimeFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword) ; #DEBUG_LINE_NO:23
    Operative.AddToFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:24
    Operative.SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionUC_Keyword) ; #DEBUG_LINE_NO:28
    Operative.AddToFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:29
    Operative.SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionParadiso_Keyword) ; #DEBUG_LINE_NO:33
    Operative.AddToFaction(CrimeFactionParadiso) ; #DEBUG_LINE_NO:34
    Operative.SetCrimeFaction(CrimeFactionParadiso) ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
EndEvent
