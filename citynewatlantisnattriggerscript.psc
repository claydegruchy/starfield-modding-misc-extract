ScriptName CityNewAtlantisNATTriggerScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property NATTriggerMessage Auto Const
Quest Property NATControlQuest Auto Const mandatory
Scene Property NATTransitScene Auto Const mandatory
GlobalVariable Property NATDestinationGlobal Auto
Message Property CityNewAtlantisNATMessage_Disallowed_Combat Auto Const mandatory
{ autofill }

;-- Functions ---------------------------------------

Event Scene.OnEnd(Scene akSource)
  Self.gotoState("Normal") ; #DEBUG_LINE_NO:11
EndEvent

;-- State -------------------------------------------
State Busy

  Event OnBeginState(String asOldState)
    Self.BlockActivation(True, True) ; #DEBUG_LINE_NO:57
    Self.RegisterForRemoteEvent(NATTransitScene as ScriptObject, "OnEnd") ; #DEBUG_LINE_NO:58
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Normal

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:
      Self.gotoState("Busy") ; #DEBUG_LINE_NO:
      Bool disallowed_Combat = Game.AreHostileActorsNear() || Game.IsGuardPursuingPlayer() ; #DEBUG_LINE_NO:
      If disallowed_Combat ; #DEBUG_LINE_NO:
        CityNewAtlantisNATMessage_Disallowed_Combat.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:
        Self.gotoState("Normal") ; #DEBUG_LINE_NO:
        Return  ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      Self.SetOpen(True) ; #DEBUG_LINE_NO:
      Utility.Wait(0.129999995) ; #DEBUG_LINE_NO:
      Int iButton = 0 ; #DEBUG_LINE_NO:
      iButton = NATTriggerMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:
      If iButton == -1 ; #DEBUG_LINE_NO:
        Self.gotoState("Normal") ; #DEBUG_LINE_NO:
      ElseIf iButton == 0 ; #DEBUG_LINE_NO:
        NATDestinationGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:
        NATTransitScene.Start() ; #DEBUG_LINE_NO:
      ElseIf iButton == 1 ; #DEBUG_LINE_NO:
        NATDestinationGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:
        NATTransitScene.Start() ; #DEBUG_LINE_NO:
      ElseIf iButton == 2 ; #DEBUG_LINE_NO:
        NATDestinationGlobal.SetValue(2.0) ; #DEBUG_LINE_NO:
        NATTransitScene.Start() ; #DEBUG_LINE_NO:
      ElseIf iButton == 3 ; #DEBUG_LINE_NO:
        NATDestinationGlobal.SetValue(3.0) ; #DEBUG_LINE_NO:
        NATTransitScene.Start() ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnBeginState(String asOldState)
    Self.BlockActivation(False, False) ; #DEBUG_LINE_NO:16
    Self.UnRegisterForRemoteEvent(NATTransitScene as ScriptObject, "OnEnd") ; #DEBUG_LINE_NO:17
  EndEvent
EndState
