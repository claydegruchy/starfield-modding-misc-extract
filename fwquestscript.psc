ScriptName FWQuestScript Extends Quest
{ Script for REAssault aliases. }

;-- Variables ---------------------------------------
Actor Attacker01Act
Actor Attacker02Act
Actor Attacker03Act
Actor Attacker04Act
Actor Attacker05Act
Actor Defender01Act
Actor Defender02Act
Actor Defender03Act
Actor Defender04Act
Actor Defender05Act
Bool assaultComplete = False

;-- Properties --------------------------------------
ReferenceAlias Property Attacker01Links Auto
ReferenceAlias Property Attacker02Links Auto
ReferenceAlias Property Attacker03Links Auto
ReferenceAlias Property Attacker04Links Auto
ReferenceAlias Property Attacker05Links Auto
ReferenceAlias Property Defender01Links Auto
ReferenceAlias Property Defender02Links Auto
ReferenceAlias Property Defender03Links Auto
ReferenceAlias Property Defender04Links Auto
ReferenceAlias Property Defender05Links Auto
ReferenceAlias Property Attacker01 Auto
ReferenceAlias Property Attacker02 Auto
ReferenceAlias Property Attacker03 Auto
ReferenceAlias Property Attacker04 Auto
ReferenceAlias Property Attacker05 Auto
ReferenceAlias Property Defender01 Auto
ReferenceAlias Property Defender02 Auto
ReferenceAlias Property Defender03 Auto
ReferenceAlias Property Defender04 Auto
ReferenceAlias Property Defender05 Auto
ReferenceAlias Property Attacker01Marker Auto
ReferenceAlias Property Attacker02Marker Auto
ReferenceAlias Property Attacker03Marker Auto
ReferenceAlias Property Attacker04Marker Auto
ReferenceAlias Property Attacker05Marker Auto
ReferenceAlias Property Defender01Marker Auto
ReferenceAlias Property Defender02Marker Auto
ReferenceAlias Property Defender03Marker Auto
ReferenceAlias Property Defender04Marker Auto
ReferenceAlias Property Defender05Marker Auto
ActorBase Property TestFWEncMinutemen Auto
ActorBase Property TestFWEncBoS Auto
ActorBase Property TestFWEncRR Auto
ActorBase Property TestFWEncInstitute Auto
ActorBase Property TestFWEncRaider Auto
ActorBase Property TestFWEncSuperMutant Auto
ActorBase Property TestFWEncGunner Auto
Keyword Property FWOwner Auto
{ This tracks which faction own this location
0 = no one
1 = Minutemen
2 = Brotherhood of Steel
3 = Railroad
4 = Institute
5 = Raiders
6 = Supermutants
7 = Gunners }
Keyword Property FWAttacker Auto
{ This tracks which faction is attacking this location
0 = no one
1 = Minutemen
2 = Brotherhood of Steel
3 = Railroad
4 = Institute
5 = Raiders
6 = Supermutants
7 = Gunners }
Float Property Attacker Auto hidden
Float Property Defender Auto hidden
LocationAlias Property MyLocation Auto
Int Property _DefenderOverride = 0 Auto
Int Property _AttackerOverride = 0 Auto
ActorValue Property FWIsAttacker Auto

;-- Functions ---------------------------------------

Function InitAssault()
  If assaultComplete ; #DEBUG_LINE_NO:103
    Return  ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
  If _AttackerOverride >= 0 || _DefenderOverride >= 0 ; #DEBUG_LINE_NO:107
    Self.SetFactionOverrrides() ; #DEBUG_LINE_NO:108
  EndIf ; #DEBUG_LINE_NO:
  Self.SpawnDefenders() ; #DEBUG_LINE_NO:111
  Self.SpawnAttackers() ; #DEBUG_LINE_NO:112
  Attacker01Act = Attacker01Links.GetActorRef() ; #DEBUG_LINE_NO:116
  Attacker02Act = Attacker02Links.GetActorRef() ; #DEBUG_LINE_NO:117
  Attacker03Act = Attacker03Links.GetActorRef() ; #DEBUG_LINE_NO:118
  Attacker04Act = Attacker04Links.GetActorRef() ; #DEBUG_LINE_NO:119
  Attacker05Act = Attacker05Links.GetActorRef() ; #DEBUG_LINE_NO:120
  Defender01Act = Defender01Links.GetActorRef() ; #DEBUG_LINE_NO:121
  Defender02Act = Defender02Links.GetActorRef() ; #DEBUG_LINE_NO:122
  Defender03Act = Defender03Links.GetActorRef() ; #DEBUG_LINE_NO:123
  Defender04Act = Defender04Links.GetActorRef() ; #DEBUG_LINE_NO:124
  Defender05Act = Defender05Links.GetActorRef() ; #DEBUG_LINE_NO:125
  If Attacker01Act != None ; #DEBUG_LINE_NO:128
    Attacker01Act.SetValue(FWIsAttacker, 1.0) ; #DEBUG_LINE_NO:129
    Attacker01Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:130
  EndIf ; #DEBUG_LINE_NO:
  If Attacker02Act != None ; #DEBUG_LINE_NO:132
    Attacker02Act.SetValue(FWIsAttacker, 1.0) ; #DEBUG_LINE_NO:133
    Attacker02Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
  If Attacker03Act != None ; #DEBUG_LINE_NO:136
    Attacker03Act.SetValue(FWIsAttacker, 1.0) ; #DEBUG_LINE_NO:137
    Attacker03Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
  If Attacker04Act != None ; #DEBUG_LINE_NO:140
    Attacker04Act.SetValue(FWIsAttacker, 1.0) ; #DEBUG_LINE_NO:141
    Attacker04Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:142
  EndIf ; #DEBUG_LINE_NO:
  If Attacker05Act != None ; #DEBUG_LINE_NO:144
    Attacker05Act.SetValue(FWIsAttacker, 1.0) ; #DEBUG_LINE_NO:145
    Attacker05Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:146
  EndIf ; #DEBUG_LINE_NO:
  If Defender01Act != None ; #DEBUG_LINE_NO:150
    Defender01Act.SetValue(FWIsAttacker, 0.0) ; #DEBUG_LINE_NO:151
    Defender01Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:152
  EndIf ; #DEBUG_LINE_NO:
  If Defender02Act != None ; #DEBUG_LINE_NO:154
    Defender02Act.SetValue(FWIsAttacker, 0.0) ; #DEBUG_LINE_NO:155
    Defender02Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:156
  EndIf ; #DEBUG_LINE_NO:
  If Defender03Act != None ; #DEBUG_LINE_NO:158
    Defender03Act.SetValue(FWIsAttacker, 0.0) ; #DEBUG_LINE_NO:159
    Defender03Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:160
  EndIf ; #DEBUG_LINE_NO:
  If Defender04Act != None ; #DEBUG_LINE_NO:162
    Defender04Act.SetValue(FWIsAttacker, 0.0) ; #DEBUG_LINE_NO:163
    Defender04Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:164
  EndIf ; #DEBUG_LINE_NO:
  If Defender05Act != None ; #DEBUG_LINE_NO:166
    Defender05Act.SetValue(FWIsAttacker, 0.0) ; #DEBUG_LINE_NO:167
    Defender05Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:168
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CompleteAssault()
  assaultComplete = True ; #DEBUG_LINE_NO:177
  If Attacker01Act != None ; #DEBUG_LINE_NO:180
    Attacker01Act.SetValue(FWIsAttacker, 0.0) ; #DEBUG_LINE_NO:181
  EndIf ; #DEBUG_LINE_NO:
  If Attacker02Act != None ; #DEBUG_LINE_NO:183
    Attacker02Act.SetValue(FWIsAttacker, 0.0) ; #DEBUG_LINE_NO:184
  EndIf ; #DEBUG_LINE_NO:
  If Attacker03Act != None ; #DEBUG_LINE_NO:186
    Attacker03Act.SetValue(FWIsAttacker, 0.0) ; #DEBUG_LINE_NO:187
  EndIf ; #DEBUG_LINE_NO:
  If Attacker04Act != None ; #DEBUG_LINE_NO:189
    Attacker04Act.SetValue(FWIsAttacker, 0.0) ; #DEBUG_LINE_NO:190
  EndIf ; #DEBUG_LINE_NO:
  If Attacker05Act != None ; #DEBUG_LINE_NO:192
    Attacker05Act.SetValue(FWIsAttacker, 0.0) ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:196
  If Attacker01Act != None ; #DEBUG_LINE_NO:198
    Attacker01Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:199
  EndIf ; #DEBUG_LINE_NO:
  If Attacker02Act != None ; #DEBUG_LINE_NO:201
    Attacker02Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:202
  EndIf ; #DEBUG_LINE_NO:
  If Attacker03Act != None ; #DEBUG_LINE_NO:204
    Attacker03Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:205
  EndIf ; #DEBUG_LINE_NO:
  If Attacker04Act != None ; #DEBUG_LINE_NO:207
    Attacker04Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:208
  EndIf ; #DEBUG_LINE_NO:
  If Attacker05Act != None ; #DEBUG_LINE_NO:210
    Attacker05Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:211
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SpawnDefenders()
  If MyLocation.getLocation().GetKeywordData(FWOwner) != 0.0 ; #DEBUG_LINE_NO:216
    Defender = MyLocation.getLocation().GetKeywordData(FWOwner) ; #DEBUG_LINE_NO:217
  Else ; #DEBUG_LINE_NO:
    Defender = Utility.RandomInt(1, 4) as Float ; #DEBUG_LINE_NO:219
  EndIf ; #DEBUG_LINE_NO:
  ActorBase DefenderBase = None ; #DEBUG_LINE_NO:224
  DefenderBase = Self.SetupFactionActorBase(Defender) ; #DEBUG_LINE_NO:225
  Int numToSpawn = 5 ; #DEBUG_LINE_NO:242
  Defender01.ForceRefTo(Defender01Marker.GetReference().PlaceActorAtMe(DefenderBase, 0, None, False, False, True, None, True) as ObjectReference) ; #DEBUG_LINE_NO:244
  Defender02.ForceRefTo(Defender02Marker.GetReference().PlaceActorAtMe(DefenderBase, 0, None, False, False, True, None, True) as ObjectReference) ; #DEBUG_LINE_NO:245
  Defender03.ForceRefTo(Defender03Marker.GetReference().PlaceActorAtMe(DefenderBase, 0, None, False, False, True, None, True) as ObjectReference) ; #DEBUG_LINE_NO:246
  Defender04.ForceRefTo(Defender04Marker.GetReference().PlaceActorAtMe(DefenderBase, 0, None, False, False, True, None, True) as ObjectReference) ; #DEBUG_LINE_NO:247
  Defender05.ForceRefTo(Defender05Marker.GetReference().PlaceActorAtMe(DefenderBase, 0, None, False, False, True, None, True) as ObjectReference) ; #DEBUG_LINE_NO:248
EndFunction

Function SpawnAttackers()
  If MyLocation.getLocation().GetKeywordData(FWAttacker) != 0.0 ; #DEBUG_LINE_NO:253
    Attacker = MyLocation.getLocation().GetKeywordData(FWAttacker) ; #DEBUG_LINE_NO:254
  Else ; #DEBUG_LINE_NO:
    Attacker = Utility.RandomInt(1, 4) as Float ; #DEBUG_LINE_NO:256
    While Attacker == Defender ; #DEBUG_LINE_NO:259
      Attacker = Utility.RandomInt(1, 4) as Float ; #DEBUG_LINE_NO:260
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  ActorBase AttackerBase = None ; #DEBUG_LINE_NO:265
  AttackerBase = Self.SetupFactionActorBase(Attacker) ; #DEBUG_LINE_NO:266
  Attacker01.ForceRefTo(Attacker01Marker.GetReference().PlaceActorAtMe(AttackerBase, 0, None, False, False, True, None, True) as ObjectReference) ; #DEBUG_LINE_NO:268
  Attacker02.ForceRefTo(Attacker02Marker.GetReference().PlaceActorAtMe(AttackerBase, 0, None, False, False, True, None, True) as ObjectReference) ; #DEBUG_LINE_NO:269
  Attacker03.ForceRefTo(Attacker03Marker.GetReference().PlaceActorAtMe(AttackerBase, 0, None, False, False, True, None, True) as ObjectReference) ; #DEBUG_LINE_NO:270
  Attacker04.ForceRefTo(Attacker04Marker.GetReference().PlaceActorAtMe(AttackerBase, 0, None, False, False, True, None, True) as ObjectReference) ; #DEBUG_LINE_NO:271
  Attacker05.ForceRefTo(Attacker05Marker.GetReference().PlaceActorAtMe(AttackerBase, 0, None, False, False, True, None, True) as ObjectReference) ; #DEBUG_LINE_NO:272
EndFunction

ActorBase Function SetupFactionActorBase(Float FactionNumber)
  If FactionNumber == 1.0 ; #DEBUG_LINE_NO:277
    Return TestFWEncMinutemen ; #DEBUG_LINE_NO:278
  ElseIf FactionNumber == 2.0 ; #DEBUG_LINE_NO:279
    Return TestFWEncBoS ; #DEBUG_LINE_NO:280
  ElseIf FactionNumber == 3.0 ; #DEBUG_LINE_NO:281
    Return TestFWEncRR ; #DEBUG_LINE_NO:282
  ElseIf FactionNumber == 4.0 ; #DEBUG_LINE_NO:283
    Return TestFWEncInstitute ; #DEBUG_LINE_NO:284
  ElseIf FactionNumber == 5.0 ; #DEBUG_LINE_NO:285
    Return TestFWEncRaider ; #DEBUG_LINE_NO:286
  ElseIf FactionNumber == 6.0 ; #DEBUG_LINE_NO:287
    Return TestFWEncSuperMutant ; #DEBUG_LINE_NO:288
  ElseIf FactionNumber == 7.0 ; #DEBUG_LINE_NO:289
    Return TestFWEncGunner ; #DEBUG_LINE_NO:290
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetFactionOverrrides()
  If _AttackerOverride >= 0 ; #DEBUG_LINE_NO:295
    MyLocation.getLocation().SetKeywordData(FWAttacker, _AttackerOverride as Float) ; #DEBUG_LINE_NO:296
  EndIf ; #DEBUG_LINE_NO:
  If _DefenderOverride >= 0 ; #DEBUG_LINE_NO:298
    MyLocation.getLocation().SetKeywordData(FWOwner, _DefenderOverride as Float) ; #DEBUG_LINE_NO:299
  EndIf ; #DEBUG_LINE_NO:
EndFunction
