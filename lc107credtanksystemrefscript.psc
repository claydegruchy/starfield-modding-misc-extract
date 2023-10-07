ScriptName LC107CredTankSystemRefScript Extends ObjectReference
{ Script for refs in the LC107 CredTank System.
 - This script is used for the refs that manage groups of shelves (the Vault, Group, and Cluter managers).
 - This is also the parent script of LC107CredTankShelfRefScript, wich manages the shelves themselves. }

;-- Variables ---------------------------------------
Int CONST_ChildPattern_Linked = -2 Const
Int CONST_ChildPattern_Reversed = -3 Const
Int CONST_ChildPattern_Simultaneous = -1 Const
Int CONST_RefType_ClusterManager = 1 Const
Int CONST_RefType_GroupManager = 2 Const
Int CONST_RefType_ShelfManager = 0 Const
Int CONST_RefType_VaultManager = 3 Const
Int CONST_ShutdownTanksPerThread = 50 Const
Int myChildPattern
lc107credtanksystemrefscript[] myShutdownChildObjects
Int myShutdownCount

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard UpdateGuard

;-- Properties --------------------------------------
Group CredTankSystemBaseProperties collapsedonref
  Int Property CredTankSystemRefType Auto Const
  { The type of ref this script is on, from the list of CONST_RefTypes below. Where this script is in the hierarchy of objects in the Vault. }
  Keyword Property ChildObjectKeyword Auto Const
  { Keyword for the linkedref connecting this ref to its child objects. }
EndGroup

Group AutofillProperties
  lc107questscript Property LC107 Auto Const mandatory
EndGroup

LC107CredTankSystemRefScript Property parentRef Auto hidden
Int Property myOperation Auto hidden
Int Property CONST_Operation_Initialize = 1 Auto Const hidden
Int Property CONST_Operation_Waiting = 2 Auto Const hidden
Int Property CONST_Operation_Responsive = 3 Auto Const hidden
Int Property CONST_Operation_Boot = 4 Auto Const hidden
Int Property CONST_Operation_Drain = 5 Auto Const hidden
Int Property CONST_Operation_Shutdown = 6 Auto Const hidden

;-- Functions ---------------------------------------

Function PerformInitialRegistration(LC107CredTankSystemRefScript myParentObject)
  parentRef = myParentObject ; #DEBUG_LINE_NO:57
  If parentRef != None ; #DEBUG_LINE_NO:58
    Self.RegisterForCustomEvent(parentRef as ScriptObject, "lc107credtanksystemrefscript_SimultaneousUpdateEvent") ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
  If CredTankSystemRefType != CONST_RefType_ShelfManager ; #DEBUG_LINE_NO:61
    lc107credtanksystemrefscript[] childObjects = Self.GetLinkedRefChain(ChildObjectKeyword, 100) as lc107credtanksystemrefscript[] ; #DEBUG_LINE_NO:62
    If childObjects != None ; #DEBUG_LINE_NO:63
      Int I = 0 ; #DEBUG_LINE_NO:64
      While I < childObjects.Length ; #DEBUG_LINE_NO:65
        childObjects[I].PerformInitialRegistration(Self) ; #DEBUG_LINE_NO:66
        I += 1 ; #DEBUG_LINE_NO:67
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PerformOperation(Int myNewOperation)
  Guard UpdateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:75
    myOperation = myNewOperation ; #DEBUG_LINE_NO:77
    lc107credtanksystemrefscript[] childObjects = Self.GetLinkedRefChain(ChildObjectKeyword, 100) as lc107credtanksystemrefscript[] ; #DEBUG_LINE_NO:78
    If childObjects != None ; #DEBUG_LINE_NO:80
      If myOperation == CONST_Operation_Initialize ; #DEBUG_LINE_NO:81
        If CredTankSystemRefType == CONST_RefType_VaultManager ; #DEBUG_LINE_NO:82
          myChildPattern = CONST_ChildPattern_Simultaneous ; #DEBUG_LINE_NO:83
        ElseIf CredTankSystemRefType == CONST_RefType_GroupManager ; #DEBUG_LINE_NO:84
          myChildPattern = CONST_ChildPattern_Simultaneous ; #DEBUG_LINE_NO:85
        ElseIf CredTankSystemRefType == CONST_RefType_ClusterManager ; #DEBUG_LINE_NO:86
          myChildPattern = CONST_ChildPattern_Linked ; #DEBUG_LINE_NO:87
        EndIf ; #DEBUG_LINE_NO:
      ElseIf myOperation == CONST_Operation_Boot ; #DEBUG_LINE_NO:89
        If CredTankSystemRefType == CONST_RefType_VaultManager ; #DEBUG_LINE_NO:90
          myChildPattern = CONST_ChildPattern_Linked ; #DEBUG_LINE_NO:91
        ElseIf CredTankSystemRefType == CONST_RefType_GroupManager ; #DEBUG_LINE_NO:92
          myChildPattern = CONST_ChildPattern_Simultaneous ; #DEBUG_LINE_NO:93
        ElseIf CredTankSystemRefType == CONST_RefType_ClusterManager ; #DEBUG_LINE_NO:94
          myChildPattern = CONST_ChildPattern_Linked ; #DEBUG_LINE_NO:95
        EndIf ; #DEBUG_LINE_NO:
      ElseIf myOperation == CONST_Operation_Drain ; #DEBUG_LINE_NO:97
        If CredTankSystemRefType == CONST_RefType_VaultManager ; #DEBUG_LINE_NO:98
          myChildPattern = CONST_ChildPattern_Linked ; #DEBUG_LINE_NO:99
        ElseIf CredTankSystemRefType == CONST_RefType_GroupManager ; #DEBUG_LINE_NO:100
          myChildPattern = CONST_ChildPattern_Simultaneous ; #DEBUG_LINE_NO:101
        ElseIf CredTankSystemRefType == CONST_RefType_ClusterManager ; #DEBUG_LINE_NO:102
          myChildPattern = CONST_ChildPattern_Reversed ; #DEBUG_LINE_NO:103
        EndIf ; #DEBUG_LINE_NO:
      ElseIf myOperation == CONST_Operation_Shutdown ; #DEBUG_LINE_NO:105
        If CredTankSystemRefType == CONST_RefType_VaultManager ; #DEBUG_LINE_NO:106
          myChildPattern = CONST_ChildPattern_Simultaneous ; #DEBUG_LINE_NO:107
        ElseIf CredTankSystemRefType == CONST_RefType_GroupManager ; #DEBUG_LINE_NO:108
          myChildPattern = CONST_ChildPattern_Linked ; #DEBUG_LINE_NO:109
        ElseIf CredTankSystemRefType == CONST_RefType_ClusterManager ; #DEBUG_LINE_NO:110
          myChildPattern = CONST_ChildPattern_Linked ; #DEBUG_LINE_NO:111
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If myChildPattern == CONST_ChildPattern_Linked && myOperation == CONST_Operation_Shutdown && childObjects.Length > CONST_ShutdownTanksPerThread ; #DEBUG_LINE_NO:115
        myShutdownChildObjects = childObjects ; #DEBUG_LINE_NO:116
        myShutdownCount = myShutdownChildObjects.Length / CONST_ShutdownTanksPerThread + 1 ; #DEBUG_LINE_NO:117
        Int I = 0 ; #DEBUG_LINE_NO:118
        While I < myShutdownCount ; #DEBUG_LINE_NO:119
          Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:120
          akArgs[0] = I as Var ; #DEBUG_LINE_NO:121
          Self.CallFunctionNoWait("PerformShutdownOperationThreaded", akArgs) ; #DEBUG_LINE_NO:122
          I += 1 ; #DEBUG_LINE_NO:123
        EndWhile ; #DEBUG_LINE_NO:
      ElseIf myChildPattern == CONST_ChildPattern_Linked ; #DEBUG_LINE_NO:125
        Int i = 0 ; #DEBUG_LINE_NO:126
        While i < childObjects.Length ; #DEBUG_LINE_NO:127
          LC107CredTankSystemRefScript currentRef = childObjects[i] ; #DEBUG_LINE_NO:128
          currentRef.PerformOperation(myOperation) ; #DEBUG_LINE_NO:129
          If myOperation == CONST_Operation_Boot && CredTankSystemRefType == CONST_RefType_VaultManager ; #DEBUG_LINE_NO:130
            Utility.Wait(1.5) ; #DEBUG_LINE_NO:131
          ElseIf myOperation == CONST_Operation_Drain && CredTankSystemRefType == CONST_RefType_VaultManager ; #DEBUG_LINE_NO:132
            Utility.Wait(1.5) ; #DEBUG_LINE_NO:133
          ElseIf myOperation == CONST_Operation_Drain && CredTankSystemRefType == CONST_RefType_ClusterManager ; #DEBUG_LINE_NO:134
            Utility.Wait(0.400000006) ; #DEBUG_LINE_NO:135
          EndIf ; #DEBUG_LINE_NO:
          i += 1 ; #DEBUG_LINE_NO:137
        EndWhile ; #DEBUG_LINE_NO:
      ElseIf myChildPattern == CONST_ChildPattern_Reversed ; #DEBUG_LINE_NO:139
        Int i = childObjects.Length - 1 ; #DEBUG_LINE_NO:140
        While i >= 0 ; #DEBUG_LINE_NO:141
          LC107CredTankSystemRefScript currentref = childObjects[i] ; #DEBUG_LINE_NO:142
          currentref.PerformOperation(myOperation) ; #DEBUG_LINE_NO:143
          If myOperation == CONST_Operation_Boot && CredTankSystemRefType == CONST_RefType_ClusterManager ; #DEBUG_LINE_NO:144
            Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:145
          ElseIf myOperation == CONST_Operation_Drain && CredTankSystemRefType == CONST_RefType_ClusterManager ; #DEBUG_LINE_NO:146
            Utility.Wait(0.300000012) ; #DEBUG_LINE_NO:147
          EndIf ; #DEBUG_LINE_NO:
          i -= 1 ; #DEBUG_LINE_NO:149
        EndWhile ; #DEBUG_LINE_NO:
      ElseIf myChildPattern == CONST_ChildPattern_Simultaneous ; #DEBUG_LINE_NO:151
        Var[] akargs = new Var[1] ; #DEBUG_LINE_NO:152
        akargs[0] = myOperation as Var ; #DEBUG_LINE_NO:153
        Self.SendCustomEvent("lc107credtanksystemrefscript_SimultaneousUpdateEvent", akargs) ; #DEBUG_LINE_NO:154
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function PerformShutdownOperationThreaded(Int threadNum)
  Int I = threadNum * CONST_ShutdownTanksPerThread ; #DEBUG_LINE_NO:166
  Int endIndex = Math.Min((I + CONST_ShutdownTanksPerThread) as Float, myShutdownChildObjects.Length as Float) as Int ; #DEBUG_LINE_NO:167
  While I < endIndex ; #DEBUG_LINE_NO:168
    myShutdownChildObjects[I].PerformOperation(myOperation) ; #DEBUG_LINE_NO:169
    I += 1 ; #DEBUG_LINE_NO:170
  EndWhile ; #DEBUG_LINE_NO:
  Guard UpdateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:172
    myShutdownCount -= 1 ; #DEBUG_LINE_NO:173
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event LC107CredTankSystemRefScript.SimultaneousUpdateEvent(LC107CredTankSystemRefScript source, Var[] akArgs)
  Self.PerformOperation(akArgs[0] as Int) ; #DEBUG_LINE_NO:181
EndEvent
