ScriptName Fragments:Quests:QF_FC01_PostQuest_01002314 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property CityAkilaCityLocation Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ReferenceAlias Property Alias_JedBullock Auto Const mandatory
ReferenceAlias Property Alias_Robber02 Auto Const mandatory
ReferenceAlias Property Alias_Robber03 Auto Const mandatory
ReferenceAlias Property Alias_Robber04 Auto Const mandatory
ReferenceAlias Property Alias_Robber05 Auto Const mandatory
ReferenceAlias Property Alias_Robber06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2000_Item_00()
  If !Alias_Player.GetRef().IsInLocation(CityAkilaCityLocation) ; #DEBUG_LINE_NO:15
    Alias_JedBullock.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:17
    Alias_Robber02.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:18
    Alias_Robber03.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:19
    Alias_Robber04.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:20
    Alias_Robber05.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:21
    Alias_Robber06.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:22
    Self.Stop() ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndFunction
