function cast(Caster, Target, Regen, Sta)
	AddSpellBonus(Target, 602, Regen)
	AddSpellBonus(Target, 1, Sta)
end

function remove(Caster, Target)
	RemoveSpellBonus(Target)
end