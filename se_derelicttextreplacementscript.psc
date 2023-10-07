ScriptName SE_DerelictTextReplacementScript Extends TerminalMenu
{ Script for generic derelicts - a terminal with random replacement text and numeric values }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Text_Properties
{ Arrays to use in various text replacement. Type differs depending on the terminal using the script }
  Form[] Property TextReplacement00 Auto Const
  Form[] Property TextReplacement01 Auto Const
  Form[] Property TextReplacement02 Auto Const
  Form[] Property TextReplacement03 Auto Const
  Form[] Property TextReplacement04 Auto Const
  Form[] Property TextReplacement05 Auto Const
EndGroup

Group Number_Properties
{ Integers - used to randomly select a form in the array. Properties allow individual users to edit the values to a desired range }
  Int Property SmallIntMin Auto Const
  Int Property SmallIntMax Auto Const
  Int Property MediumIntMin Auto Const
  Int Property MediumIntMax Auto Const
  Int Property LargeIntMin Auto Const
  Int Property LargeIntMax Auto Const
EndGroup

Group Variable_Properties
{ Determines if terminal values should be re-evaluated. Reset with each new space encounte }
  GlobalVariable Property SE_GenericDerelict_TerminalGlobal Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If SE_GenericDerelict_TerminalGlobal.GetValueInt() == 0 ; #DEBUG_LINE_NO:33
    Int ArrayValue00 = Utility.RandomInt(0, TextReplacement00.Length - 1) ; #DEBUG_LINE_NO:37
    Int ArrayValue01 = Utility.RandomInt(0, TextReplacement01.Length - 1) ; #DEBUG_LINE_NO:38
    Int ArrayValue02 = Utility.RandomInt(0, TextReplacement02.Length - 1) ; #DEBUG_LINE_NO:39
    Int ArrayValue03 = Utility.RandomInt(0, TextReplacement03.Length - 1) ; #DEBUG_LINE_NO:40
    Int ArrayValue04 = Utility.RandomInt(0, TextReplacement04.Length - 1) ; #DEBUG_LINE_NO:41
    Int ArrayValue05 = Utility.RandomInt(0, TextReplacement05.Length - 1) ; #DEBUG_LINE_NO:42
    Int SmallDigit01 = Utility.RandomInt(SmallIntMin, SmallIntMax) ; #DEBUG_LINE_NO:49
    Int SmallDigit02 = Utility.RandomInt(SmallIntMin, SmallIntMax) ; #DEBUG_LINE_NO:50
    Int MediumDigit01 = Utility.RandomInt(MediumIntMin, MediumIntMax) ; #DEBUG_LINE_NO:51
    Int MediumDigit02 = Utility.RandomInt(MediumIntMin, MediumIntMax) ; #DEBUG_LINE_NO:52
    Int LargeDigit01 = Utility.RandomInt(LargeIntMin, LargeIntMax) ; #DEBUG_LINE_NO:53
    Int LargeDigit02 = Utility.RandomInt(LargeIntMin, LargeIntMax) ; #DEBUG_LINE_NO:54
    akTerminalRef.AddTextReplacementData("MiscText00", TextReplacement00[ArrayValue00]) ; #DEBUG_LINE_NO:58
    akTerminalRef.AddTextReplacementData("MiscText01", TextReplacement01[ArrayValue01]) ; #DEBUG_LINE_NO:59
    akTerminalRef.AddTextReplacementData("MiscText02", TextReplacement02[ArrayValue02]) ; #DEBUG_LINE_NO:60
    akTerminalRef.AddTextReplacementData("MiscText03", TextReplacement03[ArrayValue03]) ; #DEBUG_LINE_NO:61
    akTerminalRef.AddTextReplacementData("MiscText04", TextReplacement04[ArrayValue04]) ; #DEBUG_LINE_NO:62
    akTerminalRef.AddTextReplacementData("MiscText05", TextReplacement05[ArrayValue05]) ; #DEBUG_LINE_NO:63
    akTerminalRef.AddTextReplacementValue("RandomInt00", SmallDigit01 as Float) ; #DEBUG_LINE_NO:67
    akTerminalRef.AddTextReplacementValue("RandomInt01", SmallDigit02 as Float) ; #DEBUG_LINE_NO:68
    akTerminalRef.AddTextReplacementValue("RandomInt02", MediumDigit01 as Float) ; #DEBUG_LINE_NO:69
    akTerminalRef.AddTextReplacementValue("RandomInt03", MediumDigit02 as Float) ; #DEBUG_LINE_NO:70
    akTerminalRef.AddTextReplacementValue("RandomInt04", LargeDigit01 as Float) ; #DEBUG_LINE_NO:71
    akTerminalRef.AddTextReplacementValue("RandomInt05", LargeDigit02 as Float) ; #DEBUG_LINE_NO:72
    SE_GenericDerelict_TerminalGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
EndEvent
