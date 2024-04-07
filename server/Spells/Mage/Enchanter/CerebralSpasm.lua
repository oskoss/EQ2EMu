--[[
    Script Name    : Spells/Mage/Enchanter/CerebralSpasm.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.26 09:11:22
    Script Purpose : 
                   : 
--]]

--[[ Info from spell_display_effects (remove from script when done)

*Applies Migraine on termination.
	*Inflicts 24 - 32 mental damage on target
*Inflicts 8 - 10 mental damage on target instantly and every 6 seconds

--]]


function cast(Caster, Target, DoTType, DoTMin, DoTMax, DDType, DDMin, DDMax)
    damage(Caster, Target, DoTType, DoTMin, DoTMax)
    AddTimer(Caster, 23850, "migraine")
end

function tick(Caster, Target, DoTType, DoTMin, DoTMax)
    damage(Caster, Target, DoTType, DoTMin, DoTMax)
end

function damage(Caster, Target, DoTType, DoTMin, DoTMax, DDType, DDMin, DDMax)
    Level = GetLevel(Caster)
    SpellLevel = 15
    Mastery = SpellLevel + 10
    StatBonus = GetInt(Caster) / 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    DmgBonus = LvlBonus + StatBonus
    MaxDmg = math.floor(DmgBonus) * 2 + DoTMax
    MinDmg = math.floor(DmgBonus) * 2 + DoTMin
    
    SpellDamage(Target, DoTType, MinDmg, MaxDmg)
    
end

function migraine(Caster, Target, DoTType, DoTMin, DoTMax, DDType, DDMin, DDMax)
    Level = GetLevel(Caster)
    Mastery = SpellLevel + 15
    StatBonus = GetInt(Caster) / 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    DmgBonus = LvlBonus + StatBonus
    DDMaxDmg = math.floor(DmgBonus) * 2 + DDMax
    DDMinDmg = math.floor(DmgBonus) * 2 + DDMin
    
    	Spell = GetSpell(5505, GetSpellTier())
    	SetSpellDataIndex(Spell, 0, DDType)
		SetSpellDataIndex(Spell, 1, DDMinDmg)
		SetSpellDataIndex(Spell, 2, DDMaxDmg)
		CastCustomSpell(Spell, Caster, Target)
end



function remove(Caster, Target)

end


