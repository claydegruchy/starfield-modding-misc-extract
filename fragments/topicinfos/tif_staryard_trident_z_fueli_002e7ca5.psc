ScriptName Fragments:TopicInfos:TIF_Staryard_Trident_Z_Fueli_002E7CA5 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property VelocityRemoved Auto Const
Potion Property VelocityBlue Auto Const
Potion Property VelocityGreen Auto Const
Potion Property VelocityOrange Auto Const
Potion Property VelocityRed Auto Const
Potion Property VelocityTeal Auto Const
Potion Property VelocityViolet Auto Const
Potion Property VelocityYellow Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityBlue as Form) >= 1 ; #DEBUG_LINE_NO:11
    VelocityRemoved.Mod(1.0) ; #DEBUG_LINE_NO:12
    Game.GetPlayer().RemoveItem(VelocityBlue as Form, 1, False, None) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityGreen as Form) >= 1 ; #DEBUG_LINE_NO:17
    VelocityRemoved.Mod(1.0) ; #DEBUG_LINE_NO:18
    Game.GetPlayer().RemoveItem(VelocityGreen as Form, 1, False, None) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityOrange as Form) >= 1 ; #DEBUG_LINE_NO:23
    VelocityRemoved.Mod(1.0) ; #DEBUG_LINE_NO:24
    Game.GetPlayer().RemoveItem(VelocityOrange as Form, 1, False, None) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityRed as Form) >= 1 ; #DEBUG_LINE_NO:29
    VelocityRemoved.Mod(1.0) ; #DEBUG_LINE_NO:30
    Game.GetPlayer().RemoveItem(VelocityRed as Form, 1, False, None) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityTeal as Form) >= 1 ; #DEBUG_LINE_NO:35
    VelocityRemoved.Mod(1.0) ; #DEBUG_LINE_NO:36
    Game.GetPlayer().RemoveItem(VelocityTeal as Form, 1, False, None) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityViolet as Form) >= 1 ; #DEBUG_LINE_NO:41
    VelocityRemoved.Mod(1.0) ; #DEBUG_LINE_NO:42
    Game.GetPlayer().RemoveItem(VelocityViolet as Form, 1, False, None) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
  If VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityYellow as Form) >= 1 ; #DEBUG_LINE_NO:47
    VelocityRemoved.Mod(1.0) ; #DEBUG_LINE_NO:48
    Game.GetPlayer().RemoveItem(VelocityYellow as Form, 1, False, None) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndFunction
