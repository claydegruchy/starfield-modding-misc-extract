ScriptName Fragments:Quests:QF_OE_MP_AcelesVsTerrormorph_000478A1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Terrormorph_Main Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph_Alt Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph_Add Auto Const mandatory
GlobalVariable Property OEDebug Auto Const mandatory
ReferenceAlias Property Alias_Furniture_Ambush_Terrormorph Auto Const mandatory
ReferenceAlias Property Alias_Furniture_Ambush_Terrormorph_Add Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  If OEDebug.GetValue() == 0.0 ; #DEBUG_LINE_NO:7
    Self.SetStage(5) ; #DEBUG_LINE_NO:8
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(1) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0005_Item_00()
  If Utility.RandomInt(1, 3) == 1 ; #DEBUG_LINE_NO:20
    Self.SetStage(10) ; #DEBUG_LINE_NO:21
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(20) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
  If Utility.RandomInt(1, 4) == 1 ; #DEBUG_LINE_NO:27
    Self.SetStage(30) ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0010_Item_00()
  ObjectReference AmbushFurniture = Alias_Furniture_Ambush_Terrormorph.GetRef() ; #DEBUG_LINE_NO:37
  ObjectReference Terrormorph = Alias_Terrormorph_Main.GetRef() ; #DEBUG_LINE_NO:38
  If Terrormorph as Bool && AmbushFurniture as Bool ; #DEBUG_LINE_NO:40
    Terrormorph.Enable(False) ; #DEBUG_LINE_NO:41
    Terrormorph.MoveTo(AmbushFurniture, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  ObjectReference AmbushFurniture = Alias_Furniture_Ambush_Terrormorph.GetRef() ; #DEBUG_LINE_NO:51
  ObjectReference Terrormorph = Alias_Terrormorph_Alt.GetRef() ; #DEBUG_LINE_NO:52
  If Terrormorph as Bool && AmbushFurniture as Bool ; #DEBUG_LINE_NO:54
    Terrormorph.Enable(False) ; #DEBUG_LINE_NO:55
    Terrormorph.MoveTo(AmbushFurniture, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  If Self.GetStageDone(30) ; #DEBUG_LINE_NO:65
    Self.SetStage(210) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0210_Item_00()
  ObjectReference AmbushFurniture = Alias_Furniture_Ambush_Terrormorph_Add.GetRef() ; #DEBUG_LINE_NO:75
  ObjectReference Terrormorph = Alias_Terrormorph_Add.GetRef() ; #DEBUG_LINE_NO:76
  If Terrormorph as Bool && AmbushFurniture as Bool ; #DEBUG_LINE_NO:78
    Terrormorph.Enable(False) ; #DEBUG_LINE_NO:79
    Terrormorph.MoveTo(AmbushFurniture, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
EndFunction
