ScriptName Fragments:Quests:QF_City_AkilaLife01_0011463F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AnnieWilcox Auto Const mandatory
ReferenceAlias Property Alias_EmilyCartwright Auto Const mandatory
Scene Property City_AkilaLife01_050_KidTalk Auto Const mandatory
ObjectReference Property AkilaLife01_StartMarker Auto Const mandatory
Keyword Property AkilaLife01_Keyword Auto Const mandatory
ReferenceAlias Property Alias_Thief Auto Const mandatory
ReferenceAlias Property Alias_Security Auto Const mandatory
Scene Property City_AkilaLife01_200b_SecurityShowsUp Auto Const mandatory
Scene Property City_AkilaLife01_175_GuardBarks Auto Const mandatory
ReferenceAlias Property Alias_EmmaWilcox Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(AkilaLife01_StartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  ObjectReference oTarg = Alias_AnnieWilcox.GetActorRef() as ObjectReference ; #DEBUG_LINE_NO:17
  oTarg.MoveTo(oTarg.GetLinkedRef(AkilaLife01_Keyword), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
  oTarg = Alias_EmilyCartwright.GetActorRef() as ObjectReference ; #DEBUG_LINE_NO:20
  oTarg.MoveTo(oTarg.GetLinkedRef(AkilaLife01_Keyword), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0050_Item_00()
  City_AkilaLife01_050_KidTalk.Start() ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0075_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:45
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:54
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:55
  Actor ThiefRef = Alias_Thief.GetActorRef() ; #DEBUG_LINE_NO:58
  ThiefRef.Enable(False) ; #DEBUG_LINE_NO:60
  ThiefRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:61
  ThiefRef.AllowBleedoutDialogue(True) ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Stage_0160_Item_00()
  Utility.wait(0.300000012) ; #DEBUG_LINE_NO:70
  Alias_Thief.GetActorReference().StopCombat() ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0175_Item_00()
  City_AkilaLife01_200b_SecurityShowsUp.Start() ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Security.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:89
  Alias_Security.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:90
  City_AkilaLife01_175_GuardBarks.Start() ; #DEBUG_LINE_NO:93
  Alias_AnnieWilcox.GetRef().MoveTo(Alias_EmmaWilcox.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:104
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:105
  Alias_Thief.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:116
  Alias_Thief.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:119
  Self.SetStage(9000) ; #DEBUG_LINE_NO:121
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:129
EndFunction
