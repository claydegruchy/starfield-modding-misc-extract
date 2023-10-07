ScriptName DR009AirlockScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool initialized = False
Bool waitForPlayerArrival = False

;-- Properties --------------------------------------
Keyword Property CosmeticDoorKeyword Auto Const mandatory
Keyword Property InvisibleDoorKeyword Auto Const mandatory
Keyword Property ArrivalTriggerVolumeKeyword Auto Const mandatory
Keyword Property LinkedAirlockKeyword Auto Const mandatory
Float Property doorClosingSeconds Auto Const mandatory
Float Property WaitSeconds = 1.5 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad()
  If initialized == False ; #DEBUG_LINE_NO:14
    Self.Init() ; #DEBUG_LINE_NO:15
    DR009AirlockScript linkedAirlockScript = Self.GetLinkedRef(LinkedAirlockKeyword) as DR009AirlockScript ; #DEBUG_LINE_NO:17
    If linkedAirlockScript != None ; #DEBUG_LINE_NO:19
      linkedAirlockScript.Init() ; #DEBUG_LINE_NO:20
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function Init()
  initialized == True ; #DEBUG_LINE_NO:26
  ObjectReference arrivalTriggerVolume = Self.GetLinkedRef(ArrivalTriggerVolumeKeyword) ; #DEBUG_LINE_NO:28
  If arrivalTriggerVolume != None ; #DEBUG_LINE_NO:30
    Self.RegisterForRemoteEvent(arrivalTriggerVolume as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnActivate(ObjectReference akActionRef)
  ObjectReference player = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:36
  If akActionRef == player ; #DEBUG_LINE_NO:37
    ObjectReference cosmeticDoor = Self.GetLinkedRef(CosmeticDoorKeyword) ; #DEBUG_LINE_NO:38
    ObjectReference invisibleDoor = Self.GetLinkedRef(InvisibleDoorKeyword) ; #DEBUG_LINE_NO:39
    DR009AirlockScript linkedAirlockScript = Self.GetLinkedRef(LinkedAirlockKeyword) as DR009AirlockScript ; #DEBUG_LINE_NO:40
    If cosmeticDoor != None && invisibleDoor != None && linkedAirlockScript != None ; #DEBUG_LINE_NO:42
      cosmeticDoor.SetOpen(False) ; #DEBUG_LINE_NO:43
      Utility.Wait(doorClosingSeconds) ; #DEBUG_LINE_NO:45
      linkedAirlockScript.waitForPlayerArrival() ; #DEBUG_LINE_NO:47
      invisibleDoor.Activate(player, False) ; #DEBUG_LINE_NO:49
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function waitForPlayerArrival()
  waitForPlayerArrival = True ; #DEBUG_LINE_NO:55
EndFunction

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  If waitForPlayerArrival ; #DEBUG_LINE_NO:59
    waitForPlayerArrival = False ; #DEBUG_LINE_NO:60
    ObjectReference cosmeticDoor = Self.GetLinkedRef(CosmeticDoorKeyword) ; #DEBUG_LINE_NO:62
    If cosmeticDoor != None ; #DEBUG_LINE_NO:64
      Utility.Wait(WaitSeconds) ; #DEBUG_LINE_NO:65
      cosmeticDoor.SetOpen(True) ; #DEBUG_LINE_NO:67
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
