ScriptName Fragments:Quests:QF_CF08_SysDef_Misc_0030B8A4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property CF08_SysDef_MiscScene01 Auto Const mandatory
ReferenceAlias Property Alias_KibweMarker Auto Const mandatory
ReferenceAlias Property Alias_Ensign01_marker Auto Const mandatory
ReferenceAlias Property Alias_Ensign01 Auto Const mandatory
ReferenceAlias Property Alias_Ensign02 Auto Const mandatory
ReferenceAlias Property Alias_Ensign03 Auto Const mandatory
ReferenceAlias Property CF08_SysDef_HeroWelcomeEnableMarker Auto Const mandatory
Scene Property CF08_SysDef_MiscScene02 Auto Const mandatory
Scene Property CF08_SysDef_MiscScene03 Auto Const mandatory
Scene Property CF08_SysDef_MiscScene04 Auto Const mandatory
ReferenceAlias Property Alias_DoorOperations Auto Const mandatory
ReferenceAlias Property Alias_SysDef_KeyEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Ensign02_marker Auto Const mandatory
ReferenceAlias Property Alias_CF08_SysDef_Ikande Auto Const mandatory
ReferenceAlias Property Alias_BridgeMarker Auto Const mandatory
ReferenceAlias Property Alias_Soldier09 Auto Const mandatory
ReferenceAlias Property Alias_Soldier10 Auto Const mandatory
ReferenceAlias Property Alias_Soldier11 Auto Const mandatory
ReferenceAlias Property Alias_Soldier12 Auto Const mandatory
Scene Property DialogueUCVigilance_CF_Post_IkandeToftHold Auto Const mandatory
Scene Property CF08_SysDef_MiscScene02b Auto Const mandatory
RefCollectionAlias Property Alias_SoldiersRefColl Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker01 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine01 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine02 Auto Const mandatory
ReferenceAlias Property Alias_Soldier_MarkerRef11 Auto Const mandatory
ReferenceAlias Property Alias_Soldier_MarkerRef12 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine03 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine04 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine05 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine06 Auto Const mandatory
Scene Property CF08_SysDef_MiscScene06 Auto Const mandatory
Outfit Property Outfit_Spacesuit_UC_Pilot_SysDef_Helmet Auto Const mandatory
Outfit Property Outfit_Spacesuit_UC_Pilot_SysDef_NoHelmet Auto Const mandatory
ReferenceAlias Property Alias_Soldier_MarkerRef13 Auto Const mandatory
Outfit Property Outfit_Clothes_UCNavy_Crew_SysDef Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker07 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine07 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine08 Auto Const mandatory
ReferenceAlias Property Alias_KibweBriefing Auto Const mandatory
ReferenceAlias Property Alias_Soldier_MarkerRef09 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine09 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine10 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine11 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine12 Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker13 Auto Const mandatory
Scene Property CF08_SysDef_MiscScene07 Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarkerPortA Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarkerPortB Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker12 Auto Const mandatory
ReferenceAlias Property Alias_TempMarine16 Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker20 Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker02 Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker21 Auto Const mandatory
ReferenceAlias Property Alias_StagingSitMarker22 Auto Const mandatory
Scene Property CF08_SysDef_MiscScene08 Auto Const mandatory
Quest Property DialogueUCVigilance Auto Const mandatory
Scene Property CF08_SysDef_MiscScene05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  CF08_SysDef_MiscScene02.Stop() ; #DEBUG_LINE_NO:7
  CF08_SysDef_MiscScene02b.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Ensign01_marker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:16
  Alias_StagingSitMarker01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:17
  Alias_StagingSitMarker07.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:18
  Alias_KibweBriefing.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:19
  Alias_Soldier11.GetRef().MoveTo(Alias_Soldier_MarkerRef13.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:20
  Alias_Soldier11.GetActorRef().SnapIntoInteraction(Alias_Soldier_MarkerRef13.GetRef()) ; #DEBUG_LINE_NO:21
  Alias_Soldier12.GetRef().MoveTo(Alias_Soldier_MarkerRef12.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:22
  Alias_Soldier12.GetActorRef().SnapIntoInteraction(Alias_Soldier_MarkerRef12.GetRef()) ; #DEBUG_LINE_NO:23
  Alias_Ensign03.GetActorRef().SetOutfit(Outfit_Clothes_UCNavy_Crew_SysDef, False) ; #DEBUG_LINE_NO:24
  DialogueUCVigilance.SetStage(4) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0014_Item_00()
  CF08_SysDef_MiscScene01.Stop() ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0015_Item_00()
  CF08_SysDef_MiscScene02.Stop() ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0016_Item_00()
  CF08_SysDef_MiscScene06.Start() ; #DEBUG_LINE_NO:49
  Actor Pilot1 = Alias_TempMarine05.GetActorRef() ; #DEBUG_LINE_NO:50
  Actor Pilot2 = Alias_TempMarine06.GetActorRef() ; #DEBUG_LINE_NO:51
  Pilot1.EnableNoWait(False) ; #DEBUG_LINE_NO:53
  Pilot2.EnableNoWait(False) ; #DEBUG_LINE_NO:54
  Pilot2.SetOutfit(Outfit_Spacesuit_UC_Pilot_SysDef_NoHelmet, False) ; #DEBUG_LINE_NO:55
  Pilot1.EvaluatePackage(False) ; #DEBUG_LINE_NO:56
  Pilot2.EvaluatePackage(False) ; #DEBUG_LINE_NO:57
  Alias_TempMarine01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:58
  Alias_TempMarine02.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0017_Item_00()
  Alias_TempMarine03.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:67
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:68
  Alias_TempMarine04.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:69
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:70
  Alias_StagingSitMarker07.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0019_Item_00()
  CF08_SysDef_MiscScene08.Start() ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0020_Item_00()
  CF08_SysDef_MiscScene01.Start() ; #DEBUG_LINE_NO:87
  Actor Marine1 = Alias_TempMarine01.GetActorRef() ; #DEBUG_LINE_NO:88
  Actor Marine2 = Alias_TempMarine02.GetActorRef() ; #DEBUG_LINE_NO:89
  Alias_TempMarine03.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:90
  Alias_TempMarine04.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:91
  Marine1.EnableNoWait(False) ; #DEBUG_LINE_NO:93
  Marine1.EvaluatePackage(False) ; #DEBUG_LINE_NO:94
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:95
  Marine2.EnableNoWait(False) ; #DEBUG_LINE_NO:96
  Marine2.EvaluatePackage(False) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0030_Item_00()
  CF08_SysDef_MiscScene01.Stop() ; #DEBUG_LINE_NO:105
  Alias_Ensign01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:106
  Alias_Ensign02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:107
  Alias_Ensign03.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:108
  Alias_Ensign02_marker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_0048_Item_00()
  Actor Marine01 = Alias_TempMarine04.GetActorRef() ; #DEBUG_LINE_NO:117
  Actor Marine02 = Alias_TempMarine07.GetActorRef() ; #DEBUG_LINE_NO:118
  Actor Marine03 = Alias_TempMarine11.GetActorRef() ; #DEBUG_LINE_NO:119
  Actor Marine04 = Alias_TempMarine12.GetActorRef() ; #DEBUG_LINE_NO:120
  Marine01.EnableNoWait(False) ; #DEBUG_LINE_NO:122
  Marine01.MoveTo(Alias_StagingSitMarkerPortA.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:123
  Marine01.EvaluatePackage(False) ; #DEBUG_LINE_NO:124
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:125
  Marine02.EnableNoWait(False) ; #DEBUG_LINE_NO:126
  Marine02.MoveTo(Alias_StagingSitMarkerPortA.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:127
  Marine02.EvaluatePackage(False) ; #DEBUG_LINE_NO:128
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:129
  Marine03.EnableNoWait(False) ; #DEBUG_LINE_NO:130
  Marine03.MoveTo(Alias_StagingSitMarkerPortB.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:131
  Marine03.EvaluatePackage(False) ; #DEBUG_LINE_NO:132
  Marine04.EnableNoWait(False) ; #DEBUG_LINE_NO:133
  Marine04.MoveTo(Alias_StagingSitMarkerPortB.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:134
  Marine04.EvaluatePackage(False) ; #DEBUG_LINE_NO:135
  CF08_SysDef_MiscScene07.Start() ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_0049_Item_00()
  Actor Marine01 = Alias_TempMarine01.GetActorRef() ; #DEBUG_LINE_NO:144
  Actor Marine02 = Alias_TempMarine02.GetActorRef() ; #DEBUG_LINE_NO:145
  Actor Marine03 = Alias_TempMarine03.GetActorRef() ; #DEBUG_LINE_NO:146
  Marine01.EnableNoWait(False) ; #DEBUG_LINE_NO:148
  Marine01.MoveTo(Alias_StagingSitMarker12.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:149
  Marine01.EvaluatePackage(False) ; #DEBUG_LINE_NO:150
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:151
  Marine02.EnableNoWait(False) ; #DEBUG_LINE_NO:152
  Marine02.MoveTo(Alias_StagingSitMarker12.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:153
  Marine02.EvaluatePackage(False) ; #DEBUG_LINE_NO:154
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:155
  Marine03.EnableNoWait(False) ; #DEBUG_LINE_NO:156
  Marine03.MoveTo(Alias_StagingSitMarker12.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:157
  Marine03.EvaluatePackage(False) ; #DEBUG_LINE_NO:158
EndFunction

Function Fragment_Stage_0050_Item_00()
  CF08_SysDef_HeroWelcomeEnableMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:168
  Alias_Ensign01_marker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:169
  Alias_Ensign02_marker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:170
  Alias_StagingSitMarker01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:172
  Alias_TempMarine05.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:173
  Alias_TempMarine06.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:174
  Alias_TempMarine09.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:175
  Alias_TempMarine10.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:176
  Alias_StagingSitMarker20.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:177
  Alias_TempMarine16.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:178
EndFunction

Function Fragment_Stage_0060_Item_00()
  Actor TempRef01 = Alias_TempMarine07.GetActorRef() ; #DEBUG_LINE_NO:187
  Actor TempRef02 = Alias_TempMarine08.GetActorRef() ; #DEBUG_LINE_NO:188
  TempRef01.MoveTo(Alias_StagingSitMarker21.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:190
  TempRef01.EvaluatePackage(False) ; #DEBUG_LINE_NO:191
  TempRef02.MoveTo(Alias_StagingSitMarker22.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:192
  TempRef02.EvaluatePackage(False) ; #DEBUG_LINE_NO:193
  CF08_SysDef_MiscScene01.Stop() ; #DEBUG_LINE_NO:195
  CF08_SysDef_MiscScene02.Start() ; #DEBUG_LINE_NO:196
  Alias_DoorOperations.GetRef().SetOpen(False) ; #DEBUG_LINE_NO:200
  Alias_TempMarine01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:201
  Alias_TempMarine02.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:202
  Alias_TempMarine03.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:203
  Alias_TempMarine04.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:204
  Alias_TempMarine11.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:205
  Alias_TempMarine12.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:206
EndFunction

Function Fragment_Stage_0070_Item_00()
  CF08_SysDef_MiscScene04.Start() ; #DEBUG_LINE_NO:215
EndFunction

Function Fragment_Stage_0080_Item_00()
  CF08_SysDef_MiscScene04.Stop() ; #DEBUG_LINE_NO:225
  CF08_SysDef_MiscScene03.Start() ; #DEBUG_LINE_NO:226
  Alias_CF08_SysDef_Ikande.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:227
EndFunction

Function Fragment_Stage_0100_Item_00()
  CF08_SysDef_MiscScene05.Stop() ; #DEBUG_LINE_NO:235
  CF08_SysDef_MiscScene08.Stop() ; #DEBUG_LINE_NO:236
  Alias_SoldiersRefColl.EvaluateAll() ; #DEBUG_LINE_NO:237
EndFunction

Function Fragment_Stage_0200_Item_00()
  CF08_SysDef_MiscScene03.Stop() ; #DEBUG_LINE_NO:246
  DialogueUCVigilance_CF_Post_IkandeToftHold.Start() ; #DEBUG_LINE_NO:247
  ObjectReference Marker01 = Alias_BridgeMarker.GetRef() ; #DEBUG_LINE_NO:249
  ObjectReference Marker02 = Alias_Ensign02.GetRef() ; #DEBUG_LINE_NO:250
  Alias_Soldier09.GetRef().MoveTo(Marker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:251
  Alias_Soldier10.GetRef().MoveTo(Marker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:252
  Alias_Soldier11.GetRef().MoveTo(Marker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:253
  Alias_Soldier12.GetRef().MoveTo(Marker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:254
  CF08_SysDef_HeroWelcomeEnableMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:255
  Alias_SoldiersRefColl.EvaluateAll() ; #DEBUG_LINE_NO:256
  Alias_StagingSitMarker20.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:257
  Alias_TempMarine16.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:258
  Self.SetStage(1000) ; #DEBUG_LINE_NO:259
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_TempMarine07.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:268
  Alias_TempMarine08.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:269
  Self.Stop() ; #DEBUG_LINE_NO:270
EndFunction
