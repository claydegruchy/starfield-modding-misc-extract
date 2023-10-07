ScriptName TestKurtRemoveArmorScript Extends Actor Const
{ test removing armor when armor is looted }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
FormList Property TestKurtArmorKeywords Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.AddInventoryEventFilter(TestKurtArmorKeywords as Form) ; #DEBUG_LINE_NO:7
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  Keyword keywordToRemove = Self.GetArmorKeyword(akBaseItem) ; #DEBUG_LINE_NO:12
  If keywordToRemove ; #DEBUG_LINE_NO:14
    Self.RemoveItem(keywordToRemove as Form, 1, False, None) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Keyword Function GetArmorKeyword(Form akBaseItem)
  If akBaseItem.HasKeywordInFormList(TestKurtArmorKeywords) ; #DEBUG_LINE_NO:20
    Int I = 0 ; #DEBUG_LINE_NO:21
    While I < TestKurtArmorKeywords.GetSize() ; #DEBUG_LINE_NO:22
      Keyword theKeyword = TestKurtArmorKeywords.GetAt(I) as Keyword ; #DEBUG_LINE_NO:23
      If theKeyword ; #DEBUG_LINE_NO:24
        If akBaseItem.HasKeyword(theKeyword) ; #DEBUG_LINE_NO:25
          Return theKeyword ; #DEBUG_LINE_NO:26
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:29
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return None ; #DEBUG_LINE_NO:32
EndFunction
