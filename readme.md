# ludamDare56 - Tiny Creatures

Theme is `Tiny Creatures`
  
## Journal

### 4-6p

Brainstorm some ideas. We did some word association and listed out some games that can give inspiration. 

- Hollow Knight
- Pikman
- Spore
- The Borrowers
- Creatures
- Bugs Life
- Alice In Wonderland - The Walrus
- Norse by Norsewest
- World of Go
- Little Nightmares
- Siphonophorae

I keep coming to the gameplay mechanic of a group of little things that can come together and separate for different needs. This could be top down strategy game, or a side platformer. 

### 6-7p

Worked on the swarming of the mobs. They will move toward the player and follow them as they move. I added some quick debug text that is attached to the player scene.

### 7-10p

Made some artwork for a background and the boss of the game. It will scoop up you/the tiny creatures and you must overcome it. I also started to rewrite the player controls to move as a side scrolling platformer

Worked on adding the background "big guy" and getting the camera to follow the player around. Adding zoom via mouse wheel

It is all a more wonky than I would like. I don't really have a level yet, and the gravity/physics seems to be affecting the player characterbody2d

### 7-10a

Got a good nights rest. Woke up this morning thinking of Godot! Tinkered with the player movement. The player is now using CharacterBody2d and gravity is working as I would expect. I removed the mob spawning, and just manually placed one. I would like to have spawners that you need to find that will allow you to pick up X number of each mob. The mobs will follow the player better now. They will stop following if they are too far away or too close. They do colide with the player, so that will not work when you have a group of them following you. I want to start on the big guy health bar and attack

### 10-12p

Health bar for the big guy in the background. Started setting up a hitbox that will go down when you click.