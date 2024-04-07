--[[
    Script Name    : Spells/Fighter/Brawler/ShoulderCharge.lua
    Script Author  : LordPazuzu
    Script Date    : 9/2/2023
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, DmgType, DmgLow, DmgHigh)

    Level = GetLevel(Caster)
    SpellLevel = 13
    Mastery = SpellLevel + 10
    StatBonus = GetStr(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    
    DmgBonus = LvlBonus + StatBonus
    MaxDmg = math.floor(DmgBonus) * 2 + DmgHigh
    MinDmg = math.floor(DmgBonus) * 2 + DmgLow
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
    AddControlEffect(Target, 4 )
end

function remove(Caster, Target)
    RemoveControlEffect(Target, 4)

end

