ScriptName UC07QuestScript Extends Quest

;-- Structs -----------------------------------------
Struct BatteryRecipeComponent
  MiscObject ComponentObject
  Int AmountRequired
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
uc07questscript:batteryrecipecomponent[] Property RecipePieces Auto Const mandatory
{ The various pieces required for the battery and how many we need }
ReferenceAlias Property EclipticSceneTarget Auto Const mandatory
{ Alias to fill if we find a living member of Ecliptic }
RefCollectionAlias Property BatteryContainers Auto Const mandatory
{ Collection containing the list of battery component containers }
RefCollectionAlias Property QuestBatteryMaterials Auto Const mandatory
{ Holding collection for the quest battery materials }
ObjectReference Property UC07_BatteryComponentsSpawn Auto Const mandatory
{ Spawn point for the battery components }
Keyword Property UC07_BatteryComponent Auto Const mandatory
{ Keyword used to designate the a component is one of our quest objects }
Int Property BatteryComponentsDistributedStage = 105 Auto Const
{ Stage to set once all the battery components have been distributed }

;-- Functions ---------------------------------------

Bool Function CheckForLivingSceneTarget(RefCollectionAlias akTargetColl)
  Int I = 0 ; #DEBUG_LINE_NO:30
  Int iCount = akTargetColl.GetCount() ; #DEBUG_LINE_NO:31
  Bool bFoundNPC = False ; #DEBUG_LINE_NO:32
  While I < iCount && !bFoundNPC ; #DEBUG_LINE_NO:34
    Actor currRef = akTargetColl.GetAt(I) as Actor ; #DEBUG_LINE_NO:35
    If !currRef.IsDead() ; #DEBUG_LINE_NO:37
      bFoundNPC = True ; #DEBUG_LINE_NO:38
      EclipticSceneTarget.ForceRefTo(currRef as ObjectReference) ; #DEBUG_LINE_NO:39
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:43
  EndWhile ; #DEBUG_LINE_NO:
  Return bFoundNPC ; #DEBUG_LINE_NO:46
EndFunction

Function DistributeBatteryComponents()
  Int I = 0 ; #DEBUG_LINE_NO:50
  Int iLength = RecipePieces.Length ; #DEBUG_LINE_NO:51
  While I < iLength ; #DEBUG_LINE_NO:54
    uc07questscript:batteryrecipecomponent myDatum = RecipePieces[I] ; #DEBUG_LINE_NO:55
    Int iAmountRequired = myDatum.AmountRequired ; #DEBUG_LINE_NO:56
    MiscObject currObj = myDatum.ComponentObject ; #DEBUG_LINE_NO:57
    ObjectReference ObjREF = UC07_BatteryComponentsSpawn.PlaceAtMe(currObj as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:58
    QuestBatteryMaterials.AddRef(ObjREF) ; #DEBUG_LINE_NO:61
    If iAmountRequired > 1 ; #DEBUG_LINE_NO:63
      Int j = 0 ; #DEBUG_LINE_NO:64
      While j < iAmountRequired ; #DEBUG_LINE_NO:66
        Self.FindBatteryContainer(ObjREF) ; #DEBUG_LINE_NO:67
        j += 1 ; #DEBUG_LINE_NO:69
      EndWhile ; #DEBUG_LINE_NO:
    ElseIf iAmountRequired == 1 ; #DEBUG_LINE_NO:71
      Self.FindBatteryContainer(ObjREF) ; #DEBUG_LINE_NO:72
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:75
  EndWhile ; #DEBUG_LINE_NO:
  Self.SetStage(BatteryComponentsDistributedStage) ; #DEBUG_LINE_NO:96
EndFunction

Function FindBatteryContainer(ObjectReference akTargetObject)
  Int iCount = BatteryContainers.GetCount() ; #DEBUG_LINE_NO:100
  Int iIndexMax = iCount - 1 ; #DEBUG_LINE_NO:101
  If iIndexMax < 0 ; #DEBUG_LINE_NO:103
    iIndexMax = 0 ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
  Int iRand = Utility.RandomInt(0, iIndexMax) ; #DEBUG_LINE_NO:107
  ObjectReference currContainer = BatteryContainers.GetAt(iRand) ; #DEBUG_LINE_NO:109
  currContainer.AddItem(akTargetObject as Form, 1, False) ; #DEBUG_LINE_NO:110
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:118
EndFunction
