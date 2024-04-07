--[[
    Script Name    : Spells/Fighter/Brawler/StanceBrawlersStance.lua
    Script Author  : LordPazuzu
    Script Date    : 9/10/2023
    Script Purpose : 
                   : 
--]]



function cast(Caster, Target, Off, Def)
    Level = GetLevel(Caster)
    SpellLevel = 16
    Mastery = SpellLevel + 10
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
            else LvlBonus = Mastery - SpellLevel
    end
    MasteryBonus = LvlBonus * 0.1
    DefBonus = Def + MasteryBonus
    
    AddSkillBonus(Target, GetSkillIDByName("Slashing"), Off)
    AddSkillBonus(Target, GetSkillIDByName("Piercing"), Off)
    AddSkillBonus(Target, GetSkillIDByName("Crushing"), Off)
    AddSkillBonus(Target, GetSkillIDByName("Defense"), DefBonus)
	AddSkillBonus(Target, GetSkillIDByName("Deflection"), DefBonus)
    
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)
    
end