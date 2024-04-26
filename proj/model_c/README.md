# Simple obstacle avoidance problem

An aircraft is travelling along a planned trajectory at a constant rate. The planned trajectory, $T$, follows locations $[a1,a2,a3,a4,a5]$ without making any maneuvers, which is the optimal path from initial location, $a1$, to destination, $a5$.

There is a certain probability that a storm will occur along the planned trajectory (in location $a3$), making the planned trajectory dangerous for air travel. In this case, the aircraft should maneuver to follow a safe trajectory, $T'$. This alternate trajectory traverses locations $[a1,a2,a3,a6,a7,a8,a5]$.

In order to minimize cost, trajectory $T$ should always be preferred unless there is a storm.

## A visualization of the environment:
![image](model_c.png "A visualization of the environment")

## The behavior of the airspace in $a4$ is defined by a DTMC as follows:
![image](storm_dtmc.png "DTMC representing behavior of storm")

The skies initially are clear.

## The behavior of the aircraft is defined by a MDP as follows:
![image](aircraft_mdp.png "MDP representing behavior of aircraft")

