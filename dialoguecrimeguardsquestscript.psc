ScriptName DialogueCrimeGuardsQuestScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct CrimeFactionGlobals
  Faction CrimeFaction
  GlobalVariable CountArrests
  GlobalVariable CountJail
  GlobalVariable CountPayFine
  GlobalVariable CountResist
EndStruct


;-- Variables ---------------------------------------
Int CountArrests = 0 Const
Int CountJail = 1 Const
Int CountPayFine = 2 Const
Int CountResist = 3 Const

;-- Properties --------------------------------------
Group CrimeGlobals
  GlobalVariable Property CrimeBribeAmount Auto Const mandatory
  GlobalVariable Property CrimeAllowBribePlayerCreditsRequired Auto Const mandatory
  GlobalVariable Property CrimeBountyAmount Auto Const mandatory
EndGroup

Group SpecialCases
  Keyword Property LocTypeSettlement Auto Const mandatory
  Quest Property City_Akila_Ashta01 Auto Const mandatory
  Location Property CityAkilaCityLocation Auto Const mandatory
  Int Property Ashta01_StageRequired = 50 Auto Const
  Int Property Ashta01_StageToSet = 65 Auto Const
EndGroup

ReferenceAlias Property Alias_Guard Auto Const mandatory
sq_parentscript Property SQ_Parent Auto Const mandatory
dialoguecrimeguardsquestscript:crimefactionglobals[] Property CrimeFactions Auto Const
{ array to hold globals for each crime faction to count player arrests etc. }

;-- Functions ---------------------------------------

Function PlayerResistingArrest()
  Self.IncrementCrimeGlobal(CountResist) ; #DEBUG_LINE_NO:45
  Alias_Guard.TryToSetPlayerResistingArrest() ; #DEBUG_LINE_NO:46
EndFunction

Function PlayerGoToJail()
  Self.IncrementCrimeGlobal(CountJail) ; #DEBUG_LINE_NO:51
  Alias_Guard.TryToSendPlayerToJail(True, False) ; #DEBUG_LINE_NO:52
  SQ_Parent.SendContrabandConfiscatedEvent(Alias_Guard.TryToGetCrimeFaction()) ; #DEBUG_LINE_NO:55
EndFunction

Function PlayerPayFine(Bool abRemoveStolenItems, Bool abGoToJail)
  Self.IncrementCrimeGlobal(CountPayFine) ; #DEBUG_LINE_NO:60
  Alias_Guard.TryToPlayerPayFine(abRemoveStolenItems, abGoToJail) ; #DEBUG_LINE_NO:62
  If abRemoveStolenItems ; #DEBUG_LINE_NO:64
    SQ_Parent.SendContrabandConfiscatedEvent(Alias_Guard.TryToGetCrimeFaction()) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PlayerTryToArrest()
  CrimeAllowBribePlayerCreditsRequired.SetValue(0.0) ; #DEBUG_LINE_NO:71
  CrimeBountyAmount.SetValue(0.0) ; #DEBUG_LINE_NO:72
  Faction CrimeFaction = Alias_Guard.TryToGetCrimeFaction() ; #DEBUG_LINE_NO:74
  If CrimeFaction ; #DEBUG_LINE_NO:76
    Float currentBounty = CrimeFaction.GetCrimeGold() as Float ; #DEBUG_LINE_NO:77
    CrimeBountyAmount.SetValue(currentBounty) ; #DEBUG_LINE_NO:79
    CrimeAllowBribePlayerCreditsRequired.SetValue(currentBounty + CrimeBribeAmount.Getvalue()) ; #DEBUG_LINE_NO:81
    Self.UpdateCurrentInstanceGlobal(CrimeBountyAmount) ; #DEBUG_LINE_NO:82
    Self.UpdateCurrentInstanceGlobal(CrimeAllowBribePlayerCreditsRequired) ; #DEBUG_LINE_NO:83
  EndIf ; #DEBUG_LINE_NO:
  Self.IncrementCrimeGlobal(CountArrests) ; #DEBUG_LINE_NO:86
  If City_Akila_Ashta01.GetStageDone(Ashta01_StageRequired) && City_Akila_Ashta01.GetStageDone(Ashta01_StageToSet) == False ; #DEBUG_LINE_NO:90
    If Game.GetPlayer().GetCurrentLocation().IsSameLocation(CityAkilaCityLocation, LocTypeSettlement) ; #DEBUG_LINE_NO:92
      City_Akila_Ashta01.SetStage(Ashta01_StageToSet) ; #DEBUG_LINE_NO:93
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PlayerSmuggling()
  Alias_Guard.TryToSendSmugglingAlarm() ; #DEBUG_LINE_NO:99
EndFunction

Function IncrementCrimeGlobal(Int globalTypeEnum)
  If globalTypeEnum > -1 && globalTypeEnum <= CountResist ; #DEBUG_LINE_NO:104
    Faction CrimeFaction = Alias_Guard.TryToGetCrimeFaction() ; #DEBUG_LINE_NO:106
    Int factionIndex = CrimeFactions.findstruct("CrimeFaction", CrimeFaction, 0) ; #DEBUG_LINE_NO:107
    If factionIndex > -1 ; #DEBUG_LINE_NO:108
      dialoguecrimeguardsquestscript:crimefactionglobals theFactionGlobals = CrimeFactions[factionIndex] ; #DEBUG_LINE_NO:109
      GlobalVariable countGlobal = None ; #DEBUG_LINE_NO:110
      If globalTypeEnum == CountArrests ; #DEBUG_LINE_NO:111
        countGlobal = theFactionGlobals.CountArrests ; #DEBUG_LINE_NO:112
      ElseIf globalTypeEnum == CountJail ; #DEBUG_LINE_NO:113
        countGlobal = theFactionGlobals.CountJail ; #DEBUG_LINE_NO:114
      ElseIf globalTypeEnum == CountPayFine ; #DEBUG_LINE_NO:115
        countGlobal = theFactionGlobals.CountPayFine ; #DEBUG_LINE_NO:116
      ElseIf globalTypeEnum == CountResist ; #DEBUG_LINE_NO:117
        countGlobal = theFactionGlobals.CountResist ; #DEBUG_LINE_NO:118
      EndIf ; #DEBUG_LINE_NO:
      If countGlobal ; #DEBUG_LINE_NO:120
        countGlobal.Mod(1.0) ; #DEBUG_LINE_NO:121
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TestGoToJail(Faction CrimeFaction, Bool realJail)
  CrimeFaction.SendPlayerToJail(True, realJail) ; #DEBUG_LINE_NO:129
EndFunction
