ScriptName SE_RaidScript Extends Quest conditional
{ Script attached to SE_Raid that handles spawning ships and getting information on the player }

;-- Variables ---------------------------------------
Int numCredits conditional
Int randomAsk = 1 conditional

;-- Properties --------------------------------------
Group Settings
  FormList Property RaidersShipList Auto Const mandatory
  { Formlist containing the ships that can spawn for this encounter }
  MiscObject Property Credits Auto Const mandatory
  { Credits Miscobject }
  Int Property maxShips Auto Const mandatory
  { max random number of ships that can spawn. }
  Int Property offsetDistance Auto Const mandatory
  { how far apart the ships are when they spawn }
  Int Property StageToSet = 50 Auto Const
  { stage to set on QuestToSetStage }
  GlobalVariable Property SE_Raid_SmallCredits Auto Const mandatory
  GlobalVariable Property SE_Raid_MediumCredits Auto Const mandatory
  GlobalVariable Property SE_Raid_LargeCredits Auto Const mandatory
EndGroup

Group QuestAliases
  RefCollectionAlias Property Alias_AttackersRC Auto Const mandatory
  { RefcollectionAlias that holds all of the enemy ships }
  ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
  { ReferenceAlias that points to the player's ship }
  ReferenceAlias Property Alias_Ship01 Auto Const mandatory
  { The enemy ship that hails the player }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.UpdatePlayerInfo() ; #DEBUG_LINE_NO:45
  Self.SpawnShips(RaidersShipList, Alias_AttackersRC) ; #DEBUG_LINE_NO:46
EndEvent

Function UpdatePlayerInfo()
  numCredits = Game.GetPlayer().GetItemCount(Credits as Form) ; #DEBUG_LINE_NO:52
EndFunction

Function SpawnShips(FormList akCurrentGroup, RefCollectionAlias akRefColToAddTo)
  Int I = 0 ; #DEBUG_LINE_NO:58
  Int GroupSize = Utility.RandomInt(1, maxShips) ; #DEBUG_LINE_NO:59
  spaceshipreference playership = Alias_PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:61
  While I < GroupSize ; #DEBUG_LINE_NO:63
    Utility.wait(1.0) ; #DEBUG_LINE_NO:64
    spaceshipreference newShip = playership.PlaceShipAtMeOffset(akCurrentGroup.GetAt(Utility.RandomInt(0, akCurrentGroup.GetSize() - 1)), (I - 1 * offsetDistance) as Float, 800.0, 0.0, 4, True, False, True, True, akRefColToAddTo as Alias, None, True) ; #DEBUG_LINE_NO:66
    newShip.EnableWithGravJump() ; #DEBUG_LINE_NO:68
    If I == 0 ; #DEBUG_LINE_NO:70
      Alias_Ship01.ForceRefTo(newShip as ObjectReference) ; #DEBUG_LINE_NO:71
      Utility.wait(5.0) ; #DEBUG_LINE_NO:72
      Self.SetStage(StageToSet) ; #DEBUG_LINE_NO:73
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:77
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RemoveItems(Int item)
{ Called from Topic Info for each possible response on the Respond scene }
  Self.UpdatePlayerInfo() ; #DEBUG_LINE_NO:85
  If item == 4 ; #DEBUG_LINE_NO:87
    Game.GetPlayer().RemoveItem(Credits as Form, SE_Raid_LargeCredits.GetValueInt(), False, None) ; #DEBUG_LINE_NO:88
  ElseIf item == 5 ; #DEBUG_LINE_NO:89
    Game.GetPlayer().RemoveItem(Credits as Form, SE_Raid_MediumCredits.GetValueInt(), False, None) ; #DEBUG_LINE_NO:90
  ElseIf item == 6 ; #DEBUG_LINE_NO:91
    Game.GetPlayer().RemoveItem(Credits as Form, SE_Raid_SmallCredits.GetValueInt(), False, None) ; #DEBUG_LINE_NO:92
  EndIf ; #DEBUG_LINE_NO:
EndFunction
