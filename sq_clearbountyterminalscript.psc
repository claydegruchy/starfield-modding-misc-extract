ScriptName SQ_ClearBountyTerminalScript Extends TerminalMenu conditional

;-- Structs -----------------------------------------
Struct CrimeFaction
  Faction theFaction
  GlobalVariable currentBounty
  Int currentBountyCost
EndStruct


;-- Variables ---------------------------------------
sq_clearbountyterminalscript:crimefaction clearBountyCrimeFaction

;-- Properties --------------------------------------
sq_clearbountyterminalscript:crimefaction[] Property CrimeFactions Auto Const
{ factions to calculate current bounty for }
ActorValue Property KioskTerminalNoSaleFlag Auto hidden
{ set to 1 if the player tries to buy something with not enough credits }
TerminalMenu Property SQ_ClearBountyTerminalMenu_Deskop Auto Const mandatory
{ the main terminal menu }
TerminalMenu Property SQ_ClearBountyTerminalMenu_Submenu Auto Const mandatory
{ the submenu for this terminal }
GlobalVariable Property SQ_ClearBountyConvenienceFee Auto Const
{ extra cost for clearing bounty via this terminal }

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If akTerminalBase == SQ_ClearBountyTerminalMenu_Deskop ; #DEBUG_LINE_NO:28
    Self.UpdateTextReplacement(akTerminalRef) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If akTerminalBase == SQ_ClearBountyTerminalMenu_Deskop && auiMenuItemID < CrimeFactions.Length ; #DEBUG_LINE_NO:36
    clearBountyCrimeFaction = CrimeFactions[auiMenuItemID] ; #DEBUG_LINE_NO:37
    If clearBountyCrimeFaction ; #DEBUG_LINE_NO:38
      akTerminalRef.AddTextReplacementData("ClearFaction", clearBountyCrimeFaction.theFaction as Form) ; #DEBUG_LINE_NO:40
      akTerminalRef.AddTextReplacementValue("ClearBounty", clearBountyCrimeFaction.currentBounty.GetValueInt() as Float) ; #DEBUG_LINE_NO:41
      akTerminalRef.AddTextReplacementValue("ClearBountyCost", clearBountyCrimeFaction.currentBountyCost as Float) ; #DEBUG_LINE_NO:42
      MiscObject credits = Game.GetCredits() ; #DEBUG_LINE_NO:44
      Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:45
      Int playerCredits = player.GetItemCount(credits as Form) ; #DEBUG_LINE_NO:46
      Int cost = clearBountyCrimeFaction.currentBountyCost ; #DEBUG_LINE_NO:47
      If playerCredits >= cost ; #DEBUG_LINE_NO:48
        akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 0.0) ; #DEBUG_LINE_NO:49
      Else ; #DEBUG_LINE_NO:
        akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 1.0) ; #DEBUG_LINE_NO:52
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akTerminalBase == SQ_ClearBountyTerminalMenu_Submenu && auiMenuItemID == 0 ; #DEBUG_LINE_NO:55
    MiscObject credits = Game.GetCredits() ; #DEBUG_LINE_NO:56
    Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:57
    Int playercredits = player.GetItemCount(credits as Form) ; #DEBUG_LINE_NO:59
    Int cost = clearBountyCrimeFaction.currentBountyCost ; #DEBUG_LINE_NO:60
    If playercredits >= cost ; #DEBUG_LINE_NO:61
      akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 0.0) ; #DEBUG_LINE_NO:63
      player.RemoveItem(credits as Form, cost, False, None) ; #DEBUG_LINE_NO:65
      clearBountyCrimeFaction.theFaction.SetCrimeGold(0) ; #DEBUG_LINE_NO:66
      clearBountyCrimeFaction.theFaction.SetCrimeGoldViolent(0) ; #DEBUG_LINE_NO:67
      clearBountyCrimeFaction.theFaction.SetPlayerEnemy(False) ; #DEBUG_LINE_NO:68
      Self.UpdateTextReplacement(akTerminalRef) ; #DEBUG_LINE_NO:71
    Else ; #DEBUG_LINE_NO:
      akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 1.0) ; #DEBUG_LINE_NO:76
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateTextReplacement(ObjectReference akTerminalRef)
  clearBountyCrimeFaction = None ; #DEBUG_LINE_NO:83
  Int I = 0 ; #DEBUG_LINE_NO:85
  While I < CrimeFactions.Length ; #DEBUG_LINE_NO:86
    sq_clearbountyterminalscript:crimefaction theCrimeFaction = CrimeFactions[I] ; #DEBUG_LINE_NO:87
    Int currentBounty = theCrimeFaction.theFaction.GetCrimeGold() ; #DEBUG_LINE_NO:88
    theCrimeFaction.currentBountyCost = Math.Round(currentBounty as Float * (1.0 + SQ_ClearBountyConvenienceFee.GetValue())) ; #DEBUG_LINE_NO:89
    theCrimeFaction.currentBounty.SetValueInt(currentBounty) ; #DEBUG_LINE_NO:92
    akTerminalRef.AddTextReplacementData("faction" + I as String, theCrimeFaction.theFaction as Form) ; #DEBUG_LINE_NO:94
    akTerminalRef.AddTextReplacementValue(("faction" + I as String) + "Bounty", currentBounty as Float) ; #DEBUG_LINE_NO:95
    I += 1 ; #DEBUG_LINE_NO:97
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
