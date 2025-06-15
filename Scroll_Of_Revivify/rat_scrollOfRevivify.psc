Scriptname rat_scrollOfRevivify extends activemagiceffect

ObjectReference Property sovngardeContainer  Auto ; rat_revivifyContainer 010012C9
Armor Property Amulet  Auto ; ReligiousZenitharCommerce
VisualEffect Property Visual  Auto ; DA10ReanimateTargetFX
Sound Property Thunder  Auto ; MAGShockFFFireSD

Event OnEffectStart(Actor akTarget, Actor akCaster)
    If (akTarget.IsDead())
        Visual.Play(akTarget) ; Start visual effect
        akTarget.EnableAI(false) ; Prevent target from walking around before we're done
        akTarget.RemoveAllItems(sovngardeContainer, true, true) ; Move items to another container as resurrect resets inventory
        Utility.Wait(1.0) ; RemoveAllItems() is non-latent
        Thunder.Play(akTarget) ; Play sound
        akTarget.Resurrect()
        akTarget.RemoveAllItems() ; Clear resurrected actors default inventory
        Utility.Wait(1.0)
        sovngardeContainer.RemoveAllItems(akTarget, true, true) ; Move items back to actor
        Utility.Wait(1.0)
        akTarget.EnableAI() ; Re-enable target AI
        akTarget.AddItem(Amulet, 1) ; Makes actor re-equip clothes
        akTarget.RemoveItem(Amulet, 1)
        Visual.Stop(akTarget) ; Stop visual effect
    EndIf
EndEvent
