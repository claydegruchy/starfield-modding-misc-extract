ScriptName Fragments:Quests:QF_City_Neon_Gang02_00226527 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_Neon_Gang_Tagging Auto Const mandatory
Quest Property City_Neon_Gang03 Auto Const mandatory
ReferenceAlias Property Alias_GuardAt02 Auto Const mandatory
RefCollectionAlias Property Alias_DisciplesAt03 Auto Const mandatory
Scene Property Gang02_400_GuardAccost Auto Const mandatory
Scene Property Gang02_400a_GuardStart Auto Const mandatory
RefCollectionAlias Property Alias_DisciplesAt01 Auto Const mandatory
ReferenceAlias Property Alias_GangSign01 Auto Const mandatory
ReferenceAlias Property Alias_GangSign02 Auto Const mandatory
ReferenceAlias Property Alias_GangSign03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  City_Neon_Gang_Tagging.Start() ; #DEBUG_LINE_NO:8
  Alias_DisciplesAt01.EnableAll(False) ; #DEBUG_LINE_NO:11
  Alias_DisciplesAt01.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:12
  Alias_DisciplesAt03.EnableAll(False) ; #DEBUG_LINE_NO:13
  Alias_DisciplesAt03.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:30
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:31
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:32
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:41
  Alias_GangSign01.GetRef().GetLinkedRef(None).PlayAnimation("Play01") ; #DEBUG_LINE_NO:44
  If Self.GetStageDone(400) && Self.GetStageDone(500) ; #DEBUG_LINE_NO:47
    Self.SetStage(600) ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:57
  Alias_GangSign02.GetRef().GetLinkedRef(None).PlayAnimation("Play01") ; #DEBUG_LINE_NO:60
  If Self.GetStageDone(300) && Self.GetStageDone(500) ; #DEBUG_LINE_NO:63
    Self.SetStage(600) ; #DEBUG_LINE_NO:64
  EndIf ; #DEBUG_LINE_NO:
  Alias_GuardAt02.GetRef().Enable(False) ; #DEBUG_LINE_NO:68
  Gang02_400a_GuardStart.Start() ; #DEBUG_LINE_NO:69
EndFunction

Function Fragment_Stage_0410_Item_00()
  (Alias_GuardAt02.GetRef() as Actor).StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0440_Item_00()
  Alias_GuardAt02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:95
  Alias_GangSign03.GetRef().GetLinkedRef(None).PlayAnimation("Play01") ; #DEBUG_LINE_NO:98
  If Self.GetStageDone(300) && Self.GetStageDone(400) ; #DEBUG_LINE_NO:101
    Self.SetStage(600) ; #DEBUG_LINE_NO:102
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:119
  City_Neon_Gang03.SetStage(100) ; #DEBUG_LINE_NO:122
  City_Neon_Gang03.SetActive(True) ; #DEBUG_LINE_NO:123
  Self.SetStage(9000) ; #DEBUG_LINE_NO:126
EndFunction

Function Fragment_Stage_9000_Item_00()
  City_Neon_Gang_Tagging.Stop() ; #DEBUG_LINE_NO:135
  Alias_GuardAt02.GetRef().Disable(False) ; #DEBUG_LINE_NO:138
  Alias_GangSign01.GetRef().GetLinkedRef(None).PlayAnimation("Play02") ; #DEBUG_LINE_NO:141
  Alias_GangSign02.GetRef().GetLinkedRef(None).PlayAnimation("Play02") ; #DEBUG_LINE_NO:142
  Alias_GangSign03.GetRef().GetLinkedRef(None).PlayAnimation("Play02") ; #DEBUG_LINE_NO:143
  Self.Stop() ; #DEBUG_LINE_NO:145
EndFunction
