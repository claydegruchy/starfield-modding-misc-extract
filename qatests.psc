ScriptName QATests Extends Quest

;-- Variables ---------------------------------------
String sDisableVanity = "setIni \"bDisableAutoVanityMode:camera\" 1" Const
String sScreenshot = "Screenshot" Const

;-- Functions ---------------------------------------

Function TestEquip(Actor ActorToEquip, FormList FormlistToTest, Float PauseDuration, Bool RemoveAllFirst, Bool TakeScreenshot)
  If RemoveAllFirst ; #DEBUG_LINE_NO:10
    ActorToEquip.RemoveAllItems(None, False, False) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
  If TakeScreenshot ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:18
  Int iMax = FormlistToTest.GetSize() ; #DEBUG_LINE_NO:19
  While I < iMax ; #DEBUG_LINE_NO:20
    Form currentForm = FormlistToTest.GetAt(I) ; #DEBUG_LINE_NO:21
    ActorToEquip.EquipItem(currentForm, False, True) ; #DEBUG_LINE_NO:23
    If TakeScreenshot ; #DEBUG_LINE_NO:
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Utility.Wait(PauseDuration) ; #DEBUG_LINE_NO:29
    I += 1 ; #DEBUG_LINE_NO:31
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
