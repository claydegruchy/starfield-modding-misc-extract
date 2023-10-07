ScriptName FFCydoniaR03QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property BookAlias Auto
ReferenceAlias Property BookMarker Auto Const mandatory
ReferenceAlias Property Vendor Auto Const mandatory
GlobalVariable Property FFCydoniaR03_BookNumber Auto Const mandatory
FormList Property FFCydoniaR03_BookList Auto Const mandatory

;-- Functions ---------------------------------------

Function RemoveBook()
  ObjectReference myBook = BookAlias.GetRef() ; #DEBUG_LINE_NO:11
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:12
  If myPlayer.GetItemCount(myBook as Form) >= 1 ; #DEBUG_LINE_NO:13
    myPlayer.RemoveItem(myBook as Form, 1, False, None) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function BookReward()
  Game.GetPlayer().AddItem(FFCydoniaR03_BookList.GetAt(FFCydoniaR03_BookNumber.GetValue() as Int - 1), 1, False) ; #DEBUG_LINE_NO:21
EndFunction

Event OnQuestInit()
  Int iBookNumberValue = FFCydoniaR03_BookNumber.GetValue() as Int ; #DEBUG_LINE_NO:28
  Form myBook = FFCydoniaR03_BookList.GetAt(iBookNumberValue - 1) ; #DEBUG_LINE_NO:29
  ObjectReference myBookRef = BookMarker.GetRef().PlaceAtMe(myBook, 1, False, False, True, None, BookAlias as Alias, True) ; #DEBUG_LINE_NO:30
  Vendor.GetRef().AddItem(myBookRef as Form, 1, False) ; #DEBUG_LINE_NO:31
EndEvent
