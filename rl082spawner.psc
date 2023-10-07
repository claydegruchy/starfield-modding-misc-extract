ScriptName RL082Spawner Extends TerminalMenu
{ Spawns shoots clutter and loot out of conveyor opening in Zero G }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property PackageSpawnMarker Auto
movablestatic[] Property packageArray Auto Const
GlobalVariable Property RL082StorageTerminal Auto
LeveledItem[] Property LootItems Auto Const
Int Property menuItemID_01 = 1 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.HandleMenuItem(auiMenuItemID) ; #DEBUG_LINE_NO:14
EndEvent

Function HandleMenuItem(Int auiMenuItemID)
  If auiMenuItemID == menuItemID_01 ; #DEBUG_LINE_NO:18
    RL082StorageTerminal.SetValue(1.0) ; #DEBUG_LINE_NO:19
    Self.StartTimer(0.100000001, 0) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  Int I = 0 ; #DEBUG_LINE_NO:26
  While I < packageArray.Length ; #DEBUG_LINE_NO:27
    Utility.wait(Utility.RandomFloat(0.100000001, 0.150000006)) ; #DEBUG_LINE_NO:28
    ObjectReference newPackage = PackageSpawnMarker.PlaceAtMe(packageArray[I] as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:29
    newPackage.SetAngle(Utility.RandomFloat(0.0, 180.0), Utility.RandomFloat(0.0, 180.0), Utility.RandomFloat(0.0, 180.0)) ; #DEBUG_LINE_NO:30
    newPackage.ApplyHavokImpulse(-1.0, 0.0, 0.0, Utility.RandomFloat(15.0, 17.0)) ; #DEBUG_LINE_NO:31
    I += 1 ; #DEBUG_LINE_NO:32
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:36
  While I < LootItems.Length ; #DEBUG_LINE_NO:37
    Utility.wait(Utility.RandomFloat(0.100000001, 0.150000006)) ; #DEBUG_LINE_NO:38
    ObjectReference newLoot = PackageSpawnMarker.PlaceAtMe(LootItems[I] as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:39
    newLoot.SetAngle(Utility.RandomFloat(0.0, 180.0), Utility.RandomFloat(0.0, 180.0), Utility.RandomFloat(0.0, 180.0)) ; #DEBUG_LINE_NO:40
    newLoot.ApplyHavokImpulse(-1.0, 0.0, 0.0, Utility.RandomFloat(5.0, 7.0)) ; #DEBUG_LINE_NO:41
    I += 1 ; #DEBUG_LINE_NO:42
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
