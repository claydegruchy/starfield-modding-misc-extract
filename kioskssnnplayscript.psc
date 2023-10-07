ScriptName KioskSSNNPlayScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialgoueSSNNScenes Auto Const mandatory
ReferenceAlias Property RadioHost Auto Const
Scene Property SSNN_00_StoryManager Auto Const mandatory
GlobalVariable Property BlockingGlobal Auto Const
{ OPTIONAL: Used to block individual kiosks from playing when the specified global is set to 1.0 }

;-- Functions ---------------------------------------

Event OnLoad()
  If BlockingGlobal == None || BlockingGlobal.GetValue() <= 0.0 ; #DEBUG_LINE_NO:10
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, 30.0, 0) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.UnregisterForDistanceEvents(Self as ScriptObject, Game.GetPlayer() as ScriptObject, -1) ; #DEBUG_LINE_NO:17
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If BlockingGlobal == None || BlockingGlobal.GetValue() <= 0.0 ; #DEBUG_LINE_NO:21
    RadioHost.ForceRefTo(Self as ObjectReference) ; #DEBUG_LINE_NO:24
    SSNN_00_StoryManager.Start() ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndEvent
