function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome t' me humble shop, then! I offer fine items fashioned from the skins o' the beasts o' Everfrost, I do. Leather is me specialty and I can always use the [extra hides], ye know.");
	elseif(e.message:findi("extra hides")) then
		e.self:Say("I'll offer any hunter some used tattered armor fer every polar bear skin I'm brought. I'm sure even ye can wrestle the skins from the backs o' the polar bear cubs, no?");
	elseif(e.message:findi("second job")) then
		e.self:Say("I have seen the warriors bringing in items called 'wrath orc wristbands'. Apparently they find them upon the lifeless bodies of the snow orc troopers. They are made from a skin I have yet to find. I will gladly reward you with either a Rawhide Tunic or Leggings or even perhaps Leather Gloves. All I ask for are Two Wrath Orc Wristbands.");
	elseif(e.message:findi("mammoth hide parchment")) then
		e.self:Say("Oh, for Jinkus? Here you go.");		--Text made up
		e.other:SummonItem(12621); 							--Mammoth Hide Parchment
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13761})) then
		e.self:Say("This is much appreciated! Please accept this used armor in return and a gold piece as well, fer yer troubles. Ye've done well! I may have a [second job] fer ye, if ye like?");
		e.other:SummonItem(eq.ChooseRandom(2131, 2134, 2127, 2126, 2129, 2125, 2133));
		e.other:Ding();
		e.other:Faction(213, 5);
		e.other:Faction(361, 5);
		e.other:Faction(294, 5);
		e.other:Faction(275, -5);
		e.other:AddEXP(150);
		e.other:GiveCash(0,0,1,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12223, item2 = 12223})) then
		e.self:Say("Fine work, Hunter!! As yer reward, please accept this item which I've fashion'd fer ye.");
		e.other:SummonItem(eq.ChooseRandom(2034, 2171, 2164));
		e.other:Ding();
		e.other:Faction(213, 5);
		e.other:Faction(361, 5);
		e.other:Faction(294, 5);
		e.other:Faction(275, -5);
		e.other:AddEXP(150);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
