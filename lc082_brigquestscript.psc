ScriptName LC082_BrigQuestScript Extends Quest conditional
{ Quest script for LC082. Manages the Brig on the UC Vigilance. }

;-- Structs -----------------------------------------
Struct BrigCellDatum
  Bool cellOccupied
  ObjectReference cellDoor
  ObjectReference cellMarker
  ObjectReference cellTrigger
  ObjectReference cellTalkZoneTrigger
  Actor cellPrisoner
EndStruct


;-- Variables ---------------------------------------
Int CONST_Assistance_HelpsAllies = 1 Const
Int CONST_InitializationDelayTimeout = 300 Const
Bool initialized

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard BrigDataGuard

;-- Properties --------------------------------------
Group QuestProperties
  lc082_brigquestscript:brigcelldatum[] Property BrigData Auto hidden
  { Struct array of data representing the Brig.
	 For convenience, to match the cell numbers on the terminal, BrigData[0] is unused/None. }
  Int Property CurrentPrisonerCount Auto conditional hidden
  { Number of prisoners currently in the Brig. }
EndGroup

Group AutofillProperties
  ReferenceAlias Property BrigManager Auto Const mandatory
  RefCollectionAlias Property BrigPrisoners Auto Const mandatory
  ActorBase Property LC082_LvlPrisonersGeneric Auto Const mandatory
  ActorValue Property Assistance Auto Const mandatory
  Armor Property Clothes_Prisoner_Scrubs_SysDef Auto Const mandatory
  Keyword Property LinkCustom01 Auto Const mandatory
  Keyword Property LC082_LinkBrigCellMarker Auto Const mandatory
  Keyword Property LC082_LinkBrigCellTrigger Auto Const mandatory
  Keyword Property LC082_LinkBrigCellTalkZoneTrigger Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function InitBrig()
  Self.Start() ; #DEBUG_LINE_NO:48
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:49
    If !initialized ; #DEBUG_LINE_NO:50
      ObjectReference[] brigCellDoors = BrigManager.GetRef().GetLinkedRefChain(LinkCustom01, 100) ; #DEBUG_LINE_NO:52
      BrigData = new lc082_brigquestscript:brigcelldatum[brigCellDoors.Length + 1] ; #DEBUG_LINE_NO:53
      Int I = 0 ; #DEBUG_LINE_NO:54
      While I < brigCellDoors.Length ; #DEBUG_LINE_NO:55
        lc082_brigquestscript:brigcelldatum newDatum = new lc082_brigquestscript:brigcelldatum ; #DEBUG_LINE_NO:56
        newDatum.cellDoor = brigCellDoors[I] ; #DEBUG_LINE_NO:57
        newDatum.cellMarker = newDatum.cellDoor.GetLinkedRef(None) ; #DEBUG_LINE_NO:58
        newDatum.cellTrigger = newDatum.cellMarker.GetLinkedRef(None) ; #DEBUG_LINE_NO:59
        newDatum.cellTalkZoneTrigger = newDatum.cellTrigger.GetLinkedRef(None) ; #DEBUG_LINE_NO:60
        BrigData[I + 1] = newDatum ; #DEBUG_LINE_NO:61
        I += 1 ; #DEBUG_LINE_NO:62
      EndWhile ; #DEBUG_LINE_NO:
      initialized = True ; #DEBUG_LINE_NO:64
    Else ; #DEBUG_LINE_NO:
      Int i = 0 ; #DEBUG_LINE_NO:67
      While i < BrigData.Length ; #DEBUG_LINE_NO:68
        lc082_brigquestscript:brigcelldatum currentData = BrigData[i] ; #DEBUG_LINE_NO:69
        If currentData != None ; #DEBUG_LINE_NO:70
          Actor currentPrisoner = currentData.cellPrisoner ; #DEBUG_LINE_NO:71
          If currentPrisoner != None ; #DEBUG_LINE_NO:72
            currentPrisoner.SetLinkedRef(currentData.cellMarker, LC082_LinkBrigCellMarker, True) ; #DEBUG_LINE_NO:73
            currentPrisoner.SetLinkedRef(currentData.cellTrigger, LC082_LinkBrigCellTrigger, True) ; #DEBUG_LINE_NO:74
            currentPrisoner.SetLinkedRef(currentData.cellTalkZoneTrigger, LC082_LinkBrigCellTalkZoneTrigger, True) ; #DEBUG_LINE_NO:75
            currentPrisoner.DisableNoWait(False) ; #DEBUG_LINE_NO:76
            currentPrisoner.MoveTo(currentData.cellMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:77
            currentPrisoner.Enable(False) ; #DEBUG_LINE_NO:78
            currentPrisoner.RemoveAllItems(None, False, False) ; #DEBUG_LINE_NO:79
            currentPrisoner.EquipItem(Clothes_Prisoner_Scrubs_SysDef as Form, False, False) ; #DEBUG_LINE_NO:80
            currentPrisoner.EvaluatePackage(False) ; #DEBUG_LINE_NO:81
            currentPrisoner.MoveTo(currentData.cellMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:82
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        i += 1 ; #DEBUG_LINE_NO:85
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Actor Function AddPrisoner(Actor newPrisoner, Int cellID)
  If !initialized ; #DEBUG_LINE_NO:95
    Int I = 0 ; #DEBUG_LINE_NO:96
    While !initialized && I < CONST_InitializationDelayTimeout ; #DEBUG_LINE_NO:97
      I += 1 ; #DEBUG_LINE_NO:98
      Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:99
    EndWhile ; #DEBUG_LINE_NO:
    If !initialized ; #DEBUG_LINE_NO:101
      Return None ; #DEBUG_LINE_NO:103
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Actor result = None ; #DEBUG_LINE_NO:107
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:108
    If newPrisoner != None ; #DEBUG_LINE_NO:109
      If newPrisoner.IsDead() ; #DEBUG_LINE_NO:110
        Return None ; #DEBUG_LINE_NO:112
      EndIf ; #DEBUG_LINE_NO:
      Int prisonerInCell = BrigData.findstruct("cellPrisoner", newPrisoner, 0) ; #DEBUG_LINE_NO:115
      If prisonerInCell >= 0 ; #DEBUG_LINE_NO:116
        Return None ; #DEBUG_LINE_NO:118
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If cellID <= 0 || cellID >= BrigData.Length || BrigData[cellID].cellPrisoner != None ; #DEBUG_LINE_NO:121
      cellID = Self.Private_FindRandomUnoccupiedCellID() ; #DEBUG_LINE_NO:122
    EndIf ; #DEBUG_LINE_NO:
    If newPrisoner == None ; #DEBUG_LINE_NO:124
      newPrisoner = BrigData[cellID].cellMarker.PlaceActorAtMe(LC082_LvlPrisonersGeneric, 2, None, False, False, True, None, True) ; #DEBUG_LINE_NO:125
    EndIf ; #DEBUG_LINE_NO:
    BrigData[cellID].cellOccupied = True ; #DEBUG_LINE_NO:127
    BrigData[cellID].cellPrisoner = newPrisoner ; #DEBUG_LINE_NO:128
    BrigPrisoners.AddRef(newPrisoner as ObjectReference) ; #DEBUG_LINE_NO:129
    newPrisoner.SetLinkedRef(BrigData[cellID].cellMarker, LC082_LinkBrigCellMarker, True) ; #DEBUG_LINE_NO:130
    newPrisoner.SetLinkedRef(BrigData[cellID].cellTrigger, LC082_LinkBrigCellTrigger, True) ; #DEBUG_LINE_NO:131
    newPrisoner.SetLinkedRef(BrigData[cellID].cellTalkZoneTrigger, LC082_LinkBrigCellTalkZoneTrigger, True) ; #DEBUG_LINE_NO:132
    newPrisoner.DisableNoWait(False) ; #DEBUG_LINE_NO:133
    newPrisoner.MoveTo(BrigData[cellID].cellMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:134
    newPrisoner.Enable(False) ; #DEBUG_LINE_NO:135
    newPrisoner.RemoveAllItems(None, False, False) ; #DEBUG_LINE_NO:136
    newPrisoner.EquipItem(Clothes_Prisoner_Scrubs_SysDef as Form, False, False) ; #DEBUG_LINE_NO:137
    newPrisoner.EvaluatePackage(False) ; #DEBUG_LINE_NO:138
    newPrisoner.MoveTo(BrigData[cellID].cellMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:139
    CurrentPrisonerCount += 1 ; #DEBUG_LINE_NO:140
    result = newPrisoner ; #DEBUG_LINE_NO:141
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  Return result ; #DEBUG_LINE_NO:143
EndFunction

Function DisablePrisoner(Actor prisonerRef)
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:150
    Int cellID = BrigData.findstruct("cellPrisoner", prisonerRef, 0) ; #DEBUG_LINE_NO:151
    If cellID >= 0 ; #DEBUG_LINE_NO:152
      prisonerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:153
      BrigData[cellID].cellOccupied = False ; #DEBUG_LINE_NO:154
      BrigData[cellID].cellPrisoner = None ; #DEBUG_LINE_NO:155
      CurrentPrisonerCount -= 1 ; #DEBUG_LINE_NO:156
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function ResetAllPrisoners()
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:166
    Int I = 0 ; #DEBUG_LINE_NO:167
    While I < BrigData.Length ; #DEBUG_LINE_NO:168
      If BrigData[I].cellOccupied ; #DEBUG_LINE_NO:169
        Actor current = BrigData[I].cellPrisoner ; #DEBUG_LINE_NO:170
        current.Reset(None) ; #DEBUG_LINE_NO:171
        current.SetLinkedRef(BrigData[I].cellMarker, LC082_LinkBrigCellMarker, True) ; #DEBUG_LINE_NO:172
        current.SetLinkedRef(BrigData[I].cellTrigger, LC082_LinkBrigCellTrigger, True) ; #DEBUG_LINE_NO:173
        current.SetLinkedRef(BrigData[I].cellTalkZoneTrigger, LC082_LinkBrigCellTalkZoneTrigger, True) ; #DEBUG_LINE_NO:174
        current.DisableNoWait(False) ; #DEBUG_LINE_NO:175
        current.MoveTo(BrigData[I].cellMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:176
        current.Enable(False) ; #DEBUG_LINE_NO:177
        current.RemoveAllItems(None, False, False) ; #DEBUG_LINE_NO:178
        current.EquipItem(Clothes_Prisoner_Scrubs_SysDef as Form, False, False) ; #DEBUG_LINE_NO:179
        current.EvaluatePackage(False) ; #DEBUG_LINE_NO:180
        current.MoveTo(BrigData[I].cellMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:181
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:183
    EndWhile ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Actor Function ReleasePrisoner(Int cellID)
  If !initialized ; #DEBUG_LINE_NO:192
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Actor releasedPrisoner = None ; #DEBUG_LINE_NO:196
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:197
    If cellID <= 0 || cellID >= BrigData.Length ; #DEBUG_LINE_NO:198
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      BrigData[cellID].cellOccupied = False ; #DEBUG_LINE_NO:201
      BrigData[cellID].cellDoor.Unlock(False) ; #DEBUG_LINE_NO:202
      BrigData[cellID].cellDoor.SetOpen(True) ; #DEBUG_LINE_NO:203
      releasedPrisoner = BrigData[cellID].cellPrisoner ; #DEBUG_LINE_NO:204
      If releasedPrisoner != None ; #DEBUG_LINE_NO:205
        BrigData[cellID].cellPrisoner = None ; #DEBUG_LINE_NO:206
        BrigPrisoners.RemoveRef(releasedPrisoner as ObjectReference) ; #DEBUG_LINE_NO:207
        CurrentPrisonerCount -= 1 ; #DEBUG_LINE_NO:208
        If releasedPrisoner.GetValue(Assistance) < CONST_Assistance_HelpsAllies as Float ; #DEBUG_LINE_NO:209
          releasedPrisoner.SetValue(Assistance, CONST_Assistance_HelpsAllies as Float) ; #DEBUG_LINE_NO:210
        EndIf ; #DEBUG_LINE_NO:
        releasedPrisoner.EvaluatePackage(False) ; #DEBUG_LINE_NO:212
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  Return releasedPrisoner ; #DEBUG_LINE_NO:216
EndFunction

Function EVPPrisoners()
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:221
    Int I = 0 ; #DEBUG_LINE_NO:222
    While I < BrigData.Length ; #DEBUG_LINE_NO:223
      lc082_brigquestscript:brigcelldatum currentData = BrigData[I] ; #DEBUG_LINE_NO:224
      If currentData != None ; #DEBUG_LINE_NO:225
        Actor currentPrisoner = currentData.cellPrisoner ; #DEBUG_LINE_NO:226
        If currentPrisoner != None ; #DEBUG_LINE_NO:227
          currentPrisoner.EvaluatePackage(False) ; #DEBUG_LINE_NO:228
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:231
    EndWhile ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Int Function GetBrigDataLength()
  Guard BrigDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:239
    Return BrigData.Length ; #DEBUG_LINE_NO:240
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Int Function Private_FindRandomUnoccupiedCellID()
  Int randomCell = Utility.RandomInt(1, BrigData.Length) ; #DEBUG_LINE_NO:246
  Int I = randomCell ; #DEBUG_LINE_NO:247
  While I < BrigData.Length ; #DEBUG_LINE_NO:248
    If BrigData[I] != None && !BrigData[I].cellOccupied ; #DEBUG_LINE_NO:249
      Return I ; #DEBUG_LINE_NO:250
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:252
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:254
  While I < randomCell ; #DEBUG_LINE_NO:255
    If BrigData[I] != None && !BrigData[I].cellOccupied ; #DEBUG_LINE_NO:256
      Return I ; #DEBUG_LINE_NO:257
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:259
  EndWhile ; #DEBUG_LINE_NO:
  Return -1 ; #DEBUG_LINE_NO:261
EndFunction
