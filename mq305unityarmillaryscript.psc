ScriptName MQ305UnityArmillaryScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnLoad()
  (Self.GetRef() as armillaryscript).BuildCompleteArmillary() ; #DEBUG_LINE_NO:4
EndEvent
