ScriptName Fragments:Quests:QF_BF04_0001BD20 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF06Microdrive Auto Const mandatory
ReferenceAlias Property Alias_CF06Evidence Auto Const mandatory
ReferenceAlias Property Alias_CF06GenerdynePass Auto Const mandatory
GlobalVariable Property CF06Count Auto Const mandatory
ReferenceAlias Property Alias_CF06Naeva Auto Const mandatory
ObjectReference Property CF06NaevaTalkMarker Auto Const mandatory
Quest Property City_NA_Viewport02 Auto Const mandatory
ReferenceAlias Property Alias_CF06_Komiko Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0060_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:7
  Self.SetStage(20) ; #DEBUG_LINE_NO:8
  Self.SetStage(30) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:25
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:34
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:43
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:44
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:45
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:46
  Game.GetPlayer().AddItem(Alias_CF06Microdrive.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:71
  If Self.IsObjectiveDisplayed(50) == True ; #DEBUG_LINE_NO:72
    Self.SetObjectiveDisplayed(50, False, False) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(70) == True ; #DEBUG_LINE_NO:75
    Self.SetObjectiveDisplayed(70, False, False) ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
  Alias_CF06_Komiko.GetActorRef().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0080_Item_00()
  If Self.GetStageDone(110) == False ; #DEBUG_LINE_NO:86
    Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:87
    Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:97
  If Self.IsObjectiveDisplayed(60) == True ; #DEBUG_LINE_NO:98
    Self.SetObjectiveDisplayed(60, False, False) ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.IsObjectiveDisplayed(50) == True ; #DEBUG_LINE_NO:109
    Self.SetObjectiveDisplayed(50, False, False) ; #DEBUG_LINE_NO:110
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(60) == True ; #DEBUG_LINE_NO:112
    Self.SetObjectiveDisplayed(60, False, False) ; #DEBUG_LINE_NO:113
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(70) == True ; #DEBUG_LINE_NO:115
    Self.SetObjectiveDisplayed(70, False, False) ; #DEBUG_LINE_NO:116
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:126
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:135
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:144
  Game.GetPlayer().RemoveItem(Alias_CF06Microdrive.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:145
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:153
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:154
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:162
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:163
  Alias_CF06Naeva.GetActorRef().Moveto(CF06NaevaTalkMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:164
  Alias_CF06Naeva.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:165
  If City_NA_Viewport02.IsRunning() ; #DEBUG_LINE_NO:168
    City_NA_Viewport02.SetStage(22) ; #DEBUG_LINE_NO:169
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:178
  Self.Stop() ; #DEBUG_LINE_NO:179
EndFunction
