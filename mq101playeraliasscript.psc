ScriptName MQ101PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Int MineralCount = 5

;-- Properties --------------------------------------
ReferenceAlias Property BarrettShip Auto
ReferenceAlias Property BarrettShipPilotChair Auto
ReferenceAlias Property Vasco Auto
MiscObject Property MineralType Auto
Location Property SystemNarionPlanetAnselonMoonNexumSurface Auto
Keyword Property ArmorTypeHelmet Auto
ReferenceAlias Property VascoStartMarker Auto
ReferenceAlias Property MedBench Auto
Location Property NewAtlantisLocation Auto
Weapon Property Cutter Auto
ActorValue Property Health Auto Const mandatory
Int Property PlayerLowHealthStage = 240 Auto Const
ReferenceAlias Property PlayerShip Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(MineralType as Form) ; #DEBUG_LINE_NO:19
  Self.AddInventoryEventFilter(Cutter as Form) ; #DEBUG_LINE_NO:20
EndEvent

Function PirateCombatStarts()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:25
  Float iLowHealth = PlayerREF.GetValue(Health) / 2.0 ; #DEBUG_LINE_NO:26
  Self.RegisterForActorValueLessThanEvent(PlayerREF as ObjectReference, Health, iLowHealth) ; #DEBUG_LINE_NO:27
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:31
  If Utility.IsGameMenuPaused() || PlayerREF.GetSpaceship() != None ; #DEBUG_LINE_NO:34
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.GetOwningQuest().SetStage(PlayerLowHealthStage) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:42
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:44
  If (akBaseItem == MineralType as Form) && PlayerREF.GetItemCount(MineralType as Form) >= MineralCount ; #DEBUG_LINE_NO:45
    myQuest.SetStage(25) ; #DEBUG_LINE_NO:46
    Self.RemoveInventoryEventFilter(MineralType as Form) ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
  If akBaseItem == Cutter as Form ; #DEBUG_LINE_NO:50
    myQuest.SetStage(20) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterShipInterior(ObjectReference akShip)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:56
  If akShip == BarrettShip.GetRef() ; #DEBUG_LINE_NO:57
    If myQuest.GetStageDone(320) == False && myQuest.GetStage() < 500 ; #DEBUG_LINE_NO:58
      myQuest.SetStage(320) ; #DEBUG_LINE_NO:59
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If akShip == PlayerShip.GetRef() ; #DEBUG_LINE_NO:63
    If myQuest.GetStageDone(900) == True && myQuest.GetStageDone(1000) == False ; #DEBUG_LINE_NO:64
      myQuest.SetStage(1000) ; #DEBUG_LINE_NO:65
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnExitShipInterior(ObjectReference akShip)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:72
  If Self.GetRef().IsInLocation(NewAtlantisLocation) ; #DEBUG_LINE_NO:74
    myQuest.SetStage(1320) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
  If myQuest.GetStageDone(900) == True ; #DEBUG_LINE_NO:78
    myQuest.SetStage(1000) ; #DEBUG_LINE_NO:79
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnSit(ObjectReference akFurniture)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:85
  If akFurniture == BarrettShipPilotChair.GetRef() ; #DEBUG_LINE_NO:86
    If myQuest.GetStageDone(340) == False && myQuest.GetStage() < 500 ; #DEBUG_LINE_NO:87
      myQuest.SetStage(340) ; #DEBUG_LINE_NO:88
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If akFurniture == MedBench.GetRef() ; #DEBUG_LINE_NO:92
    myQuest.SetStage(100) ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
  If akBaseObject.HasKeyword(ArmorTypeHelmet) ; #DEBUG_LINE_NO:98
    Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:99
    If myQuest.GetStageDone(155) ; #DEBUG_LINE_NO:100
      If myQuest.GetStageDone(165) ; #DEBUG_LINE_NO:101
        myQuest.SetStage(168) ; #DEBUG_LINE_NO:102
      Else ; #DEBUG_LINE_NO:
        myQuest.SetStage(169) ; #DEBUG_LINE_NO:104
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
