ScriptName RIR04_GuardAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Outfit Property Outfit_Clothes_Neon_Security_NoHelmet Auto Const mandatory
Outfit Property Outfit_Clothes_Akila_Security_NoHeadwear Auto Const mandatory
Outfit Property Outfit_Clothes_NewAtlantis_Security_NoHelmet Auto Const mandatory
Outfit Property Outfit_Clothes_Security_Guard_01_with_Helmet Auto Const mandatory
Outfit Property Outfit_Freestar_Militia_NoHat Auto Const mandatory
Keyword Property CrimeFactionNeon_Keyword Auto Const mandatory
Keyword Property CrimeFactionAkilaCity_Keyword Auto Const mandatory
Keyword Property CrimeFactionFreestar_Keyword Auto Const mandatory
Keyword Property CrimeFactionUC_Keyword Auto Const mandatory
Keyword Property CrimeFactionHopeTown_Keyword Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property GuardFaction Auto Const mandatory
LocationAlias Property ChosenLocation Auto Const mandatory
Message Property RIR04_SecurityGuardName_Neon Auto Const mandatory
Message Property RIR04_SecurityGuardName_AkilaCity Auto Const mandatory
Message Property RIR04_SecurityGuardName_Freestar Auto Const mandatory
Message Property RIR04_SecurityGuardName_UC Auto Const mandatory
Message Property RIR04_SecurityGuardName_HopeTown Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Actor GuardActor = Self.GetActorRef() ; #DEBUG_LINE_NO:30
  Location MyLocation = ChosenLocation.GetLocation() ; #DEBUG_LINE_NO:31
  If MyLocation.HasKeyword(CrimeFactionNeon_Keyword) ; #DEBUG_LINE_NO:33
    GuardActor.SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet, False) ; #DEBUG_LINE_NO:34
    GuardActor.AddToFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:35
    GuardActor.SetCrimeFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:36
    GuardActor.SetOverrideName(RIR04_SecurityGuardName_Neon) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionAkilaCity_Keyword) ; #DEBUG_LINE_NO:40
    GuardActor.SetOutfit(Outfit_Clothes_Akila_Security_NoHeadwear, False) ; #DEBUG_LINE_NO:41
    GuardActor.AddToFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:42
    GuardActor.SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:43
    GuardActor.SetOverrideName(RIR04_SecurityGuardName_AkilaCity) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword) ; #DEBUG_LINE_NO:47
    GuardActor.SetOutfit(Outfit_Freestar_Militia_NoHat, False) ; #DEBUG_LINE_NO:48
    GuardActor.AddToFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:49
    GuardActor.SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:50
    GuardActor.SetOverrideName(RIR04_SecurityGuardName_Freestar) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionUC_Keyword) ; #DEBUG_LINE_NO:54
    GuardActor.SetOutfit(Outfit_Clothes_NewAtlantis_Security_NoHelmet, False) ; #DEBUG_LINE_NO:55
    GuardActor.AddToFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:56
    GuardActor.SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:57
    GuardActor.SetOverrideName(RIR04_SecurityGuardName_UC) ; #DEBUG_LINE_NO:58
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionHopeTown_Keyword) ; #DEBUG_LINE_NO:61
    GuardActor.SetOutfit(Outfit_Freestar_Militia_NoHat, False) ; #DEBUG_LINE_NO:62
    GuardActor.AddToFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:63
    GuardActor.SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:64
    GuardActor.SetOverrideName(RIR04_SecurityGuardName_HopeTown) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
  GuardActor.AddToFaction(GuardFaction) ; #DEBUG_LINE_NO:68
EndEvent
