sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	$z = $npc->GetZ();
	quest::set_proximity($x - 15, $x + 15, $y - 25, $y + 25, $z - 15, $z + 10);
} 

sub EVENT_ENTER
{
	quest::movepc(45,-49,1057,-43,999);
}