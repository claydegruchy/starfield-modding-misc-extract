ScriptName SQ_TreasureMap_CreateScript Extends ObjectReference
{ place this script on a container to create treasure map(s) in it on load
  NOTE: only 1 scripted container per location! }

;-- Variables ---------------------------------------
Quest[] myQuests

;-- Properties --------------------------------------
Keyword Property SQ_TreasureMap_CreateMapStoryEvent Auto Const mandatory
{ story event to send to try to place treasure maps for sale by vendor }
Int Property TreasureMapType = -1 Auto Const
{ specify which type of treasure map is allowed for this container:
    -1 = any
    0 = surface
    1 = resources
    2 = space }
Int Property TreasureMapProximityRestriction = -1 Auto Const
{ specify any "proximity" that isn't allowed for this vendor (sent with story event as Value2):
    -1 = no restriction
    0 = local area
    1 = same planet - if restricted, also prevent local area
    2 = same system
    3 = different system }
GlobalVariable Property SQ_TreasureMap_CreateAny Auto Const mandatory
{ holds value for story manager to create any type of treasure map (99) }

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.CheckQuests() == False ; #DEBUG_LINE_NO:34
    Int aiValue1 = TreasureMapType ; #DEBUG_LINE_NO:36
    If aiValue1 < 0 ; #DEBUG_LINE_NO:37
      aiValue1 = SQ_TreasureMap_CreateAny.GetValueInt() ; #DEBUG_LINE_NO:38
    EndIf ; #DEBUG_LINE_NO:
    Int aiValue2 = TreasureMapProximityRestriction ; #DEBUG_LINE_NO:40
    If aiValue2 < 0 ; #DEBUG_LINE_NO:41
      aiValue2 = SQ_TreasureMap_CreateAny.GetValueInt() ; #DEBUG_LINE_NO:42
    EndIf ; #DEBUG_LINE_NO:
    myQuests = SQ_TreasureMap_CreateMapStoryEvent.SendStoryEventAndWait(Self.GetCurrentLocation(), Self as ObjectReference, None, aiValue1, aiValue2) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function CheckQuests()
  Bool isQuestRunning = False ; #DEBUG_LINE_NO:51
  Int I = myQuests.Length - 1 ; #DEBUG_LINE_NO:53
  While I >= 0 ; #DEBUG_LINE_NO:54
    Quest theQuest = myQuests[I] ; #DEBUG_LINE_NO:55
    If theQuest.IsRunning() ; #DEBUG_LINE_NO:57
      isQuestRunning = True ; #DEBUG_LINE_NO:58
    Else ; #DEBUG_LINE_NO:
      myQuests.remove(I, 1) ; #DEBUG_LINE_NO:60
    EndIf ; #DEBUG_LINE_NO:
    I -= 1 ; #DEBUG_LINE_NO:62
  EndWhile ; #DEBUG_LINE_NO:
  Return isQuestRunning ; #DEBUG_LINE_NO:65
EndFunction
