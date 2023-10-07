ScriptName Fragments:Quests:QF_MB_Sabotage01_RIR04_0013F73D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI_RadiantSupport Auto Const mandatory
ReferenceAlias Property Alias_PrimaryRef Auto Const mandatory
ReferenceAlias Property Alias_DevicePlacementTrigger Auto Const mandatory
Keyword Property CrimeFactionNeon_Keyword Auto Const mandatory
Keyword Property CrimeFactionFreestar_Keyword Auto Const mandatory
Keyword Property CrimeFactionUC_Keyword Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Keyword Property CrimeFactionHopeTown_Keyword Auto Const mandatory
ReferenceAlias Property Alias_PrimaryRefLinkedRef Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetRewardValues() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:19
  ObjectReference TriggerRef = Alias_DevicePlacementTrigger.GetRef() ; #DEBUG_LINE_NO:21
  ObjectReference MarkerRef = Alias_PrimaryRef.GetRef() ; #DEBUG_LINE_NO:22
  Location MyLocation = MarkerRef.GetCurrentLocation() ; #DEBUG_LINE_NO:23
  If MyLocation.HasKeyword(CrimeFactionNeon_Keyword) ; #DEBUG_LINE_NO:25
    TriggerRef.SetFactionOwner(CrimeFactionNeon, False) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword) || MyLocation.HasKeyword(CrimeFactionHopeTown_Keyword) ; #DEBUG_LINE_NO:28
    TriggerRef.SetFactionOwner(CrimeFactionFreestar, False) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionUC_Keyword) ; #DEBUG_LINE_NO:31
    TriggerRef.SetFactionOwner(CrimeFactionUC, False) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  ObjectReference MarkerRef = Alias_PrimaryRef.GetRef() ; #DEBUG_LINE_NO:41
  Alias_PrimaryRefLinkedRef.ForceRefTo(MarkerRef.GetLinkedRef(None)) ; #DEBUG_LINE_NO:42
  Alias_Guard.GetRef().MoveTo(Alias_PrimaryRefLinkedRef.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:51
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:52
  kmyQuest.AddFinalValues() ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:63
  missionsabotagequestscript kmyQuest = __temp as missionsabotagequestscript ; #DEBUG_LINE_NO:64
  (RI_RadiantSupport as ri_radiantsupportquestscript).MBCompleted() ; #DEBUG_LINE_NO:67
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:69
EndFunction
