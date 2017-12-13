# quests
My quest scripts to use with my custom db + source.

(This readme file will serve as the global readme file for the project: server code, quest scripts, database work)

Note: the server codebase is a direct fork from EQEmu, but, although there are slight customizations here and there, it is 100% compatible with the main branch and is regularly merged-in.

This quest repository is focused on classic - Kunark - Velious.

Right now (december 2017), the bulk of the quest & content work is being done on vanilla EverQuest.

List of repositories for this project:
=====================================

* https://github.com/proxeeus/quests/
* https://github.com/proxeeus/server/
* add a github for a database archive? what's the best way to distribute it?

Current highlights include, but are not limited to:
===================================================

- Obviously (this being the quest repo), a ton of quest work/fixes: rewards, drops, dialogues etc.

- Every single class/race/deity newbie quests (and their associated recipes) have been fixed/implemented wherever needed.

- Restored a ton of fluff/classically accurate dialogues wherever applicable. This is an ongoing process.

- Fully working boat system (mix of perl & a bit of C++ backend regarding static & empty zones). Firiona Vie's Maiden Voyage is useable and *working* (due to a small C++ 'hack')

Vanilla boat routes: Freeport -> OOT -> Butcherblock -> Freeport, Erudin (complete with the Erudin shuttles) -> Erud's Crossing -> Qeynos -> Erud's Crossing -> Erudin.

- A ton of faction work, which, while not 110% classically accurate, will be better than stock database values. This is an ongoing process.

- A lot of items with newer graphics have been reverted to their classic counterparts. This is an ongoing process.

- A lot of various NPCs features (faces, textures...) that were lost due to Luclin+ models are restored to their classic counterparts, which drastically reduces the "samey" look of NPCs across the world. A small C++ backend fix has been put in place to make plugin-driven NPC feature randomization persist for clients zoning. This in turn allows generic mobs like karana bandits, dervish cutthroats, mistmoore dark elves etc to have their faces completely randomized each time one of them is spawning. This is an ongoing process.

- Classic Cazic-Thule (not the high level version)

- Classic Paw (the gnoll version)

- Day/night cycle in Kithicor Forest. Watch out for those pesky undeads!
- Day/night cycle in East Karana - boy, those undead gnolls DO smell bad!
- Day/night cycle in Lake Rathetear - undead gnolls spawn in the camp @ South Karana's zone line. Beware!
- Generally speaking: day/night cycles enabled wherever needed. This is an ongoing process!

- Fixed tons of bad spawns/bad path grids/statically immobile NPCs/missing spawns etc etc. This is an ongoing process.

- Classic skeletons (brown/white), classic vendors, gypsy models/textures.

- Most classic vendors have had their stocks reflect the classic ones (armor sellers etc), instead of being empty. One or three may have slipped under the radar but for the most part this should be accurate.


Todo list
=========

- Kunark
- Velious
- Tradeskills
- Further customizations to the Bots (PlayerBot system still in the design stages)
