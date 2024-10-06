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

Health bar for the big guy in the background. Started setting up a hitbox that will go down when you click.Did some more stuff, feeling the time crunch! 

Ate some food, went on a walk and listened about pigments and light and pastel painting. Back at 3

## 3p-5p

Thought it would be good to list out my todos before the jam is done. Implemented one of them (esc will now pause the game). Got the collision layers sorted out most of the way. The big guy is still not detecting the projectiles. I am wondering if that is due to the z layering? Started a very bare bones audio project using LMMS to get some background music

## 6p-10p

Started watching james and the giant peach. trying to get the big guy collision working. Switched to a tile set for the ground. Collision with the big guy is still not working. That is frustrating. Failed at that but spent some time building out a tile set and level editor. I did not merge that work from my laptop to my desktop, which I started working on in the morning, luckily git will help me with that! I did spend sometime after 10 getting my forgejo runners using a base image that contains git-lfs so that my CI will work again with my new runner vms.

## 8a-10:30a

Started with a rested mind and got the big guy collision working... I was using on_body_entered and should have used on_area_entered, so much time was spent on this. I am happy it is working now. Also, I got the projectile rotation/spawning working with some help from my local Mistral7B LLM. It was using the local coordinates as global ones and just had to translate that and it is working again.I made some sound effects for jumping and big guy taking damage in lmms. 

## 11a-3p 

Tried to make a mob spawner for the tiny creatures that follow you around. I failed at that, and now there are none of them in the game. That is for the best, since they did nothing yet other than follow you around. Can't recall what exactly I worked on. I am going to call this jam complete at 3p. I technically have a game... you have to figure out where to shoot, and the you kill a bigger creature. I did not quite execute the scaleing of "tiny creatures" that I set out for. I am happy with this jam!

