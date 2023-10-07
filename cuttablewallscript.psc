ScriptName CuttableWallScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
{ Link to the Bolts, a LinkRefChain }
Keyword Property LinkCustom02 Auto Const mandatory
{ Link to the panel }
wwiseevent Property DRS_Cuttable_IndIntRmSmWallMid_PlugA03_PlugCut Auto Const mandatory

;-- Functions ---------------------------------------

Event ObjectReference.OnDestroyed(ObjectReference akSender, ObjectReference akDestroyer)
  DRS_Cuttable_IndIntRmSmWallMid_PlugA03_PlugCut.Play(akSender, None, None) ; #DEBUG_LINE_NO:18
  ObjectReference[] Bolts = Self.GetLinkedRefChain(LinkCustom01, 100) ; #DEBUG_LINE_NO:20
  Bool allBoltsDestroyed = True ; #DEBUG_LINE_NO:21
  Int index = 0 ; #DEBUG_LINE_NO:22
  While index < Bolts.Length ; #DEBUG_LINE_NO:23
    If !Bolts[index].isDestroyed() ; #DEBUG_LINE_NO:24
      allBoltsDestroyed = False ; #DEBUG_LINE_NO:25
    EndIf ; #DEBUG_LINE_NO:
    index += 1 ; #DEBUG_LINE_NO:27
  EndWhile ; #DEBUG_LINE_NO:
  If allBoltsDestroyed ; #DEBUG_LINE_NO:30
    Self.ReleasePanel() ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ReleasePanel()
  Self.GetLinkedRef(LinkCustom02).SetOpen(True) ; #DEBUG_LINE_NO:37
EndFunction

Function IntializeCuttableWall()
  ObjectReference[] Bolts = Self.GetLinkedRefChain(LinkCustom01, 100) ; #DEBUG_LINE_NO:41
  Int index = 0 ; #DEBUG_LINE_NO:42
  While index < Bolts.Length ; #DEBUG_LINE_NO:43
    Bolts[index].ClearDestruction() ; #DEBUG_LINE_NO:44
    Self.RegisterForRemoteEvent(Bolts[index] as ScriptObject, "OnDestroyed") ; #DEBUG_LINE_NO:45
    index += 1 ; #DEBUG_LINE_NO:46
  EndWhile ; #DEBUG_LINE_NO:
  Self.GetLinkedRef(LinkCustom02).SetOpen(False) ; #DEBUG_LINE_NO:48
  Self.GoToState("Done") ; #DEBUG_LINE_NO:49
EndFunction

Event OnReset()
  Self.GoToState("Initial") ; #DEBUG_LINE_NO:55
  If Game.GetPlayer().GetParentCell() == Self.GetParentCell() ; #DEBUG_LINE_NO:56
    Self.IntializeCuttableWall() ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
EndEvent

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnCellLoad()
    Self.IntializeCuttableWall() ; #DEBUG_LINE_NO:12
  EndEvent
EndState
