ScriptName SQ_Groups_QuestScript Extends Quest
{ used to access group definitions and functions }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group autofill
  GlobalVariable Property SQ_Group_Gender_Any Auto Const mandatory
  GlobalVariable Property SQ_Group_Gender_Female Auto Const mandatory
  GlobalVariable Property SQ_Group_Gender_Male Auto Const mandatory
  GlobalVariable Property SQ_Group_SpawnType_Corpse Auto Const mandatory
EndGroup

Group GroupRoles
  GlobalVariable Property SQ_GroupRole_Enemy Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_GroupRole_Victim Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_GroupRole_Neutral Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_GroupRole_BiomePredator Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_GroupRole_BiomePrey Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_GroupRole_BiomeCritter Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Debug_GroupRole_Enemy Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Debug_GroupRole_Victim Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Debug_GroupRole_Neutral Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Debug_GroupRole_BiomePredator Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Debug_GroupRole_BiomePrey Auto Const mandatory
  { autofill }
  GlobalVariable Property SQ_Debug_GroupRole_BiomeCritter Auto Const mandatory
  { autofill }
EndGroup

sq_groupscript[] Property Groups Auto Const mandatory
{ holds all the defined groups with SQ_GroupScript }

;-- Functions ---------------------------------------

Bool Function CheckGroupsForOccupation(sq_groupscript[] GroupsToCheck, sq_groupoccupationscript OccupationToFind)
  Int I = 0 ; #DEBUG_LINE_NO:46
  While I < GroupsToCheck.Length ; #DEBUG_LINE_NO:47
    sq_groupscript currentGroup = GroupsToCheck[I] ; #DEBUG_LINE_NO:48
    If currentGroup.HasOccupation(OccupationToFind) ; #DEBUG_LINE_NO:50
      Return True ; #DEBUG_LINE_NO:51
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:54
  EndWhile ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:57
EndFunction

sq_groupscript[] Function GetAllGroupsWithOccupation(sq_groupoccupationscript OccupationToFind, sq_groupscript[] LimitSearchToTheseGroups)
  sq_groupscript[] matchingGroups = new sq_groupscript[0] ; #DEBUG_LINE_NO:62
  sq_groupscript[] arrayToSearch = LimitSearchToTheseGroups ; #DEBUG_LINE_NO:64
  If arrayToSearch == None ; #DEBUG_LINE_NO:66
    arrayToSearch = Groups ; #DEBUG_LINE_NO:67
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:72
  While I < arrayToSearch.Length ; #DEBUG_LINE_NO:73
    sq_groupscript currentGroup = arrayToSearch[I] ; #DEBUG_LINE_NO:74
    If currentGroup.OccupationData.findstruct("Occupation", OccupationToFind, 0) >= 0 ; #DEBUG_LINE_NO:76
      matchingGroups.add(currentGroup, 1) ; #DEBUG_LINE_NO:78
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:81
  EndWhile ; #DEBUG_LINE_NO:
  Return matchingGroups ; #DEBUG_LINE_NO:85
EndFunction

sq_groupscript Function GetRandomGroupWithOccupation(sq_groupoccupationscript OccupationToFind, sq_groupscript[] LimitSearchToTheseGroups)
  sq_groupscript[] groupsWithOccupation = Self.GetAllGroupsWithOccupation(OccupationToFind, LimitSearchToTheseGroups) ; #DEBUG_LINE_NO:91
  Int iRandom = Utility.RandomInt(0, groupsWithOccupation.Length - 1) ; #DEBUG_LINE_NO:92
  sq_groupscript randomGroup = groupsWithOccupation[iRandom] ; #DEBUG_LINE_NO:93
  Return randomGroup ; #DEBUG_LINE_NO:97
EndFunction

sq_groupoccupationscript[] Function GetAllPossibleOccupations()
  sq_groupoccupationscript[] occupations = new sq_groupoccupationscript[0] ; #DEBUG_LINE_NO:105
  Int I = 0 ; #DEBUG_LINE_NO:107
  While I < Groups.Length ; #DEBUG_LINE_NO:108
    sq_groupscript currentGroup = Groups[I] ; #DEBUG_LINE_NO:109
    sq_groupoccupationscript[] currentGroupOccupations = currentGroup.GetAllOccupations() ; #DEBUG_LINE_NO:110
    Int iOccupation = 0 ; #DEBUG_LINE_NO:112
    While iOccupation < currentGroupOccupations.Length ; #DEBUG_LINE_NO:113
      sq_groupoccupationscript currentOccupation = currentGroupOccupations[iOccupation] ; #DEBUG_LINE_NO:114
      If occupations.find(currentOccupation, 0) < 0 ; #DEBUG_LINE_NO:116
        occupations.add(currentOccupation, 1) ; #DEBUG_LINE_NO:118
      EndIf ; #DEBUG_LINE_NO:
      iOccupation += 1 ; #DEBUG_LINE_NO:121
    EndWhile ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:124
  EndWhile ; #DEBUG_LINE_NO:
  Return occupations ; #DEBUG_LINE_NO:129
EndFunction

sq_groupoccupationscript Function GetRandomOccupationFromAllPossibleOccupations()
  sq_groupoccupationscript[] allPossibleOccupations = Self.GetAllPossibleOccupations() ; #DEBUG_LINE_NO:134
  Int iRandom = Utility.RandomInt(0, allPossibleOccupations.Length - 1) ; #DEBUG_LINE_NO:135
  sq_groupoccupationscript randomOccupation = allPossibleOccupations[iRandom] ; #DEBUG_LINE_NO:136
  Return randomOccupation ; #DEBUG_LINE_NO:139
EndFunction

sq_groupscript Function GetGroupByActor(Actor ActorToGetGroupFor, Bool ValidateActor)
  sq_groupscript returnVal = None ; #DEBUG_LINE_NO:145
  Int I = 0 ; #DEBUG_LINE_NO:146
  While returnVal == None && I < Groups.Length ; #DEBUG_LINE_NO:147
    sq_groupscript currentGroup = Groups[I] ; #DEBUG_LINE_NO:148
    If currentGroup.CheckActorFactions(ActorToGetGroupFor) ; #DEBUG_LINE_NO:150
      If ValidateActor == False || currentGroup.ValidateActor(ActorToGetGroupFor, None) ; #DEBUG_LINE_NO:152
        returnVal = currentGroup ; #DEBUG_LINE_NO:153
      Else ; #DEBUG_LINE_NO:
        Return None ; #DEBUG_LINE_NO:156
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:160
  EndWhile ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:164
EndFunction

sq_groupscript Function GetGroupByFactionID(GlobalVariable FactionID)
  sq_groupscript returnVal = None ; #DEBUG_LINE_NO:169
  Int I = 0 ; #DEBUG_LINE_NO:170
  While returnVal == None && I < Groups.Length ; #DEBUG_LINE_NO:172
    sq_groupscript currentGroup = Groups[I] ; #DEBUG_LINE_NO:173
    If currentGroup.FactionID == FactionID ; #DEBUG_LINE_NO:175
      returnVal = currentGroup ; #DEBUG_LINE_NO:176
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:179
  EndWhile ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:183
EndFunction

sq_groupscript Function GetGroupByFactionIDValue(Int FactionIDValue)
  sq_groupscript returnVal = None ; #DEBUG_LINE_NO:188
  Int I = 0 ; #DEBUG_LINE_NO:189
  While returnVal == None && I < Groups.Length ; #DEBUG_LINE_NO:190
    sq_groupscript currentGroup = Groups[I] ; #DEBUG_LINE_NO:191
    If currentGroup.FactionID.GetValue() == FactionIDValue as Float ; #DEBUG_LINE_NO:193
      Return currentGroup ; #DEBUG_LINE_NO:194
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:197
  EndWhile ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:201
EndFunction

Int Function GetGroupFactionIDValueByActor(Actor ActorToGetGroupFor, Bool ValidateActor)
  Return Self.GetGroupByActor(ActorToGetGroupFor, ValidateActor).FactionID.GetValue() as Int ; #DEBUG_LINE_NO:206
EndFunction

Function DebugSpawnGroupReference(ObjectReference SpawnAtRef, sq_groupscript GroupToSpawnFrom, sq_groupoccupationscript OccupationToSpawn, GlobalVariable SpawnType, GlobalVariable Gender)
  GroupToSpawnFrom.SpawnGroupReference(SpawnAtRef, OccupationToSpawn, None, False, SpawnType, Gender, False, None, False, -1) ; #DEBUG_LINE_NO:213
EndFunction

Function SetDebugGroupRoleEnemy(GlobalVariable SQ_GroupID)
  SQ_Debug_GroupRole_Enemy.SetValue(SQ_GroupID.GetValueInt() as Float) ; #DEBUG_LINE_NO:218
EndFunction

Function SetDebugGroupRoleVictim(GlobalVariable SQ_GroupID)
  SQ_Debug_GroupRole_Victim.SetValue(SQ_GroupID.GetValueInt() as Float) ; #DEBUG_LINE_NO:223
EndFunction

Function SetDebugGroupRoleNeutral(GlobalVariable SQ_GroupID)
  SQ_Debug_GroupRole_Neutral.SetValue(SQ_GroupID.GetValueInt() as Float) ; #DEBUG_LINE_NO:228
EndFunction

Function SetDebugGroupRoleBiomePredator(GlobalVariable SQ_GroupID)
  SQ_Debug_GroupRole_BiomePredator.SetValue(SQ_GroupID.GetValueInt() as Float) ; #DEBUG_LINE_NO:233
EndFunction

Function SetDebugGroupRoleBiomePrey(GlobalVariable SQ_GroupID)
  SQ_Debug_GroupRole_BiomePrey.SetValue(SQ_GroupID.GetValueInt() as Float) ; #DEBUG_LINE_NO:238
EndFunction

Function SetDebugGroupRoleBiomeCritter(GlobalVariable SQ_GroupID)
  SQ_Debug_GroupRole_BiomeCritter.SetValue(SQ_GroupID.GetValueInt() as Float) ; #DEBUG_LINE_NO:243
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:250
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:254
EndFunction
