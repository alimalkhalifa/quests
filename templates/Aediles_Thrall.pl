############################################
# ZONE: All Starter Zones, PoK and Bazaar
# DATABASE: AX_CLASSIC Custom
# LAST EDIT DATE: Febuary 4th, 2009 (Angelox)
# VERSION: 1.0
# DEVELOPER: Congdar
#
## REVISED BY ANGELOX!
## My idea is to make things easier for the player to get the bots.
## By Level 10 you should have your full group
## for less plat and newbee drobs
## Original quest is renamed "Aediles_Thrall.pl.ORG" incase you prefer it.
#
# *** NPC INFORMATION ***
#
# NAME: Aediles Thrall
# TYPE: NPC
# RACE: Dwarf
# LEVEL: 71
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Bat Wings ID-13068
# Spider Legs ID-13417
# Cracked Staff ID-6018
# Orc Ribcage  ID-19551
# Silver Ring ID-10038
# Hunting bow ID-8011
# Flag updates for quest global bot_spawn_limit
#
#
# *** QUESTS INVOLVED IN ***
#
# 1 - Custom Quest - Buying Slaves(bots)
#
#
# *** QUESTS AVAILABLE TO ***
#
# 1 - Anyone meeting level requirements
#
#
############################################

# Some global settings for the quest.  Set them to your preferred levels and plat costs
# Level options for when a character can acquire more slaves(bots)
my $firstbotlevel  = 1;
my $firstbotcost   = 0;
my $secondbotlevel = 1;
my $secondbotcost  = 0;
my $thirdbotlevel  = 1;
my $thirdbotcost   = 0;
my $fourthbotlevel = 1;
my $fourthbotcost  = 0;
my $fifthbotlevel  = 1;
my $fifthbotcost   = 0;
my $nineteenbotlevel = 1;
my $nineteenbotcost  = 0;
my $twentyninebotlevel = 1;
my $twentyninebotcost = 0;
my $fortyfourbotlevel = 1;
my $fortyfourbotcost  = 0;
my $sixtyfourbotlevel = 1;
my $sixtyfourbotcost  = 0;

# They have enough for one group, now they start creating raid bots up to the quest::spawnbotcount() limit.
# A rule setting EQOffline:SpawnBotCount of 11 is two full groups including you.
# my $nextbotlevel   = 340;
# my $nextbotcost    = 1000;
# my $nextextracost  = 2000;

sub EVENT_SAY {
   if(defined $qglobals{bot_spawn_limit} && (quest::spawnbotcount() >= $qglobals{bot_spawn_limit})) {
	 if(($text=~/Gief/i)){
		quest::say("Here ya go, one more companion!");
		$success = $qglobals{bot_spawn_limit}+1;
         quest::setglobal("bot_spawn_limit", $success, 5, "F");
         $client->Message(6,"You receive a character flag!");
         $client->Message(6,"You can now create and spawn an Individual! See: '#bot help create' and '#bot spawn' commands.");
         $client->Message(6,"You have $qglobals{bot_spawn_limit} out of quest::spawnbotcount() possible Individuals.");
	 }
         if($text=~/show/i) {
            quest::say("Well, ya gotta tell'm what ya [want], and they don't know everything!");
         }
         if(($text=~/want/i) || ($text=~/command/i)) {
            quest::say("They answer these commands that start with #bot (fer example, '#bot create'); [create], [delete], [list], [spawn], [group add], [group remove], [group order]. Want to [hear more] or need me to explain [macros]?");
         }
         if(($text=~/create/i) || ($text=~/spawn/i)) {
            quest::say("First you have to create the bot; '#bot help create' will show you related class and race numbers you will have to provide, and you have to make a name - for example, this command will make you a female cleric, high elf with the name of Sissy; '#bot create Sissy 2 5 female'. If the creation is successful, you will see a message; Bot created: and it's uniqe id a six-digit number like 346045, you'll need this id for spawning the bot in #bot spawn'");
         }
         if(($text=~/list/i)|| ($text=~/inventory/i)) {
            quest::say("'#bot list' will show you what bots are yours and their ID numbers.");
            quest::say("'#bot inventory list', will show you what the targeted bot has on, and their ID numbers.");
            quest::say("'#bot inventory remove [slotid]' wil remove the item at the given slot in the inventory of the targetted bot.");
         }
         if($text=~/delete/i) {
            quest::say("#bot delete will completely destroy forever the targeted bot and all its items, so be careful with this one.");
         }
         if($text=~/group add/i) {
            quest::say("Target the bot you spawned and use '#bot group add' so he will join your group.");
         }
         if($text=~/group remove/i) {
            quest::say("Target the bot and use '#bot group remove' will remove it from the group and it will die.");
         }
         if($text=~/group order/i) {
            quest::say("'#bot group order' followed by 'follow', 'guard' or 'attack (target)' and the bots will do as told.");
         }
         if($text=~/hear more/i) {
            quest::say("Ok, but ya gots ta remember to start with #bot when ya try the command (fer example'#bot update'); here's some more; [inventory list], [inventory remove], [update] [group summon], [summon], [raid], and I [got more] too!");
         }
         if($text=~/summon/i) {
            quest::say("'#bot summon' will summon one targeted bot to you.");
            quest::say("'#bot group summon' summons all your grouped bots to you");
	    quest::say("'#bot corpse summon' Necromancers will summon your corpse for resurrect.");
         }
         if($text=~/update/i) {
            quest::say("Enter '#bot update' when you gain a level, so the bot ups his level too");
         }
         if($text=~/raid/i) {
            quest::say(" You can also form multiple groups of bots and for your own raids, '#bot raid [commands]' has a whole slew of more commands. I might teach you those later, but '#bot raid help' will show help.");
         }
         if($text=~/got more/i) {
            quest::say("These commands are for special spells or skills you want the bot to use; [ai mez], [picklock], [cure], [track], [target calm], [evac], [resurrectme], [corpse summon], [sow], [invis],[levitate], [resist], [shrinkme], [endureb], [charm],[gate], [runeme]");
         }
         if($text=~/ae mez/i) {
            quest::say("'#bot ai mez' will mez your target, If you're grouped with an enchanter.");
         }
         if($text=~/picklock/i) {
            quest::say("For '#bot picklock', You must have a targeted rogue bot in your group and be right on the door.");
         }
         if($text=~/cure/i) {
            quest::say("#bot cure has the following options (If you use a cleric with the right level); poison, disease, curse, and blindness.");
         }
         if($text=~/track/i) {
            quest::say("'#bot track' is for looking at mobs in the zone a ranger has rare tracking oprion.");
         }
         if($text=~/calm/i) {
            quest::say("'#bot target calm' is pacify spell for mob control");
         }
         if($text=~/evac/i) {
            quest::say("'#bot evac' will transport your pc group to safe location in the current zone.");
         }
         if($text=~/resurrectme/i) {
            quest::say("#bot resurrectme is so your bot cleric will rez you.");
         }
         if($text=~/sow/i) {
            quest::say("'#bot sow' for bot class that can sow, Druid can also sow wolf, and sow indoors when she gets the right level");
         }
         if($text=~/invis/i) {
            quest::say("'#bot invis' will provide you with invisiblity (must have proper class in group)");
         }
         if($text=~/levitate/i) {
            quest::say("'#bot levitate' gives you levitation (must have proper class in group)");
         }
         if($text=~/resist/i) {
            quest::say("For '#bot resist', the bot wil ask you which restist you want (must have proper class in group)");
         }
         if($text=~/shrinkme/i) {
            quest::say("'#bot shrinkme' You need a Shaman for this, he'll make you smaller");
         }
         if($text=~/endureb/i) {
            quest::say("'#bot endureb' You won't need to hold your breath under water (must have proper class in group)");
         }
         if($text=~/charm/i) {
            quest::say(" There's '#bot charm' and there's '#bot dire charm', these are for turning the enemy into your bot's pet. Be sure to remove the bots pet first with '#bot pet remove'. ");
         }
         if($text=~/gate/i) {
            quest::say("'#bot gate' works with a Druid or a Wizard in your group.");
         }
         if($text=~/runeme/i) {
            quest::say("'#bot runeme', your Enchanter Bot cast Rune spell on you");
         }
        if($text=~/macro/i) {
            quest::say("A macro will make your bot command always be ready to use with a click of your mouse, on your keyboard press the <alt> and the <m> keys- that will bring up your [action] window.");
         }
         if($text=~/action/i) {
            quest::say("Your action window has four tabs, you need the fourth one called '[Socials] Page', another way to get to it, is with keyboard strokes <ctrl> and <o>");
         }
         if($text=~/socials/i) {
            quest::say("When you get to the Socials Page, click on the '>' [button] tell you find and empty page.");
         }
         if($text=~/button/i) {
            quest::say("Right-click on an empty button, that will bring up your 'Edit Social' window. Wanna see an [example]?");
         }
         if($text=~/example/i) {
            quest::say("Okay, in the Edit Social window, you'll see six spaces, one for the name of the button (Social Name), and five more that will take a command on each line. Do you want to see a [single] command or a [combo] of commands? ");
         }
         if($text=~/single/i) {
            quest::say("I'll use the bot attack command for this one; for the first line under 'Social Name' put in the label 'Attack', then you only need one more line in one of the five larger spaces, type in '#bot group order attack', then click the <accept> button.");
            quest::say("When you zone or camp out, these macros will be saved with your character.");
         }
         if($text=~/combo/i) {
            quest::say("For this combo, I'll show you how to [spawn] a bot, then add him to your group.");
            quest::say("For 'Social Name', you can call it the class it is, this will be called 'Cleric'.");
            quest::say("You'll need all five remaining comand spaces, and for a bot named Sissy would look like this;");
            quest::say("Line one '#bot spawn Sissy'");
            quest::say("Line two (you need to make a pause, or next command will be over looked); '/pause 4'");
	    quest::say("Line three; '/target Sissy'");
            quest::say("Line four; '/pause 4'");
	    quest::say("Line five; '#bot group add'");
            quest::say("Click on the <accept> button and you're ready");
         }
         if($text=~/assistance/i) {
            quest::say("I can help ya with [commands] or [macros].");
         }
          if($text=~/bot/i) {
            quest::say("A bot is another name we give to your NPC helpers or Mercenaries. You can use them so you don't have to venture alone.");
         }
           if(($ulevel >= $firstbotlevel) && ($qglobals{bot_spawn_limit} <= 0)) {
 #        quest::settimer("face", 25);
         if($text=~/Hail/i) {
            quest::say("Hey der youngster.  Lookin' fer a bit o' [help] with yer adventurin'?");
         }
         if($text=~/Help/i) {
            quest::emote("looks around the room and pauses a few seconds");
            quest::say("Well, I kin sell ye a [product] ye can't find no place else.");
         }
         if($text=~/Product/i) {
            quest::emote("looks around the room again");
            quest::say("Shhh, i'm involved in wut I like ta call A.I.D., I kin [AID] ye in yer adventurin'");
         }
         if($text=~/AID/i) {
            quest::emote("looks around the room again");
            quest::say("It be 'Acquired Individuals Delivery' and it means I kin supply ye with [Individuals].");
         }
         if($text=~/Individuals/i) {
            quest::emote("looks around the room again");
            quest::say("Shhh, not too loud... I kin deliver ye an Individual if yer [interested]?");
         }
         if($text=~/Interested/i) {
            quest::say("Let me tell ye, keepin' up a supply o' Individuals can be a costly endeavor and so's I kin feed 'em I need ye ta be collectin' up sum [supplies] fer me.");
         }
         if(($text=~/Supplies/i) && ($race eq 'Froglok')) {
            quest::say("The Individual will cost ye $firstbotcost platinum pieces an' 4 small mosquito wings.");
	    return;
         }
         if(($text=~/Supplies/i) && ($race eq 'Iksar')) {
            quest::say("The Individual will cost ye $firstbotcost platinum pieces an' 4 loose scales.");
	    return;
         }
         if(($text=~/Supplies/i) && ($race eq 'Dark Elf')) {
            quest::say("The Individual will cost ye $firstbotcost platinum pieces an' 4 rat whiskers.");
	    return;
         }
         if(($text=~/Supplies/i) && ($race eq 'Vah Shir')) {
            quest::say("The Individual will cost ye $firstbotcost platinum pieces an' 4 rat furs.");
	    return;
         }
         if(($text=~/Supplies/i) && ($race eq 'Erudite')) {
            quest::say("The Individual will cost ye $firstbotcost platinum pieces an' 4 bone chips.");
	    return;
         }
         if($text=~/Supplies/i) {
            quest::say("The Individual will cost ye $firstbotcost platinum pieces an' 4 bat wings.");
         }
      }
      elsif(($ulevel >= $secondbotlevel) && ($qglobals{bot_spawn_limit} <= 1)) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
#spider legs, spiderling legs, fine mosquito wing, fire beetle leg, Sabertooth Cub Canine 
         if(($text=~/Supplies/i) && ($race eq 'Froglok')) {
            quest::emote("looks around the room");
            quest::say("The Individual will cost ye $secondbotcost platinum pieces an' 4 fine mosquito wings.");
	    return;
         }
         if(($text=~/Supplies/i) && ($race eq 'Iksar')) {
            quest::emote("looks around the room");
            quest::say("The Individual will cost ye $secondbotcost platinum pieces an' 4 Sabertooth Cub Canines.");
	    return;
         }
         if(($text=~/Supplies/i) && ($race eq 'Human')) {
            quest::emote("looks around the room");
            quest::say("The Individual will cost ye $secondbotcost platinum pieces an' 4 fire beetle legs.");
	    return;
         }
        if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $secondbotcost platinum an' 4 spider legs... heh, me likes spider legs!");
         }
      }
      elsif(($ulevel >= $thirdbotlevel) && ($qglobals{bot_spawn_limit} <= 2)) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
         if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $thirdbotcost platinum an' 2 cracked staffs... I can make me somore plat wit dose.");
         }
      }
      elsif(($ulevel >= $fourthbotlevel) && ($qglobals{bot_spawn_limit} <= 3)) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
         if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $fourthbotcost platinum an bring me any ribcage as long as it's not off a nasty 'ol rat!");
         }
      }
      elsif(($ulevel >= $fifthbotlevel) && ($qglobals{bot_spawn_limit} <= 4)) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
         if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $fifthbotcost platinum an' I wanna silver ring fer me lady.");
         }
      }
      elsif(($ulevel >= $nineteenbotlevel) && ($qglobals{bot_spawn_limit} <= 19)) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
         if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $nineteenbotcost platinum an' one o' dem hunting bows fer shootin' at dem runaway Individuals.");
         }
      }
      elsif(($ulevel >= $twentyninebotlevel) && ($qglobals{bot_spawn_limit} <= 29)) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
         if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $twentyninebotcost platinum an' da wife wants a nice Blue Diamond cause she tinks she's so cute!, and I gotta keep her happy!");
         }
      }
      elsif(($ulevel >= $fortyfourbotlevel) && ($qglobals{bot_spawn_limit} <=44 )) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
         if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $fortyfourbotcost platinum an' da wife wants to collect Fire Emerald Rings, so get me one a dose ... I gotta keep her happy!");
         }
      }
      elsif(($ulevel >= $sixtyfourbotlevel) && ($qglobals{bot_spawn_limit} <=64 )) {
         if($text=~/Hail/i) {
            quest::say("Ahh, a returnin' customer. Are ye [interested] in another Individual?");
         }
         if($text=~/Interested/i) {
            quest::emote("looks around the room");
            quest::say("Shhh, I kin deliver ye another Individual for $sixtyfourbotcost platinum - an' I needs flowstones, so I can pimp me an me wife's gear! Ill take any kind: Bloodflow, Starflow, Boneflow, Fireflow, Waterflow, Mudflow, Voidflow, Emberflow, Stormflow, Mossflow, or Shadowflow.");
         }
      }
      else {
         if (($text=~/Hail/i) && ($ulevel < $secondbotlevel)) {
            quest::say("Yer not ready yet, come back when you get level $secondbotlevel .");
            quest::say("Or maybe ya wants ta learn more about [commands] or [macros]?");}
         if (($text=~/Hail/i) && ($ulevel >= $secondbotlevel) && ($ulevel < $thirdbotlevel)) {
            quest::say("Yer not ready yet, come back when you get level $thirdbotlevel");
            quest::say("Or maybe ya wants ta learn more about [commands] or [macros]?");}
         if (($text=~/Hail/i) && ($ulevel >= $thirdbotlevel) && ($ulevel < $fourthbotlevel)) {
            quest::say("Yer not ready yet, come back when you get level $fourthbotlevel .");
            quest::say("Or maybe ya wants ta learn more about [commands] or [macros]?");}
         if (($text=~/Hail/i) && ($ulevel >= $fourthbotlevel) && ($ulevel < $fifthbotlevel)) {
            quest::say("Yer not ready yet, come back when you get level $fifthbotlevel .");
            quest::say("Or maybe ya wants ta learn more about [commands] or [macros]?");}
         if (($text=~/Hail/i) && ($ulevel >= $fifthbotlevel) && ($ulevel < $nineteenbotlevel)) {
            quest::say("Yer not ready yet, come back when you get level $nineteenbotlevel .");
            quest::say("Or maybe ya wants ta learn more about [commands] or [macros]?");}
         if (($text=~/Hail/i) && ($ulevel >= $nineteenbotlevel) && ($ulevel < $twentyninebotlevel)) {
            quest::say("Yer not ready yet, come back when you get level $twentyninebotlevel");
            quest::say("Or maybe ya wants ta learn more about [commands] or [macros]?");}
         if (($text=~/Hail/i) && ($ulevel >= $twentyninebotlevel) && ($ulevel < $fortyfourbotlevel)) {
            quest::say("Yer not ready yet, come back when you get level $fortyfourbotlevel .");
            quest::say("Or maybe ya wants ta learn more about [commands] or [macros]?");}
         if (($text=~/Hail/i) && ($ulevel >= $fortyfourbotlevel) && ($ulevel < $sixtyfourbotlevel)) {
            quest::say("Yer not ready yet, come back when you get level $sixtyfourbotlevel .");
            quest::say("Or maybe ya wants ta learn more about [commands] or [macros]?");}
         if (($text=~/Hail/i) && (($ulevel >= $sixtyfourbotlevel) && ($qglobals{bot_spawn_limit} >= 64 ))) {
            quest::say("Ya already got all da bots ya can get!");
            quest::say("Or maybe ya wants ta learn more about [commands] or [macros]?");}

         #if (($text=~/Hail/i) && ($ulevel >= $sixtyfourbotlevel) && ($ulevel < $nextbotlevel)) {
         #   quest::say("Yer not ready yet, come back when you get level $nextbotlevel .");
         #   quest::say("Or maybe ya wants ta learn more about [commands] or [macros]?");}
       }
    }
      else {
       if($text=~/Hail/i) {
         quest::say("eh? Mind yer own business, go away!");
      }
    }
 }
sub EVENT_ITEM {
#First bot items
my @itemz = (13068,13071,12405,12466,13064); #batwing, rat whiskers ,small mosquito wings, loose scale, rat fur
#Second bot items
	my $total = 0;
	foreach $xitem (@itemz) {
	  $total += $itemcount{$xitem}
	  }
my @itemy = (13417,13254,97171,13250,12426); #spider legs, spiderling legs, fine mosquito wing, fire beetle leg, Sabertooth Cub Canine
#Fourth bot items (third bot items are cracked staffs, you can find those anywhere)
	my $total2 = 0;
	foreach $witem (@itemy) {
	  $total2 += $itemcount{$witem}
	  }
my @itemx = (3402,6705,7162,17381,17388,19551,19552,19553,20185,20196,20412,55980); #These are all just assorted ribcages so almost any ribcage is valid, provided the mobs level is not too low.
	my $total3 = 0;
	foreach $vitem (@itemx) {
	  $total3 += $itemcount{$vitem}
	  }
   if($itemcount{200} == 1){
    quest::say("Nice to meets ya! Here's a little somtin' ta get ya started. It's me own lucky charm!");
    quest::say("You gots work ta do! Ya can have one of me Bots already, but I needs to see yer gonna stay wit me.");
    quest::say("Go get me 4 bat wings an one platinum piece - don't weigh me down with dat copper and silver or gold! Just one platium piece and da bat wings.");
    quest::summonitem(620);  #Aediles Mark of the Bots Charm
    return;
    }
   if(defined $qglobals{bot_spawn_limit} && (quest::spawnbotcount() > $qglobals{bot_spawn_limit})) {
      my $success = 0;
      if(($ulevel >= $firstbotlevel) && ($qglobals{bot_spawn_limit} <= 0)) {
         if(($platinum == $firstbotcost) && ($total >= 4)) { #First bot items
            $success = $qglobals{bot_spawn_limit}+1;
	    quest::say("Ya did okay! Now if ya need me to [show] you how to work these things, or want to learn how to make [macros] of your bot commands, Even if ya don't know how to [spawn] a bot, just say so.");
          }
	 else{
	     quest::say("Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
	   if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
              quest::givecash($copper, $silver, $gold, $platinum);
	  }
	}
      }
      elsif(($ulevel >= $secondbotlevel) && ($qglobals{bot_spawn_limit} <= 1)) {
         if(($platinum == $secondbotcost) && ($total2 >= 4)) { #Second bot items
            $success = $qglobals{bot_spawn_limit}+1;
            quest::say("Thanks $name!");
         }
	 else{
	     quest::say("Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
	   if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
	  }
	}
      }
      elsif(($ulevel >= $thirdbotlevel) && ($qglobals{bot_spawn_limit} <= 2)) {
         if(($platinum == $thirdbotcost) && plugin::check_handin(\%itemcount, 6018  => 2)) { #cracked staff
            $success = $qglobals{bot_spawn_limit}+1;
            quest::say("Thanks $name!");
         }
	 else{
	     quest::say("Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
	   if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
	  }
	}
      }
      elsif(($ulevel >= $fourthbotlevel) && ($qglobals{bot_spawn_limit} <= 3)) {
         if(($platinum == $fourthbotcost) && ($total3 >= 1)) { #fourth bot items
            $success = $qglobals{bot_spawn_limit}+1;
            quest::say("Thanks $name!");
         }
	 else{
	     quest::say("Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
	   if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
	  }
	}
      }
      elsif(($ulevel >= $fifthbotlevel) && ($qglobals{bot_spawn_limit} <= 4)) {
         if(($platinum == $fifthbotcost) && plugin::check_handin(\%itemcount, 10038 => 1)) { #silver ring
            $success = $qglobals{bot_spawn_limit}+1;
            quest::say("Thanks $name!");
         }
	 else{
	     quest::say("Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
	   if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
	  }
	}
      }
      elsif(($ulevel >= $nineteenbotlevel) && ($qglobals{bot_spawn_limit} <= 19)) {
         if(($platinum == $nineteenbotcost) && plugin::check_handin(\%itemcount, 8011 => 1)) { #hunting bow
            $success = $qglobals{bot_spawn_limit}+1;
            quest::say("Thanks $name!");
         }
	 else{
           if (plugin::check_handin(\%itemcount, 8003 => 1)){ #the wrong bow
               quest::say("I don want that stink'n bow, me wants a hunting bow!");
               quest::summonitem(8003);
	     }
           if (plugin::check_handin(\%itemcount, 8009 => 1)){ #the wrong bow
               quest::say("I don want that stink'n bow, me wants a hunting bow!");
               quest::summonitem(8009);
	     }
	   if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
		quest::givecash($copper, $silver, $gold, $platinum);
	     }
	     quest::say("Dat ain't whats me asked ye fer!!");
             plugin::return_items(\%itemcount);
	}
      }
      elsif(($ulevel >= $twentyninebotlevel) && ($qglobals{bot_spawn_limit} <= 29)) {
         if(($platinum == $twentyninebotcost) && plugin::check_handin(\%itemcount, 22503 => 1)) { #Blue Diamond
            $success = $qglobals{bot_spawn_limit}+1;
            quest::say("Thanks $name!");
         }
	 else{
	     quest::say("Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
	   if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
	  }
	}
      }
      elsif(($ulevel >= $fortyfourbotlevel) && ($qglobals{bot_spawn_limit} <= 44)) {
         if(($platinum == $fortyfourbotcost) && plugin::check_handin(\%itemcount, 10049 => 1)) { #Fire Emerald Ring
            $success = $qglobals{bot_spawn_limit}+1;
            quest::say("Thanks $name!");
         }
	 else{
	     quest::say("Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
	   if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
	  }
	}
      }
      elsif(($ulevel >= $sixtyfourbotlevel) && ($qglobals{bot_spawn_limit} <= 64)) {
         if(($platinum == $sixtyfourbotcost) && plugin::check_handin(\%itemcount, 72650 =>1) || plugin::check_handin(\%itemcount, 72651 =>1) ||
	    plugin::check_handin(\%itemcount, 72652 =>1) || plugin::check_handin(\%itemcount, 72653 =>1) || 
	    plugin::check_handin(\%itemcount, 72654 =>1) || plugin::check_handin(\%itemcount, 72655 =>1) ||
	    plugin::check_handin(\%itemcount, 72657 =>1) || plugin::check_handin(\%itemcount, 72658 =>1) ||
	    plugin::check_handin(\%itemcount, 72659 =>1) || plugin::check_handin(\%itemcount, 72660 =>1) ||
	    plugin::check_handin(\%itemcount, 72661 =>1) || plugin::check_handin(\%itemcount, 72656 =>1)) { #Flow Stones
            $success = $qglobals{bot_spawn_limit}+1;
            quest::say("Thanks $name!");
         }
	 else{
	     quest::say("Dat ain't whats me asked ye fer!");
             plugin::return_items(\%itemcount);
	   if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
            quest::givecash($copper, $silver, $gold, $platinum);
	  }
	}
      }
      if($success > 0) {
         #quest::say("Thanks $name!");
         quest::setglobal("bot_spawn_limit", $success, 5, "F");
         $client->Message(6,"You receive a character flag!");
         $client->Message(6,"You can now create and spawn an Individual! See: '#bot help create' and '#bot spawn' commands.");
         $client->Message(6,"You have $qglobals{bot_spawn_limit} out of quest::spawnbotcount() possible Individuals.");
         $success = 0;
      }
   }
   else {
      quest::say("Dat ain't whats me asked ye fer!");
      plugin::return_items(\%itemcount);
      if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
         quest::givecash($copper, $silver, $gold, $platinum);
      }
   }
}

sub EVENT_SPAWN {
my $x;
my $y;
my $z;
my $h;

$x = $npc->GetX();
$y = $npc->GetY();
$z = $npc->GetZ();
$h = $npc->GetHeading();
   quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  #if(quest::botquest()) {
     if(!defined $qglobals{bot_spawn_limit}) {
        quest::setglobal("bot_spawn_limit", 0, 5, "F");
     }
  #}
 my $random_result2 = int(rand(100));
 if ($random_result2<=40){
   if($ulevel <= $firstbotlevel){
   	quest::say("Psst! hey $name! wouldn't you like to have some [assistance]? I can provide you with some [bot] helpers! Come find me and we can talk.");
  }
 }
}

# END of FILE Zone:many -- Aediles_Thrall.pl
