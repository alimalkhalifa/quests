###########
# Helper script
# This will give raiding testers the opportunity to gear up bots pretty easily
# TODO: 
# - refactor code in separate methods
# - add generic loot generation (ie: CreateWisCasterJewelry(), CreateMeleeDPSJewelry() etc etc)
# - handle equipment level (ie: [lowlevel rogue], [highlevel shaman] etc)
#
############

sub EVENT_SAY
{
	if ($text=~/hail/i)
	{
		quest::say("I am the Bot Equipment provider and will only work for bot raiding beta-testing. Please provide me with a valid class name and in exchange I'll give you a full Bot equipment starter set.");
	}
	if ($text=~/cleric/i)
	{
		# Sol Ro armor
		quest::summonitem(4921);
		quest::summonitem(4922);
		quest::summonitem(4923);
		quest::summonitem(4924);
		quest::summonitem(4925);
		quest::summonitem(4925);
		quest::summonitem(4926);
	# Paw of Opolla
	quest::summonitem(13730);
	# Aegis of Life
	quest::summonitem(12238);
	}
	if ($text=~/enchanter/i)
	{
		# Incandescent Sol Ro armor
		quest::summonitem(2350);
		quest::summonitem(2351);
		# Incandescant Wand
		quest::summonitem(6334);
		# Robe of the Ishva
	quest::summonitem(1357);
	# Stein of Moggok
	quest::summonitem(6359);
	}
	if ($text=~/rogue/i)
	{
		# Burning Rapier
		quest::summonitem(7041);
		# Gloomwater Harpoon
	quest::summonitem(7407);
	# Ravenscale armor
	quest::summonitem(3168);
	quest::summonitem(3167);
	quest::summonitem(3172);
	quest::summonitem(3169);
	quest::summonitem(3169);
	quest::summonitem(3164);
	quest::summonitem(3166);
	quest::summonitem(3161);
	quest::summonitem(3170);
	quest::summonitem(3171);
	quest::summonitem(3162);
	quest::summonitem(3163);
	quest::summonitem(3165);
	# FBSS
	quest::summonitem(1365);
	}
	if ($text=~/shaman/i)
	{
		# Totemic Armor
		quest::summonitem(4941);
	quest::summonitem(4945);
	quest::summonitem(4945);
	quest::summonitem(4946);
	quest::summonitem(4948);
	quest::summonitem(4942);
	quest::summonitem(4944);
	quest::summonitem(4947);
	quest::summonitem(4943);
	# Paw of Opolla
	quest::summonitem(13730);
	# Testament of Vanear
	quest::summonitem(13991);
	}
	if ($text=~/wizard/i)
	{
		# Acumen Mask
		quest::summonitem(2366);
		# Tishan�s Kilt
	quest::summonitem(2365);
	# Staff of the Wheel
	quest::summonitem(14360);
	# Flowing Black Robe
	quest::summonitem(1320);
	# Stein of Moggok
	quest::summonitem(6359);
	}
	if ($text=~/warrior/i)
	{
		# SSOY x2
		quest::summonitem(5500);
		quest::summonitem(5500);
		# Rubicite Armor
		quest::summonitem(4172);
		quest::summonitem(4169);
	quest::summonitem(4169);
	quest::summonitem(4164);
	quest::summonitem(4166);
	quest::summonitem(4163);
	quest::summonitem(4170);
	quest::summonitem(4171);
	quest::summonitem(4161);
	quest::summonitem(4162);
	quest::summonitem(4165);
	# FBSS
	quest::summonitem(1365);
	}
	if ($text=~/monk/i)
	{
		# Wu�s armor
		quest::summonitem(25716);
	quest::summonitem(25721);
	quest::summonitem(25718);
	quest::summonitem(1192);
	quest::summonitem(25720);
	quest::summonitem(25717);
	quest::summonitem(25725);
	quest::summonitem(25722);
	quest::summonitem(25719);
	quest::summonitem(25723);
	quest::summonitem(25726);
	quest::summonitem(25724);
	quest::summonitem(25724);
	# FBSS
	quest::summonitem(1365);
	# Enameled Black Mace x2
	quest::summonitem(6401);
	quest::summonitem(6401);

	}
	if ($text=~/necromancer/i)
	{
		# Shadowbound Sol ro
		quest::summonitem(3317);
	quest::summonitem(3318);
	# Robe of Enshroudment
	quest::summonitem(1355);
			# Harvester
	quest::summonitem(5316);
	# Stein of Moggok
	quest::summonitem(6359);
	}
	if ($text=~/paladin/i)
	{
		# Armor of Ro
		quest::summonitem(3152);
	quest::summonitem(3150);
	quest::summonitem(3154);
	quest::summonitem(3156);
	quest::summonitem(3153);
	quest::summonitem(3153);
	quest::summonitem(3151);
	quest::summonitem(3155);
		# Ghoulbane
		quest::summonitem(5403);
		# Mistmoore Crested Shield
	quest::summonitem(9310);
	# FBSS
	quest::summonitem(1365);
	}
}