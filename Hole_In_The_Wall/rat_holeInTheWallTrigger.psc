Scriptname rat_holeInTheWallTrigger extends ObjectReference

Actor Property Alduin  Auto ; MQ101AlduinREF (MQ101Alduin)
ObjectReference Property wall  Auto ; dunCGTowerHole01REF (DragonTowerHole01)

Bool hasTriggered = false

Event OnTriggerEnter(ObjectReference akTriggerRef)
    If (akTriggerRef == Game.GetPlayer() && hasTriggered == false)
        hasTriggered = true
        Alduin.Disable(true)
        wall.Disable(true)
    EndIf
EndEvent
