ScriptName Fragments:TopicInfos:TIF_SE_Player_ZW09_0008907E Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Book Property Pse_zw09_Diamond_Warranty Auto Const mandatory
Quest Property PSE_Player_ZW09 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.getplayer().RemoveItem(Game.GetCredits() as Form, 100000, False, None) ; #DEBUG_LINE_NO:8
  Game.getplayer().AddItem(Pse_zw09_Diamond_Warranty as Form, 1, False) ; #DEBUG_LINE_NO:9
  PSE_Player_ZW09.setstage(300) ; #DEBUG_LINE_NO:10
EndFunction
