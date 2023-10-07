ScriptName FrontDoorToLodgeScript Extends ObjectReference

;-- Variables ---------------------------------------
Int FailsafeTimerID = 5
Int FailsafeTimerLength = 15
inputenablelayer LodgeDoorLayer
Armor StorePlayerArmor
Armor StorePlayerSuit

;-- Properties --------------------------------------
Message Property TestFrontDoorLodgeMSG Auto Const mandatory
Bool Property LodgeFrontDoorOpen Auto
ActorValue Property PlayerUnityTimesEntered Auto Const mandatory
Idle Property IdleDoorWatch Auto Const mandatory
Armor Property Clothes_Chronomark_Mq101 Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Int Property MQ101LodgeStage = 1510 Auto Const
Message Property NotAllowedDuringCombat Auto Const mandatory

;-- Functions ---------------------------------------

Event Actor.OnItemUnequipped(Actor akSender, Form akBaseObject, ObjectReference akReference)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function WatchAnimFinished()
  Self.GotoState("HasBeenTriggered") ; #DEBUG_LINE_NO:113
  Self.CancelTimer(FailsafeTimerID) ; #DEBUG_LINE_NO:114
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:115
  LodgeDoorLayer = None ; #DEBUG_LINE_NO:116
  If StorePlayerArmor != None ; #DEBUG_LINE_NO:119
    PlayerREF.EquipItem(StorePlayerArmor as Form, False, True) ; #DEBUG_LINE_NO:120
  EndIf ; #DEBUG_LINE_NO:
  If StorePlayerSuit != None ; #DEBUG_LINE_NO:123
    PlayerREF.EquipItem(StorePlayerSuit as Form, False, True) ; #DEBUG_LINE_NO:124
  EndIf ; #DEBUG_LINE_NO:
  PlayerREF.RemoveItem(Clothes_Chronomark_Mq101 as Form, 1, True, None) ; #DEBUG_LINE_NO:127
  Self.BlockActivation(False, False) ; #DEBUG_LINE_NO:130
  LodgeFrontDoorOpen = True ; #DEBUG_LINE_NO:131
  Self.Activate(PlayerREF as ObjectReference, False) ; #DEBUG_LINE_NO:132
  Self.UnRegisterForRemoteEvent(PlayerREF as ScriptObject, "OnItemUnequipped") ; #DEBUG_LINE_NO:133
EndFunction

;-- State -------------------------------------------
State HasBeenActivated

  Event Actor.OnItemUnequipped(Actor akSender, Form akBaseObject, ObjectReference akReference)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnTimer(Int aiTimerID)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State waitingforPlayer

  Event Actor.OnItemUnequipped(Actor akSender, Form akBaseObject, ObjectReference akReference)
    Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:
    If akSender == PlayerREF ; #DEBUG_LINE_NO:
      If StorePlayerArmor == None ; #DEBUG_LINE_NO:
        StorePlayerArmor = akBaseObject as Armor ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        StorePlayerSuit = akBaseObject as Armor ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnActivate(ObjectReference akActionRef)
    Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:
    If akActionRef == PlayerREF as ObjectReference ; #DEBUG_LINE_NO:
      If PlayerREF.IsInCombat() || Game.IsGuardPursuingPlayer() ; #DEBUG_LINE_NO:
        NotAllowedDuringCombat.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:
      ElseIf LodgeFrontDoorOpen == False && PlayerREF.GetValue(PlayerUnityTimesEntered) == 0.0 && MQ101.GetStageDone(MQ101LodgeStage) == False && MQ101.IsCompleted() == False ; #DEBUG_LINE_NO:
        LodgeDoorLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:
        LodgeDoorLayer.DisablePlayerControls(True, True, True, True, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:
        Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnItemUnequipped") ; #DEBUG_LINE_NO:
        Self.RegisterForAnimationEvent(PlayerREF as ObjectReference, "Activate") ; #DEBUG_LINE_NO:
        Game.ForceFirstPerson() ; #DEBUG_LINE_NO:
        If PlayerREF.IsWeaponDrawn() ; #DEBUG_LINE_NO:
          PlayerREF.SheatheWeapon() ; #DEBUG_LINE_NO:
          Utility.Wait(2.0) ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:
        PlayerREF.UnequipItemSlot(3) ; #DEBUG_LINE_NO:
        PlayerREF.UnequipItemSlot(8) ; #DEBUG_LINE_NO:
        PlayerREF.UnequipItemSlot(35) ; #DEBUG_LINE_NO:
        PlayerREF.EquipItem(Clothes_Chronomark_Mq101 as Form, False, True) ; #DEBUG_LINE_NO:
        Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:
        PlayerREF.PlayIdle(IdleDoorWatch) ; #DEBUG_LINE_NO:
        Utility.Wait(7.0) ; #DEBUG_LINE_NO:
        Self.PlayAnimation("Play01") ; #DEBUG_LINE_NO:
        Self.StartTimer(FailsafeTimerLength as Float, FailsafeTimerID) ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Self.GotoState("HasBeenTriggered") ; #DEBUG_LINE_NO:
        Self.BlockActivation(False, False) ; #DEBUG_LINE_NO:
        LodgeFrontDoorOpen = True ; #DEBUG_LINE_NO:
        Self.Activate(akActionRef, False) ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnAnimationEvent(ObjectReference akSource, String asEventName)
    Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:
    If asEventName == "Activate" ; #DEBUG_LINE_NO:
      Self.WatchAnimFinished() ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnTimer(Int aiTimerID)
    Self.WatchAnimFinished() ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:19
    If LodgeFrontDoorOpen == False && PlayerREF.GetValue(PlayerUnityTimesEntered) == 0.0 && MQ101.GetStageDone(MQ101LodgeStage) == False && MQ101.IsCompleted() == False ; #DEBUG_LINE_NO:20
      Self.BlockActivation(True, False) ; #DEBUG_LINE_NO:21
    Else ; #DEBUG_LINE_NO:
      Self.GotoState("HasBeenTriggered") ; #DEBUG_LINE_NO:23
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
