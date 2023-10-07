ScriptName Fragments:Quests:QF_FFNewAtlantis06_00089F4E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FFNewAtlantis06_StartingScene01 Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_Markkanen Auto Const mandatory
ReferenceAlias Property Alias_NATenableMarker Auto Const mandatory
ReferenceAlias Property Alias_Chair Auto Const mandatory
ReferenceAlias Property Alias_Vandal Auto Const mandatory
Faction Property FFNewAtlantis06Faction Auto Const mandatory
ReferenceAlias Property Alias_Terminal Auto Const mandatory
Scene Property FFNewAtlantis06_TL_Functionary_Greet Auto Const mandatory
ReferenceAlias Property Alias_MASTMarker Auto Const mandatory
Quest Property City_NewAtlantis_Z_TheKindnessOfStrangers Auto Const mandatory
ReferenceAlias Property Alias_TahirVala Auto Const mandatory
Scene Property FFNewAtlantis06_TL_Mark_Stage60 Auto Const mandatory
Scene Property FFNewAtlantis06_TL_Mark_Stage80 Auto Const mandatory
ReferenceAlias Property Alias_OfficerSweepMarker Auto Const mandatory
ActorBase Property UC_NA_DonnaRain Auto Const mandatory
ReferenceAlias Property Alias_SergeantYumi Auto Const mandatory
Scene Property FFNewAtlantis06_Greet_TahirValaNoCamera Auto Const mandatory
Quest Property FFNewAtlantis06_SpeechChallengeQuest Auto Const mandatory
ReferenceAlias Property Alias_SuspectArrested Auto Const mandatory
ReferenceAlias Property Alias_OfficerSweep Auto Const mandatory
ReferenceAlias Property Alias_Trucker Auto Const mandatory
ReferenceAlias Property Alias_PrisonFunctionary Auto Const mandatory
Quest Property FFNewAtlantis02Misc Auto Const mandatory
Quest Property FFNewAtlantis02 Auto Const mandatory
ReferenceAlias Property Alias_PrisonDoor Auto Const mandatory
ReferenceAlias Property Alias_FunctionaryEndMarker Auto Const mandatory
ReferenceAlias Property Alias_MarkannenMarker Auto Const mandatory
ReferenceAlias Property Alias_Book Auto Const mandatory
Scene Property FFNewAtlantis06_085_SC_TahirValaNoCameraEND Auto Const mandatory
Scene Property FFNewAtlantis06_080_TL_Mark_Stage80 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  City_NewAtlantis_Z_TheKindnessOfStrangers.SetStage(100) ; #DEBUG_LINE_NO:7
  City_NewAtlantis_Z_TheKindnessOfStrangers.SetStage(200) ; #DEBUG_LINE_NO:8
  FFNewAtlantis02.Stop() ; #DEBUG_LINE_NO:9
  Self.SetStage(1) ; #DEBUG_LINE_NO:10
  Game.GetPlayer().MoveTo(Alias_SergeantYumi.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0003_Item_00()
  If Self.GetStageDone(4) ; #DEBUG_LINE_NO:19
    Self.SetObjectiveCompleted(88, True) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0004_Item_00()
  If Self.GetStageDone(3) ; #DEBUG_LINE_NO:29
    Self.SetObjectiveCompleted(88, True) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0008_Item_00()
  FFNewAtlantis02Misc.SetStage(100) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:47
  Alias_Markkanen.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:48
  Alias_NATenableMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:49
  ObjectReference SweepMarkerREF = Alias_OfficerSweepMarker.GetRef() ; #DEBUG_LINE_NO:51
  SweepMarkerREF.SetActorOwner(None, False) ; #DEBUG_LINE_NO:52
  Alias_OfficerSweep.GetActorRef().SnapIntoInteraction(SweepMarkerREF) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0011_Item_00()
  Self.SetObjectiveCompleted(89, True) ; #DEBUG_LINE_NO:61
EndFunction

Function Fragment_Stage_0020_Item_00()
  FFNewAtlantis06_StartingScene01.Start() ; #DEBUG_LINE_NO:69
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:70
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0040_Item_00()
  SQ_Followers.SetRoleActive(Alias_Markkanen.GetActorRef(), True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:79
  Alias_Chair.GetRef().SetFactionOwner(FFNewAtlantis06Faction, False) ; #DEBUG_LINE_NO:80
  Alias_MASTMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:81
  Alias_Book.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:82
  Alias_Trucker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:83
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:84
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0045_Item_00()
  Alias_Vandal.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_0046_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:101
  Self.SetObjectiveDisplayed(45, True, False) ; #DEBUG_LINE_NO:102
  Alias_Vandal.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:103
  Alias_Terminal.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:104
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(45, True) ; #DEBUG_LINE_NO:112
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:113
  Alias_Vandal.GetRef().MoveTo(Alias_SergeantYumi.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:114
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:122
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:123
  Alias_TahirVala.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0065_Item_00()
  Alias_SergeantYumi.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:133
EndFunction

Function Fragment_Stage_0070_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:141
  defaultfollowertogglequestscript kmyQuest = __temp as defaultfollowertogglequestscript ; #DEBUG_LINE_NO:142
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:145
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:146
  FFNewAtlantis06_SpeechChallengeQuest.Start() ; #DEBUG_LINE_NO:147
  ObjectReference Gershon = Alias_Vandal.GetRef() ; #DEBUG_LINE_NO:149
  ObjectReference Marker = Alias_FunctionaryEndMarker.GetRef() ; #DEBUG_LINE_NO:150
  If Gershon.GetDistance(Marker) > 5.0 ; #DEBUG_LINE_NO:152
    Gershon.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:153
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0075_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:162
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:163
  Alias_SuspectArrested.ForceRefTo(Alias_TahirVala.GetRef()) ; #DEBUG_LINE_NO:164
  FFNewAtlantis06_Greet_TahirValaNoCamera.Start() ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_0078_Item_00()
  FFNewAtlantis06_080_TL_Mark_Stage80.Stop() ; #DEBUG_LINE_NO:173
  FFNewAtlantis06_085_SC_TahirValaNoCameraEND.Start() ; #DEBUG_LINE_NO:174
EndFunction

Function Fragment_Stage_0079_Item_00()
  ObjectReference PrisonDoorRef = Alias_PrisonDoor.GetRef() ; #DEBUG_LINE_NO:182
  PrisonDoorRef.SetOpen(False) ; #DEBUG_LINE_NO:184
  PrisonDoorRef.Lock(True, False, True) ; #DEBUG_LINE_NO:185
EndFunction

Function Fragment_Stage_0080_Item_00()
  SQ_Followers.SetRoleInactive(Alias_Markkanen.GetActorRef(), True, False, True) ; #DEBUG_LINE_NO:193
  FFNewAtlantis06_TL_Mark_Stage80.Start() ; #DEBUG_LINE_NO:194
  Alias_NATenableMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:195
  Alias_OfficerSweepMarker.GetRef().SetActorOwner(UC_NA_DonnaRain, False) ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0085_Item_00()
  Alias_TahirVala.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:204
  Alias_Markkanen.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:205
EndFunction

Function Fragment_Stage_0088_Item_00()
  If !Self.GetStageDone(3) || !Self.GetStageDone(4) ; #DEBUG_LINE_NO:213
    Self.SetObjectiveDisplayed(88, True, False) ; #DEBUG_LINE_NO:214
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(89, True, False) ; #DEBUG_LINE_NO:216
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0089_Item_00()
  Actor VandalRef = Alias_Vandal.GetActorRef() ; #DEBUG_LINE_NO:225
  Actor MarkRef = Alias_Markkanen.GetActorRef() ; #DEBUG_LINE_NO:226
  SQ_Followers.SetRoleInactive(MarkRef, True, False, True) ; #DEBUG_LINE_NO:228
  Alias_SuspectArrested.ForceRefTo(VandalRef as ObjectReference) ; #DEBUG_LINE_NO:229
  VandalRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:230
  MarkRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:231
  Alias_NATenableMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:232
  Alias_OfficerSweepMarker.GetRef().SetActorOwner(UC_NA_DonnaRain, False) ; #DEBUG_LINE_NO:233
EndFunction

Function Fragment_Stage_0095_Item_00()
  Alias_Vandal.GetActorRef().SnapIntoInteraction(Alias_PrisonFunctionary.GetRef()) ; #DEBUG_LINE_NO:241
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:249
  Alias_Chair.GetRef().SetFactionOwner(None, False) ; #DEBUG_LINE_NO:250
  Alias_NATenableMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:251
  FFNewAtlantis06_SpeechChallengeQuest.Stop() ; #DEBUG_LINE_NO:252
  Alias_Trucker.Clear() ; #DEBUG_LINE_NO:253
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Markkanen.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:261
  Alias_TahirVala.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:262
  Alias_Vandal.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:263
  Alias_MASTMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:264
  ObjectReference PrisonDoorRef = Alias_PrisonDoor.GetRef() ; #DEBUG_LINE_NO:265
  PrisonDoorRef.Lock(False, False, True) ; #DEBUG_LINE_NO:266
  Self.Stop() ; #DEBUG_LINE_NO:267
EndFunction
