ScriptName SQ_DoctorsScript Extends Quest

;-- Variables ---------------------------------------
MiscObject Credits
Actor PlayerRef
Int iHealMax = 999999999

;-- Properties --------------------------------------
Group Autofill
  ReferenceAlias Property PrimaryAliasDoctor Auto Const mandatory
  GlobalVariable Property SQ_Doctors_Price_Wounds Auto Const mandatory
  GlobalVariable Property SQ_Doctors_Price_Afflictions Auto Const mandatory
  GlobalVariable Property SQ_Doctors_Price_Addictions Auto Const mandatory
  GlobalVariable Property SQ_Doctors_Price_Everything Auto Const mandatory
  Spell Property SQ_Doctors_CureAll Auto Const mandatory
  Spell Property CureAddictions Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function CannotPay()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:19
  Credits = Game.GetCredits() ; #DEBUG_LINE_NO:20
EndEvent

Function BuySupplies()
  PrimaryAliasDoctor.GetActorReference().ShowBarterMenu() ; #DEBUG_LINE_NO:25
EndFunction

Function HealWounds()
  Self.PayForService(SQ_Doctors_Price_Wounds) ; #DEBUG_LINE_NO:30
  PlayerRef.RestoreValue(Game.GetHealthAV(), iHealMax as Float) ; #DEBUG_LINE_NO:31
EndFunction

Function HealAfflictions()
  Self.PayForService(SQ_Doctors_Price_Afflictions) ; #DEBUG_LINE_NO:36
  SQ_Doctors_CureAll.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference) ; #DEBUG_LINE_NO:37
EndFunction

Function HealAddictions()
  Self.PayForService(SQ_Doctors_Price_Addictions) ; #DEBUG_LINE_NO:42
  CureAddictions.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference) ; #DEBUG_LINE_NO:43
EndFunction

Function HealEverything()
  Self.PayForService(SQ_Doctors_Price_Everything) ; #DEBUG_LINE_NO:48
  PlayerRef.RestoreValue(Game.GetHealthAV(), iHealMax as Float) ; #DEBUG_LINE_NO:49
  CureAddictions.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference) ; #DEBUG_LINE_NO:50
  SQ_Doctors_CureAll.Cast(PlayerRef as ObjectReference, PlayerRef as ObjectReference) ; #DEBUG_LINE_NO:51
EndFunction

Function PayForService(GlobalVariable CostGlobal)
  PlayerRef.RemoveItem(Credits as Form, CostGlobal.GetValueInt(), False, None) ; #DEBUG_LINE_NO:60
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:67
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:71
EndFunction
