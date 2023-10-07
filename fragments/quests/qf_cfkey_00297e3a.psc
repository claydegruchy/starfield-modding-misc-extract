ScriptName Fragments:Quests:QF_CFKey_00297E3A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_CF02SecurityDoors Auto Const mandatory
ActorValue Property Health Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0005_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:8
  Int count = Alias_CF02SecurityDoors.GetCount() ; #DEBUG_LINE_NO:9
  While I < count ; #DEBUG_LINE_NO:10
    Alias_CF02SecurityDoors.GetAt(I).SetOpen(False) ; #DEBUG_LINE_NO:11
    I += 1 ; #DEBUG_LINE_NO:12
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:30
  Int count = Alias_CF02SecurityDoors.GetCount() ; #DEBUG_LINE_NO:31
  While I < count ; #DEBUG_LINE_NO:32
    Alias_CF02SecurityDoors.GetAt(I).SetOpen(True) ; #DEBUG_LINE_NO:33
    I += 1 ; #DEBUG_LINE_NO:34
  EndWhile ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:37
EndFunction
