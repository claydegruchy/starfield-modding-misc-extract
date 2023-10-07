ScriptName MS05RewardScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
ReferenceAlias Property RidiculousShip Auto Const mandatory
ReferenceAlias Property SensibleShip Auto Const mandatory
Int Property SellShipStage = 1001 Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForCustomEvent(SQ_PlayerShip as ScriptObject, "sq_playershipscript_SQ_PlayerSellShip") ; #DEBUG_LINE_NO:11
EndEvent

Event SQ_PlayerShipScript.SQ_PlayerSellShip(sq_playershipscript akSender, Var[] akArgs)
  spaceshipreference PlayerShipToSell = akArgs[0] as spaceshipreference ; #DEBUG_LINE_NO:17
  If PlayerShipToSell == RidiculousShip.GetShipRef() || PlayerShipToSell == SensibleShip.GetShipRef() ; #DEBUG_LINE_NO:20
    Self.SetStage(SellShipStage) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent
