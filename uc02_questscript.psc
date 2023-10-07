ScriptName UC02_QuestScript Extends Quest

;-- Structs -----------------------------------------
Struct BuildingPowerDatum
  RefCollectionAlias PowerBoxCollection
  { Ref collection that contains all the powerboxes for this building }
  ReferenceAlias PrimaryBoxAlias
  { Alias for the first box we want to direct the player towards }
  ReferenceAlias SecondaryBoxAlias
  { Alias for the second box we want to direct the player towards }
  ReferenceAlias TertiaryBoxAlias
  { Alias for the third box we want to direct the player towards }
  ReferenceAlias ObjAlias
  { Alias used to manage the objective }
  Int ArrayIndex
  { An index used to look up the which array of power boxes to loop through }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group ObjIndicesAndStages
  Int Property ActivatePowerBoxesStage = 601 Auto Const
  { Stage set to direct the player to activate the power boxes }
  Int Property PowerBoxActivatedObj = 601 Auto Const
  { Objective index for the player to start activating powerboxes }
  Int Property RestoreLivestockScannerObj = 602 Auto Const
  { Objective index for "Restore the tracker" objective }
  Int Property FirstLureActivatedStage = 630 Auto Const
  { Stage set when the first lure is activated }
  Int Property AllPoweredUpObj = 650 Auto Const
  { Objective index to set once all the boxes are turned on }
  Int Property TerrormorphDeadStage = 700 Auto Const
  { Stage set if the Terrormorph bites it }
EndGroup

Group Objects
  GlobalVariable Property UC02_PowerBoxesActivated Auto Const mandatory
  { Global variable used to track how many power boxes the player has activated }
  GlobalVariable Property UC02_PowerBoxesTotal Auto Const mandatory
  { Global variable used to track the total number of power boxes }
  uc02_questscript:buildingpowerdatum[] Property BuildingPowerData Auto mandatory
  { Array of building power data }
  wwiseevent Property PrimeSoundEvent Auto Const mandatory
  { Sound to play when the pumps are primed }
EndGroup

Group Aliases
  RefCollectionAlias Property PowerBoxes Auto Const mandatory
  { General holding collection for powerboxes }
  ReferenceAlias Property Terrormorph Auto Const mandatory
  { Ref alias for the Terrormorph }
  RefCollectionAlias[] Property PowerBoxCollections Auto Const mandatory
  { Array of all the Powerbox collections for all the buildings }
  ReferenceAlias[] Property Building02Boxes Auto mandatory
  { Array of all the aliases for building 01 }
  ReferenceAlias[] Property Building03Boxes Auto mandatory
  { Array of all the aliases for building 02 }
  ReferenceAlias[] Property Building04Boxes Auto mandatory
  { Array of all the aliases for building 03 }
  RefCollectionAlias Property FuelTanks Auto Const mandatory
  { Ref collection for all the fuel tanks in the area }
  ReferenceAlias Property PrimeSoundSource Auto Const mandatory
  { Ref alias for the first prime sound source }
  RefCollectionAlias Property SecurityBldgDoors Auto Const mandatory
  { Collection for all the doors in the security room }
EndGroup

Group Misc
  Float Property MinPrimePumpDelay = 0.200000003 Auto Const
  { Minimum amount of time to wait between prime pump sounds }
  Float Property MaxPrimePumpDelay = 0.600000024 Auto Const
  { Max amount of time to wait between prime pump sounds }
EndGroup


;-- Functions ---------------------------------------

Function SetUpPowerboxObjective()
  Int I = 0 ; #DEBUG_LINE_NO:95
  Int iLength = PowerBoxCollections.Length ; #DEBUG_LINE_NO:96
  Int iCompletedBuildings = 0 ; #DEBUG_LINE_NO:97
  While I < iLength ; #DEBUG_LINE_NO:100
    RefCollectionAlias currColl = PowerBoxCollections[I] ; #DEBUG_LINE_NO:101
    Int currCount = currColl.GetCount() ; #DEBUG_LINE_NO:102
    If currCount == 0 ; #DEBUG_LINE_NO:104
      iCompletedBuildings += 1 ; #DEBUG_LINE_NO:105
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:109
  EndWhile ; #DEBUG_LINE_NO:
  If iCompletedBuildings as Float >= UC02_PowerBoxesTotal.GetValue() ; #DEBUG_LINE_NO:112
    Self.SetStage(AllPoweredUpObj) ; #DEBUG_LINE_NO:114
  Else ; #DEBUG_LINE_NO:
    UC02_PowerBoxesActivated.SetValue(iCompletedBuildings as Float) ; #DEBUG_LINE_NO:116
    Int j = 0 ; #DEBUG_LINE_NO:119
    Int jLength = BuildingPowerData.Length ; #DEBUG_LINE_NO:120
    While j < jLength ; #DEBUG_LINE_NO:123
      uc02_questscript:buildingpowerdatum currDatum = BuildingPowerData[j] ; #DEBUG_LINE_NO:124
      RefCollectionAlias currcoll = currDatum.PowerBoxCollection ; #DEBUG_LINE_NO:125
      ObjectReference TargetObj = None ; #DEBUG_LINE_NO:126
      ObjectReference FirstBox = currDatum.PrimaryBoxAlias.GetRef() ; #DEBUG_LINE_NO:127
      ObjectReference SecondBox = currDatum.SecondaryBoxAlias.GetRef() ; #DEBUG_LINE_NO:128
      ObjectReference ThirdBox = currDatum.TertiaryBoxAlias.GetRef() ; #DEBUG_LINE_NO:129
      If currcoll.Find(FirstBox) >= 0 ; #DEBUG_LINE_NO:131
        TargetObj = FirstBox ; #DEBUG_LINE_NO:133
      ElseIf currcoll.Find(SecondBox) >= 0 ; #DEBUG_LINE_NO:134
        currDatum.PrimaryBoxAlias.Clear() ; #DEBUG_LINE_NO:136
        TargetObj = SecondBox ; #DEBUG_LINE_NO:137
      ElseIf currcoll.Find(ThirdBox) >= 0 ; #DEBUG_LINE_NO:138
        currDatum.PrimaryBoxAlias.Clear() ; #DEBUG_LINE_NO:140
        currDatum.SecondaryBoxAlias.Clear() ; #DEBUG_LINE_NO:141
        TargetObj = ThirdBox ; #DEBUG_LINE_NO:142
      Else ; #DEBUG_LINE_NO:
        currDatum.PrimaryBoxAlias.Clear() ; #DEBUG_LINE_NO:145
        currDatum.SecondaryBoxAlias.Clear() ; #DEBUG_LINE_NO:146
        currDatum.TertiaryBoxAlias.Clear() ; #DEBUG_LINE_NO:147
      EndIf ; #DEBUG_LINE_NO:
      currDatum.ObjAlias.ForceRefTo(TargetObj) ; #DEBUG_LINE_NO:150
      j += 1 ; #DEBUG_LINE_NO:153
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UpdateBuildingPowerObjTarget(ObjectReference akSetBox, RefCollectionAlias akSourceCollection)
  Int I = 0 ; #DEBUG_LINE_NO:159
  Int iLength = PowerBoxCollections.Length ; #DEBUG_LINE_NO:160
  Bool bFoundBox = False ; #DEBUG_LINE_NO:161
  uc02_questscript:buildingpowerdatum TargetDatum = None ; #DEBUG_LINE_NO:162
  Int iArrayIndex = 0 ; #DEBUG_LINE_NO:163
  ReferenceAlias TargetObjAlias = None ; #DEBUG_LINE_NO:164
  Int iIndex = BuildingPowerData.findstruct("PowerBoxCollection", akSourceCollection, 0) ; #DEBUG_LINE_NO:167
  TargetDatum = BuildingPowerData[iIndex] ; #DEBUG_LINE_NO:168
  iArrayIndex = TargetDatum.ArrayIndex ; #DEBUG_LINE_NO:169
  If TargetDatum.ArrayIndex == 2 ; #DEBUG_LINE_NO:172
    TargetObjAlias = Self.UpdatePowerboxObjective(akSetBox, Building02Boxes) ; #DEBUG_LINE_NO:174
  ElseIf TargetDatum.ArrayIndex == 3 ; #DEBUG_LINE_NO:175
    TargetObjAlias = Self.UpdatePowerboxObjective(akSetBox, Building03Boxes) ; #DEBUG_LINE_NO:177
  ElseIf TargetDatum.ArrayIndex == 4 ; #DEBUG_LINE_NO:178
    TargetObjAlias = Self.UpdatePowerboxObjective(akSetBox, Building04Boxes) ; #DEBUG_LINE_NO:180
  EndIf ; #DEBUG_LINE_NO:
  If TargetObjAlias != None ; #DEBUG_LINE_NO:184
    If TargetObjAlias.GetRef() != TargetDatum.ObjAlias.GetRef() ; #DEBUG_LINE_NO:185
      TargetDatum.ObjAlias.ForceRefTo(TargetObjAlias.GetRef()) ; #DEBUG_LINE_NO:186
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    TargetDatum.ObjAlias.Clear() ; #DEBUG_LINE_NO:190
  EndIf ; #DEBUG_LINE_NO:
EndFunction

ReferenceAlias Function UpdatePowerboxObjective(ObjectReference akTriggeringBox, ReferenceAlias[] akTargetArray)
  Int I = 0 ; #DEBUG_LINE_NO:195
  Int iLength = akTargetArray.Length ; #DEBUG_LINE_NO:196
  Bool bFoundTarget = False ; #DEBUG_LINE_NO:197
  ReferenceAlias ObjAlias = None ; #DEBUG_LINE_NO:198
  While I < iLength && !bFoundTarget ; #DEBUG_LINE_NO:201
    ReferenceAlias currAlias = akTargetArray[I] ; #DEBUG_LINE_NO:202
    If currAlias.GetRef() == akTriggeringBox ; #DEBUG_LINE_NO:204
      bFoundTarget = True ; #DEBUG_LINE_NO:206
      currAlias.Clear() ; #DEBUG_LINE_NO:207
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:210
  EndWhile ; #DEBUG_LINE_NO:
  Int j = 0 ; #DEBUG_LINE_NO:214
  Bool bFoundAlias = False ; #DEBUG_LINE_NO:215
  While j < iLength ; #DEBUG_LINE_NO:217
    ReferenceAlias curralias = akTargetArray[j] ; #DEBUG_LINE_NO:218
    If curralias.GetRef() != None ; #DEBUG_LINE_NO:221
      bFoundTarget = True ; #DEBUG_LINE_NO:223
      ObjAlias = curralias ; #DEBUG_LINE_NO:224
    EndIf ; #DEBUG_LINE_NO:
    j += 1 ; #DEBUG_LINE_NO:227
  EndWhile ; #DEBUG_LINE_NO:
  Return ObjAlias ; #DEBUG_LINE_NO:231
EndFunction

Function UpdatePowerBoxCount(ObjectReference akTargetPowerBox, RefCollectionAlias akSourceColl)
  Int iIndex = PowerBoxes.Find(akTargetPowerBox) ; #DEBUG_LINE_NO:236
  PowerBoxes.RemoveRef(akTargetPowerBox) ; #DEBUG_LINE_NO:237
  If iIndex >= 0 ; #DEBUG_LINE_NO:242
    Self.UpdateBuildingPowerObjTarget(akTargetPowerBox, akSourceColl) ; #DEBUG_LINE_NO:243
  EndIf ; #DEBUG_LINE_NO:
  If akSourceColl.GetCount() <= 0 && Self.GetStageDone(ActivatePowerBoxesStage) ; #DEBUG_LINE_NO:247
    If Self.ModObjectiveGlobal(1.0, UC02_PowerBoxesActivated, PowerBoxActivatedObj, UC02_PowerBoxesTotal.GetValue(), True, True, True, False) ; #DEBUG_LINE_NO:249
      Self.SetStage(AllPoweredUpObj) ; #DEBUG_LINE_NO:251
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TriggerPumpPrimeAudio(Float afInitialWait)
  If afInitialWait > 0.0 ; #DEBUG_LINE_NO:258
    Utility.Wait(afInitialWait) ; #DEBUG_LINE_NO:259
  EndIf ; #DEBUG_LINE_NO:
  PrimeSoundEvent.Play(PrimeSoundSource.GetRef(), None, None) ; #DEBUG_LINE_NO:263
  Utility.Wait(Utility.RandomFloat(MinPrimePumpDelay, MaxPrimePumpDelay)) ; #DEBUG_LINE_NO:265
  Int I = 0 ; #DEBUG_LINE_NO:268
  Int iCount = 1 ; #DEBUG_LINE_NO:269
  While I < iCount ; #DEBUG_LINE_NO:271
    ObjectReference currTank = FuelTanks.GetAt(I) ; #DEBUG_LINE_NO:272
    If !currTank.IsDisabled() ; #DEBUG_LINE_NO:274
      Utility.Wait(Utility.RandomFloat(MinPrimePumpDelay, MaxPrimePumpDelay)) ; #DEBUG_LINE_NO:275
      PrimeSoundEvent.Play(currTank, None, None) ; #DEBUG_LINE_NO:276
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:278
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ToggleRestoreTrackerObj(Bool bEnable)
  If !Self.GetStageDone(TerrormorphDeadStage) ; #DEBUG_LINE_NO:283
    If bEnable ; #DEBUG_LINE_NO:284
      If !Self.IsObjectiveDisplayed(RestoreLivestockScannerObj) ; #DEBUG_LINE_NO:285
        Self.SetObjectiveDisplayed(RestoreLivestockScannerObj, True, False) ; #DEBUG_LINE_NO:286
      EndIf ; #DEBUG_LINE_NO:
    ElseIf Self.IsObjectiveDisplayed(RestoreLivestockScannerObj) ; #DEBUG_LINE_NO:289
      Self.SetObjectiveDisplayed(RestoreLivestockScannerObj, False, False) ; #DEBUG_LINE_NO:290
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SealSecurityBldgDoors(Bool bClose)
  Int I = 0 ; #DEBUG_LINE_NO:297
  Int iCount = SecurityBldgDoors.GetCount() ; #DEBUG_LINE_NO:298
  While I < iCount ; #DEBUG_LINE_NO:300
    ObjectReference currRef = SecurityBldgDoors.GetAt(I) ; #DEBUG_LINE_NO:301
    If bClose ; #DEBUG_LINE_NO:303
      currRef.SetOpen(False) ; #DEBUG_LINE_NO:304
      currRef.SetLockLevel(254) ; #DEBUG_LINE_NO:305
      currRef.Lock(True, False, True) ; #DEBUG_LINE_NO:306
    Else ; #DEBUG_LINE_NO:
      currRef.SetLockLevel(0) ; #DEBUG_LINE_NO:308
      currRef.Unlock(False) ; #DEBUG_LINE_NO:309
      currRef.SetOpen(True) ; #DEBUG_LINE_NO:310
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:313
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:322
EndFunction
