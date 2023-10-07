ScriptName SQ_TreasureMapSurfaceQuestScript Extends SQ_TreasureMapQuestScript

;-- Variables ---------------------------------------
Location myDungeonLocation
resource myResource

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard itemTrackingGuard

;-- Properties --------------------------------------
ReferenceAlias Property TreasureContainer Auto Const mandatory
{ Treasure container }
LocationAlias Property dungeonLocation Auto Const mandatory
{ treasure location }
missionparentscript Property MB_Parent Auto Const mandatory
{ holds array of resource AVs }

;-- Functions ---------------------------------------

Bool Function CreateTreasure()
  Bool success = False ; #DEBUG_LINE_NO:18
  ObjectReference treasureRef = Treasure.GetRef() ; #DEBUG_LINE_NO:20
  sq_treasuremapscript treasureMapRef = TreasureMapOriginal.GetRef() as sq_treasuremapscript ; #DEBUG_LINE_NO:21
  If treasureRef as Bool && treasureMapRef as Bool ; #DEBUG_LINE_NO:24
    success = True ; #DEBUG_LINE_NO:25
    If treasureMapRef.TreasureMod ; #DEBUG_LINE_NO:26
      treasureRef.AttachMod(treasureMapRef.TreasureMod, 0) ; #DEBUG_LINE_NO:27
    EndIf ; #DEBUG_LINE_NO:
    treasureRef.PromoteToLegendary(0, None) ; #DEBUG_LINE_NO:30
    TreasureContainer.GetRef().AddItem(treasureRef as Form, 1, False) ; #DEBUG_LINE_NO:31
    If treasureMapRef.TreasureQuantityMax > 1 ; #DEBUG_LINE_NO:34
      Int amountToAdd = Utility.RandomInt(treasureMapRef.TreasureQuantityMin, treasureMapRef.TreasureQuantityMax) - 1 ; #DEBUG_LINE_NO:35
      If amountToAdd > 0 ; #DEBUG_LINE_NO:36
        If treasureMapRef.TreasureAllTheSameThing ; #DEBUG_LINE_NO:38
          Form baseTreasure = treasureRef.GetBaseObject() ; #DEBUG_LINE_NO:40
          TreasureContainer.GetRef().AddItem(baseTreasure, amountToAdd, False) ; #DEBUG_LINE_NO:41
        Else ; #DEBUG_LINE_NO:
          TreasureContainer.GetRef().AddItem(treasureMapRef.Treasure, amountToAdd, False) ; #DEBUG_LINE_NO:43
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If treasureMapRef.TreasureLocation == 1 ; #DEBUG_LINE_NO:48
      MiscObject treasureMiscObject = treasureRef.GetBaseObject() as MiscObject ; #DEBUG_LINE_NO:51
      If treasureMiscObject ; #DEBUG_LINE_NO:52
        missionparentscript:missionsupplytype[] resourceAVs = MB_Parent.resourceAVs ; #DEBUG_LINE_NO:53
        ActorValue resourceAV = None ; #DEBUG_LINE_NO:54
        Int I = 0 ; #DEBUG_LINE_NO:55
        While I < resourceAVs.Length && resourceAV == None ; #DEBUG_LINE_NO:56
          ActorValue testResourceAV = resourceAVs[I].supplyAV ; #DEBUG_LINE_NO:57
          myResource = testResourceAV.GetResource() ; #DEBUG_LINE_NO:58
          If myResource as Bool && treasureMiscObject.GetObjectResourceCount(myResource) as Bool ; #DEBUG_LINE_NO:60
            resourceAV = testResourceAV ; #DEBUG_LINE_NO:61
          EndIf ; #DEBUG_LINE_NO:
          I += 1 ; #DEBUG_LINE_NO:63
        EndWhile ; #DEBUG_LINE_NO:
        If resourceAV ; #DEBUG_LINE_NO:66
          myDungeonLocation = dungeonLocation.GetLocation() ; #DEBUG_LINE_NO:67
          If myDungeonLocation ; #DEBUG_LINE_NO:68
            myDungeonLocation.SetValue(resourceAV, 1.0) ; #DEBUG_LINE_NO:69
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:72
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return success ; #DEBUG_LINE_NO:76
EndFunction

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
  If myDungeonLocation ; #DEBUG_LINE_NO:80
    If akNewLoc == myDungeonLocation || akOldLoc == myDungeonLocation ; #DEBUG_LINE_NO:81
      Self.UpdateItemTracking() ; #DEBUG_LINE_NO:83
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If aiTransferReason == 4 || aiTransferReason == 7 || aiTransferReason == 12 || aiTransferReason == 42 ; #DEBUG_LINE_NO:91
    Self.SetStage(ObjectiveStage) ; #DEBUG_LINE_NO:92
    Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnItemAdded") ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateItemTracking()
  Guard itemTrackingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:101
    Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:102
    If playerRef.GetCurrentLocation() == myDungeonLocation ; #DEBUG_LINE_NO:104
      Self.AddInventoryEventFilter(myResource as Form) ; #DEBUG_LINE_NO:106
      Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnItemAdded") ; #DEBUG_LINE_NO:107
    Else ; #DEBUG_LINE_NO:
      Self.UnregisterForRemoteEvent(playerRef as ScriptObject, "OnItemAdded") ; #DEBUG_LINE_NO:111
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction
