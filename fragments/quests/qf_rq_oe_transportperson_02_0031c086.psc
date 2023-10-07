ScriptName Fragments:Quests:QF_RQ_OE_TransportPerson_02_0031C086 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Actors Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rq_transportpersonscript kmyQuest = __temp as rq_transportpersonscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:19
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript ; #DEBUG_LINE_NO:20
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:23
  kmyQuest.AddPassengers(Alias_Actors) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:32
  rq_transportpersonscript kmyQuest = __temp as rq_transportpersonscript ; #DEBUG_LINE_NO:33
  kmyQuest.AgreeToTransportPassenger() ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0285_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:44
  rq_transportpersonscript kmyQuest = __temp as rq_transportpersonscript ; #DEBUG_LINE_NO:45
  If Self.IsObjectiveDisplayed(100) && !Self.IsObjectiveCompleted(100) ; #DEBUG_LINE_NO:48
    Self.SetObjectiveFailed(100, True) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:51
  Self.SetStage(990) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0390_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:60
  rq_transportpersonscript kmyQuest = __temp as rq_transportpersonscript ; #DEBUG_LINE_NO:61
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:64
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:65
  kmyQuest.SetDialogueAV_Hello_DepartingShip() ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0920_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:74
  rq_transportpersonscript kmyQuest = __temp as rq_transportpersonscript ; #DEBUG_LINE_NO:75
  Self.SetStage(990) ; #DEBUG_LINE_NO:78
  kmyQuest.SetDialogueAV_Hello_Calm_Success() ; #DEBUG_LINE_NO:79
EndFunction
