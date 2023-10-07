ScriptName MapMarkerPlanetTraitScript Extends ObjectReference
{ temp script for showing message about a planet trait when this location is entered }

;-- Variables ---------------------------------------
Bool TraitOverrideInitDone = False

;-- Properties --------------------------------------
sq_parentscript Property SQ_Parent Auto Const mandatory
{ use to get planet trait data }
Int Property DiscoveryTimerID = 1 Auto Const
Float Property DiscoveryTimeSeconds = 0.5 Auto Const
{ how long after discovery to show the message }
Keyword Property LocationTraitOverride Auto hidden
{ set by HandleTraitEnabling, if this map marker has any trait enable linked refs
    if this is set, use this trait instead of looking for a trait keyword on the Location }

;-- Functions ---------------------------------------

Event OnLoad()
  If TraitOverrideInitDone == False ; #DEBUG_LINE_NO:18
    Self.HandleTraitEnabling() ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
  sq_parentscript:planettraitdata theData = SQ_Parent.GetPlanetTraitData(Self as ObjectReference) ; #DEBUG_LINE_NO:22
  If theData ; #DEBUG_LINE_NO:23
    Location traitLocation = Self.GetCurrentLocation() ; #DEBUG_LINE_NO:24
    planet planetToCheck = Self.GetCurrentPlanet() ; #DEBUG_LINE_NO:25
    If planetToCheck.IsTraitKnown(theData.PlanetTrait) ; #DEBUG_LINE_NO:26
      traitLocation.SetExplored(True) ; #DEBUG_LINE_NO:28
    Else ; #DEBUG_LINE_NO:
      Int scanCountNeeded = traitLocation.GetRefTypeAliveCount(SQ_Parent.PlanetTraitScanTargetLocRef) ; #DEBUG_LINE_NO:30
      traitLocation.SetValue(SQ_Parent.PlanetTraitLocationScanCountRequired, scanCountNeeded as Float) ; #DEBUG_LINE_NO:33
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnMapMarkerDiscovered()
  Self.StartTimer(DiscoveryTimeSeconds, DiscoveryTimerID) ; #DEBUG_LINE_NO:41
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == DiscoveryTimerID ; #DEBUG_LINE_NO:45
    SQ_Parent.DiscoverMatchingPlanetTraits(Self as ObjectReference, False) ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function HandleTraitEnabling()
  If TraitOverrideInitDone == False ; #DEBUG_LINE_NO:53
    If LocationTraitOverride == None ; #DEBUG_LINE_NO:54
      Keyword[] matchingTraits = new Keyword[0] ; #DEBUG_LINE_NO:55
      Keyword[] planetTraits = Self.GetCurrentPlanet().GetKeywordTypeList(SQ_Parent.KeywordType_PlanetTrait) ; #DEBUG_LINE_NO:56
      Int planetTraitsIndex = 0 ; #DEBUG_LINE_NO:59
      While planetTraitsIndex < planetTraits.Length ; #DEBUG_LINE_NO:60
        Keyword currentKeyword = planetTraits[planetTraitsIndex] ; #DEBUG_LINE_NO:61
        If Self.GetRefsLinkedToMe(currentKeyword, None).Length > 0 ; #DEBUG_LINE_NO:62
          matchingTraits.add(currentKeyword, 1) ; #DEBUG_LINE_NO:63
        EndIf ; #DEBUG_LINE_NO:
        planetTraitsIndex += 1 ; #DEBUG_LINE_NO:68
      EndWhile ; #DEBUG_LINE_NO:
      If matchingTraits.Length > 0 ; #DEBUG_LINE_NO:73
        Int traitToEnable = Utility.RandomInt(0, matchingTraits.Length - 1) ; #DEBUG_LINE_NO:74
        LocationTraitOverride = matchingTraits[traitToEnable] ; #DEBUG_LINE_NO:75
        Self.GetRefsLinkedToMe(LocationTraitOverride, None)[0].EnableNoWait(False) ; #DEBUG_LINE_NO:78
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  TraitOverrideInitDone = True ; #DEBUG_LINE_NO:82
EndFunction
