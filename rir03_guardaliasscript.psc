ScriptName RIR03_GuardAliasScript Extends ReferenceAlias

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
Keyword Property CrimeFactionParadiso_Keyword Auto Const mandatory
Keyword Property CrimeFactionHopeTown_Keyword Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimeFactionParadiso Auto Const mandatory
Faction Property GuardFaction Auto Const mandatory
LocationAlias Property ChosenLocation Auto Const mandatory
Message Property RIR03_SecurityGuardName_Neon Auto Const mandatory
Message Property RIR03_SecurityGuardName_AkilaCity Auto Const mandatory
Message Property RIR03_SecurityGuardName_Freestar Auto Const mandatory
Message Property RIR03_SecurityGuardName_UC Auto Const mandatory
Message Property RIR03_SecurityGuardName_Paradiso Auto Const mandatory
Message Property RIR03_SecurityGuardName_HopeTown Auto Const mandatory
Message Property RIR03_KeycardName_Neon Auto Const mandatory
Message Property RIR03_KeycardName_AkilaCity Auto Const mandatory
Message Property RIR03_KeycardName_Freestar Auto Const mandatory
Message Property RIR03_KeycardName_UC Auto Const mandatory
Message Property RIR03_KeycardName_Paradiso Auto Const mandatory
Message Property RIR03_KeycardName_HopeTown Auto Const mandatory
ReferenceAlias Property Keycard Auto Const mandatory
ReferenceAlias Property KeycardSafe Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Actor GuardActor = Self.GetActorRef() ; #DEBUG_LINE_NO:43
  Location MyLocation = ChosenLocation.GetLocation() ; #DEBUG_LINE_NO:44
  If MyLocation.HasKeyword(CrimeFactionNeon_Keyword) ; #DEBUG_LINE_NO:46
    GuardActor.SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet, False) ; #DEBUG_LINE_NO:47
    GuardActor.AddToFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:48
    GuardActor.SetCrimeFaction(CrimeFactionNeon) ; #DEBUG_LINE_NO:49
    GuardActor.SetOverrideName(RIR03_SecurityGuardName_Neon) ; #DEBUG_LINE_NO:50
    Keycard.GetRef().SetOverrideName(RIR03_KeycardName_Neon) ; #DEBUG_LINE_NO:51
    KeycardSafe.GetRef().SetOverrideName(RIR03_KeycardName_Neon) ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionAkilaCity_Keyword) ; #DEBUG_LINE_NO:55
    GuardActor.SetOutfit(Outfit_Clothes_Akila_Security_NoHeadwear, False) ; #DEBUG_LINE_NO:56
    GuardActor.AddToFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:57
    GuardActor.SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:58
    GuardActor.SetOverrideName(RIR03_SecurityGuardName_AkilaCity) ; #DEBUG_LINE_NO:59
    Keycard.GetRef().SetOverrideName(RIR03_KeycardName_AkilaCity) ; #DEBUG_LINE_NO:60
    KeycardSafe.GetRef().SetOverrideName(RIR03_KeycardName_AkilaCity) ; #DEBUG_LINE_NO:61
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword) ; #DEBUG_LINE_NO:64
    GuardActor.SetOutfit(Outfit_Freestar_Militia_NoHat, False) ; #DEBUG_LINE_NO:65
    GuardActor.AddToFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:66
    GuardActor.SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:67
    GuardActor.SetOverrideName(RIR03_SecurityGuardName_Freestar) ; #DEBUG_LINE_NO:68
    Keycard.GetRef().SetOverrideName(RIR03_KeycardName_Freestar) ; #DEBUG_LINE_NO:69
    KeycardSafe.GetRef().SetOverrideName(RIR03_KeycardName_Freestar) ; #DEBUG_LINE_NO:70
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionUC_Keyword) ; #DEBUG_LINE_NO:73
    GuardActor.SetOutfit(Outfit_Clothes_NewAtlantis_Security_NoHelmet, False) ; #DEBUG_LINE_NO:74
    GuardActor.AddToFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:75
    GuardActor.SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:76
    GuardActor.SetOverrideName(RIR03_SecurityGuardName_UC) ; #DEBUG_LINE_NO:77
    Keycard.GetRef().SetOverrideName(RIR03_KeycardName_UC) ; #DEBUG_LINE_NO:78
    KeycardSafe.GetRef().SetOverrideName(RIR03_KeycardName_UC) ; #DEBUG_LINE_NO:79
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionParadiso_Keyword) ; #DEBUG_LINE_NO:82
    GuardActor.SetOutfit(Outfit_Clothes_Security_Guard_01_with_Helmet, False) ; #DEBUG_LINE_NO:83
    GuardActor.AddToFaction(CrimeFactionParadiso) ; #DEBUG_LINE_NO:84
    GuardActor.SetCrimeFaction(CrimeFactionParadiso) ; #DEBUG_LINE_NO:85
    GuardActor.SetOverrideName(RIR03_SecurityGuardName_Paradiso) ; #DEBUG_LINE_NO:86
    Keycard.GetRef().SetOverrideName(RIR03_KeycardName_Paradiso) ; #DEBUG_LINE_NO:87
    KeycardSafe.GetRef().SetOverrideName(RIR03_KeycardName_Paradiso) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionHopeTown_Keyword) ; #DEBUG_LINE_NO:91
    GuardActor.SetOutfit(Outfit_Freestar_Militia_NoHat, False) ; #DEBUG_LINE_NO:92
    GuardActor.AddToFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:93
    GuardActor.SetCrimeFaction(CrimeFactionFreestar) ; #DEBUG_LINE_NO:94
    GuardActor.SetOverrideName(RIR03_SecurityGuardName_HopeTown) ; #DEBUG_LINE_NO:95
    Keycard.GetRef().SetOverrideName(RIR03_KeycardName_HopeTown) ; #DEBUG_LINE_NO:96
    KeycardSafe.GetRef().SetOverrideName(RIR03_KeycardName_HopeTown) ; #DEBUG_LINE_NO:97
  EndIf ; #DEBUG_LINE_NO:
  GuardActor.AddToFaction(GuardFaction) ; #DEBUG_LINE_NO:100
EndEvent
