## General structure of the study:

- A firt sperimentation phase:
  during this pahse the reasearch used different prism and Grip default exaples to test different flags and functionality of the tro tools
  In particular the interesting observation are:
  - GRIP performe epsecially well in their exaples demonstrating that in best case scenario GRIP perform the best against PRISM and SYmmPRism
  - GRIP doesn't function in absence of strict symmetry and his blocked by Lexer of Parser during the translation process
  - Symmprism can gave false positive because being implement inside Prism can let the program compile wihtout recucing the actyal simmetry and that can gave the idea of a reduction when not present
    - if you select a specific interval for the simmetry and there isn't it will block it
  - Global variable and single modules can trigger the performance of GRIP if not set right
  - Symmprism is often outperfomed by GRIP due to his trnaslation of the model:
    - While Symmprism cut some calculation when prism is running and verifing a model, Grip rewrite the entire model and then let Prism do his work
- The stipulation of three main grups of Hypothesis:
  - One to check the functionality of Grip in a seamingly best case scenario of GRIP.
  - One to check the performance of Symmprism, prism and GRIP in a temporal scenario.
  - One to force a best case scenario for GRIP in a model that normally wouldn't.

## First observation durint the sperimentation phase:

Usally forcint the presence of same modules let GRIP do his translation, but doesn't happen in every case.
The GRIP's lexer presents a very strict grammar this can became a problem with the organization or creation of the model.

- One of the rule for example stop the user from the creation of numbered global variabile, examples like Id1 or Id2 must be transformed into other name like ID or IDD
- The presence of non symmetrical modules can sometimes trigger the Parser or Lexer into an error
- The approach of the entire system is strictly and althought this is right for the creation of a formal language it can block research from using it in non conventional systems
- The symmetry of the modules must be complete, we can't create module with a pratial presence of symmetry and then use some ID to differentiate them
  Hypothesis:

Each Hypothesis will be displayed on the creation of a model that represents a robot on grid. This grid i finite and with a small dimension (max 5X5 grid) to make the calculation more smooth
and faster to do. The main point of using a similar model is to make a faster creation of model to analize the different behavior of prism, Symmprism and Grip in different scenarios.

### Hypothesis 1:

##### Idea 1:

the creation of a pure probabilistic model that uses probability to let the robot:

- move round one of the 8 possibile direction

- stay in the same place and gather information

- eventually if he gather information it changes the probability on the direction it takes (is more probable that he moves instead of staying in the same place)
  - after staying once in the same place the probability won't reset until he moves away from a specific cell.

- if a bord is hitten it can move in less direction

### Hypothesis 2:

##### Idea 1:

the creation of a pure temporal probabilistic model that uses probability to let the robot:

- move round one of the 8 possibile direction

- Stay in the same place and gather information

- Eventually if he gather information it changes the probability on the direction it takes

- If a bord is hitten it can move in less direction

and uses time to: - create different turns, each turn has a specific time inside wich the robot can use do an action (a movement or a resaerch of more information)

### Hypothesis 3:

If we find a way to differentiate not directly the different cells we can transform the grid into a symmetrical model and use the power of GRIP to reduce it's complexity.

##### Idea 1:

Using a single cell ad model template and differentiate based on the movement of the robot

##### Problems:

- If the robot is the differentiator cells are disconneted, so the model represents two disconnected events.

- If we try to use id for single cells the cells won't be simmetrical at full so GRIP won't redce the model

- The same problem is present if we want to model different cells with their coordinates

The idea is to use the robot to check different coordinates and cell, the cell will register just the presence of robot on it or not. So that each cell can be symmetrical to another.
In the next idea we'll have to find a new way to connect robot and cell toghether without breaking the simmetry necessary for the research.

#### Idea 2:

Trying to take the case of organic simmetry and use them

The idea is to model the cases of symmetry in the model to have simmetrical representation: each round the robot will change just 1 cell, the other will be all simmetrical one to another
So we can try to model that, we create multiple modules that changes just when the robot change them, instead of chaging based on id or other specificiation we cahnge them based on their actiavation
The important notion is that n - 1 cells are actively symmetrical during the entire execution because we model the state occupaed or not, instead of X e Y position.

This can produce a specific model in the form of different states reachable based on the position of the robot.
