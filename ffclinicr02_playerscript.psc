ScriptName FFClinicR02_PlayerScript Extends ReferenceAlias conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group StagesAndIndices
  Int Property ResourceSearchStage = 10 Auto Const
  { Once this stage is set, start tracking the player's collection of the Resource }
  Int Property ResourceObjIndex = 10 Auto Const
  { Objective index we need to update each time the player collects the Resource }
EndGroup

Group Globals
  GlobalVariable Property FFClinicR02ItemCount Auto Const mandatory
  { Global var used to track how many Resources the player has collected }
  GlobalVariable Property FFClinicR02ItemTotal Auto Const mandatory
  { Global var used to know how many of the Resource we want the player to collect }
  GlobalVariable Property FFClinicR02ResourceNumber Auto Const mandatory
  { Global var used to know how which Resource we want the player to collect }
EndGroup

Group Objects
  resource Property ResOrgCommonToxin Auto Const mandatory
  { Toxin Resource object }
  resource Property ResOrgCommonSealant Auto Const mandatory
  { Sealant Resource object }
  resource Property ResOrgUncommonMembrane Auto Const mandatory
  { Membrane Resource object }
  resource Property ResOrgUncommonAntibiotic Auto Const mandatory
  { Antibiotic Resource object }
  resource Property ResOrgRareAnalgesic Auto Const mandatory
  { Analgesic Resource object }
  resource Property ResOrgRareSedative Auto Const mandatory
  { Sedative Resource object }
  resource Property ResOrgExoticNarcotic Auto Const mandatory
  { Narcotic Resource object }
  resource Property ResOrgExoticBiosuppressant Auto Const mandatory
  { Biosuppressant Resource object }
  Form Property ResourceItemFilter Auto
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:58
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == ResourceSearchStage ; #DEBUG_LINE_NO:62
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:64
    Self.RegisterPlayerForResourcePickup() ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RegisterPlayerForResourcePickup()
  If FFClinicR02ResourceNumber.GetValueInt() == 1 ; #DEBUG_LINE_NO:71
    ResourceItemFilter = ResOrgCommonToxin as Form ; #DEBUG_LINE_NO:72
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 2 ; #DEBUG_LINE_NO:73
    ResourceItemFilter = ResOrgCommonSealant as Form ; #DEBUG_LINE_NO:74
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 3 ; #DEBUG_LINE_NO:75
    ResourceItemFilter = ResOrgUncommonMembrane as Form ; #DEBUG_LINE_NO:76
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 4 ; #DEBUG_LINE_NO:77
    ResourceItemFilter = ResOrgUncommonAntibiotic as Form ; #DEBUG_LINE_NO:78
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 5 ; #DEBUG_LINE_NO:79
    ResourceItemFilter = ResOrgRareAnalgesic as Form ; #DEBUG_LINE_NO:80
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 6 ; #DEBUG_LINE_NO:81
    ResourceItemFilter = ResOrgRareSedative as Form ; #DEBUG_LINE_NO:82
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 7 ; #DEBUG_LINE_NO:83
    ResourceItemFilter = ResOrgExoticNarcotic as Form ; #DEBUG_LINE_NO:84
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 8 ; #DEBUG_LINE_NO:85
    ResourceItemFilter = ResOrgExoticBiosuppressant as Form ; #DEBUG_LINE_NO:86
  EndIf ; #DEBUG_LINE_NO:
  Self.AddInventoryEventFilter(ResourceItemFilter) ; #DEBUG_LINE_NO:88
  Utility.wait(3.0) ; #DEBUG_LINE_NO:91
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:92
  myQuest.ModObjectiveGlobal(Game.GetPlayer().GetItemCount(ResourceItemFilter) as Float, FFClinicR02ItemCount, ResourceObjIndex, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:93
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:98
  myQuest.ModObjectiveGlobal(aiItemCount as Float, FFClinicR02ItemCount, ResourceObjIndex, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:99
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  FFClinicR02ItemCount.SetValueInt(Game.GetPlayer().GetItemCount(ResourceItemFilter)) ; #DEBUG_LINE_NO:106
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:107
  myQuest.ModObjectiveGlobal(0.0, FFClinicR02ItemCount, ResourceObjIndex, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:108
EndEvent
