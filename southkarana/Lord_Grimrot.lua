function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my field of decay. Won't you be so kind as to attack me? I have need of more bodies to join my diseased legion. Try it, maybe you shall win and gain my trusty [Pestilence].");
	elseif(e.message:findi("pestilence")) then
		e.self:Say("My beloved scythe. Upon my death, my soul shall live withn her.  Such is the pact.");
	end
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Death awaits you, my foolhardy friend.");
	end
end

function event_death_complete(e)
	e.self:Say("You have won this round, but my soul shall find its way back to the Bloodsabers.");
end

-- END of FILE Zone:southkarana  ID:3312 -- Lord_Grimrot 

