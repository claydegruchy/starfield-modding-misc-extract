ScriptName Fragments:Quests:QF__0100143E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
ReferenceAlias Property Alias_Ship02 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
RefCollectionAlias Property Alias_Attackers Auto Const mandatory
Scene Property PSE_Raid01a_HailingScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0040_Item_00()
  PSE_Raid01a_HailingScene.start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Attackers.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0200_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:23
  Alias_Attackers.EvaluateAll() ; #DEBUG_LINE_NO:25
  Utility.wait(14.0) ; #DEBUG_LINE_NO:26
  While I < Alias_Attackers.GetCount() ; #DEBUG_LINE_NO:28
    (Alias_Attackers.GetAt(I) as spaceshipreference).DisableWithGravJumpNoWait() ; #DEBUG_LINE_NO:29
    Utility.wait(Utility.randomfloat(0.200000003, 3.900000095)) ; #DEBUG_LINE_NO:30
    I += 1 ; #DEBUG_LINE_NO:31
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
