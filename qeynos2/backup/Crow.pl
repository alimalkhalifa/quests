# Revised by Proxeeus
#The Tattered Pouch
sub EVENT_SAY
{
 if($text=~/hail/i){
 quest::say("Welcome to Crow's! If you're thirsty, we have a fine selection of brews and ales.");
}
 }
 
sub EVENT_DEATH{
	quest::say("You can't break the Circle.. kill one, and.. there will always be another to take his place.. and.. take revenge.");
}
sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 17600 => 1)){
      quest::say("What are you? The Rat's new bag man? Peh, he is useless. That bum drinks any gold he gets. Here ya go, kid!");
      quest::summonitem(13901);
      quest::givecash("0","0","6","0");
      quest::faction(33,10); # +Circle of Unseen Hands
      quest::faction(217,-10); # -Merchants of Qeynos
      quest::faction(53,10); # Corrupt Qeynos Guards
      quest::faction(135,-10); #-Guards of Qeynos
      quest::faction(164,10); # Kane Bayle
       quest::ding(); quest::exp(200);
      }
plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2054 -- Crow.pl
