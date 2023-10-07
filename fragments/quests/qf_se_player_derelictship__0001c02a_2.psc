ScriptName Fragments:Quests:QF_SE_Player_DerelictShip__0001C02A_2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_DerelictShip Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionCompanyGlobal Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionTypeGlobal Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionHazardGlobal Auto Const mandatory
GlobalVariable Property SE_DerelictGeneric_MissionHazardCauseGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_Repaired Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_MissionCrewTypeGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_IDCardGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_BlackboxGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_LogsDownloaded Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_HazardFixed Auto Const mandatory
GlobalVariable Property BE_GenericDerelicCrewGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalCrewGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalDockingGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalCrewEquipmentGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_TerminalVoteTallyGlobal Auto Const mandatory
GlobalVariable Property SE_GenericDerelict_UniqueEntry01Global Auto Const mandatory
FormList Property BEHazardKeywordList Auto Const mandatory
sq_parentscript Property SQ_Parent Auto Const mandatory
sq_parentscript:actorvaluedatum[] Property AdditionalActorValuesToDamage Auto Const
RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const mandatory
RefCollectionAlias Property Alias_CrewWoundedMarkers Auto Const mandatory
Furniture Property NPCWoundedLean Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  SQ_Parent.SetupDamagedShip(Alias_DerelictShip.GetShipRef(), False, True, True, True, True, True, AdditionalActorValuesToDamage) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_DerelictShip.GetShipRef().SetValue(DockingPermission, 0.0) ; #DEBUG_LINE_NO:15
  SE_GenericDerelict_MissionCrewTypeGlobal.SetValue(Utility.RandomInt(0, 3) as Float) ; #DEBUG_LINE_NO:16
  SE_DerelictGeneric_MissionCompanyGlobal.SetValueInt(Utility.RandomInt(0, 4)) ; #DEBUG_LINE_NO:17
  SE_DerelictGeneric_MissionHazardGlobal.SetValueInt(Utility.RandomInt(0, 11)) ; #DEBUG_LINE_NO:18
  SE_DerelictGeneric_MissionHazardCauseGlobal.SetValueInt(Utility.RandomInt(0, 2)) ; #DEBUG_LINE_NO:19
  SE_DerelictGeneric_MissionTypeGlobal.SetValueInt(Utility.RandomInt(0, 1)) ; #DEBUG_LINE_NO:20
  SE_GenericDerelict_Repaired.SetValue(0.0) ; #DEBUG_LINE_NO:21
  SE_GenericDerelict_LogsDownloaded.SetValue(0.0) ; #DEBUG_LINE_NO:22
  SE_GenericDerelict_HazardFixed.SetValue(0.0) ; #DEBUG_LINE_NO:23
  SE_GenericDerelict_TerminalGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:24
  SE_GenericDerelict_TerminalCrewGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:25
  SE_GenericDerelict_TerminalDockingGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:26
  SE_GenericDerelict_TerminalCrewEquipmentGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:27
  SE_GenericDerelict_TerminalVoteTallyGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:28
  ObjectReference[] FurnitureRef = Alias_CrewSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:30
  Int I = 0 ; #DEBUG_LINE_NO:31
  While I < FurnitureRef.Length ; #DEBUG_LINE_NO:32
    Alias_CrewWoundedMarkers.AddRef(FurnitureRef[I].PlaceAtMe(NPCWoundedLean as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:33
    I += 1 ; #DEBUG_LINE_NO:34
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  Keyword[] hazardKeywords = BEHazardKeywordList.GetArray(False) as Keyword[] ; #DEBUG_LINE_NO:43
  spaceshipreference DerelictShip = Alias_DerelictShip.GetShipRef() ; #DEBUG_LINE_NO:44
  Int biohazard = Utility.RandomInt(0, 2) ; #DEBUG_LINE_NO:46
  If biohazard == 0 ; #DEBUG_LINE_NO:47
    DerelictShip.AddKeyword(hazardKeywords[11]) ; #DEBUG_LINE_NO:48
  ElseIf biohazard == 1 ; #DEBUG_LINE_NO:49
    DerelictShip.AddKeyword(hazardKeywords[8]) ; #DEBUG_LINE_NO:50
  Else ; #DEBUG_LINE_NO:
    DerelictShip.AddKeyword(hazardKeywords[10]) ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_01()
  Keyword[] hazardKeywords = BEHazardKeywordList.GetArray(False) as Keyword[] ; #DEBUG_LINE_NO:61
  Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[8]) ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Stage_0020_Item_02()
  Keyword[] hazardKeywords = BEHazardKeywordList.GetArray(False) as Keyword[] ; #DEBUG_LINE_NO:70
  Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[6]) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0020_Item_03()
  Keyword[] hazardKeywords = BEHazardKeywordList.GetArray(False) as Keyword[] ; #DEBUG_LINE_NO:79
  Int biohazard = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:80
  If biohazard == 1 ; #DEBUG_LINE_NO:81
    Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[4]) ; #DEBUG_LINE_NO:82
  Else ; #DEBUG_LINE_NO:
    Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[24]) ; #DEBUG_LINE_NO:84
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_04()
  Keyword[] hazardKeywords = BEHazardKeywordList.GetArray(False) as Keyword[] ; #DEBUG_LINE_NO:93
  Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[3]) ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_0020_Item_05()
  Keyword[] hazardKeywords = BEHazardKeywordList.GetArray(False) as Keyword[] ; #DEBUG_LINE_NO:102
  Int biohazard = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:103
  If biohazard == 1 ; #DEBUG_LINE_NO:104
    Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[5]) ; #DEBUG_LINE_NO:105
  Else ; #DEBUG_LINE_NO:
    Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[0]) ; #DEBUG_LINE_NO:107
  EndIf ; #DEBUG_LINE_NO:
EndFunction
