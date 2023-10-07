ScriptName DialogueCydoniaQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property DialogueCydonia_HorusAid_CooldownTime Auto Const mandatory
LeveledItem Property LL_CY_HorusGift Auto Const mandatory
Float Property CooldownTimerDays = 7.0 Auto Const
RefCollectionAlias Property AllMiners Auto Const mandatory
Weapon Property Cutter Auto Const mandatory

;-- Functions ---------------------------------------

Function HorusAid()
  Game.GetPlayer().AddItem(LL_CY_HorusGift as Form, 1, False) ; #DEBUG_LINE_NO:10
  Self.SetCooldown() ; #DEBUG_LINE_NO:11
EndFunction

Function SetCooldown()
  Float fDayLength = Game.GetPlayer().GetCurrentPlanet().GetDayLength() ; #DEBUG_LINE_NO:17
  DialogueCydonia_HorusAid_CooldownTime.SetValue(Utility.GetCurrentGameTime() + fDayLength * CooldownTimerDays) ; #DEBUG_LINE_NO:18
EndFunction

Function SwapCutters()
  Bool bCutterEquipped = False ; #DEBUG_LINE_NO:25
  Int I = 0 ; #DEBUG_LINE_NO:26
  Int iCount = AllMiners.GetCount() ; #DEBUG_LINE_NO:27
  While I < iCount ; #DEBUG_LINE_NO:28
    Actor myMiner = AllMiners.GetAt(I) as Actor ; #DEBUG_LINE_NO:29
    If myMiner.GetItemCount(Cutter as Form) > 0 && myMiner.IsDead() == False ; #DEBUG_LINE_NO:30
      If myMiner.IsEquipped(Cutter as Form) ; #DEBUG_LINE_NO:31
        bCutterEquipped = True ; #DEBUG_LINE_NO:32
      Else ; #DEBUG_LINE_NO:
        bCutterEquipped = False ; #DEBUG_LINE_NO:34
      EndIf ; #DEBUG_LINE_NO:
      myMiner.RemoveItem(Cutter as Form, 1, False, None) ; #DEBUG_LINE_NO:36
      myMiner.AddItem(Cutter as Form, 1, False) ; #DEBUG_LINE_NO:37
      If bCutterEquipped == True ; #DEBUG_LINE_NO:38
        myMiner.EquipItem(Cutter as Form, False, False) ; #DEBUG_LINE_NO:39
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:42
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
