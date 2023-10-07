ScriptName FFCydoniaR02QuestScript Extends Quest

;-- Variables ---------------------------------------
Form myItem

;-- Properties --------------------------------------
FormList Property FFCydoniaR02_CrimsonFleetItemList Auto Const mandatory
FormList Property FFCydoniaR02_EclipticItemList Auto Const mandatory
FormList Property FFCydoniaR02_HouseVaruunItemList Auto Const mandatory
FormList Property FFCydoniaR02_SpacersItemList Auto Const mandatory
FormList Property FFCydoniaR02_SyndicateItemList Auto Const mandatory
GlobalVariable Property FFCydoniaR02_EquipmentNeededCount Auto Const mandatory
GlobalVariable Property FFCydoniaR02_ItemsAcquired Auto Const mandatory
Keyword Property LocEncCrimsonFleet Auto Const mandatory
Keyword Property LocEncEcliptic Auto Const mandatory
Keyword Property LocEncHouseVaruun Auto Const mandatory
Keyword Property LocEncSpacers Auto Const mandatory
Keyword Property LocEncSyndicate Auto Const mandatory
LocationAlias Property Base Auto Const mandatory
ReferenceAlias Property BossContainer Auto Const mandatory
ReferenceAlias Property Denis Auto Const mandatory
ReferenceAlias Property Item Auto Const mandatory

;-- Functions ---------------------------------------

Function CheckItems()
  If myItem != None ; #DEBUG_LINE_NO:25
    Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:26
    Int iCount = FFCydoniaR02_EquipmentNeededCount.GetValue() as Int ; #DEBUG_LINE_NO:27
    If myPlayer.GetItemCount(myItem) >= iCount ; #DEBUG_LINE_NO:28
      FFCydoniaR02_ItemsAcquired.SetValue(1.0) ; #DEBUG_LINE_NO:29
      myPlayer.RemoveItem(myItem, iCount, False, Denis.GetRef()) ; #DEBUG_LINE_NO:30
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  Location myLoc = Base.GetLocation() ; #DEBUG_LINE_NO:39
  FFCydoniaR02_ItemsAcquired.SetValue(0.0) ; #DEBUG_LINE_NO:40
  Int iItemsNeeded = FFCydoniaR02_EquipmentNeededCount.GetValue() as Int ; #DEBUG_LINE_NO:41
  Int I = 0 ; #DEBUG_LINE_NO:42
  If myLoc != None ; #DEBUG_LINE_NO:44
    If myLoc.HasKeyword(LocEncCrimsonFleet) ; #DEBUG_LINE_NO:45
      I = Utility.RandomInt(0, FFCydoniaR02_CrimsonFleetItemList.GetSize() - 1) ; #DEBUG_LINE_NO:46
      myItem = FFCydoniaR02_CrimsonFleetItemList.GetAt(I) ; #DEBUG_LINE_NO:47
    ElseIf myLoc.HasKeyword(LocEncEcliptic) ; #DEBUG_LINE_NO:49
      I = Utility.RandomInt(0, FFCydoniaR02_EclipticItemList.GetSize() - 1) ; #DEBUG_LINE_NO:50
      myItem = FFCydoniaR02_EclipticItemList.GetAt(I) ; #DEBUG_LINE_NO:51
    ElseIf myLoc.HasKeyword(LocEncHouseVaruun) ; #DEBUG_LINE_NO:53
      I = Utility.RandomInt(0, FFCydoniaR02_HouseVaruunItemList.GetSize() - 1) ; #DEBUG_LINE_NO:54
      myItem = FFCydoniaR02_HouseVaruunItemList.GetAt(I) ; #DEBUG_LINE_NO:55
    ElseIf myLoc.HasKeyword(LocEncSyndicate) ; #DEBUG_LINE_NO:57
      I = Utility.RandomInt(0, FFCydoniaR02_SyndicateItemList.GetSize() - 1) ; #DEBUG_LINE_NO:58
      myItem = FFCydoniaR02_SyndicateItemList.GetAt(I) ; #DEBUG_LINE_NO:59
    ElseIf myLoc.HasKeyword(LocEncSpacers) ; #DEBUG_LINE_NO:61
      I = Utility.RandomInt(0, FFCydoniaR02_SpacersItemList.GetSize() - 1) ; #DEBUG_LINE_NO:62
      myItem = FFCydoniaR02_SpacersItemList.GetAt(I) ; #DEBUG_LINE_NO:63
    EndIf ; #DEBUG_LINE_NO:
    If myItem != None ; #DEBUG_LINE_NO:67
      ObjectReference myBossContainer = BossContainer.GetRef() ; #DEBUG_LINE_NO:68
      myBossContainer.AddItem(myItem, iItemsNeeded - 1, False) ; #DEBUG_LINE_NO:69
      myBossContainer.AddAliasedItem(myItem, Item as Alias, 1, True) ; #DEBUG_LINE_NO:70
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
