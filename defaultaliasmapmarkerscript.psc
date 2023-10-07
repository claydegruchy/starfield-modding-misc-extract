ScriptName DefaultAliasMapMarkerScript Extends ReferenceAlias Const default
{ default script to set map marker data on a map marker in an alias }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property AllowGravJump = False Auto Const
{ allow grav jump to the map marker? (only valid for space map markers) }
Bool Property VisibleOnStarMap = True Auto Const
{ Visible on Star Map? }
Bool Property Discovered = False Auto Const
{ set the map marker "discovered"? }
Int Property UndiscoveredVisibility = -1 Auto Const
{ undiscovered visibility: -1 = don't change
  0 = Always (default)
  1 = System
  2 = Planet }
Int Property MapMarkerType = -1 Auto Const
{ map marker type. See SetMapMarkerType in CS wiki for enum values
    -1 = don't change }
Int Property MapMarkerCategory = -1 Auto Const
{ map marker category. See SetMapMarkerCategory in CS wiki for enum values
    -1 = don't change }
Message Property UnexploredName Auto Const
{ OPTIONAL - unexplored name to set on map marker if supplied }
Bool Property EnableOnInit = True Auto Const
{ Enables the map marker on init (usually irrelevant but required for default space cell map markers which are all initially disabled) }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.UpdateMapMarkerFlags() ; #DEBUG_LINE_NO:38
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  Self.UpdateMapMarkerFlags() ; #DEBUG_LINE_NO:43
EndEvent

Function UpdateMapMarkerFlags()
  ObjectReference mapMarkerRef = Self.GetRef() ; #DEBUG_LINE_NO:47
  If mapMarkerRef ; #DEBUG_LINE_NO:48
    mapMarkerRef.SetMarkerAllowGravJump(AllowGravJump) ; #DEBUG_LINE_NO:50
    mapMarkerRef.SetMarkerVisibleOnStarMap(VisibleOnStarMap) ; #DEBUG_LINE_NO:52
    If UndiscoveredVisibility > -1 ; #DEBUG_LINE_NO:53
      mapMarkerRef.SetMarkerUndiscoveredVisibility(UndiscoveredVisibility) ; #DEBUG_LINE_NO:55
    EndIf ; #DEBUG_LINE_NO:
    If MapMarkerType > -1 ; #DEBUG_LINE_NO:57
      mapMarkerRef.SetMapMarkerType(MapMarkerType) ; #DEBUG_LINE_NO:59
    EndIf ; #DEBUG_LINE_NO:
    If MapMarkerCategory > -1 ; #DEBUG_LINE_NO:61
      mapMarkerRef.SetMapMarkerCategory(MapMarkerCategory) ; #DEBUG_LINE_NO:63
    EndIf ; #DEBUG_LINE_NO:
    If UnexploredName ; #DEBUG_LINE_NO:65
      mapMarkerRef.SetMapMarkerUnexploredName(UnexploredName) ; #DEBUG_LINE_NO:67
    EndIf ; #DEBUG_LINE_NO:
    If EnableOnInit ; #DEBUG_LINE_NO:69
      mapMarkerRef.Enable(False) ; #DEBUG_LINE_NO:70
    EndIf ; #DEBUG_LINE_NO:
    If Discovered ; #DEBUG_LINE_NO:72
      mapMarkerRef.SetMarkerDiscovered() ; #DEBUG_LINE_NO:74
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
