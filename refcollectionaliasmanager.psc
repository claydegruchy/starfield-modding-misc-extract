ScriptName RefCollectionAliasManager Extends Quest
{ Looks through a ReferenceCollection and finds the best one and shoves it into sing Reference Alias. }

;-- Structs -----------------------------------------
Struct FactionWeightData
  Faction WhichFaction
  Float Weight
EndStruct

Struct ItemKeywordWeightData
  Keyword ItemKeyword
  Float Weight
EndStruct

Struct MessageData
  Message MessageToDisplay
  GlobalVariable ConditionalGlobal
  Float ConditionalGlobalValue
EndStruct


;-- Variables ---------------------------------------
ObjectReference BestReferenceSoFar
Bool BestWeightHasBeenSet
Float BestWeightSoFar
ObjectReference DistanceToRef
Actor LOSToActor
Keyword StartingKeyword

;-- Properties --------------------------------------
Group Properties
{ Every ref is given a total weight value, this data configures the weights }
  RefCollectionAlias Property RefCollectionToManage Auto Const
  ReferenceAlias Property ReferenceAliasToFill Auto Const
  { What "single" Reference Alias are we going to fill after managing the collection? }
  Float Property DistanceWeight = -1.0 Auto Const
  { Default = -1.  NOTE: Negative value means prefer closest.

How much to we multiply the GetDistance() check to add to a references preference weight?

Check is for distance to player. If you prefer to find closest to something else, see advanced properties. }
  Float Property ValueWeight = 1.0 Auto Const
  { Default = 1.

How much to we multiply the GetGoldValue() check to add to a references preference weight?

Reminder: things without Value GetGoldValue() will return -1 }
  refcollectionaliasmanager:factionweightdata[] Property FactionWeights Auto Const
  { An actor having one or more of these factions will cause the specified amount added to a references preference weight 
(more than one faction listed means more than one weight being added) }
  refcollectionaliasmanager:itemkeywordweightdata[] Property ItemKeywordWeights Auto Const
  { Generates weight based on keywords that item has. If container, GetItemCount() will look for these keywords, each keyword is given a weight, the count of items with each keyword is multiplied by the weight.
Items with multiple keywords get weights based on all the keywords. }
  Bool Property IgnoreCreatedRefs = True Auto Const
  { Default: true; if true, any non-persiting references not existing in the masterfile will be ignored (player dropped, created by script etc.)
Primarily this is used to get dogmeat to ignore things the player dropped. }
  Bool Property IgnoreEmptyContainers = True Auto Const
  { Default: true; if true, empty Containers will not be considered at all for the best reference. In otherwords, they will never fill ReferenceAliasToFill. }
  Bool Property IgnoreThingsBehindPlayer = True Auto Const
  { Ignores anything behind the player's current facing.

See Advanced properties to defining heading angle. }
  Bool Property IgnoreThingsWithoutLOS = False Auto Const
  { ignores anything that doesn't pass a LOS check to the Player OR to ClosestToThisAlias }
  Keyword Property OverrideIgnoreBehindKeyword Auto Const
  { If this quest started by this keyword, ignore the rule about ignoring things behind player.
This is to get this to work better when the player commands dogmeat to find things through dialogue. }
  Bool Property IgnoreIfWouldBeStealing = True Auto Const
  { If true, ignore anything owned }
  ReferenceAlias Property AliasToTestForStealing Auto Const
  { When doing WouldBeStealing check, check for Actor in this alias }
  Float Property MaxZPositionDifference = 300.0 Auto Const
  { Default: 300; if Z position between object and ClosetToThisAlias is greater than this, ignore the item }
  Int Property MinContainerValue = 50 Auto Const
  { Default: 50; ignore any container with a value less than this }
  refcollectionaliasmanager:messagedata[] Property MessagesToDisplayWhenBestItemFound Auto Const
EndGroup

Group Advanced
  ReferenceAlias Property ClosestToThisAlias Auto Const
  { Default: None; if None = Player, if not none, use the reference in this alias for distance calculation }
  ReferenceAlias Property LOSCheckToThisAlias Auto Const
  { Default: None; if None = Player, if not none, use the reference in this alias for LOS calculation }
  Float Property MaxDegreesForInfront = 90.0 Auto Const
  { Default: 90; what is the arc in degrees that means in front of the player }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  If ClosestToThisAlias ; #DEBUG_LINE_NO:125
    DistanceToRef = ClosestToThisAlias.GetReference() ; #DEBUG_LINE_NO:126
  Else ; #DEBUG_LINE_NO:
    DistanceToRef = Game.Getplayer() as ObjectReference ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
  If LOSCheckToThisAlias ; #DEBUG_LINE_NO:131
    LOSToActor = LOSCheckToThisAlias.GetActorRef() ; #DEBUG_LINE_NO:132
  Else ; #DEBUG_LINE_NO:
    LOSToActor = Game.Getplayer() ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
  StartingKeyword = akKeyword ; #DEBUG_LINE_NO:142
EndEvent

Function ProcessCollection()
  Actor TestStealingRef = AliasToTestForStealing.GetActorRef() ; #DEBUG_LINE_NO:148
  Int CountOfRefCollection = RefCollectionToManage.GetCount() ; #DEBUG_LINE_NO:150
  ObjectReference ClosestToThisRef = ClosestToThisAlias.GetReference() ; #DEBUG_LINE_NO:152
  Int I = 0 ; #DEBUG_LINE_NO:154
  While I < CountOfRefCollection ; #DEBUG_LINE_NO:155
    ObjectReference CurrentRef = RefCollectionToManage.GetAt(I) ; #DEBUG_LINE_NO:156
    Float CurrentDistance = CurrentRef.GetDistance(DistanceToRef) ; #DEBUG_LINE_NO:158
    Float CurrentWeightedDistance = CurrentDistance * DistanceWeight ; #DEBUG_LINE_NO:159
    Float CurrentZPositionDifference = Self.GetZPositionDifference(CurrentRef) ; #DEBUG_LINE_NO:161
    Float CurrentValue = 0.0 ; #DEBUG_LINE_NO:163
    If CurrentRef.GetBaseObject() is Container ; #DEBUG_LINE_NO:164
      CurrentValue = CurrentRef.GetInventoryValue() as Float ; #DEBUG_LINE_NO:165
    Else ; #DEBUG_LINE_NO:
      CurrentValue = CurrentRef.GetGoldValue() as Float ; #DEBUG_LINE_NO:167
    EndIf ; #DEBUG_LINE_NO:
    Float CurrentWeightedValue = CurrentValue * ValueWeight ; #DEBUG_LINE_NO:169
    Float CurrentFactionsWeight = Self.GetFactionsWeight(CurrentRef) ; #DEBUG_LINE_NO:178
    Float CurrentItemKeywordsWeight = Self.GetItemKeywordsWeight(CurrentRef) ; #DEBUG_LINE_NO:181
    Float CurrentWeightedTotal = CurrentWeightedDistance + CurrentWeightedValue + CurrentFactionsWeight + CurrentItemKeywordsWeight ; #DEBUG_LINE_NO:185
    If CurrentRef.GetBaseObject() is Container ; #DEBUG_LINE_NO:191
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Bool ignoreMe = False ; #DEBUG_LINE_NO:201
    Actor PlayerRef = Game.Getplayer() ; #DEBUG_LINE_NO:207
    If TestStealingRef.WouldBeStealing(CurrentRef) && IgnoreIfWouldBeStealing ; #DEBUG_LINE_NO:209
      ignoreMe = True ; #DEBUG_LINE_NO:211
    ElseIf IgnoreThingsWithoutLOS && LOSToActor.HasDirectLOS(CurrentRef, "", "") == False && PlayerRef.HasDirectLOS(CurrentRef, "", "") == False && PlayerRef.HasDetectionLOS(CurrentRef) == False ; #DEBUG_LINE_NO:213
      ignoreMe = True ; #DEBUG_LINE_NO:215
    ElseIf CurrentRef.IsCreated() && IgnoreCreatedRefs ; #DEBUG_LINE_NO:217
      ignoreMe = True ; #DEBUG_LINE_NO:219
    ElseIf CurrentZPositionDifference > MaxZPositionDifference ; #DEBUG_LINE_NO:221
      ignoreMe = True ; #DEBUG_LINE_NO:223
    ElseIf CurrentRef.GetBaseObject() is Container ; #DEBUG_LINE_NO:225
      If CurrentRef.GetItemCount(None) == 0 && IgnoreEmptyContainers ; #DEBUG_LINE_NO:226
        ignoreMe = True ; #DEBUG_LINE_NO:228
      ElseIf CurrentRef.GetInventoryValue() < MinContainerValue ; #DEBUG_LINE_NO:230
        ignoreMe = True ; #DEBUG_LINE_NO:232
      EndIf ; #DEBUG_LINE_NO:
    ElseIf IgnoreThingsBehindPlayer && Self.IsBehindPlayer(CurrentRef) && StartingKeyword != OverrideIgnoreBehindKeyword ; #DEBUG_LINE_NO:236
      ignoreMe = True ; #DEBUG_LINE_NO:238
    EndIf ; #DEBUG_LINE_NO:
    If ignoreMe == False && (CurrentWeightedTotal > BestWeightSoFar || BestWeightHasBeenSet == False) ; #DEBUG_LINE_NO:242
      BestWeightHasBeenSet = True ; #DEBUG_LINE_NO:244
      BestWeightSoFar = CurrentWeightedTotal ; #DEBUG_LINE_NO:245
      BestReferenceSoFar = CurrentRef ; #DEBUG_LINE_NO:246
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:252
  EndWhile ; #DEBUG_LINE_NO:
  If BestReferenceSoFar == None ; #DEBUG_LINE_NO:256
    Self.stop() ; #DEBUG_LINE_NO:258
  Else ; #DEBUG_LINE_NO:
    ReferenceAliasToFill.ForceRefTo(BestReferenceSoFar) ; #DEBUG_LINE_NO:263
    Message MessageToDisplayWhenBestItemFound = Self.GetMessageToDisplay() ; #DEBUG_LINE_NO:266
    If MessageToDisplayWhenBestItemFound ; #DEBUG_LINE_NO:267
      MessageToDisplayWhenBestItemFound.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:268
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Message Function GetMessageToDisplay()
  Int I = 0 ; #DEBUG_LINE_NO:275
  While I < MessagesToDisplayWhenBestItemFound.Length ; #DEBUG_LINE_NO:276
    refcollectionaliasmanager:messagedata currentMessageData = MessagesToDisplayWhenBestItemFound[I] ; #DEBUG_LINE_NO:278
    If currentMessageData.ConditionalGlobal.GetValue() == currentMessageData.ConditionalGlobalValue ; #DEBUG_LINE_NO:280
      Return currentMessageData.MessageToDisplay ; #DEBUG_LINE_NO:281
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:284
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Float Function GetFactionsWeight(ObjectReference ReferenceToCheck)
  Float returnVal = 0.0 ; #DEBUG_LINE_NO:292
  Actor ActorToCheck = ReferenceToCheck as Actor ; #DEBUG_LINE_NO:294
  Float TotalFactionWeights = 0.0 ; #DEBUG_LINE_NO:296
  If ActorToCheck ; #DEBUG_LINE_NO:298
    Int I = 0 ; #DEBUG_LINE_NO:299
    While I < FactionWeights.Length ; #DEBUG_LINE_NO:300
      If ActorToCheck.IsInFaction(FactionWeights[I].WhichFaction) ; #DEBUG_LINE_NO:302
        TotalFactionWeights += FactionWeights[I].Weight ; #DEBUG_LINE_NO:305
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:310
    EndWhile ; #DEBUG_LINE_NO:
    returnVal = TotalFactionWeights ; #DEBUG_LINE_NO:313
  Else ; #DEBUG_LINE_NO:
    returnVal = 0.0 ; #DEBUG_LINE_NO:317
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:322
EndFunction

Float Function GetItemKeywordsWeight(ObjectReference ReferenceToCheck)
  Float returnVal = 0.0 ; #DEBUG_LINE_NO:329
  Float TotalItemKeywordsWeights = 0.0 ; #DEBUG_LINE_NO:331
  If ReferenceToCheck ; #DEBUG_LINE_NO:334
    Int I = 0 ; #DEBUG_LINE_NO:335
    While I < ItemKeywordWeights.Length ; #DEBUG_LINE_NO:336
      If ReferenceToCheck.GetBaseObject() is Container ; #DEBUG_LINE_NO:339
        Int itemCount = ReferenceToCheck.GetItemCount(ItemKeywordWeights[I].ItemKeyword as Form) ; #DEBUG_LINE_NO:341
        If itemCount > 0 ; #DEBUG_LINE_NO:343
          TotalItemKeywordsWeights += itemCount as Float * ItemKeywordWeights[I].Weight ; #DEBUG_LINE_NO:346
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        TotalItemKeywordsWeights += ItemKeywordWeights[I].Weight ; #DEBUG_LINE_NO:352
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:356
    EndWhile ; #DEBUG_LINE_NO:
    returnVal = TotalItemKeywordsWeights ; #DEBUG_LINE_NO:360
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:369
EndFunction

Bool Function IsBehindPlayer(ObjectReference ObjectToCheck)
  Float heading = Game.Getplayer().GetHeadingAngle(ObjectToCheck) ; #DEBUG_LINE_NO:378
  Bool returnVal = Math.abs(heading) > MaxDegreesForInfront / 2.0 ; #DEBUG_LINE_NO:382
  Return returnVal ; #DEBUG_LINE_NO:386
EndFunction

Float Function GetZPositionDifference(ObjectReference ObjectToCheck)
  Float ActorZ = ClosestToThisAlias.GetReference().GetPositionZ() ; #DEBUG_LINE_NO:393
  Float ObjectZ = ObjectToCheck.GetPositionZ() ; #DEBUG_LINE_NO:394
  Return Math.abs(ActorZ - ObjectZ) ; #DEBUG_LINE_NO:396
EndFunction
