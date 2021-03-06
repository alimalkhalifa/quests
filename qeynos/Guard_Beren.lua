function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want? Are you friends with that lousy [dwarf]?! You had better not be unless you want to spend the rest of the week bleeding!");
	elseif(e.message:findi("dwarf")) then
		e.self:Say("That dwarf, Trumpy, who Corshin here thinks is a friend of Commander Bayle's, keeps pestering my poor brother Faren. I have had just about enough of him and [his kind].");
	elseif(e.message:findi("his kind")) then
		e.self:Say("You know... thieves, drunks and murderers. Decent folk just don't have a chance anymore.");
	elseif(e.message:findi("faren")) then
		e.self:Say("My brother Faren is a fine fisherman just like our father was. He fishes out there on the East Dock just about every day.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 24) then
		e.self:Say("How are they biting, little brother?");
		eq.signal(1159,1);
	end
end

function event_signal(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	if(e.signal == 1 and xloc == -145 and yloc == -247) then
		e.self:Say("Yes, sir!");
	elseif(e.signal == 2) then
		e.self:Say("Don't you worry about him! I will take care of [Trumpy] Irontoe once and for all!");
	elseif(e.signal == 5 and xloc == -145 and yloc == -247) then
		e.self:Say("Heh, speak for yourself, Corshin. That one looks like a troublemaker to me.");
	end
end

function event_combat(e)
	if(e.joined) then
		local racesplural = require("races_plural");

		e.self:Say( eq.ChooseRandom( string.format("It's %s like you who have ruined your own lands. You'll not ruin mine!",racesplural.GetPlural(e.other:GetRace())), 
									 string.format("%s have no place in our realm!",racesplural.GetPlural(e.other:GetRace())),
									 string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())),
									 string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace()))
									)
				   );
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end