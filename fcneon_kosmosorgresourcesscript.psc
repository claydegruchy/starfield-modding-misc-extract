ScriptName FCNeon_KosmosOrgResourcesScript Extends Quest

;-- Structs -----------------------------------------
Struct ResourceGlobalMap
  resource theResource
  { The resource. }
  GlobalVariable theResourceCountGlobal
  { The Global Variable that tracks the count of this resource. }
  Int maxToSell
  { The maximum number of this Resource to sell at any given time. }
  GlobalVariable resourceSellPriceGlobal
  { The Global Variable that stores the amount to sell this Resource for (per unit). }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group required
  fcneon_kosmosorgresourcesscript:resourceglobalmap[] Property ResourcesAndGlobals Auto Const mandatory
  { An array of Resources and their mapped Global Variables that track the count of each of the Resources that Kosmos will buy. }
  GlobalVariable Property FCNeon_Kosmos_NextTurnInGameTime Auto Const mandatory
  { A variable that tracks the next allowed turn-in time for this quest. }
  Float Property TurnInDuration = 0.699999988 Auto Const
  { The duration (in UT game days) between allowed turn-ins of this quest. }
EndGroup

Int Property RESOURCETYPE_BIOSUPPRESSANT = 0 AutoReadOnly
Int Property RESOURCETYPE_HYPERCATALYST = 1 AutoReadOnly
Int Property RESOURCETYPE_LUBRICANT = 2 AutoReadOnly
Int Property RESOURCETYPE_STIMULANT = 3 AutoReadOnly
Int Property RESOURCETYPE_POLYMER = 4 AutoReadOnly
Int Property RESOURCETYPE_SOLVENT = 5 AutoReadOnly
Int Property RESOURCETYPE_GASTRONOMIC = 6 AutoReadOnly

;-- Functions ---------------------------------------

Function UpdatePlayerResourceCounts()
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:40
  Int I = 0 ; #DEBUG_LINE_NO:42
  While I < ResourcesAndGlobals.Length ; #DEBUG_LINE_NO:43
    fcneon_kosmosorgresourcesscript:resourceglobalmap rgMap = ResourcesAndGlobals[I] ; #DEBUG_LINE_NO:44
    rgMap.theResourceCountGlobal.SetValueInt(playerRef.GetComponentCount(rgMap.theResource as Form)) ; #DEBUG_LINE_NO:45
    Self.UpdateCurrentInstanceGlobal(rgMap.theResourceCountGlobal) ; #DEBUG_LINE_NO:46
    I += 1 ; #DEBUG_LINE_NO:47
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SellResource(Int aiResourceIndex)
  If aiResourceIndex < 0 ; #DEBUG_LINE_NO:53
    Return  ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:58
  fcneon_kosmosorgresourcesscript:resourceglobalmap rgMap = ResourcesAndGlobals[aiResourceIndex] ; #DEBUG_LINE_NO:59
  Int resourceCount = playerRef.GetComponentCount(rgMap.theResource as Form) ; #DEBUG_LINE_NO:63
  If resourceCount <= 0 ; #DEBUG_LINE_NO:64
    Return  ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
  Int countToSell = 0 ; #DEBUG_LINE_NO:70
  If resourceCount > rgMap.maxToSell ; #DEBUG_LINE_NO:71
    countToSell = rgMap.maxToSell ; #DEBUG_LINE_NO:72
  Else ; #DEBUG_LINE_NO:
    countToSell = resourceCount ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
  playerRef.RemoveItemByComponent(rgMap.theResource as Form, countToSell, False, None) ; #DEBUG_LINE_NO:78
  playerRef.AddItem(Game.GetCredits() as Form, rgMap.resourceSellPriceGlobal.GetValueInt() * countToSell, False) ; #DEBUG_LINE_NO:79
  FCNeon_Kosmos_NextTurnInGameTime.SetValue(Utility.GetCurrentGameTime() + TurnInDuration) ; #DEBUG_LINE_NO:82
EndFunction
