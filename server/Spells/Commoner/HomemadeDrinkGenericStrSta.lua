function cast(Caster, Target, Regen, Buff)
	AddSpellBonus(Target, 603, Regen)
	AddSpellBonus(Target, 0, Buff)
	AddSpellBonus(Target, 1, Buff)
end

function remove(Caster, Target)
	RemoveSpellBonus(Target)
end