ScriptName MS06_QuestScript Extends Quest

;-- Structs -----------------------------------------
Struct ResourceData
  resource ResourceType
  { The type of Reource we're looking for }
  GlobalVariable ResourceCount
  { The amount of the resource we have }
  GlobalVariable ResourceTotal
  { The amount of the resource we need }
  Int ResourceObjective
  { The objective associated with the Resource Type }
  Bool ResourceFulfilled
  { Does the player have the required amount? }
EndStruct


;-- Variables ---------------------------------------
Int ExplodeTimerID = 1

;-- Properties --------------------------------------
ActorValue Property DockingPermission Auto Const mandatory
conditionform Property MS06_ResourceConditionForm Auto Const mandatory
GlobalVariable Property MS06ChoiceValue Auto Const mandatory
GlobalVariable Property MS06_GravDriveCreditsAmount Auto Const mandatory
GlobalVariable Property MS06_GravDriveCreditsAmountLess Auto Const mandatory
GlobalVariable Property MS06Resource01Count Auto Const mandatory
GlobalVariable Property MS06Resource01Total Auto Const mandatory
GlobalVariable Property MS06Resource01ConstantAmount Auto Const mandatory
GlobalVariable Property MS06Resource02Count Auto Const mandatory
GlobalVariable Property MS06Resource02Total Auto Const mandatory
GlobalVariable Property MS06Resource02ConstantAmount Auto Const mandatory
GlobalVariable Property MS06Resource03Count Auto Const mandatory
GlobalVariable Property MS06Resource03Total Auto Const mandatory
GlobalVariable Property MS06Resource03ConstantAmount Auto Const mandatory
GlobalVariable Property MS06Resource04Count Auto Const mandatory
GlobalVariable Property MS06Resource04Total Auto Const mandatory
GlobalVariable Property MS06Resource04ConstantAmount Auto Const mandatory
GlobalVariable Property MS06Retrofit01Status Auto Const mandatory
GlobalVariable Property MS06Retrofit02Status Auto Const mandatory
GlobalVariable Property MS06Retrofit03Status Auto Const mandatory
Int Property GatherResourcesStage = 1000 Auto Const
Int Property ResourcesCompletedStage = 1500 Auto Const
Int Property CompletedRetrofitStage = 2400 Auto Const
Int Property EscapeStage = 3200 Auto Const
MiscObject Property Credits Auto Const mandatory
MiscObject Property OrgCommonFiber Auto Const mandatory
MiscObject Property OrgUncommonSealant Auto Const mandatory
MiscObject Property InorgCommonIron Auto Const mandatory
MiscObject Property InorgRareLithium Auto Const mandatory
ReferenceAlias Property KlaxonSoundMarker Auto Const mandatory
ReferenceAlias Property Player Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory
ReferenceAlias Property ECSConstantShip Auto Const mandatory
RefCollectionAlias Property Klaxons Auto Const mandatory
RefCollectionAlias Property LightsOff Auto Const mandatory
resource Property ResOrgCommonFiber Auto Const mandatory
resource Property ResOrgCommonSealant Auto Const mandatory
resource Property ResInorgCommonIron Auto Const mandatory
resource Property ResInorgRareLithium Auto Const mandatory
LeveledItem Property MS06_LL_ConstantGoods Auto Const mandatory
Float Property ExplodeTimerLength = 10.0 Auto Const
ms06_questscript:resourcedata[] Property ResourceDatum Auto

;-- Functions ---------------------------------------

Function SetChoice(Int aiChoiceValue)
  MS06ChoiceValue.SetValue(aiChoiceValue as Float) ; #DEBUG_LINE_NO:72
EndFunction

Function RegisterPlayerforInventoryFilter()
  ms06_playerscript myPlayerScript = Player as ms06_playerscript ; #DEBUG_LINE_NO:78
  myPlayerScript.RegisterPlayerForResourceTracking() ; #DEBUG_LINE_NO:79
EndFunction

Function ResourceCheck()
  Int I = 0 ; #DEBUG_LINE_NO:87
  Int iLength = ResourceDatum.Length ; #DEBUG_LINE_NO:88
  While I < iLength ; #DEBUG_LINE_NO:89
    GlobalVariable myResourceCount = ResourceDatum[I].ResourceCount ; #DEBUG_LINE_NO:90
    Int MyPlayerComponentCount = Game.GetPlayer().GetComponentCount(ResourceDatum[I].ResourceType as Form) ; #DEBUG_LINE_NO:91
    If myResourceCount.GetValue() != MyPlayerComponentCount as Float ; #DEBUG_LINE_NO:92
      myResourceCount.SetValue(MyPlayerComponentCount as Float) ; #DEBUG_LINE_NO:93
      Self.UpdateCurrentInstanceGlobal(ResourceDatum[I].ResourceCount) ; #DEBUG_LINE_NO:94
      If ResourceDatum[I].ResourceCount.GetValue() >= ResourceDatum[I].ResourceTotal.GetValue() ; #DEBUG_LINE_NO:95
        ResourceDatum[I].ResourceFulfilled = True ; #DEBUG_LINE_NO:96
        Self.SetObjectiveDisplayed(ResourceDatum[I].ResourceObjective, False, False) ; #DEBUG_LINE_NO:98
      Else ; #DEBUG_LINE_NO:
        ResourceDatum[I].ResourceFulfilled = False ; #DEBUG_LINE_NO:100
        Self.SetObjectiveDisplayed(ResourceDatum[I].ResourceObjective, True, True) ; #DEBUG_LINE_NO:102
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:105
  EndWhile ; #DEBUG_LINE_NO:
  Self.AllResourcesCheck() ; #DEBUG_LINE_NO:108
EndFunction

Function AllResourcesCheck()
  Int I = 0 ; #DEBUG_LINE_NO:114
  Int iLength = ResourceDatum.Length ; #DEBUG_LINE_NO:115
  Bool ResourcesFulfilled = False ; #DEBUG_LINE_NO:116
  While I < iLength ; #DEBUG_LINE_NO:117
    If ResourceDatum[I].ResourceFulfilled == True ; #DEBUG_LINE_NO:119
      ResourcesFulfilled = True ; #DEBUG_LINE_NO:120
    Else ; #DEBUG_LINE_NO:
      ResourcesFulfilled = False ; #DEBUG_LINE_NO:122
      I = iLength ; #DEBUG_LINE_NO:124
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:126
  EndWhile ; #DEBUG_LINE_NO:
  If ResourcesFulfilled == True ; #DEBUG_LINE_NO:131
    If Self.GetStageDone(ResourcesCompletedStage) ; #DEBUG_LINE_NO:132
      Self.SetObjectiveDisplayed(ResourcesCompletedStage, True, False) ; #DEBUG_LINE_NO:133
    Else ; #DEBUG_LINE_NO:
      Self.SetStage(ResourcesCompletedStage) ; #DEBUG_LINE_NO:135
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Self.GetStageDone(ResourcesCompletedStage) ; #DEBUG_LINE_NO:138
    Self.SetObjectiveDisplayed(ResourcesCompletedStage, False, False) ; #DEBUG_LINE_NO:139
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RemoveResources()
  If MS06_ResourceConditionForm.IsTrue(Game.GetPlayer() as ObjectReference, None) ; #DEBUG_LINE_NO:147
    Game.GetPlayer().RemoveItemByComponent(ResOrgCommonFiber as Form, MS06Resource01Total.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:148
    Game.GetPlayer().RemoveItemByComponent(ResOrgCommonSealant as Form, MS06Resource02Total.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:149
    Game.GetPlayer().RemoveItemByComponent(ResInorgCommonIron as Form, MS06Resource03Total.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:150
    Game.GetPlayer().RemoveItemByComponent(ResInorgRareLithium as Form, MS06Resource04Total.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:151
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RemoveCredits(Bool abSpeechChallengeSuccess)
  If abSpeechChallengeSuccess == False ; #DEBUG_LINE_NO:159
    Game.GetPlayer().RemoveItem(Credits as Form, MS06_GravDriveCreditsAmount.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:160
  Else ; #DEBUG_LINE_NO:
    Game.GetPlayer().RemoveItem(Credits as Form, MS06_GravDriveCreditsAmountLess.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:162
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CheckEngineeringTerminalSettings()
  If !Self.GetStageDone(CompletedRetrofitStage) ; #DEBUG_LINE_NO:170
    If MS06Retrofit01Status.GetValue() == 1.0 && MS06Retrofit02Status.GetValue() == 1.0 && MS06Retrofit03Status.GetValue() == 1.0 ; #DEBUG_LINE_NO:172
      Self.SetStage(CompletedRetrofitStage) ; #DEBUG_LINE_NO:173
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ConstantGiveResources()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:180
  myPlayer.AddItem(OrgCommonFiber as Form, MS06Resource01ConstantAmount.GetValue() as Int, False) ; #DEBUG_LINE_NO:181
  myPlayer.AddItem(OrgUncommonSealant as Form, MS06Resource02ConstantAmount.GetValue() as Int, False) ; #DEBUG_LINE_NO:182
  myPlayer.AddItem(InorgCommonIron as Form, MS06Resource03ConstantAmount.GetValue() as Int, False) ; #DEBUG_LINE_NO:183
  myPlayer.AddItem(InorgRareLithium as Form, MS06Resource04ConstantAmount.GetValue() as Int, False) ; #DEBUG_LINE_NO:184
EndFunction

Function ConstantGiveGoods()
  Game.GetPlayer().AddItem(MS06_LL_ConstantGoods as Form, 1, False) ; #DEBUG_LINE_NO:190
EndFunction

Function DebugGiveResources()
  Game.GetPlayer().AddItem(OrgCommonFiber as Form, MS06Resource01Total.GetValue() as Int, False) ; #DEBUG_LINE_NO:196
  Game.GetPlayer().AddItem(OrgUncommonSealant as Form, MS06Resource02Total.GetValue() as Int, False) ; #DEBUG_LINE_NO:197
  Game.GetPlayer().AddItem(InorgCommonIron as Form, MS06Resource03Total.GetValue() as Int, False) ; #DEBUG_LINE_NO:198
  Game.GetPlayer().AddItem(InorgRareLithium as Form, MS06Resource04Total.GetValue() as Int, False) ; #DEBUG_LINE_NO:199
EndFunction

Function StartKlaxons()
  KlaxonSoundMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:205
  Int I = 0 ; #DEBUG_LINE_NO:206
  Int iCount = Klaxons.GetCount() ; #DEBUG_LINE_NO:207
  While I < iCount ; #DEBUG_LINE_NO:208
    ObjectReference myKlaxon = Klaxons.GetAt(I) ; #DEBUG_LINE_NO:209
    myKlaxon.PlayAnimation("TurnOnPulse") ; #DEBUG_LINE_NO:210
    I += 1 ; #DEBUG_LINE_NO:211
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetECSConstantSelfDestruct()
  LightsOff.DisableAll(False) ; #DEBUG_LINE_NO:217
  Self.StartKlaxons() ; #DEBUG_LINE_NO:218
EndFunction

Function ECSConstantExplode()
  ECSConstantShip.GetShipReference().SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:223
  Self.StartTimer(ExplodeTimerLength, ExplodeTimerID) ; #DEBUG_LINE_NO:224
EndFunction

Event OnTimer(Int aiTimerId)
  If aiTimerId == ExplodeTimerID ; #DEBUG_LINE_NO:233
    KlaxonSoundMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:235
    spaceshipreference myShip = ECSConstantShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:236
    myShip.SetValue(Game.GetInvulnerableAV(), 0.0) ; #DEBUG_LINE_NO:237
    myShip.IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:238
    myShip.KillEssential(None) ; #DEBUG_LINE_NO:239
  EndIf ; #DEBUG_LINE_NO:
EndEvent
