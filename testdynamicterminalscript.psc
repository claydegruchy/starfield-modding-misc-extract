ScriptName TestDynamicTerminalScript Extends TerminalMenu

;-- Variables ---------------------------------------
Int maxEntriesCurrent01 = 6
Int maxEntriesCurrent02 = 6
Int maxEntriesInit = 6
Int maxIndex = 4
Int minEntries = 2
Int minIndex = 1
ObjectReference myTerminalRef
Int startingItemID = 0

;-- Properties --------------------------------------
TerminalMenu Property TestDynamicTerminalMenu Auto Const
TerminalMenu Property TestDynamicTerminalMenu02 Auto Const
TerminalMenu Property TestKurtDynamicTerminalItem Auto Const
TerminalMenu Property TestKurtDynamicTerminalItem02 Auto Const
TerminalMenu Property TestDeskop Auto Const
GlobalVariable[] Property TextReplacementGlobals Auto Const
Form Property TextReplacementForm Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  akTerminalRef.AddTextReplacementData("MiscItem01", TextReplacementForm) ; #DEBUG_LINE_NO:37
  Int itemValue = TextReplacementForm.GetGoldValue() ; #DEBUG_LINE_NO:38
  akTerminalRef.AddTextReplacementValue("MiscItem01Value", itemValue as Float) ; #DEBUG_LINE_NO:39
EndEvent

Function InitEntries(TerminalMenu terminalToInit, Bool decrementEntries)
  terminalToInit.ClearDynamicMenuItems(myTerminalRef) ; #DEBUG_LINE_NO:44
  Int maxEntriesCurrent = maxEntriesInit ; #DEBUG_LINE_NO:46
  If decrementEntries ; #DEBUG_LINE_NO:48
    If TestDynamicTerminalMenu ; #DEBUG_LINE_NO:49
      maxEntriesCurrent01 += -1 ; #DEBUG_LINE_NO:50
      maxEntriesCurrent = maxEntriesCurrent01 ; #DEBUG_LINE_NO:51
    Else ; #DEBUG_LINE_NO:
      maxEntriesCurrent02 += -1 ; #DEBUG_LINE_NO:53
      maxEntriesCurrent = maxEntriesCurrent02 ; #DEBUG_LINE_NO:54
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    maxEntriesCurrent = Utility.RandomInt(minEntries, maxEntriesInit) ; #DEBUG_LINE_NO:57
    If TestDynamicTerminalMenu ; #DEBUG_LINE_NO:58
      maxEntriesCurrent01 = maxEntriesCurrent ; #DEBUG_LINE_NO:59
    Else ; #DEBUG_LINE_NO:
      maxEntriesCurrent02 = maxEntriesCurrent ; #DEBUG_LINE_NO:61
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  maxEntriesCurrent = Math.Max(minEntries as Float, maxEntriesCurrent as Float) as Int ; #DEBUG_LINE_NO:65
  Int I = 0 ; #DEBUG_LINE_NO:69
  While I < maxEntriesCurrent ; #DEBUG_LINE_NO:70
    Int index = Utility.RandomInt(minIndex, maxIndex) ; #DEBUG_LINE_NO:72
    Int itemID = I + startingItemID ; #DEBUG_LINE_NO:73
    TextReplacementGlobals[0].SetValue(itemID as Float) ; #DEBUG_LINE_NO:75
    terminalToInit.AddDynamicMenuItem(myTerminalRef, index, itemID, TextReplacementGlobals as Form[]) ; #DEBUG_LINE_NO:76
    I += 1 ; #DEBUG_LINE_NO:77
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  myTerminalRef = akTerminalRef ; #DEBUG_LINE_NO:83
  akTerminalRef.AddTextReplacementData("TerminalMenu", TestDynamicTerminalMenu02 as Form) ; #DEBUG_LINE_NO:85
  If akTerminalBase == TestDeskop && auiMenuItemID == 0 ; #DEBUG_LINE_NO:86
    Self.InitEntries(TestDynamicTerminalMenu, False) ; #DEBUG_LINE_NO:87
  ElseIf akTerminalBase == TestDeskop && auiMenuItemID == 3 ; #DEBUG_LINE_NO:88
    Self.InitEntries(TestDynamicTerminalMenu02, False) ; #DEBUG_LINE_NO:89
  ElseIf akTerminalBase == TestKurtDynamicTerminalItem && auiMenuItemID == 1 ; #DEBUG_LINE_NO:90
    Self.InitEntries(TestDynamicTerminalMenu, True) ; #DEBUG_LINE_NO:91
  ElseIf akTerminalBase == TestKurtDynamicTerminalItem02 && auiMenuItemID == 1 ; #DEBUG_LINE_NO:92
    Self.InitEntries(TestDynamicTerminalMenu02, True) ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
EndEvent
