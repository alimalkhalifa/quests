#Darkwater Ladder Event 
#All Starter Towns
#Angelox

sub EVENT_SAY {
  if(($text=~/Hail/i) && ($charid < 1176)) { #set
    #quest::say("Your character ID is $charid ");
    quest::say("Your character is too old for this ladder, start a new character!");
    $client->Message(15,"This ladder begins April 16, 2010, ending date posted at the AX Classic forums..");
    $client->Message(15,"You should start your new character on or after the starting date.");
    return; 
  }
  if (($text=~/Hail/i) && ($charid > 1175)){  #set
    quest::say("Hail, $name! I am Darkwater the Ladder Guide, and will be observing and rewarding you for your advancement on the Ladder."); 
    quest::say("I will [reward] you for advancement to levels 20, 35, 45, 55, and 65. When you reach 65, ask me for your [title], and I will provide it for you, in addition to your reward.");
    return;
  }
  if (($text=~/join/i)&& ($charid > 1175)){ #set
    quest::say("Glad to have you with us ");
    return; 
  }
  if (($text=~/title/i) && ($charid == 951)) { #Princesse
    quest::say("Well done $name! Here is your title.");
    $client->SetAATitle("Ladder Champion");
    return;
  }
  if (($text=~/title/i) && ($charid == 533)) { #Shadowfist
    quest::say("Well done $name! Here is your title.");
    $client->SetAATitle("Ladder Champion");
    return;
  }
  if (($text=~/title/i) && ($charid > 1175) && ($ulevel > 64)) { #set 
    quest::say("Well done $name! Here is your title.");
    $client->SetAATitle("Ladder Champion");
    return;
  }
  if (($text=~/title/i) && ($charid > 1175) && ($ulevel < 65)) { #set
    quest::say("You need to be level 65 on the Ladder for this.");
    $client->Message(15,"Ladder title is available during the time period posted.");
    return;
  }
  if (($text=~/reward/i) && ($charid > 1175) && ($ulevel > 19) &&  ($ulevel < 35) && ($ladder_trophy < 1)) { #set LadderTrophy1
    quest::say("Well done $name! Here is your trophy.");
    quest::summonitem(409);
    $client->Message(6,"You recieved the Ladder Players Trophy!");
    quest::say("Do you still travel by ship? I have [items] in my possession that can help you with your travels.");
    quest::setglobal("ladder_trophy",1,5,"F");
    $ladder_trophy=undef;
    return;}
      if (($text=~/reward/i) && ($charid > 1175) && ($ulevel > 19) &&  ($ulevel < 35) && ($ladder_trophy==1)) {
	quest::say("You already have your level 20 trophy.");
	quest::say("Do you still travel by ship? I have [items] in my possession that can help you with your travels.");
	return;}
  if (($text=~/reward/i) && ($charid > 1175) && ($ulevel > 34) &&  ($ulevel < 45) && ($ladder_trophy < 2)) { #set LadderTrophy2
    quest::say("Well done $name! Here is your trophy.");
    quest::summonitem(410);
    $client->Message(6,"You recieved the Dedicated Ladder Players Trophy!");
    quest::setglobal("ladder_trophy",2,5,"F");
    $ladder_trophy=undef;
    return;}
      if (($text=~/reward/i) && ($charid > 1175) && ($ulevel > 34) &&  ($ulevel < 45) && ($ladder_trophy==2)) {
	quest::say("You already have your level 35 trophy.");
	return;}
  if (($text=~/reward/i) && ($charid > 1175) && ($ulevel > 44) &&  ($ulevel < 55) && ($ladder_trophy < 3)) { #set LadderTrophy3
    quest::say("Well done $name! Here is your trophy.");
    quest::summonitem(411);
    $client->Message(6,"You recieved the Advanced Ladder Players Trophy!");
    quest::setglobal("ladder_trophy",3,5,"F");
    $ladder_trophy=undef;
    return;}
      if (($text=~/reward/i) && ($charid > 1175) && ($ulevel > 44) &&  ($ulevel < 55) && ($ladder_trophy==3)) {
	quest::say("You already have your level 45 trophy.");
	return;}
  if (($text=~/reward/i) && ($charid > 1175) && ($ulevel > 54) &&  ($ulevel < 65) && ($ladder_trophy < 4)) { #set LadderTrophy4
    quest::say("Well done $name! Here is your trophy.");
    quest::summonitem(412);
    $client->Message(6,"You recieved the Master's Ladder Players Trophy!");
    quest::setglobal("ladder_trophy",4,5,"F");
    $ladder_trophy=undef;
    return;}
      if (($text=~/reward/i) && ($charid > 1175) && ($ulevel > 54) &&  ($ulevel < 65) && ($ladder_trophy==4)) {
	quest::say("You already have your level 55 trophy.");
	return;}
  if (($text=~/reward/i) && ($charid > 1175) && ($ulevel > 64) && ($ladder_trophy < 5)) { #set LadderTrophy5
    quest::say("Well done $name! Here is your trophy.");
    quest::summonitem(413);
    $client->Message(6,"You recieved the Champion's Ladder Players Trophy!");
    quest::setglobal("ladder_trophy",5,5,"F");
    $ladder_trophy=undef;
    return;}
      if (($text=~/reward/i) && ($charid > 1175) && ($ulevel > 64) && ($ladder_trophy==5)) {
	quest::say("You already have your level 65 trophy.");
	return;}
#Moonstone Quests
  if ($text=~/items/i){
    quest::say("While fighting evil in Norrath, I have found the legendary [Moonstones] on certain kills.");
    return;}
  if ($text=~/Moonstones/i){
    quest::say("With the magic of a Moonstone in your [possession], you will be able to travel to the land where it was formed.");
    return;}
  if ($text=~/possession/i){
    quest::say("I have many of these Moonstones, I would give one to anybody who can [prove] there worthiness and determination to me.");
    return;}
  if ($text=~/prove/i){
    quest::say("I have two quests for you, the [first] quest is for Moonstones in Antonica, Odus, Faydwer, and Kunark. The [second] is for the Moonstone of the Ice.");
    return;}
  if (($text=~/second/i) && (($race eq 'Wood Elf') | ($race eq 'High Elf') | ($race eq 'Dwarf') |
      ($race eq 'Gnome'))){ #Fayder
    quest::say("Go to the Castle Mistmoore in Lesser Faydark, and bring me the proof I want: bring me the blood from a Fallen Noble");
    return;}
  if (($text=~/second/i) && (($race eq 'Human') | ($race eq 'Dark Elf') | ($race eq 'Barbarian') |
      ($race eq 'Half Elf') | ($race eq 'Troll') | ($race eq 'Ogre') | ($race eq 'Halfling'))){ #Antonica
    quest::say("Go to the Accursed Temple of Cazic-Thule in the Feerrott, and bring me the proof I want: bring me a Mosquito Earring from The Infected Mosquito");
    return;}
  if (($text=~/second/i) && (($race eq 'Iksar') | ($race eq 'Froglok'))){ #Kunark
    quest::say("Go to the Crypt of Dalnir in Warsliks Woods, and bring me the proof I want: bring me the Battle Plans from a kly evoker");
    return;} 
  if (($text=~/second/i) && (($race eq 'Vah Shir') | ($race eq 'Erudite') | ($race eq 'Human') |
      ($race eq 'Dark Elf'))){ #Odus
    quest::say("Go to Stonebrunt Mountains in Odus, and bring me the proof I want: bring me a Leopard Fang from a kejek leopard");
    return;}

  if (($text=~/first/i) && (($race eq 'Wood Elf') | ($race eq 'High Elf') | ($race eq 'Dwarf') |
      ($race eq 'Gnome'))){ #Fayder
    quest::say("Go to Dagnor's Cauldron in Butcher Block, and bring me the proof I want: bring me the Water Ring from an aqua goblin.");
    return;}
  if (($text=~/first/i) && (($race eq 'Human') | ($race eq 'Dark Elf') | ($race eq 'Barbarian') |
      ($race eq 'Half Elf') | ($race eq 'Troll') | ($race eq 'Ogre') | ($race eq 'Halfling'))){ #Antonica
    quest::say("Go to Rathe Mountains in Antonica, and bring me the proof I want: bring me Bone Barbs from a barbed bone skeleton");
    return;}
  if (($text=~/first/i) && (($race eq 'Iksar') | ($race eq 'Froglok'))){ #Kunark
    quest::say("Go to the Lake of Ill Omen in Kunark, and bring me the proof I want: bring me a Tattooed Sarnak Head  from a Sarnak legionnaire");
    return;} 
  if (($text=~/first/i) && (($race eq 'Vah Shir') | ($race eq 'Erudite') | ($race eq 'Human') |
      ($race eq 'Dark Elf'))){ #Odus
    quest::say("Go to Erud\'s Crossing in Odus, and bring me the proof I want: bring me the tool kit from a frantic kerran.");
    return;}
#End Moonstone - rest in EVENT_ITEM
  if (($text=~/reward/i) && ($charid > 1175)) { #set
    quest::say("You need to get to level 20!");
    return;
  }else{
    $client->Message(15,"Either you said the wrong thing, or you do not qualify for this Ladder.");
    $client->Message(15,"In order to qualify for this Ladder, you need to have started a character on or after the start date posted at the AX Classic forums.");
  }
}
sub EVENT_ITEM{
  if ($charid < 1176) { #set
    #quest::say("Your character ID is $charid ");
    quest::say("Your character is too old for this ladder, start a new character!");
    $client->Message(15,"This ladder began April 16, 2010, ending date posted at the AX Classic forums.");
    $client->Message(15,"You should start your new character on or after the starting date.");
    plugin::return_items(\%itemcount);
    return;}
  # Noble's Blood, Dalnir Battle Plans,Leopard Fang, Skeeter Earring
  if (($itemcount{1890} == 1) | ($itemcount{48058} == 1) | ($itemcount{6944} == 1) | ($itemcount{604} == 1)) {
    quest::say("Well done $name! Here is your Moonstone.");
    $client->Message(6,"You recieved the Moonstone of the Ice!");
    quest::summonitem(133);
    return;}
  # Bone Barbs, Water Ring (both types),Sarnak Head,Tool Kit
  if (($itemcount{19037} == 1) | ($itemcount{69246} == 1) | ($itemcount{10546} == 1) | ($itemcount{12911} == 1) | ($itemcount{17057} == 1)) {
    quest::say("Well done $name! Here is your Moonstone.");
    if (($race eq 'Wood Elf') | ($race eq 'High Elf') | ($race eq 'Dwarf') |
      ($race eq 'Gnome')){ #Fayder
      $client->Message(6,"You recieved the Moonstone of the Commons!");
      quest::summonitem(126);
     return;}
    if (($race eq 'Human') | ($race eq 'Dark Elf') | ($race eq 'Barbarian') |
      ($race eq 'Half Elf') | ($race eq 'Troll') | ($race eq 'Ogre') | ($race eq 'Halfling')){ #Antonica
      $client->Message(6,"You recieved the Moonstone of the Faydark!");
      quest::summonitem(125);
      return;}
    if (($race eq 'Iksar') | ($race eq 'Froglok')){ #Kunark
      $client->Message(6,"You recieved the Moonstone of the Faydark!");
      quest::summonitem(125);
      return;}
    if (($race eq 'Vah Shir') | ($race eq 'Erudite') | ($race eq 'Human') |
      ($race eq 'Dark Elf')){ #Odus
      $client->Message(6,"You recieved the Moonstone of the Karanas!");
      quest::summonitem(128);
      return;}
  }
  else{
    quest::say("Sorry, I can't use this.");
    plugin::return_items(\%itemcount);
  }
}

#quest::enabletitle
#quest::checktitle
#quest::removetitle
