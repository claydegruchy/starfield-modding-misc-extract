ScriptName RAD06Script Extends Quest

;-- Structs -----------------------------------------
Struct ResourcesInfo
  Int ResourceID
  { This is the ID number of the resource. }
  MiscObject ResourceObject
  { This is the misc item tied to the actual resource. }
  Int PricePerUnit
  { This is how much you are paid for delivering the resources }
  ReferenceAlias NameReference
  { This is the Reference Alias that has the name of the Resource }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
rad06script:resourcesinfo[] Property ResourceInfo Auto Const
{ Array of all the Resource info for RAD06 }
GlobalVariable Property RAD06_CurrentQuantity Auto Const mandatory
GlobalVariable Property RAD06_CurrentReward Auto Const mandatory
GlobalVariable Property RAD06_Quantity_01_Low Auto Const mandatory
GlobalVariable Property RAD06_Quantity_02_Medium Auto Const mandatory
GlobalVariable Property RAD06_Quantity_03_High Auto Const mandatory
GlobalVariable Property RAD06_EndValue Auto Const mandatory
Perk Property Scanning Auto Const mandatory
ActorValue Property RAD06_ResourceCheckAV Auto Const mandatory
ActorValue Property RAD06_CurrentQuantityAV Auto Const mandatory
ActorValue Property RAD06_DeliveryAmountAV Auto Const mandatory
ReferenceAlias Property PlayerShipInventory Auto Const
ReferenceAlias Property QuestGiver Auto Const
ReferenceAlias Property ResourceName Auto Const
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function InitResource()
{ Pick a resource and quantity }
  Actor aPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:23
  Int nResourceID = 0 ; #DEBUG_LINE_NO:26
  nResourceID = Utility.RandomInt(1, RAD06_EndValue.GetValue() as Int) ; #DEBUG_LINE_NO:27
  QuestGiver.GetRef().SetValue(RAD06_ResourceCheckAV, nResourceID as Float) ; #DEBUG_LINE_NO:30
  ResourceName.ForceRefTo(ResourceInfo[nResourceID - 1].NameReference.GetRef()) ; #DEBUG_LINE_NO:33
  Int nRandomQuantity = Utility.RandomInt(1, 3) ; #DEBUG_LINE_NO:36
  Float fActualQuantity = 0.0 ; #DEBUG_LINE_NO:37
  If nRandomQuantity == 1 ; #DEBUG_LINE_NO:38
    fActualQuantity = RAD06_Quantity_01_Low.GetValue() ; #DEBUG_LINE_NO:39
  ElseIf nRandomQuantity == 2 ; #DEBUG_LINE_NO:40
    fActualQuantity = RAD06_Quantity_02_Medium.GetValue() ; #DEBUG_LINE_NO:41
  Else ; #DEBUG_LINE_NO:
    fActualQuantity = RAD06_Quantity_03_High.GetValue() ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
  RAD06_CurrentQuantity.SetValue(fActualQuantity) ; #DEBUG_LINE_NO:47
  QuestGiver.GetRef().SetValue(RAD06_CurrentQuantityAV, fActualQuantity) ; #DEBUG_LINE_NO:48
  Float fResourceReward = ResourceInfo[nResourceID - 1].PricePerUnit as Float ; #DEBUG_LINE_NO:51
  Float fCreditReward = RAD06_CurrentQuantity.GetValue() * fResourceReward ; #DEBUG_LINE_NO:52
  RAD06_CurrentReward.SetValue(fCreditReward) ; #DEBUG_LINE_NO:53
  (PlayerShipInventory as rad06playeraliasscript).ResourceToLookFor = ResourceInfo[nResourceID - 1].ResourceObject ; #DEBUG_LINE_NO:56
  (PlayerShipInventory as rad06playeraliasscript).QuantityToLookFor = RAD06_CurrentQuantity.GetValue() as Int ; #DEBUG_LINE_NO:57
  (PlayerShipInventory as rad06playeraliasscript).RefreshFilter() ; #DEBUG_LINE_NO:58
  Self.UpdateCurrentInstanceGlobal(RAD06_CurrentQuantity) ; #DEBUG_LINE_NO:61
  Self.UpdateCurrentInstanceGlobal(RAD06_CurrentReward) ; #DEBUG_LINE_NO:62
EndFunction

Bool Function CargoHoldResourceCheck()
{ Check to see if the player has the right mats in her cargo hold right now }
  Actor aQuestGiver = QuestGiver.GetActorRef() ; #DEBUG_LINE_NO:70
  Int nResourceID = aQuestGiver.GetValue(RAD06_ResourceCheckAV) as Int ; #DEBUG_LINE_NO:71
  Int nFullQuantity = aQuestGiver.GetValue(RAD06_CurrentQuantityAV) as Int ; #DEBUG_LINE_NO:72
  Int nCurrentQuantity = PlayerShipInventory.GetRef().GetItemCount(ResourceInfo[nResourceID - 1].ResourceObject as Form) ; #DEBUG_LINE_NO:73
  If nCurrentQuantity >= nFullQuantity ; #DEBUG_LINE_NO:78
    nCurrentQuantity = nFullQuantity ; #DEBUG_LINE_NO:79
    Self.SetStage(200) ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
  aQuestGiver.SetValue(RAD06_DeliveryAmountAV, nCurrentQuantity as Float) ; #DEBUG_LINE_NO:84
  If nCurrentQuantity > 0 ; #DEBUG_LINE_NO:87
    PlayerShipInventory.GetRef().RemoveItem(ResourceInfo[nResourceID - 1].ResourceObject as Form, nCurrentQuantity, False, None) ; #DEBUG_LINE_NO:89
    Int nCreditsToReward = nCurrentQuantity * ResourceInfo[nResourceID - 1].PricePerUnit ; #DEBUG_LINE_NO:91
    Game.GetPlayer().AddItem(Credits as Form, nCreditsToReward, False) ; #DEBUG_LINE_NO:92
    Int nNewFullQuantity = nFullQuantity - nCurrentQuantity ; #DEBUG_LINE_NO:94
    aQuestGiver.SetValue(RAD06_CurrentQuantityAV, nNewFullQuantity as Float) ; #DEBUG_LINE_NO:95
    RAD06_CurrentQuantity.SetValue(nNewFullQuantity as Float) ; #DEBUG_LINE_NO:98
    If !Self.GetStageDone(200) ; #DEBUG_LINE_NO:99
      Self.UpdateCurrentInstanceGlobal(RAD06_CurrentQuantity) ; #DEBUG_LINE_NO:100
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
