ScriptName KioskTerminalVendorScript Extends TerminalMenu
{ script for terminals that act as vending machines }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Form[] Property ItemsForSale Auto Const
{ array of items for sale at this vending machine }
ActorValue Property KioskTerminalItemCount Auto Const mandatory
{ set when initialized, for conditioning menu items }
ActorValue Property KioskTerminalInitialized Auto Const mandatory
{ set to 1 when initialized }
ActorValue Property KioskTerminalNoSaleFlag Auto Const mandatory
{ set to 1 if the player tries to buy something with not enough credits }
TerminalMenu Property KioskTerminalMenu Auto Const mandatory
{ the main terminal menu for this kiosk }

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If akTerminalRef.GetValue(KioskTerminalInitialized) == 0.0 ; #DEBUG_LINE_NO:22
    akTerminalRef.SetValue(KioskTerminalInitialized, 1.0) ; #DEBUG_LINE_NO:23
    Int I = 0 ; #DEBUG_LINE_NO:24
    While I < ItemsForSale.Length ; #DEBUG_LINE_NO:25
      Form theItem = ItemsForSale[I] ; #DEBUG_LINE_NO:26
      akTerminalRef.AddTextReplacementData("MiscItem" + I as String, theItem) ; #DEBUG_LINE_NO:27
      Int itemValue = theItem.GetGoldValue() ; #DEBUG_LINE_NO:28
      akTerminalRef.AddTextReplacementValue(("MiscItem" + I as String) + "value", itemValue as Float) ; #DEBUG_LINE_NO:29
      I += 1 ; #DEBUG_LINE_NO:31
    EndWhile ; #DEBUG_LINE_NO:
    akTerminalRef.SetValue(KioskTerminalItemCount, I as Float) ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If akTerminalBase == KioskTerminalMenu ; #DEBUG_LINE_NO:39
    Form theItem = ItemsForSale[auiMenuItemID] ; #DEBUG_LINE_NO:40
    If theItem ; #DEBUG_LINE_NO:41
      akTerminalRef.AddTextReplacementData("SaleItem", theItem) ; #DEBUG_LINE_NO:42
      MiscObject credits = Game.GetCredits() ; #DEBUG_LINE_NO:44
      Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:45
      Int playerCredits = player.GetItemCount(credits as Form) ; #DEBUG_LINE_NO:46
      Int cost = theItem.GetGoldValue() ; #DEBUG_LINE_NO:47
      If playerCredits >= cost ; #DEBUG_LINE_NO:48
        akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 0.0) ; #DEBUG_LINE_NO:49
        player.RemoveItem(credits as Form, cost, False, None) ; #DEBUG_LINE_NO:51
        player.Additem(theItem, 1, False) ; #DEBUG_LINE_NO:52
      Else ; #DEBUG_LINE_NO:
        akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 1.0) ; #DEBUG_LINE_NO:55
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
