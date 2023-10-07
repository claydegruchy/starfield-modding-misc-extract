ScriptName REAssaultQuestScript Extends Quest
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
Faction Property REAssaultFactionFriend Auto
ActorValue Property REAssaultRole Auto

;-- Functions ---------------------------------------

Function InitAssault()
  If assaultComplete ; #DEBUG_LINE_NO:43
    Return  ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
  Attacker01Act = Attacker01Links.GetActorRef() ; #DEBUG_LINE_NO:48
  Attacker02Act = Attacker02Links.GetActorRef() ; #DEBUG_LINE_NO:49
  Attacker03Act = Attacker03Links.GetActorRef() ; #DEBUG_LINE_NO:50
  Attacker04Act = Attacker04Links.GetActorRef() ; #DEBUG_LINE_NO:51
  Attacker05Act = Attacker05Links.GetActorRef() ; #DEBUG_LINE_NO:52
  Defender01Act = Defender01Links.GetActorRef() ; #DEBUG_LINE_NO:53
  Defender02Act = Defender02Links.GetActorRef() ; #DEBUG_LINE_NO:54
  Defender03Act = Defender03Links.GetActorRef() ; #DEBUG_LINE_NO:55
  Defender04Act = Defender04Links.GetActorRef() ; #DEBUG_LINE_NO:56
  Defender05Act = Defender05Links.GetActorRef() ; #DEBUG_LINE_NO:57
  If Attacker01Act != None ; #DEBUG_LINE_NO:60
    Attacker01Act.SetValue(REAssaultRole, 1.0) ; #DEBUG_LINE_NO:62
    Attacker01Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
  If Attacker02Act != None ; #DEBUG_LINE_NO:65
    Attacker02Act.SetValue(REAssaultRole, 1.0) ; #DEBUG_LINE_NO:67
    Attacker02Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
  If Attacker03Act != None ; #DEBUG_LINE_NO:70
    Attacker03Act.SetValue(REAssaultRole, 1.0) ; #DEBUG_LINE_NO:72
    Attacker03Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  If Attacker04Act != None ; #DEBUG_LINE_NO:75
    Attacker04Act.SetValue(REAssaultRole, 1.0) ; #DEBUG_LINE_NO:77
    Attacker04Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
  If Attacker05Act != None ; #DEBUG_LINE_NO:80
    Attacker05Act.SetValue(REAssaultRole, 1.0) ; #DEBUG_LINE_NO:82
    Attacker05Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:83
  EndIf ; #DEBUG_LINE_NO:
  If Defender01Act != None ; #DEBUG_LINE_NO:87
    Defender01Act.SetValue(REAssaultRole, 0.0) ; #DEBUG_LINE_NO:88
    Defender01Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:89
  EndIf ; #DEBUG_LINE_NO:
  If Defender02Act != None ; #DEBUG_LINE_NO:91
    Defender02Act.SetValue(REAssaultRole, 0.0) ; #DEBUG_LINE_NO:92
    Defender02Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
  If Defender03Act != None ; #DEBUG_LINE_NO:95
    Defender03Act.SetValue(REAssaultRole, 0.0) ; #DEBUG_LINE_NO:96
    Defender03Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:97
  EndIf ; #DEBUG_LINE_NO:
  If Defender04Act != None ; #DEBUG_LINE_NO:99
    Defender04Act.SetValue(REAssaultRole, 0.0) ; #DEBUG_LINE_NO:100
    Defender04Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:101
  EndIf ; #DEBUG_LINE_NO:
  If Defender05Act != None ; #DEBUG_LINE_NO:103
    Defender05Act.SetValue(REAssaultRole, 0.0) ; #DEBUG_LINE_NO:104
    Defender05Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:105
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartAssault()
  If Attacker01Act != None ; #DEBUG_LINE_NO:114
    Attacker01Act.SetValue(REAssaultRole, 2.0) ; #DEBUG_LINE_NO:116
    Attacker01Act.RemoveFromFaction(REAssaultFactionFriend) ; #DEBUG_LINE_NO:117
    Attacker01Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
  If Attacker02Act != None ; #DEBUG_LINE_NO:120
    Attacker02Act.SetValue(REAssaultRole, 2.0) ; #DEBUG_LINE_NO:122
    Attacker02Act.RemoveFromFaction(REAssaultFactionFriend) ; #DEBUG_LINE_NO:123
    Attacker02Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:124
  EndIf ; #DEBUG_LINE_NO:
  If Attacker03Act != None ; #DEBUG_LINE_NO:126
    Attacker03Act.SetValue(REAssaultRole, 2.0) ; #DEBUG_LINE_NO:128
    Attacker03Act.RemoveFromFaction(REAssaultFactionFriend) ; #DEBUG_LINE_NO:129
    Attacker03Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:130
  EndIf ; #DEBUG_LINE_NO:
  If Attacker04Act != None ; #DEBUG_LINE_NO:132
    Attacker04Act.SetValue(REAssaultRole, 2.0) ; #DEBUG_LINE_NO:134
    Attacker04Act.RemoveFromFaction(REAssaultFactionFriend) ; #DEBUG_LINE_NO:135
    Attacker04Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:136
  EndIf ; #DEBUG_LINE_NO:
  If Attacker05Act != None ; #DEBUG_LINE_NO:138
    Attacker05Act.SetValue(REAssaultRole, 2.0) ; #DEBUG_LINE_NO:140
    Attacker05Act.RemoveFromFaction(REAssaultFactionFriend) ; #DEBUG_LINE_NO:141
    Attacker05Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:142
  EndIf ; #DEBUG_LINE_NO:
  If Defender01Act != None ; #DEBUG_LINE_NO:146
    Defender01Act.RemoveFromFaction(REAssaultFactionFriend) ; #DEBUG_LINE_NO:148
    Defender01Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:149
  EndIf ; #DEBUG_LINE_NO:
  If Defender02Act != None ; #DEBUG_LINE_NO:151
    Defender02Act.RemoveFromFaction(REAssaultFactionFriend) ; #DEBUG_LINE_NO:153
    Defender02Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:154
  EndIf ; #DEBUG_LINE_NO:
  If Defender03Act != None ; #DEBUG_LINE_NO:156
    Defender03Act.RemoveFromFaction(REAssaultFactionFriend) ; #DEBUG_LINE_NO:158
    Defender03Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:159
  EndIf ; #DEBUG_LINE_NO:
  If Defender04Act != None ; #DEBUG_LINE_NO:161
    Defender04Act.RemoveFromFaction(REAssaultFactionFriend) ; #DEBUG_LINE_NO:163
    Defender04Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:164
  EndIf ; #DEBUG_LINE_NO:
  If Defender05Act != None ; #DEBUG_LINE_NO:166
    Defender05Act.RemoveFromFaction(REAssaultFactionFriend) ; #DEBUG_LINE_NO:168
    Defender05Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:169
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CompleteAssault()
  assaultComplete = True ; #DEBUG_LINE_NO:179
  If Attacker01Act != None ; #DEBUG_LINE_NO:182
    Attacker01Act.SetValue(REAssaultRole, 0.0) ; #DEBUG_LINE_NO:183
  EndIf ; #DEBUG_LINE_NO:
  If Attacker02Act != None ; #DEBUG_LINE_NO:185
    Attacker02Act.SetValue(REAssaultRole, 0.0) ; #DEBUG_LINE_NO:186
  EndIf ; #DEBUG_LINE_NO:
  If Attacker03Act != None ; #DEBUG_LINE_NO:188
    Attacker03Act.SetValue(REAssaultRole, 0.0) ; #DEBUG_LINE_NO:189
  EndIf ; #DEBUG_LINE_NO:
  If Attacker04Act != None ; #DEBUG_LINE_NO:191
    Attacker04Act.SetValue(REAssaultRole, 0.0) ; #DEBUG_LINE_NO:192
  EndIf ; #DEBUG_LINE_NO:
  If Attacker05Act != None ; #DEBUG_LINE_NO:194
    Attacker05Act.SetValue(REAssaultRole, 0.0) ; #DEBUG_LINE_NO:195
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:198
  If Attacker01Act != None ; #DEBUG_LINE_NO:200
    Attacker01Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:201
  EndIf ; #DEBUG_LINE_NO:
  If Attacker02Act != None ; #DEBUG_LINE_NO:203
    Attacker02Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:204
  EndIf ; #DEBUG_LINE_NO:
  If Attacker03Act != None ; #DEBUG_LINE_NO:206
    Attacker03Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:207
  EndIf ; #DEBUG_LINE_NO:
  If Attacker04Act != None ; #DEBUG_LINE_NO:209
    Attacker04Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:210
  EndIf ; #DEBUG_LINE_NO:
  If Attacker05Act != None ; #DEBUG_LINE_NO:212
    Attacker05Act.EvaluatePackage(False) ; #DEBUG_LINE_NO:213
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CleanupAssault()
  Attacker01Act = None ; #DEBUG_LINE_NO:218
  Attacker02Act = None ; #DEBUG_LINE_NO:219
  Attacker03Act = None ; #DEBUG_LINE_NO:220
  Attacker04Act = None ; #DEBUG_LINE_NO:221
  Attacker05Act = None ; #DEBUG_LINE_NO:222
  Defender01Act = None ; #DEBUG_LINE_NO:223
  Defender02Act = None ; #DEBUG_LINE_NO:224
  Defender03Act = None ; #DEBUG_LINE_NO:225
  Defender04Act = None ; #DEBUG_LINE_NO:226
  Defender05Act = None ; #DEBUG_LINE_NO:227
EndFunction
