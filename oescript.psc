ScriptName OEScript Extends REScript
{ Main Manager for the Overlay Encounter System }

;-- Structs -----------------------------------------
Struct ActorValueDatum
  ActorValue ActorValueToSet
  Float value
EndStruct

Struct CreatureCorpseDatum
  ReferenceAlias CreatureAlias
  { Creature corpse to spawn. This kills the reference in the alias and moves it to the specified marker. 
        Use DefaultGroupSpawnQuestScript to spawn NPC corpses. }
  ReferenceAlias MoveTo
  { Marker to move the corpse to. }
EndStruct

Struct VendorDatum
  ReferenceAlias NPCAlias
  { The Vendor that uses the particular container. }
  ReferenceAlias VendorContainer
  { This is the alias that will hold the Vendor's container. Normally this would hold items by default, 
        but because the contents may change with Keywords added by this script, the container will be cleared and the LL for VendorInventory will be added to the container. }
  LeveledItem VendorInventory
  { The items loaded into the Vendor's container. }
  Faction VendorFaction
  { Filter for: Vendor_OE_* }
  String Comment
  { Used for traces. }
EndStruct


;-- Variables ---------------------------------------
defaultgroupspawnquestscript DefaultGroupSpawnQuest
ObjectReference[] OwnedObjects
Bool gGroupSpawnsFinished = False

;-- Properties --------------------------------------
Group RangeCheck
  Float Property RangeCheckDistance Auto Const
  { Optional - When player's distance to trigger is less than this, stage RangeCheckStage will be set. }
  Int Property RangeCheckStage Auto Const
  { Optional - When player's distance to trigger is less than RangeCheckDistance, set this stage. }
EndGroup

Group Overlay_Settings
  oescript:actorvaluedatum[] Property LocationActorValues Auto Const
  { actor values added to the Location }
  Location Property OE_Location Auto hidden
  { set on startup with the current Location }
EndGroup

Group Creature_Settings
  oescript:creaturecorpsedatum[] Property CreatureCorpseData Auto Const
EndGroup

Group Object_Settings
  oescript:vendordatum[] Property VendorData Auto Const
  Faction Property OwningFaction Auto
  { If set to None, nothing created by the OEScript is owned
         If NONE, will be set by DefaultGroupSpawnQuestScript to first owner faction it sets }
  Int Property RewardContainerLockLevel = 0 Auto Const
  { If a Reward Container is available, this sets its lock level.
        0=Unlocked, 25=Novice, 50=Advanced, 75=Expert, 100=Master
        251=Barred, 252=Chained, 253=Terminal Only, 254=Inaccessible, 255=Requires Key.
        If set to 255, it will try to generate a key and place it in the Key_Reward alias. }
  ReferenceAlias Property Marker_Key Auto Const
  { Location where the Key will be spawned if the RewardContainerLockLevel is set to 255. If blank, the key won't be spawned. By default, key is enabled. }
  LeveledItem Property LL_OE_Default_Reward Auto Const
  { Used to populate the Reward Container. }
EndGroup

Group Stage_Settings
  Int Property QuestSetupCompleteStage = -1 Auto Const
  { stage is set when quest is fully setup (bFinishedOnStoryEvent=true) }
EndGroup

Group AutofillProperties
  ReferenceAlias Property Trigger Auto Const mandatory
  ReferenceAlias Property Container_Reward Auto Const
  ReferenceAlias Property Key_Reward Auto Const
  { The Reference to the Reward Container's key, if applicable. }
  ReferenceAlias Property Marker_Center Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  Parent.OnQuestStarted() ; #DEBUG_LINE_NO:108
  DefaultGroupSpawnQuest = (Self as Quest) as defaultgroupspawnquestscript ; #DEBUG_LINE_NO:110
  OwnedObjects = new ObjectReference[0] ; #DEBUG_LINE_NO:111
  Parent.DefineCustomLogs() ; #DEBUG_LINE_NO:113
  If DefaultGroupSpawnQuest ; #DEBUG_LINE_NO:118
    DefaultGroupSpawnQuest.InitialGroupSpawn(LocalScriptName) ; #DEBUG_LINE_NO:120
    gGroupSpawnsFinished = DefaultGroupSpawnQuest.GroupSetupCompleted ; #DEBUG_LINE_NO:121
  EndIf ; #DEBUG_LINE_NO:
  Self._PushLocationAVs() ; #DEBUG_LINE_NO:127
  Int failsafeCounter = 20 ; #DEBUG_LINE_NO:130
  While gGroupSpawnsFinished == False && failsafeCounter > 0 && DefaultGroupSpawnQuest as Bool ; #DEBUG_LINE_NO:131
    gGroupSpawnsFinished = DefaultGroupSpawnQuest.GroupSetupCompleted ; #DEBUG_LINE_NO:133
    Utility.wait(1.0) ; #DEBUG_LINE_NO:134
    failsafeCounter -= 1 ; #DEBUG_LINE_NO:135
  EndWhile ; #DEBUG_LINE_NO:
  Self._SetupRewardContainer() ; #DEBUG_LINE_NO:138
  Self._SetupCreatureCorpses() ; #DEBUG_LINE_NO:141
  If RangeCheckDistance > 0.0 ; #DEBUG_LINE_NO:144
    ObjectReference centerMarkerRef = Marker_Center.GetRef() ; #DEBUG_LINE_NO:145
    Self.RegisterForDistanceLessThanEvent(Game.GetPlayer() as ScriptObject, centerMarkerRef as ScriptObject, RangeCheckDistance, 0) ; #DEBUG_LINE_NO:147
  EndIf ; #DEBUG_LINE_NO:
  bFinishedOnStoryEvent = True ; #DEBUG_LINE_NO:150
  If QuestSetupCompleteStage > -1 ; #DEBUG_LINE_NO:153
    Self.SetStage(QuestSetupCompleteStage) ; #DEBUG_LINE_NO:154
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.SetStage(RangeCheckStage) ; #DEBUG_LINE_NO:162
  Self._SetupVendors() ; #DEBUG_LINE_NO:163
EndEvent

Function _PushLocationAVs()
  Int index = 0 ; #DEBUG_LINE_NO:168
  If OE_Location == None ; #DEBUG_LINE_NO:170
    If Marker_Center.GetRef() ; #DEBUG_LINE_NO:171
      OE_Location = Marker_Center.GetRef().GetCurrentLocation() ; #DEBUG_LINE_NO:172
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If OE_Location ; #DEBUG_LINE_NO:179
    index = 0 ; #DEBUG_LINE_NO:180
    While index < LocationActorValues.Length ; #DEBUG_LINE_NO:181
      OE_Location.SetValue(LocationActorValues[index].ActorValueToSet, LocationActorValues[index].value) ; #DEBUG_LINE_NO:182
      index += 1 ; #DEBUG_LINE_NO:183
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function _SetupVendors()
  Int index = 0 ; #DEBUG_LINE_NO:194
  While index < VendorData.Length ; #DEBUG_LINE_NO:197
    If ((VendorData[index].VendorContainer as Bool && VendorData[index].NPCAlias as Bool) && VendorData[index].VendorFaction as Bool) && VendorData[index].VendorInventory as Bool ; #DEBUG_LINE_NO:199
      Self._SetupVendor(index) ; #DEBUG_LINE_NO:200
    EndIf ; #DEBUG_LINE_NO:
    index += 1 ; #DEBUG_LINE_NO:205
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function _SetupVendor(Int aiVendorIndex)
  ObjectReference VendorContainer = VendorData[aiVendorIndex].VendorContainer.GetRef() ; #DEBUG_LINE_NO:212
  Faction VendorFaction = VendorData[aiVendorIndex].VendorFaction ; #DEBUG_LINE_NO:213
  LeveledItem VendorInventory = VendorData[aiVendorIndex].VendorInventory ; #DEBUG_LINE_NO:214
  ReferenceAlias VendorNPC = VendorData[aiVendorIndex].NPCAlias ; #DEBUG_LINE_NO:215
  String VendorName = VendorData[aiVendorIndex].Comment ; #DEBUG_LINE_NO:216
  VendorContainer.RemoveAllItems(None, False, False) ; #DEBUG_LINE_NO:219
  If VendorNPC ; #DEBUG_LINE_NO:221
    VendorContainer.AddItem(VendorInventory as Form, 1, False) ; #DEBUG_LINE_NO:222
    (VendorNPC.GetRef() as Actor).AddToFaction(VendorFaction) ; #DEBUG_LINE_NO:223
  EndIf ; #DEBUG_LINE_NO:
  VendorContainer.Lock(True, False, True) ; #DEBUG_LINE_NO:226
EndFunction

Function _SetupRewardContainer()
  If Container_Reward ; #DEBUG_LINE_NO:232
    ObjectReference ContainerREF = Container_Reward.GetRef() ; #DEBUG_LINE_NO:233
    If ContainerREF ; #DEBUG_LINE_NO:235
      If LL_OE_Default_Reward ; #DEBUG_LINE_NO:237
        ContainerREF.AddItem(LL_OE_Default_Reward as Form, 1, False) ; #DEBUG_LINE_NO:238
      EndIf ; #DEBUG_LINE_NO:
      ContainerREF.SetLockLevel(RewardContainerLockLevel) ; #DEBUG_LINE_NO:248
      If RewardContainerLockLevel > 0 ; #DEBUG_LINE_NO:250
        ContainerREF.Lock(True, False, True) ; #DEBUG_LINE_NO:251
      EndIf ; #DEBUG_LINE_NO:
      If RewardContainerLockLevel == 255 ; #DEBUG_LINE_NO:254
        Self._SetupContainerKey(ContainerREF) ; #DEBUG_LINE_NO:255
      EndIf ; #DEBUG_LINE_NO:
      Self._SetupOwners(ContainerREF) ; #DEBUG_LINE_NO:259
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function _SetupOwners(ObjectReference akRefToOwn)
  If akRefToOwn as Bool && OwningFaction as Bool ; #DEBUG_LINE_NO:268
    akRefToOwn.SetFactionOwner(OwningFaction, False) ; #DEBUG_LINE_NO:269
    OwnedObjects.add(akRefToOwn, 1) ; #DEBUG_LINE_NO:270
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function _ClearOwners(Bool bClearRewardContainer, Bool bClearObjects)
  ObjectReference ContainerREF = Container_Reward.GetRef() ; #DEBUG_LINE_NO:277
  Int index = 0 ; #DEBUG_LINE_NO:278
  If bClearObjects ; #DEBUG_LINE_NO:280
    While index < OwnedObjects.Length ; #DEBUG_LINE_NO:282
      OwnedObjects[index].SetFactionOwner(None, False) ; #DEBUG_LINE_NO:284
      index += 1 ; #DEBUG_LINE_NO:285
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If bClearRewardContainer && ContainerREF as Bool ; #DEBUG_LINE_NO:289
    ContainerREF.SetFactionOwner(None, False) ; #DEBUG_LINE_NO:291
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function _SetupContainerKey(ObjectReference akLockedObjectRef)
  ObjectReference KeyMarkerREF = Marker_Key.GetRef() ; #DEBUG_LINE_NO:297
  ObjectReference KeyObjectREF = None ; #DEBUG_LINE_NO:298
  Key KeyToPlace = None ; #DEBUG_LINE_NO:299
  If KeyMarkerREF == None ; #DEBUG_LINE_NO:301
    KeyMarkerREF = Marker_Center.GetRef() ; #DEBUG_LINE_NO:302
  EndIf ; #DEBUG_LINE_NO:
  If KeyMarkerREF as Bool && akLockedObjectRef as Bool ; #DEBUG_LINE_NO:305
    KeyObjectREF = KeyMarkerREF.PlaceLockedRefKeyAtMe(akLockedObjectRef, 1, False, False, True) ; #DEBUG_LINE_NO:306
    If KeyObjectREF ; #DEBUG_LINE_NO:307
      Key_Reward.ForceRefTo(KeyObjectREF) ; #DEBUG_LINE_NO:308
    Else ; #DEBUG_LINE_NO:
      KeyToPlace = akLockedObjectRef.GetKey() ; #DEBUG_LINE_NO:310
      If KeyToPlace ; #DEBUG_LINE_NO:311
        KeyObjectREF = KeyMarkerREF.PlaceAtMe(KeyToPlace as Form, 1, False, False, True, None, Key_Reward as Alias, True) ; #DEBUG_LINE_NO:312
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function _SetupCreatureCorpses()
  Int CorpseIndex = 0 ; #DEBUG_LINE_NO:324
  While CorpseIndex < CreatureCorpseData.Length ; #DEBUG_LINE_NO:326
    oescript:creaturecorpsedatum theCorpseData = CreatureCorpseData[CorpseIndex] ; #DEBUG_LINE_NO:327
    If theCorpseData.CreatureAlias ; #DEBUG_LINE_NO:328
      ObjectReference Corpse = theCorpseData.CreatureAlias.GetRef() ; #DEBUG_LINE_NO:329
      If Corpse ; #DEBUG_LINE_NO:330
        Corpse.TryToKill(None) ; #DEBUG_LINE_NO:331
        If theCorpseData.MoveTo ; #DEBUG_LINE_NO:332
          ObjectReference Marker = theCorpseData.MoveTo.GetRef() ; #DEBUG_LINE_NO:333
          If Corpse as Bool && Marker as Bool ; #DEBUG_LINE_NO:334
            Corpse.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:336
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    CorpseIndex += 1 ; #DEBUG_LINE_NO:341
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ClearAllObjectOwnership(Bool bRewardContainer, Bool bClearAllObjects)
  Self._ClearOwners(bRewardContainer, bClearAllObjects) ; #DEBUG_LINE_NO:353
EndFunction
