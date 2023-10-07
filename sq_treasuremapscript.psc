ScriptName SQ_TreasureMapScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property StoryManagerEventKeyword Auto Const mandatory
ObjectReference Property SQ_TreasureMapHoldingCellMarker Auto Const mandatory
{ autofill }
Form Property Treasure Auto Const mandatory
{ treasure that will be created and placed in quest location }
objectmod Property TreasureMod Auto Const
{ OPTIONAL: mod to add to treasure when created - obviously can only be used for weapons or armor (and only if the Treasure is one or the other)
    TEMP: this will be removed once this task is done: https://bgs.atlassian.net/browse/GEN-424645 }
Int Property TreasureLocation = 0 Auto Const
{ sent with story event as Value1: 
  0 = surface
  1 = resources
  2 = space }
Int Property TreasureProximity = 2 Auto Const
{ sent with story event as Value2:
    0 = local area (find location in current block pattern)
    1 = same planet
    2 = same system
    3 = different system }
Int Property TreasureQuantityMin = 1 Auto Const
{ this is used for cases where more than 1 item of treasure is needed (usually for resource maps) }
Int Property TreasureQuantityMax = 1 Auto Const
Bool Property TreasureAllTheSameThing = True Auto Const
{ true = additional treasure will use base object of first treasure created for all additional items - so it will be a uniform stack
  false = additional treaure will use whatever settings on the Treasure leveled list - so it could be a range of items }
sq_treasuremapquestscript Property myQuest Auto hidden
{ filled when treasure quest is started }

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  If myQuest == None ; #DEBUG_LINE_NO:46
    If akNewContainer == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:47
      Self.StartTreasureQuest() ; #DEBUG_LINE_NO:48
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartTreasureQuest()
  ObjectReference treasureRef = SQ_TreasureMapHoldingCellMarker.PlaceAtMe(Treasure, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:55
  SQ_TreasureMapScript treasureMapRef = SQ_TreasureMapHoldingCellMarker.PlaceAtMe(Self.GetBaseObject(), 1, False, False, True, None, None, True) as SQ_TreasureMapScript ; #DEBUG_LINE_NO:56
  sq_treasuremapquestscript[] myQuests = StoryManagerEventKeyword.SendStoryEventAndWait(None, treasureRef, treasureMapRef as ObjectReference, TreasureLocation, TreasureProximity) as sq_treasuremapquestscript[] ; #DEBUG_LINE_NO:58
  If myQuests.Length > 0 ; #DEBUG_LINE_NO:60
    myQuest = myQuests[0] ; #DEBUG_LINE_NO:61
    Int failsafeCount = 0 ; #DEBUG_LINE_NO:64
    While myQuest.IsStarting() && failsafeCount < 100 ; #DEBUG_LINE_NO:65
      Utility.wait(0.100000001) ; #DEBUG_LINE_NO:67
      failsafeCount += 1 ; #DEBUG_LINE_NO:68
    EndWhile ; #DEBUG_LINE_NO:
    ObjectReference player = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:73
    player.RemoveItem(Self as Form, 1, True, None) ; #DEBUG_LINE_NO:74
    player.AddItem(myQuest.TreasureMap.GetRef() as Form, 1, True) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
EndFunction
