function event_combat(e)
	if(e.joined == true) then
		e.self:Say( eq.ChooseRandom( ("Come.... come and join Tolon!"),
									 ("Never fear.... Smyth issss...Here!")
									 ) );
	end
end

function event_death_complete(e)
	e.self:Say("Bertoxxuloussss.... shall find you.");
end