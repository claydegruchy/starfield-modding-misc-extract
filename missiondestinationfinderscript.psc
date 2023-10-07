ScriptName MissionDestinationFinderScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
missionparentscript Property MissionParent Auto Const mandatory
{ mission parent quest }
Keyword Property LocTypeMajorOrbital Auto Const mandatory
Keyword Property MissionBoardReserved Auto Const mandatory
{ used to tag "reserved" mission board refs }
LocationAlias Property SourcePlanet Auto Const mandatory
{ source planet location }
LocationAlias[] Property DestinationLocations Auto Const mandatory
{ array of destination locations }
RefCollectionAlias[] Property DestinationRefCollections Auto Const mandatory
{ array of collections holding destination ref }

;-- Functions ---------------------------------------

Bool Function FindMatchingDestination(missionparentscript:missionlocreftype[] cargoTypes, RefCollectionAlias SourceCollection, ReferenceAlias SourceAlias, ReferenceAlias DestinationAlias, LocationAlias DestinationLocationAlias)
  Bool foundValidDestination = False ; #DEBUG_LINE_NO:22
  Form[] sourceMarkers = new Form[0] ; #DEBUG_LINE_NO:25
  Int j = 0 ; #DEBUG_LINE_NO:26
  While j < SourceCollection.GetCount() ; #DEBUG_LINE_NO:27
    ObjectReference sourceRef = SourceCollection.GetAt(j) ; #DEBUG_LINE_NO:28
    If sourceRef.HasKeyword(MissionBoardReserved) == False ; #DEBUG_LINE_NO:29
      sourceMarkers.add(sourceRef.GetBaseObject(), 1) ; #DEBUG_LINE_NO:30
    EndIf ; #DEBUG_LINE_NO:
    j += 1 ; #DEBUG_LINE_NO:34
  EndWhile ; #DEBUG_LINE_NO:
  Int I = cargoTypes.Length - 1 ; #DEBUG_LINE_NO:38
  While I > -1 ; #DEBUG_LINE_NO:39
    If sourceMarkers.find(cargoTypes[I].cargoSourceBase, 0) < 0 ; #DEBUG_LINE_NO:41
      cargoTypes.remove(I, 1) ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
    I -= 1 ; #DEBUG_LINE_NO:47
  EndWhile ; #DEBUG_LINE_NO:
  If cargoTypes.Length > 0 ; #DEBUG_LINE_NO:51
    ObjectReference[] destinationRefs = new ObjectReference[0] ; #DEBUG_LINE_NO:53
    Form[] destinationMarkers = new Form[0] ; #DEBUG_LINE_NO:54
    Location sourcePlanetLocation = SourcePlanet.GetLocation() ; #DEBUG_LINE_NO:55
    I = 0 ; #DEBUG_LINE_NO:57
    While I < DestinationLocations.Length ; #DEBUG_LINE_NO:58
      Location theLocation = DestinationLocations[I].GetLocation() ; #DEBUG_LINE_NO:59
      If theLocation as Bool && theLocation.IsSameLocation(sourcePlanetLocation, LocTypeMajorOrbital) == False ; #DEBUG_LINE_NO:62
        RefCollectionAlias theCollection = DestinationRefCollections[I] ; #DEBUG_LINE_NO:63
        If theLocation as Bool && theCollection.GetCount() > 0 ; #DEBUG_LINE_NO:64
          Int k = 0 ; #DEBUG_LINE_NO:65
          While k < theCollection.GetCount() ; #DEBUG_LINE_NO:66
            destinationRefs.add(theCollection.GetAt(k), 1) ; #DEBUG_LINE_NO:67
            k += 1 ; #DEBUG_LINE_NO:68
          EndWhile ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:74
    EndWhile ; #DEBUG_LINE_NO:
    j = 0 ; #DEBUG_LINE_NO:79
    While j < destinationRefs.Length ; #DEBUG_LINE_NO:80
      ObjectReference destinationRef = destinationRefs[j] ; #DEBUG_LINE_NO:81
      If destinationRef.HasKeyword(MissionBoardReserved) == False ; #DEBUG_LINE_NO:82
        destinationMarkers.add(destinationRef.GetBaseObject(), 1) ; #DEBUG_LINE_NO:83
      EndIf ; #DEBUG_LINE_NO:
      j += 1 ; #DEBUG_LINE_NO:87
    EndWhile ; #DEBUG_LINE_NO:
    I = destinationMarkers.Length - 1 ; #DEBUG_LINE_NO:92
    While I > -1 ; #DEBUG_LINE_NO:93
      Int cargoTypesIndex = cargoTypes.findstruct("cargoDestinationBase", destinationMarkers[I], 0) ; #DEBUG_LINE_NO:95
      If cargoTypesIndex < 0 ; #DEBUG_LINE_NO:96
        destinationRefs.remove(I, 1) ; #DEBUG_LINE_NO:99
        destinationMarkers.remove(I, 1) ; #DEBUG_LINE_NO:100
      EndIf ; #DEBUG_LINE_NO:
      I -= 1 ; #DEBUG_LINE_NO:102
    EndWhile ; #DEBUG_LINE_NO:
    If destinationMarkers.Length > 0 ; #DEBUG_LINE_NO:105
      Self.DebugShowDestinationMarkers(destinationRefs) ; #DEBUG_LINE_NO:108
      Int destinationRefIndex = Utility.RandomInt(0, destinationRefs.Length - 1) ; #DEBUG_LINE_NO:111
      ObjectReference destinationref = destinationRefs[destinationRefIndex] ; #DEBUG_LINE_NO:113
      If destinationref ; #DEBUG_LINE_NO:117
        I = 0 ; #DEBUG_LINE_NO:118
        Location destinationLocation = None ; #DEBUG_LINE_NO:119
        While I < DestinationRefCollections.Length && destinationLocation == None ; #DEBUG_LINE_NO:120
          If DestinationRefCollections[I].Find(destinationref) > -1 ; #DEBUG_LINE_NO:121
            destinationLocation = DestinationLocations[I].GetLocation() ; #DEBUG_LINE_NO:122
          EndIf ; #DEBUG_LINE_NO:
          I += 1 ; #DEBUG_LINE_NO:124
        EndWhile ; #DEBUG_LINE_NO:
        If destinationref as Bool && destinationLocation as Bool ; #DEBUG_LINE_NO:126
          foundValidDestination = True ; #DEBUG_LINE_NO:127
          DestinationAlias.ForceRefTo(destinationref) ; #DEBUG_LINE_NO:129
          DestinationLocationAlias.ForceLocationTo(destinationLocation) ; #DEBUG_LINE_NO:130
          Form destinationMarker = destinationMarkers[destinationRefIndex] ; #DEBUG_LINE_NO:133
          Int cargoTypeIndex = cargoTypes.findstruct("cargoDestinationBase", destinationMarker, 0) ; #DEBUG_LINE_NO:134
          Int sourceIndex = sourceMarkers.find(cargoTypes[cargoTypeIndex].cargoSourceBase, 0) ; #DEBUG_LINE_NO:135
          Form sourceMarker = sourceMarkers[sourceIndex] ; #DEBUG_LINE_NO:144
          j = 0 ; #DEBUG_LINE_NO:145
          ObjectReference sourceref = None ; #DEBUG_LINE_NO:146
          While j < SourceCollection.GetCount() && sourceref == None ; #DEBUG_LINE_NO:147
            ObjectReference collectionRef = SourceCollection.GetAt(j) ; #DEBUG_LINE_NO:148
            If collectionRef.GetBaseObject() == sourceMarker ; #DEBUG_LINE_NO:149
              sourceref = collectionRef ; #DEBUG_LINE_NO:150
            EndIf ; #DEBUG_LINE_NO:
            j += 1 ; #DEBUG_LINE_NO:152
          EndWhile ; #DEBUG_LINE_NO:
          If sourceref ; #DEBUG_LINE_NO:155
            SourceAlias.ForceRefTo(sourceref) ; #DEBUG_LINE_NO:156
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return foundValidDestination ; #DEBUG_LINE_NO:168
EndFunction

Function DebugShowDestinationMarkers(ObjectReference[] destinationRefs)
  Int I = 0 ; #DEBUG_LINE_NO:173
  While I < destinationRefs.Length ; #DEBUG_LINE_NO:174
    ObjectReference theRef = destinationRefs[I] ; #DEBUG_LINE_NO:175
    I += 1 ; #DEBUG_LINE_NO:177
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
