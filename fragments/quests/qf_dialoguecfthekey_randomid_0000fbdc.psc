ScriptName Fragments:Quests:QF_DialogueCFTheKey_RandomId_0000FBDC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueCFTheKey_RandomIdles_LastNova02 Auto Const mandatory
GlobalVariable Property CF_LastNovaPatronGlobal Auto Const mandatory
Quest Property DialogueCFTheKey_RandomIdles_LastNova01 Auto Const mandatory
Quest Property DialogueCFTheKey_RandomIdles_LastNova04 Auto Const mandatory
ReferenceAlias Property Alias_PushUpFurniture01 Auto Const mandatory
ReferenceAlias Property Alias_PushUpFurniture02 Auto Const mandatory
ReferenceAlias Property Alias_PushUpFurniture03 Auto Const mandatory
Scene Property DialogueCFTheKey_RandomIdles_LastNovaScene03 Auto Const mandatory
Scene Property DialogueCFTheKey_RandomIdles_LastNovaScene01 Auto Const mandatory
Scene Property DialogueCFTheKey_RandomIdles_LastNovaScene02 Auto Const mandatory
ReferenceAlias Property Alias_Pirate03 Auto Const mandatory
ReferenceAlias Property Alias_Pirate04 Auto Const mandatory
ReferenceAlias Property Alias_Pirate05 Auto Const mandatory
ReferenceAlias Property Alias_PushUpFurniture04 Auto Const mandatory
Keyword Property AnimArchetypeConfident Auto Const mandatory
Keyword Property AnimArchetypePirate Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  DialogueCFTheKey_RandomIdles_LastNovaScene03.Stop() ; #DEBUG_LINE_NO:7
  Alias_PushUpFurniture01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:8
  Alias_PushUpFurniture02.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:9
  Alias_PushUpFurniture03.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:10
  Alias_PushUpFurniture04.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:11
  Actor Pirate03 = Alias_Pirate03.GetActorRef() ; #DEBUG_LINE_NO:13
  Actor Pirate04 = Alias_Pirate04.GetActorRef() ; #DEBUG_LINE_NO:14
  Actor Pirate05 = Alias_Pirate05.GetActorRef() ; #DEBUG_LINE_NO:15
  Pirate03.EvaluatePackage(False) ; #DEBUG_LINE_NO:17
  Pirate04.EvaluatePackage(False) ; #DEBUG_LINE_NO:18
  Pirate05.EvaluatePackage(False) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0010_Item_00()
  DialogueCFTheKey_RandomIdles_LastNova01.Start() ; #DEBUG_LINE_NO:27
  DialogueCFTheKey_RandomIdles_LastNova02.Start() ; #DEBUG_LINE_NO:28
  Int I = Utility.RandomInt(0, 4) ; #DEBUG_LINE_NO:29
  CF_LastNovaPatronGlobal.SetValue(I as Float) ; #DEBUG_LINE_NO:30
  DialogueCFTheKey_RandomIdles_LastNovaScene03.Start() ; #DEBUG_LINE_NO:36
  Alias_PushUpFurniture01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:38
  Alias_PushUpFurniture02.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:39
  Alias_PushUpFurniture03.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:40
  Alias_PushUpFurniture04.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:41
  Actor Pirate03 = Alias_Pirate03.GetActorRef() ; #DEBUG_LINE_NO:43
  Actor Pirate04 = Alias_Pirate04.GetActorRef() ; #DEBUG_LINE_NO:44
  ObjectReference Pirate05 = Alias_Pirate05.GetRef() ; #DEBUG_LINE_NO:45
  Pirate03.RemoveKeyword(AnimArchetypePirate) ; #DEBUG_LINE_NO:47
  Pirate03.AddKeyword(AnimArchetypeConfident) ; #DEBUG_LINE_NO:48
  Pirate04.RemoveKeyword(AnimArchetypePirate) ; #DEBUG_LINE_NO:49
  Pirate04.AddKeyword(AnimArchetypeConfident) ; #DEBUG_LINE_NO:50
  Pirate03.SnapIntoInteraction(Pirate03.GetLinkedRef(None)) ; #DEBUG_LINE_NO:52
  Pirate04.SnapIntoInteraction(Pirate04.GetLinkedRef(None)) ; #DEBUG_LINE_NO:53
  Pirate05.MoveTo(Pirate05.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0020_Item_00()
  DialogueCFTheKey_RandomIdles_LastNovaScene01.Stop() ; #DEBUG_LINE_NO:62
  DialogueCFTheKey_RandomIdles_LastNovaScene02.Stop() ; #DEBUG_LINE_NO:63
  DialogueCFTheKey_RandomIdles_LastNovaScene03.Stop() ; #DEBUG_LINE_NO:64
  DialogueCFTheKey_RandomIdles_LastNova01.Stop() ; #DEBUG_LINE_NO:67
  DialogueCFTheKey_RandomIdles_LastNova02.Stop() ; #DEBUG_LINE_NO:68
  DialogueCFTheKey_RandomIdles_LastNova04.Stop() ; #DEBUG_LINE_NO:69
  Self.Stop() ; #DEBUG_LINE_NO:70
EndFunction
