ScriptName VendorEnhanceScript Extends TopicInfo Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property EnhancePrice Auto Const mandatory
GlobalVariable Property PD_EnhanceSpecialVouchers Auto Const mandatory
Quest Property DialogueParadiso Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If PD_EnhanceSpecialVouchers.GetValue() < 1.0 || Self.GetOwningQuest() != DialogueParadiso ; #DEBUG_LINE_NO:13
    Game.GetPlayer().RemoveItem(Credits as Form, EnhancePrice.GetValueInt(), False, None) ; #DEBUG_LINE_NO:14
  ElseIf PD_EnhanceSpecialVouchers.GetValue() >= 2.0 ; #DEBUG_LINE_NO:17
    PD_EnhanceSpecialVouchers.SetValue(1.0) ; #DEBUG_LINE_NO:18
  ElseIf PD_EnhanceSpecialVouchers.GetValue() == 1.0 ; #DEBUG_LINE_NO:19
    PD_EnhanceSpecialVouchers.SetValue(0.0) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.200000003) ; #DEBUG_LINE_NO:27
  Game.ShowRaceMenu(None, 2, None, None, None) ; #DEBUG_LINE_NO:28
  Self.RegisterForMenuOpenCloseEvent("ChargenMenu") ; #DEBUG_LINE_NO:29
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "ChargenMenu" ; #DEBUG_LINE_NO:33
    If abOpening == False ; #DEBUG_LINE_NO:34
      Self.UnRegisterForMenuOpenCloseEvent("ChargenMenu") ; #DEBUG_LINE_NO:35
      Game.FadeOutGame(False, True, 0.0, 0.100000001, False) ; #DEBUG_LINE_NO:36
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
