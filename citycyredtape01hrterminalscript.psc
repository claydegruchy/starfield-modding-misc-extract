ScriptName CityCYRedTape01HRTerminalScript Extends TerminalMenu

;-- Structs -----------------------------------------
Struct EdData
  GlobalVariable EducationValue
  { The value we set for the player's stated Education Level }
  Message EducationMSG
  { The Message to output associated with this level of Education }
EndStruct

Struct ExpData
  GlobalVariable ExperienceValue
  { The value we set for the player's stated Executive Assistant Experience Level }
  Message ExperienceMSG
  { The Message to output associated with this level of experience }
EndStruct

Struct QualityData
  GlobalVariable QualityRangeValue
  { The range value based on the player's City_CY_RedTape01ApplicationTotal value }
  Message QualityMSG
  { The Message to output associated with this range value, based on how well the player answered the questions }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property City_CY_RedTape01_Experience Auto Const mandatory
GlobalVariable Property City_CY_RedTape01_Education Auto Const mandatory
GlobalVariable Property City_CY_RedTape01ApplicationTotal Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Quality01 Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Quality02 Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Quality03 Auto Const mandatory
Keyword Property LinkCustom10 Auto Const mandatory
Float Property fDistance = 16.0 Auto Const
TerminalMenu Property City_CY_RedTape01_HRSubTerminal_Applications_Genesis Auto Const mandatory
TerminalMenu Property City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis Auto Const mandatory
Int Property PlayerNameBodyTextIndex = 0 Auto Const
Int Property ExperienceBodyTextIndex = 1 Auto Const
Int Property EducationBodyTextIndex = 2 Auto Const
Int Property QualityBodyTextIndex = 3 Auto Const
Message[] Property ExpMessage Auto Const mandatory
Message[] Property EdMessage Auto Const mandatory
Message[] Property QualityMessage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:51
  Actor myTia = akTerminalRef.GetLinkedRef(LinkCustom10) as Actor ; #DEBUG_LINE_NO:52
  Float fTiaDistance = myTia.GetDistance(myPlayer as ObjectReference) ; #DEBUG_LINE_NO:53
  If fTiaDistance < fDistance ; #DEBUG_LINE_NO:54
    myTia.SendTrespassAlarm(myPlayer) ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
  terminalscript myTerminalRef = akTerminalRef as terminalscript ; #DEBUG_LINE_NO:58
  Form[] textReplacementArray = new Form[0] ; #DEBUG_LINE_NO:59
  textReplacementArray.add(myPlayer as Form, 1) ; #DEBUG_LINE_NO:60
  Int ExpIndex = City_CY_RedTape01_Experience.GetValue() as Int ; #DEBUG_LINE_NO:62
  If ExpIndex >= 0 && ExpIndex <= ExpMessage.Length - 1 ; #DEBUG_LINE_NO:63
    Message myExpMsg = ExpMessage[ExpIndex] ; #DEBUG_LINE_NO:64
    textReplacementArray.add(myExpMsg as Form, 1) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
  Int EdIndex = City_CY_RedTape01_Education.GetValue() as Int ; #DEBUG_LINE_NO:68
  If EdIndex >= 0 && EdIndex <= EdMessage.Length - 1 ; #DEBUG_LINE_NO:69
    Message myEdMsg = EdMessage[EdIndex] ; #DEBUG_LINE_NO:70
    textReplacementArray.add(myEdMsg as Form, 1) ; #DEBUG_LINE_NO:71
  EndIf ; #DEBUG_LINE_NO:
  Int iTotal = City_CY_RedTape01ApplicationTotal.GetValue() as Int ; #DEBUG_LINE_NO:74
  Int iQuality = 0 ; #DEBUG_LINE_NO:75
  If iTotal as Float < City_CY_RedTape01Quality01.GetValue() ; #DEBUG_LINE_NO:76
    iQuality = 0 ; #DEBUG_LINE_NO:77
  ElseIf (iTotal as Float >= City_CY_RedTape01Quality01.GetValue()) && (iTotal as Float < City_CY_RedTape01Quality02.GetValue()) ; #DEBUG_LINE_NO:78
    iQuality = 1 ; #DEBUG_LINE_NO:79
  ElseIf (iTotal as Float >= City_CY_RedTape01Quality02.GetValue()) && (iTotal as Float < City_CY_RedTape01Quality03.GetValue()) ; #DEBUG_LINE_NO:80
    iQuality = 2 ; #DEBUG_LINE_NO:81
  ElseIf iTotal as Float >= City_CY_RedTape01Quality03.GetValue() ; #DEBUG_LINE_NO:82
    iQuality = 3 ; #DEBUG_LINE_NO:83
  EndIf ; #DEBUG_LINE_NO:
  Message myQualityMsg = QualityMessage[iQuality] ; #DEBUG_LINE_NO:85
  textReplacementArray.add(myQualityMsg as Form, 1) ; #DEBUG_LINE_NO:86
  akTerminalRef.AddTextReplacementData("PlayerLabel", Game.GetPlayer().GetBaseObject()) ; #DEBUG_LINE_NO:88
  City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis.AddDynamicBodyTextItem(myTerminalRef as ObjectReference, PlayerNameBodyTextIndex, 2, textReplacementArray) ; #DEBUG_LINE_NO:91
  City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis.AddDynamicBodyTextItem(myTerminalRef as ObjectReference, ExperienceBodyTextIndex, 3, textReplacementArray) ; #DEBUG_LINE_NO:92
  City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis.AddDynamicBodyTextItem(myTerminalRef as ObjectReference, EducationBodyTextIndex, 4, textReplacementArray) ; #DEBUG_LINE_NO:93
  City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis.AddDynamicBodyTextItem(myTerminalRef as ObjectReference, QualityBodyTextIndex, 5, textReplacementArray) ; #DEBUG_LINE_NO:94
EndEvent
