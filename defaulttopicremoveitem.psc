ScriptName DefaultTopicRemoveItem Extends TopicInfo Const default

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property RemoveItemOnBegin = False Auto Const
{ Default: false; should we remove the item when the topic starts playing? }
Bool Property RemoveItemOnEnd = True Auto Const
{ Default: true; should we remove the item when the topic finishes playing? }
MiscObject Property MiscItemToRemove Auto Const
{ Which item should we remove from player? }
Int Property ItemCountToRemove = 1 Auto Const
{ how many items should we remove? }
GlobalVariable Property ItemCountToRemoveGlobal Auto Const
{ OPTIONAL - if this is provided, it will be used instead of ItemCountToRemove }

;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If RemoveItemOnBegin ; #DEBUG_LINE_NO:18
    Self.RemoveItem() ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If RemoveItemOnEnd ; #DEBUG_LINE_NO:25
    Self.RemoveItem() ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RemoveItem()
  Int countToRemove = ItemCountToRemove ; #DEBUG_LINE_NO:32
  If ItemCountToRemoveGlobal ; #DEBUG_LINE_NO:33
    countToRemove = ItemCountToRemoveGlobal.GetValueInt() ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().RemoveItem(MiscItemToRemove as Form, countToRemove, False, None) ; #DEBUG_LINE_NO:36
EndFunction
