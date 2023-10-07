ScriptName CommonArrayFunctions Extends ScriptObject
{ Holds common functions for dealing with arrays of various types }

;-- Functions ---------------------------------------

Bool Function CheckObjectReferenceAgainstArray(ObjectReference ObjectToCheck, ObjectReference[] ArrayToCheck, Bool returnValueIfArrayIsEmpty) Global
  If ObjectToCheck == None ; #DEBUG_LINE_NO:23
    Return False ; #DEBUG_LINE_NO:25
  ElseIf ArrayToCheck.Length == 0 ; #DEBUG_LINE_NO:26
    Return returnValueIfArrayIsEmpty ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
  Int findVal = ArrayToCheck.find(ObjectToCheck, 0) ; #DEBUG_LINE_NO:31
  Bool returnVal = False ; #DEBUG_LINE_NO:32
  If findVal >= 0 ; #DEBUG_LINE_NO:34
    returnVal = True ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:41
EndFunction

Int Function FindInReferenceAliasArray(ObjectReference ObjectToCheck, ReferenceAlias[] ArrayToCheck) Global
  If ObjectToCheck == None ; #DEBUG_LINE_NO:50
    Return -1 ; #DEBUG_LINE_NO:52
  ElseIf ArrayToCheck.Length == 0 ; #DEBUG_LINE_NO:53
    Return -1 ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
  Int returnVal = -1 ; #DEBUG_LINE_NO:58
  If ObjectToCheck ; #DEBUG_LINE_NO:59
    Int I = 0 ; #DEBUG_LINE_NO:60
    While returnVal == -1 && I < ArrayToCheck.Length ; #DEBUG_LINE_NO:61
      If ArrayToCheck[I].GetReference() == ObjectToCheck ; #DEBUG_LINE_NO:62
        returnVal = I ; #DEBUG_LINE_NO:63
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:65
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:72
EndFunction

Bool Function CheckObjectReferenceAgainstReferenceAliasArray(ObjectReference ObjectToCheck, ReferenceAlias[] ArrayToCheck, Bool returnValueIfArrayIsEmpty) Global
  If ObjectToCheck == None ; #DEBUG_LINE_NO:90
    Return False ; #DEBUG_LINE_NO:92
  ElseIf ArrayToCheck.Length == 0 ; #DEBUG_LINE_NO:93
    Return returnValueIfArrayIsEmpty ; #DEBUG_LINE_NO:95
  EndIf ; #DEBUG_LINE_NO:
  Bool returnVal = CommonArrayFunctions.FindInReferenceAliasArray(ObjectToCheck, ArrayToCheck) > -1 ; #DEBUG_LINE_NO:98
  Return returnVal ; #DEBUG_LINE_NO:102
EndFunction

Bool Function CheckActorAgainstFactionArray(Actor ObjectToCheck, Faction[] ArrayToCheck, Bool returnValueIfArrayIsEmpty) Global
  If ObjectToCheck == None ; #DEBUG_LINE_NO:122
    Return False ; #DEBUG_LINE_NO:124
  ElseIf ArrayToCheck.Length == 0 ; #DEBUG_LINE_NO:125
    Return returnValueIfArrayIsEmpty ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
  Bool returnVal = False ; #DEBUG_LINE_NO:130
  If ObjectToCheck ; #DEBUG_LINE_NO:131
    Int I = 0 ; #DEBUG_LINE_NO:132
    While returnVal == False && I < ArrayToCheck.Length ; #DEBUG_LINE_NO:133
      returnVal = ObjectToCheck.IsInFaction(ArrayToCheck[I]) ; #DEBUG_LINE_NO:134
      I += 1 ; #DEBUG_LINE_NO:135
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:142
EndFunction

Bool Function CheckObjectAgainstKeywordArray(ObjectReference ObjectToCheck, Keyword[] ArrayToCheck, Bool returnValueIfArrayIsEmpty) Global
  If ObjectToCheck == None ; #DEBUG_LINE_NO:160
    Return False ; #DEBUG_LINE_NO:162
  ElseIf ArrayToCheck.Length == 0 ; #DEBUG_LINE_NO:163
    Return returnValueIfArrayIsEmpty ; #DEBUG_LINE_NO:165
  EndIf ; #DEBUG_LINE_NO:
  Bool returnVal = False ; #DEBUG_LINE_NO:168
  If ObjectToCheck ; #DEBUG_LINE_NO:169
    Int I = 0 ; #DEBUG_LINE_NO:170
    While returnVal == False && I < ArrayToCheck.Length ; #DEBUG_LINE_NO:171
      returnVal = ObjectToCheck.HasKeyword(ArrayToCheck[I]) ; #DEBUG_LINE_NO:172
      I += 1 ; #DEBUG_LINE_NO:173
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:180
EndFunction

Bool Function CheckFormAgainstKeywordArray(Form ObjectToCheck, Keyword[] ArrayToCheck, Bool returnValueIfArrayIsEmpty) Global
  If ObjectToCheck == None ; #DEBUG_LINE_NO:197
    Return False ; #DEBUG_LINE_NO:199
  ElseIf ArrayToCheck.Length == 0 ; #DEBUG_LINE_NO:200
    Return returnValueIfArrayIsEmpty ; #DEBUG_LINE_NO:202
  EndIf ; #DEBUG_LINE_NO:
  Bool returnVal = False ; #DEBUG_LINE_NO:205
  If ObjectToCheck ; #DEBUG_LINE_NO:206
    Int I = 0 ; #DEBUG_LINE_NO:207
    While returnVal == False && I < ArrayToCheck.Length ; #DEBUG_LINE_NO:208
      returnVal = ObjectToCheck.HasKeyword(ArrayToCheck[I]) ; #DEBUG_LINE_NO:209
      I += 1 ; #DEBUG_LINE_NO:210
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:217
EndFunction

Bool Function CheckFormAgainstArray(Form FormToCheck, Form[] ArrayToCheck, Bool returnValueIfArrayIsEmpty) Global
  If FormToCheck == None ; #DEBUG_LINE_NO:236
    Return False ; #DEBUG_LINE_NO:238
  ElseIf ArrayToCheck.Length == 0 ; #DEBUG_LINE_NO:239
    Return returnValueIfArrayIsEmpty ; #DEBUG_LINE_NO:241
  EndIf ; #DEBUG_LINE_NO:
  Int findVal = ArrayToCheck.find(FormToCheck, 0) ; #DEBUG_LINE_NO:244
  Bool returnVal = False ; #DEBUG_LINE_NO:245
  If findVal >= 0 ; #DEBUG_LINE_NO:247
    returnVal = True ; #DEBUG_LINE_NO:248
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:254
EndFunction

Bool Function CheckLocationAgainstArray(Location ObjectToCheck, Location[] ArrayToCheck, Location LocationToCheckIsDifferent, Bool returnValueIfArrayIsEmpty, Bool matchIfChildLocation) Global
  If ObjectToCheck == None ; #DEBUG_LINE_NO:274
    Return False ; #DEBUG_LINE_NO:276
  ElseIf ArrayToCheck.Length == 0 ; #DEBUG_LINE_NO:277
    Return returnValueIfArrayIsEmpty ; #DEBUG_LINE_NO:279
  EndIf ; #DEBUG_LINE_NO:
  Int findVal = ArrayToCheck.find(ObjectToCheck, 0) ; #DEBUG_LINE_NO:283
  Bool returnVal = False ; #DEBUG_LINE_NO:284
  If findVal >= 0 && LocationToCheckIsDifferent != ArrayToCheck[findVal] ; #DEBUG_LINE_NO:289
    returnVal = True ; #DEBUG_LINE_NO:290
  ElseIf matchIfChildLocation ; #DEBUG_LINE_NO:
    Int I = 0 ; #DEBUG_LINE_NO:293
    While returnVal == False && I < ArrayToCheck.Length ; #DEBUG_LINE_NO:294
      If ArrayToCheck[I].IsChild(ObjectToCheck) && (LocationToCheckIsDifferent == None || ArrayToCheck[I].IsChild(LocationToCheckIsDifferent) == False) ; #DEBUG_LINE_NO:295
        returnVal = True ; #DEBUG_LINE_NO:297
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:299
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:306
EndFunction

Bool Function CheckLocationAgainstLocationAliasArray(Location ObjectToCheck, LocationAlias[] ArrayToCheck, Location LocationToCheckIsDifferent, Bool returnValueIfArrayIsEmpty, Bool matchIfChildLocation) Global
  If ObjectToCheck == None ; #DEBUG_LINE_NO:325
    Return False ; #DEBUG_LINE_NO:327
  ElseIf ArrayToCheck.Length == 0 ; #DEBUG_LINE_NO:328
    Return returnValueIfArrayIsEmpty ; #DEBUG_LINE_NO:330
  EndIf ; #DEBUG_LINE_NO:
  Bool returnVal = False ; #DEBUG_LINE_NO:333
  If ObjectToCheck ; #DEBUG_LINE_NO:334
    Int I = 0 ; #DEBUG_LINE_NO:335
    While returnVal == False && I < ArrayToCheck.Length ; #DEBUG_LINE_NO:336
      returnVal = ArrayToCheck[I].GetLocation() == ObjectToCheck && LocationToCheckIsDifferent != ArrayToCheck[I].GetLocation() ; #DEBUG_LINE_NO:341
      If !returnVal && matchIfChildLocation ; #DEBUG_LINE_NO:342
        returnVal = ArrayToCheck[I].GetLocation().IsChild(ObjectToCheck) && (LocationToCheckIsDifferent == None || ArrayToCheck[I].GetLocation().IsChild(LocationToCheckIsDifferent) == False) ; #DEBUG_LINE_NO:344
        If returnVal ; #DEBUG_LINE_NO:
           ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:349
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:356
EndFunction

Keyword Function GetFirstFoundKeywordInArrayForLocation(Location LocationToCheck, Keyword[] ArrayToCheck) Global
  Keyword returnVal = None ; #DEBUG_LINE_NO:365
  Int I = 0 ; #DEBUG_LINE_NO:367
  While I < ArrayToCheck.Length && returnVal == None ; #DEBUG_LINE_NO:368
    If LocationToCheck.HasKeyword(ArrayToCheck[I]) ; #DEBUG_LINE_NO:370
      returnVal = ArrayToCheck[I] ; #DEBUG_LINE_NO:371
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:374
  EndWhile ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:379
EndFunction

Faction Function GetFirstFoundFactionInArrayForActor(Actor ActorToCheck, Faction[] ArrayToCheck) Global
  Faction returnVal = None ; #DEBUG_LINE_NO:388
  Int I = 0 ; #DEBUG_LINE_NO:390
  While I < ArrayToCheck.Length && returnVal == None ; #DEBUG_LINE_NO:391
    If ActorToCheck.IsInFaction(ArrayToCheck[I]) ; #DEBUG_LINE_NO:393
      returnVal = ArrayToCheck[I] ; #DEBUG_LINE_NO:394
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:397
  EndWhile ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:402
EndFunction

Bool Function IsActorInArrayHostileToActor(Actor ActorToCheck, ObjectReference[] ArrayToCheck) Global
  Bool returnVal = False ; #DEBUG_LINE_NO:412
  Int I = 0 ; #DEBUG_LINE_NO:414
  While I < ArrayToCheck.Length && returnVal == False ; #DEBUG_LINE_NO:415
    If (ArrayToCheck[I] as Actor).IsHostileToActor(ActorToCheck) ; #DEBUG_LINE_NO:417
      returnVal = True ; #DEBUG_LINE_NO:418
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:421
  EndWhile ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:426
EndFunction

Actor[] Function GetActorArrayFromAliasArray(ReferenceAlias[] AliasArrayToGetActorsFrom) Global
  Actor[] newArray = new Actor[0] ; #DEBUG_LINE_NO:433
  Int I = 0 ; #DEBUG_LINE_NO:435
  While I < AliasArrayToGetActorsFrom.Length ; #DEBUG_LINE_NO:436
    Actor actorRef = AliasArrayToGetActorsFrom[I].GetActorReference() ; #DEBUG_LINE_NO:437
    If actorRef ; #DEBUG_LINE_NO:439
      newArray.add(actorRef, 1) ; #DEBUG_LINE_NO:440
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:443
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

ObjectReference[] Function GetReferenceArrayFromAliasArray(ReferenceAlias[] AliasArrayToGetActorsFrom) Global
  ObjectReference[] newArray = new ObjectReference[0] ; #DEBUG_LINE_NO:449
  Int I = 0 ; #DEBUG_LINE_NO:451
  While I < AliasArrayToGetActorsFrom.Length ; #DEBUG_LINE_NO:452
    ObjectReference ref = AliasArrayToGetActorsFrom[I].GetActorReference() as ObjectReference ; #DEBUG_LINE_NO:453
    If ref ; #DEBUG_LINE_NO:455
      newArray.add(ref, 1) ; #DEBUG_LINE_NO:456
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:459
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Int Function GetCountAliveStateFromArray(Actor[] ArrayToCheck, Bool CheckAlive) Global
  Int count = 0 ; #DEBUG_LINE_NO:468
  Int I = 0 ; #DEBUG_LINE_NO:470
  While I < ArrayToCheck.Length ; #DEBUG_LINE_NO:471
    If ArrayToCheck[I].IsDead() != CheckAlive ; #DEBUG_LINE_NO:472
      count += 1 ; #DEBUG_LINE_NO:473
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:475
  EndWhile ; #DEBUG_LINE_NO:
  Return count ; #DEBUG_LINE_NO:478
EndFunction

Int Function GetCountLoadedStateFromArray(ObjectReference[] ArrayToCheck, Bool Check3DLoaded) Global
  Int count = 0 ; #DEBUG_LINE_NO:485
  Int I = 0 ; #DEBUG_LINE_NO:487
  While I < ArrayToCheck.Length ; #DEBUG_LINE_NO:488
    If ArrayToCheck[I].Is3DLoaded() == Check3DLoaded ; #DEBUG_LINE_NO:489
      count += 1 ; #DEBUG_LINE_NO:490
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:492
  EndWhile ; #DEBUG_LINE_NO:
  Return count ; #DEBUG_LINE_NO:495
EndFunction

Int Function GetCountLoadedAndAliveStateFromArray(Actor[] ArrayToCheck, Bool Check3DLoaded, Bool CheckAlive) Global
  Int count = 0 ; #DEBUG_LINE_NO:503
  Int I = 0 ; #DEBUG_LINE_NO:505
  While I < ArrayToCheck.Length ; #DEBUG_LINE_NO:506
    If ArrayToCheck[I].Is3DLoaded() == Check3DLoaded && ArrayToCheck[I].IsDead() != CheckAlive ; #DEBUG_LINE_NO:507
      count += 1 ; #DEBUG_LINE_NO:508
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:510
  EndWhile ; #DEBUG_LINE_NO:
  Return count ; #DEBUG_LINE_NO:513
EndFunction

Int Function GetCountAliveStateFromAliasArray(ReferenceAlias[] AliasArrayToCheck, Bool CheckAlive) Global
  Actor[] ArrayToCheck = CommonArrayFunctions.GetActorArrayFromAliasArray(AliasArrayToCheck) ; #DEBUG_LINE_NO:521
  Return CommonArrayFunctions.GetCountAliveStateFromArray(ArrayToCheck, CheckAlive) ; #DEBUG_LINE_NO:522
EndFunction

Int Function GetCountLoadedStateFromAliasArray(ReferenceAlias[] AliasArrayToCheck, Bool Check3DLoaded) Global
  ObjectReference[] ArrayToCheck = CommonArrayFunctions.GetReferenceArrayFromAliasArray(AliasArrayToCheck) ; #DEBUG_LINE_NO:530
  Return CommonArrayFunctions.GetCountLoadedStateFromArray(ArrayToCheck, Check3DLoaded) ; #DEBUG_LINE_NO:531
EndFunction

Int Function GetCountLoadedAndAliveStateFromAliasArray(ReferenceAlias[] AliasArrayToCheck, Bool Check3DLoaded, Bool CheckAlive) Global
  Actor[] ArrayToCheck = CommonArrayFunctions.GetActorArrayFromAliasArray(AliasArrayToCheck) ; #DEBUG_LINE_NO:539
  Return CommonArrayFunctions.GetCountLoadedAndAliveStateFromArray(ArrayToCheck, Check3DLoaded, CheckAlive) ; #DEBUG_LINE_NO:540
EndFunction

ReferenceAlias[] Function GetReferenceAliasesFromAliasArray(Alias[] ArrayOfVariousTypesOfAliases) Global
  ReferenceAlias[] returnArray = new ReferenceAlias[0] ; #DEBUG_LINE_NO:547
  Int I = 0 ; #DEBUG_LINE_NO:549
  While I < ArrayOfVariousTypesOfAliases.Length ; #DEBUG_LINE_NO:550
    ReferenceAlias currentReferenceAlias = ArrayOfVariousTypesOfAliases[I] as ReferenceAlias ; #DEBUG_LINE_NO:551
    If currentReferenceAlias ; #DEBUG_LINE_NO:553
      returnArray.add(currentReferenceAlias, 1) ; #DEBUG_LINE_NO:554
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:557
  EndWhile ; #DEBUG_LINE_NO:
  Return returnArray ; #DEBUG_LINE_NO:560
EndFunction

RefCollectionAlias[] Function GetRefCollectionAliasesFromAliasArray(Alias[] ArrayOfVariousTypesOfAliases) Global
  RefCollectionAlias[] returnArray = new RefCollectionAlias[0] ; #DEBUG_LINE_NO:566
  Int I = 0 ; #DEBUG_LINE_NO:568
  While I < ArrayOfVariousTypesOfAliases.Length ; #DEBUG_LINE_NO:569
    RefCollectionAlias currentRefCollectionAlias = ArrayOfVariousTypesOfAliases[I] as RefCollectionAlias ; #DEBUG_LINE_NO:570
    If currentRefCollectionAlias ; #DEBUG_LINE_NO:572
      returnArray.add(currentRefCollectionAlias, 1) ; #DEBUG_LINE_NO:573
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:576
  EndWhile ; #DEBUG_LINE_NO:
  Return returnArray ; #DEBUG_LINE_NO:579
EndFunction

ObjectReference[] Function GetReferencesFromAliasArray(Alias[] ArrayOfVariousTypesOfAliases) Global
  ObjectReference[] refs = new ObjectReference[0] ; #DEBUG_LINE_NO:586
  Int I = 0 ; #DEBUG_LINE_NO:588
  While I < ArrayOfVariousTypesOfAliases.Length ; #DEBUG_LINE_NO:589
    ReferenceAlias currentRefAllias = ArrayOfVariousTypesOfAliases[I] as ReferenceAlias ; #DEBUG_LINE_NO:590
    RefCollectionAlias currentRefCollectionAlias = ArrayOfVariousTypesOfAliases[I] as RefCollectionAlias ; #DEBUG_LINE_NO:591
    ObjectReference currentRef = None ; #DEBUG_LINE_NO:593
    If currentRefAllias ; #DEBUG_LINE_NO:595
      currentRef = currentRefAllias.GetRef() ; #DEBUG_LINE_NO:596
      If currentRef ; #DEBUG_LINE_NO:597
        refs.add(currentRef, 1) ; #DEBUG_LINE_NO:598
      EndIf ; #DEBUG_LINE_NO:
    ElseIf currentRefCollectionAlias ; #DEBUG_LINE_NO:
      ObjectReference[] refColRefs = currentRefCollectionAlias.GetArray() ; #DEBUG_LINE_NO:601
      Int r = 0 ; #DEBUG_LINE_NO:602
      While r < refColRefs.Length ; #DEBUG_LINE_NO:603
        currentRef = refColRefs[r] ; #DEBUG_LINE_NO:604
        If currentRef ; #DEBUG_LINE_NO:606
          refs.add(currentRef, 1) ; #DEBUG_LINE_NO:607
        EndIf ; #DEBUG_LINE_NO:
        r += 1 ; #DEBUG_LINE_NO:610
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:614
  EndWhile ; #DEBUG_LINE_NO:
  Return refs ; #DEBUG_LINE_NO:617
EndFunction

ObjectReference[] Function GetReferencesWithMatchingKeyword(ObjectReference[] ArrayOfRefsToCheck, Keyword KeywordToMatch) Global
  ObjectReference[] returnArray = new ObjectReference[0] ; #DEBUG_LINE_NO:624
  Int I = 0 ; #DEBUG_LINE_NO:626
  While I < ArrayOfRefsToCheck.Length ; #DEBUG_LINE_NO:627
    If ArrayOfRefsToCheck[I].HasKeyword(KeywordToMatch) ; #DEBUG_LINE_NO:628
      returnArray.add(ArrayOfRefsToCheck[I], 1) ; #DEBUG_LINE_NO:629
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:631
  EndWhile ; #DEBUG_LINE_NO:
  Return returnArray ; #DEBUG_LINE_NO:634
EndFunction

Int Function GetRandomIndex(Int ArrayLength) Global
  Return Utility.RandomInt(0, ArrayLength - 1) ; #DEBUG_LINE_NO:639
EndFunction

Int[] Function GetRandomizedIndexes(Int ArrayLength) Global
  Int[] randomizedIndexes = new Int[ArrayLength] ; #DEBUG_LINE_NO:646
  Int I = 0 ; #DEBUG_LINE_NO:649
  While I < ArrayLength ; #DEBUG_LINE_NO:650
    randomizedIndexes[I] = I ; #DEBUG_LINE_NO:651
    I += 1 ; #DEBUG_LINE_NO:652
  EndWhile ; #DEBUG_LINE_NO:
  I = ArrayLength - 1 ; #DEBUG_LINE_NO:656
  While I > 0 ; #DEBUG_LINE_NO:657
    Int r = Utility.RandomInt(0, I) ; #DEBUG_LINE_NO:659
    Int temp = randomizedIndexes[I] ; #DEBUG_LINE_NO:660
    randomizedIndexes[I] = randomizedIndexes[r] ; #DEBUG_LINE_NO:661
    randomizedIndexes[r] = temp ; #DEBUG_LINE_NO:662
    I -= 1 ; #DEBUG_LINE_NO:663
  EndWhile ; #DEBUG_LINE_NO:
  Return randomizedIndexes ; #DEBUG_LINE_NO:666
EndFunction

ObjectReference[] Function CopyObjArray(ObjectReference[] input) Global
  ObjectReference[] output = new ObjectReference[input.Length] ; #DEBUG_LINE_NO:672
  Int I = 0 ; #DEBUG_LINE_NO:673
  While I < input.Length ; #DEBUG_LINE_NO:674
    output[I] = input[I] ; #DEBUG_LINE_NO:675
    I += 1 ; #DEBUG_LINE_NO:676
  EndWhile ; #DEBUG_LINE_NO:
  Return output ; #DEBUG_LINE_NO:678
EndFunction

ObjectReference[] Function CopyAndRandomizeObjArray(ObjectReference[] input) Global
  ObjectReference[] output = CommonArrayFunctions.CopyObjArray(input) ; #DEBUG_LINE_NO:684
  Float[] random = Utility.RandomFloatsFromSeed(Utility.RandomInt(0, 100000), output.Length, 0.0, 1.0) ; #DEBUG_LINE_NO:685
  Int I = output.Length - 1 ; #DEBUG_LINE_NO:686
  While I >= 0 ; #DEBUG_LINE_NO:687
    Int currentRandomIndex = (random[I] * I as Float) as Int ; #DEBUG_LINE_NO:688
    ObjectReference temp = output[I] ; #DEBUG_LINE_NO:689
    output[I] = output[currentRandomIndex] ; #DEBUG_LINE_NO:690
    output[currentRandomIndex] = temp ; #DEBUG_LINE_NO:691
    I -= 1 ; #DEBUG_LINE_NO:692
  EndWhile ; #DEBUG_LINE_NO:
  Return output ; #DEBUG_LINE_NO:694
EndFunction

Actor[] Function CopyActorArray(Actor[] input) Global
  Actor[] output = new Actor[input.Length] ; #DEBUG_LINE_NO:700
  Int I = 0 ; #DEBUG_LINE_NO:701
  While I < input.Length ; #DEBUG_LINE_NO:702
    output[I] = input[I] ; #DEBUG_LINE_NO:703
    I += 1 ; #DEBUG_LINE_NO:704
  EndWhile ; #DEBUG_LINE_NO:
  Return output ; #DEBUG_LINE_NO:706
EndFunction

Actor[] Function CopyAndRandomizeActorArray(Actor[] input) Global
  Actor[] output = CommonArrayFunctions.CopyActorArray(input) ; #DEBUG_LINE_NO:712
  Float[] random = Utility.RandomFloatsFromSeed(Utility.RandomInt(0, 100000), output.Length, 0.0, 1.0) ; #DEBUG_LINE_NO:713
  Int I = output.Length - 1 ; #DEBUG_LINE_NO:714
  While I >= 0 ; #DEBUG_LINE_NO:715
    Int currentRandomIndex = (random[I] * I as Float) as Int ; #DEBUG_LINE_NO:716
    Actor temp = output[I] ; #DEBUG_LINE_NO:717
    output[I] = output[currentRandomIndex] ; #DEBUG_LINE_NO:718
    output[currentRandomIndex] = temp ; #DEBUG_LINE_NO:719
    I -= 1 ; #DEBUG_LINE_NO:720
  EndWhile ; #DEBUG_LINE_NO:
  Return output ; #DEBUG_LINE_NO:722
EndFunction

ObjectReference[] Function GetAllRefsInTriggers(ObjectReference[] triggers) Global
  ObjectReference[] returnVal = new ObjectReference[0] ; #DEBUG_LINE_NO:734
  Int I = 0 ; #DEBUG_LINE_NO:735
  While I < triggers.Length ; #DEBUG_LINE_NO:736
    ObjectReference[] allRefsInCurrentTrigger = triggers[I].GetAllRefsInTrigger() ; #DEBUG_LINE_NO:737
    Int j = 0 ; #DEBUG_LINE_NO:738
    While j < allRefsInCurrentTrigger.Length ; #DEBUG_LINE_NO:739
      If returnVal.find(allRefsInCurrentTrigger[j], 0) < 0 ; #DEBUG_LINE_NO:740
        returnVal.add(allRefsInCurrentTrigger[j], 1) ; #DEBUG_LINE_NO:741
      EndIf ; #DEBUG_LINE_NO:
      j += 1 ; #DEBUG_LINE_NO:743
    EndWhile ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:745
  EndWhile ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:747
EndFunction

ObjectReference[] Function SortRefsByValue(ObjectReference[] input, ActorValue sortAV) Global
  ObjectReference[] sortedInput = new ObjectReference[0] ; #DEBUG_LINE_NO:753
  Int I = 0 ; #DEBUG_LINE_NO:754
  While I < input.Length ; #DEBUG_LINE_NO:755
    ObjectReference current = input[I] ; #DEBUG_LINE_NO:756
    If current != None ; #DEBUG_LINE_NO:757
      Float currentValue = current.GetValue(sortAV) ; #DEBUG_LINE_NO:758
      Int j = 0 ; #DEBUG_LINE_NO:759
      While j < sortedInput.Length ; #DEBUG_LINE_NO:760
        If sortedInput[j].GetValue(sortAV) >= currentValue ; #DEBUG_LINE_NO:761
          sortedInput.insert(current, j) ; #DEBUG_LINE_NO:762
          j = sortedInput.Length + 1 ; #DEBUG_LINE_NO:763
        EndIf ; #DEBUG_LINE_NO:
        j += 1 ; #DEBUG_LINE_NO:765
      EndWhile ; #DEBUG_LINE_NO:
      If j == sortedInput.Length ; #DEBUG_LINE_NO:767
        sortedInput.add(current, 1) ; #DEBUG_LINE_NO:768
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:771
  EndWhile ; #DEBUG_LINE_NO:
  Return sortedInput ; #DEBUG_LINE_NO:773
EndFunction
