function event_death_complete(e)
	eq.set_global("sirran","7",3,"M20");
	eq.spawn2(71058,0,0,-960,-1037,1093,128);
end

function event_cast_begin(e)
	if(e.spell:ID() == 982) then
		e.self:Shout(e.self:GetTarget():GetName() .. "!");
	end
end
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
