# CS 2261 Final Project by Jefferson Allen (jallen337)

## //UPDATE March 30th 
### The plot so far:
Set in the year 2072, you —a nameless hacker— are caught while attempting to access files concerning the TriOptimum Corporation. Luckily, a TriOptimum executive has offered to drop all charges against you, in exchange for a confidential hacking of the outer planets research stations. You've hacked into one of the local sentry drones for use in this mission.
- You must interface with all 4 research stations to download that stations data, as the sentry has no wireless capabilities.
- HDD space is limited in a sentry, so you can only download from one station at a time.
- Dock with an orbiting satellite to upload the collected data and continue to the next station. It will increase altitude with each upload in preperation for launch.
- When completed, the satellite will leave the planets orbit and the sentry will self destruct.
- The satellite will enter the orbits of 4 planets total(4 game levels) to collect the necessary information.

### Gameplay details
In order of importance(to allow scalling back if necessary)
- [x] **Movement and shooting:** The Drone controls similar to asteroids in that
you turn to a direction and hit a button to move or shoot in that direction.
- [ ] **Cutoff:** Drone engines won’t work deeper into space, so engines cut if you go
too high. Prevents player exiting map.
- [ ] **Infinite-Lives:** Drone destruction is of no concern as another can be hacked,
though it can cost you time to get back to where you were.
- [x] **GUI:** Shows timer, resources, score, fuel, minimap, compass, level, and health.
- [x] **Resoure collection:** Stop off at different stations along the planets
surface to collect data. Vulnerable to enemies here as can’t move or
shoot. Can leave station early, but won’t gather all resources(can always come back later).
- [x] **Countdown Timer:** Level 1(900 sec), Level 2(750 sec), Level 3(600 sec), Level 4(500
sec). Game over if timer hits 0.
- [x] **Score:** killing an enemy, spare time, and destroyed drones all change the
score count.
- [ ] **Multiple levels:** You need to travel to 4 planets total(4 game levels) to collect the necessary information.
- [ ] **Five enemy types:** Caterpillars(ground vehicle that fires straight up),
Laser-Droids(homing enemies that fire lasers sideways), Lunar-Lurkers(hidden
stationary enemies that fire up), Asteroids(move randomly), Astro-Mines(fast
homing killers released from fake asteroids, can’t be destroyed, you must fly
to the planets surface to trick them into hitting the ground rather than the
drone).
- [ ] **Cheat:** All sentry drones have been upgraded to the new NS-5 Model with wireless capabilities. Simply be in the vicinity of a satellite or station to upload and download data respectively.
- [ ] **Minimap:** shows where you are in relation to the mother ship and the
stations/fuel depots.
- [x] **Parallax:** The stars, mountains, and craters will move at different speeds. See
figure 1 for visual.
- [ ] **Fuel Depots:** Fuel runs out with engine use(like the game lunar lander), but you can stop off
at fuel depots to refuel.

### Controls:
- Up/Down = Fire boosters / Move Menu cursor
- Left/Right = Rotate drone left/right
- A = Select
- B = Back
- Start = Pause game

### Current state of the game (Figure 1) Youtube video

[![Space!](https://img.youtube.com/vi/-r3OKp7sDrw/0.jpg)](http://www.youtube.com/watch?v=-r3OKp7sDrw)
