ScriptName SQ_TreasureMapSpaceQuestScript Extends SQ_TreasureMapQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property GeneralMarkers Auto Const mandatory
{ Possible locations at which loot items can be placed. }
RefCollectionAlias Property TreasureContainers Auto Const mandatory
{ put created containers here }
Container Property SQ_TreasureMap_SpaceCrate Auto Const mandatory
{ standard "space crate" }

;-- Functions ---------------------------------------

Bool Function CreateTreasure()
  Bool success = False ; #DEBUG_LINE_NO:15
  ObjectReference treasureRef = Treasure.GetRef() ; #DEBUG_LINE_NO:17
  sq_treasuremapspacescript treasureMapRef = TreasureMapOriginal.GetRef() as sq_treasuremapspacescript ; #DEBUG_LINE_NO:18
  If treasureRef as Bool && treasureMapRef as Bool ; #DEBUG_LINE_NO:21
    Int I = Utility.RandomInt(treasureMapRef.TreasureContainersMin, treasureMapRef.TreasureContainersMax) ; #DEBUG_LINE_NO:22
    Int markerCount = GeneralMarkers.GetCount() ; #DEBUG_LINE_NO:23
    If I > markerCount ; #DEBUG_LINE_NO:25
      I = markerCount ; #DEBUG_LINE_NO:26
    EndIf ; #DEBUG_LINE_NO:
    Form treasureItem = None ; #DEBUG_LINE_NO:32
    If treasureMapRef.TreasureAllTheSameThing ; #DEBUG_LINE_NO:33
      treasureItem = treasureRef.GetBaseObject() ; #DEBUG_LINE_NO:35
    Else ; #DEBUG_LINE_NO:
      treasureItem = treasureMapRef.Treasure ; #DEBUG_LINE_NO:37
    EndIf ; #DEBUG_LINE_NO:
    While I > 0 ; #DEBUG_LINE_NO:41
      ObjectReference spawnMarker = GeneralMarkers.GetAt(Utility.RandomInt(0, GeneralMarkers.GetCount() - 1)) ; #DEBUG_LINE_NO:42
      ObjectReference newContainer = spawnMarker.PlaceAtMe(SQ_TreasureMap_SpaceCrate as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:43
      GeneralMarkers.RemoveRef(GeneralMarkers.GetAt(I)) ; #DEBUG_LINE_NO:45
      TreasureContainers.AddRef(newContainer) ; #DEBUG_LINE_NO:46
      Int amountToAdd = Utility.RandomInt(treasureMapRef.TreasureQuantityMin, treasureMapRef.TreasureQuantityMax) ; #DEBUG_LINE_NO:49
      If amountToAdd > 0 ; #DEBUG_LINE_NO:50
        newContainer.AddItem(treasureItem, amountToAdd, False) ; #DEBUG_LINE_NO:51
        success = True ; #DEBUG_LINE_NO:52
      EndIf ; #DEBUG_LINE_NO:
      I -= 1 ; #DEBUG_LINE_NO:55
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return success ; #DEBUG_LINE_NO:58
EndFunction
