ScriptName FFConstantR02QuestScript Extends Quest

;-- Structs -----------------------------------------
Struct CrimeFactionDatum
  Keyword SettlementCrimeFactionKeyword
  { The Crime Faction keyword used in the location where the family member can be found }
  Faction CrimeFaction
  { The corresponding Crime Faction for that Location }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property FamilyLoc Auto Const mandatory
Message[] Property FNameList Auto Const mandatory
Message[] Property MNameList Auto Const mandatory
ReferenceAlias Property Family Auto Const mandatory
ReferenceAlias Property Slate Auto Const mandatory
Book Property FFConstantR02_Slate Auto Const mandatory
Int Property StartStage = 100 Auto Const
ffconstantr02questscript:crimefactiondatum[] Property CrimeFactionData Auto Const
{ Array of data for setting up crime factions for the family member }

;-- Functions ---------------------------------------

Function SetCrimeFaction()
  Location myFamilyLocation = FamilyLoc.GetLocation() ; #DEBUG_LINE_NO:26
  Actor myFamily = Family.GetActorRef() ; #DEBUG_LINE_NO:27
  Int I = 0 ; #DEBUG_LINE_NO:29
  Int iCount = CrimeFactionData.Length ; #DEBUG_LINE_NO:30
  While I < iCount ; #DEBUG_LINE_NO:31
    If myFamilyLocation.HasKeyword(CrimeFactionData[I].SettlementCrimeFactionKeyword) ; #DEBUG_LINE_NO:32
      myFamily.SetCrimeFaction(CrimeFactionData[I].CrimeFaction) ; #DEBUG_LINE_NO:33
      I = iCount ; #DEBUG_LINE_NO:35
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:37
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetRelativeName()
  ActorBase myActorBase = Family.GetActorRef().GetLeveledActorBase() ; #DEBUG_LINE_NO:45
  Int iSex = myActorBase.GetSex() ; #DEBUG_LINE_NO:46
  If iSex == 0 ; #DEBUG_LINE_NO:47
    Self.SetMName() ; #DEBUG_LINE_NO:48
  ElseIf iSex == 1 ; #DEBUG_LINE_NO:49
    Self.SetFName() ; #DEBUG_LINE_NO:50
  Else ; #DEBUG_LINE_NO:
    Int iRandomSex = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:53
    If iRandomSex == 0 ; #DEBUG_LINE_NO:54
      Self.SetMName() ; #DEBUG_LINE_NO:55
    ElseIf iRandomSex == 1 ; #DEBUG_LINE_NO:56
      Self.SetFName() ; #DEBUG_LINE_NO:57
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.SetCrimeFaction() ; #DEBUG_LINE_NO:60
EndFunction

Function SetMName()
  ObjectReference myRelative = Family.GetRef() ; #DEBUG_LINE_NO:65
  Message myName = None ; #DEBUG_LINE_NO:66
  Int iRandom = Utility.RandomInt(0, MNameList.Length - 1) ; #DEBUG_LINE_NO:67
  myName = MNameList[iRandom] ; #DEBUG_LINE_NO:68
  myRelative.SetOverrideName(myName) ; #DEBUG_LINE_NO:69
  Self.CreateSlate(myName) ; #DEBUG_LINE_NO:70
EndFunction

Function SetFName()
  ObjectReference myRelative = Family.GetRef() ; #DEBUG_LINE_NO:75
  Message myName = None ; #DEBUG_LINE_NO:76
  Int iRandom = Utility.RandomInt(0, FNameList.Length - 1) ; #DEBUG_LINE_NO:77
  myName = FNameList[iRandom] ; #DEBUG_LINE_NO:78
  myRelative.SetOverrideName(myName) ; #DEBUG_LINE_NO:79
  Self.CreateSlate(myName) ; #DEBUG_LINE_NO:80
EndFunction

Function CreateSlate(Message amName)
  Game.GetPlayer().AddAliasedItem(FFConstantR02_Slate as Form, Slate as Alias, 1, False) ; #DEBUG_LINE_NO:85
  Slate.GetRef().AddTextReplacementData("myName", amName as Form) ; #DEBUG_LINE_NO:86
  Self.SetStage(StartStage) ; #DEBUG_LINE_NO:87
EndFunction

Function DebugObjective()
  Self.SetObjectiveDisplayed(StartStage, True, True) ; #DEBUG_LINE_NO:91
EndFunction

Event OnQuestInit()
  Self.SetRelativeName() ; #DEBUG_LINE_NO:96
EndEvent
