ScriptName Fragments:Quests:QF_BE_RI03_0024015E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI03 Auto Const mandatory
RefCollectionAlias Property Alias_GenericTurrets Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  RI03.SetStage(600) ; #DEBUG_LINE_NO:7
  Cell myCell = Alias_PilotSeat.GetRef().GetParentCell() ; #DEBUG_LINE_NO:9
  myCell.SetPublic(True) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:19
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:20
  kmyQuest.SetCrewPlayerFriend(True, True) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0150_Item_00()
  ObjectReference PilotSeatRef = Alias_PilotSeat.GetRef() ; #DEBUG_LINE_NO:31
  Cell myCell = PilotSeatRef.GetParentCell() ; #DEBUG_LINE_NO:32
  PilotSeatRef.BlockActivation(False, False) ; #DEBUG_LINE_NO:33
  myCell.SetFactionOwner(None) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_GenericTurrets.SetUnconscious(False) ; #DEBUG_LINE_NO:42
EndFunction
