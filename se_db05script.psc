ScriptName SE_DB05Script Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
FormList Property ManufacturedItems_All Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_ItemNeeded Auto Const mandatory
Float Property hasManufacturedItem = 0.0 Auto conditional hidden
GlobalVariable Property SE_Player_DB05_ItemValueGlobal Auto mandatory
Form Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.PopulateNeededItem() ; #DEBUG_LINE_NO:17
EndEvent

Form Function CheckInventory()
  Form[] PlayersManufacturedItems = new Form[0] ; #DEBUG_LINE_NO:24
  Int I = 0 ; #DEBUG_LINE_NO:25
  Int formListSize = ManufacturedItems_All.GetSize() ; #DEBUG_LINE_NO:26
  While I < formListSize ; #DEBUG_LINE_NO:29
    If Game.GetPlayer().GetItemCount(ManufacturedItems_All.GetAt(I)) > 0 ; #DEBUG_LINE_NO:30
      PlayersManufacturedItems.add(ManufacturedItems_All.GetAt(I), 1) ; #DEBUG_LINE_NO:31
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:33
  EndWhile ; #DEBUG_LINE_NO:
  Int currentAmount = Game.GetPlayer().GetItemCount(PlayersManufacturedItems[0]) ; #DEBUG_LINE_NO:36
  Form currentItem = PlayersManufacturedItems[0] ; #DEBUG_LINE_NO:38
  Int j = 1 ; #DEBUG_LINE_NO:40
  While j < PlayersManufacturedItems.Length ; #DEBUG_LINE_NO:41
    If Game.GetPlayer().GetItemCount(PlayersManufacturedItems[j]) < currentAmount ; #DEBUG_LINE_NO:43
      currentAmount = Game.GetPlayer().GetItemCount(PlayersManufacturedItems[j]) ; #DEBUG_LINE_NO:44
      currentItem = PlayersManufacturedItems[j] ; #DEBUG_LINE_NO:45
    EndIf ; #DEBUG_LINE_NO:
    j += 1 ; #DEBUG_LINE_NO:47
  EndWhile ; #DEBUG_LINE_NO:
  Return currentItem ; #DEBUG_LINE_NO:51
EndFunction

Function PopulateNeededItem()
  Form manufacturedItem = Self.CheckInventory() ; #DEBUG_LINE_NO:56
  If manufacturedItem ; #DEBUG_LINE_NO:58
    hasManufacturedItem = 1.0 ; #DEBUG_LINE_NO:59
  Else ; #DEBUG_LINE_NO:
    manufacturedItem = (ManufacturedItems_All.GetAt(Utility.RandomInt(0, ManufacturedItems_All.GetSize() - 1)) as ObjectReference) as Form ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
  Alias_HailingShip.GetShipRef().AddAliasedItem(manufacturedItem, Alias_ItemNeeded as Alias, 1, True) ; #DEBUG_LINE_NO:66
  SE_Player_DB05_ItemValueGlobal.SetValueInt(manufacturedItem.GetGoldValue() * 2) ; #DEBUG_LINE_NO:68
  Alias_HailingShip.GetShipRef().AddItem(Credits, SE_Player_DB05_ItemValueGlobal.GetValueInt() * 2, False) ; #DEBUG_LINE_NO:71
EndFunction

Function GiveItem()
  If Game.GetPlayer().GetItemCount(Alias_ItemNeeded.GetRef() as Form) > 0 && Alias_HailingShip.GetShipRef().GetItemCount(Credits) >= SE_Player_DB05_ItemValueGlobal.GetValueInt() * 2 ; #DEBUG_LINE_NO:76
    Game.GetPlayer().RemoveItem(Alias_ItemNeeded.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:78
    Alias_HailingShip.GetShipRef().AddItem(Alias_ItemNeeded.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:79
    Game.GetPlayer().AddItem(Credits, SE_Player_DB05_ItemValueGlobal.GetValueInt() * 2, False) ; #DEBUG_LINE_NO:81
    Alias_HailingShip.GetShipRef().RemoveItem(Credits, SE_Player_DB05_ItemValueGlobal.GetValueInt() * 2, False, None) ; #DEBUG_LINE_NO:82
  EndIf ; #DEBUG_LINE_NO:
EndFunction
