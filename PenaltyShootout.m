clc 
clear 
%Penalty Shootout
numPlayers= input("How many people will be playing(1 or 2):");
a=0;
goalie=0; 
shotSpot=0;
if (numPlayers == 1)
while(a==0)
    team1 = input("Choose your Team(1-8):");
    team2= randi(7+1)
    while team1==team2
        team2=randi(8);
        if team1~=team2
            a=1;
        end
    end
    shotSpot= input("Choose a spot to shoot yout shot(1-6):");
    goalie = randi(5+1);
    if goalie==shotSpot
        fprintf("The Penalty has been saved!");
        fprintf("The score is 0-0");
    else
        frpintf("The Penalty was made!");
        fprintf("The score is 1-0");
    end
    
    a=1;
end
end
if (numPlayers==2)
    while(a==0)
    team1 = input("Choose your Team(1-8):");
    team2 = input("Choose a different Team(1-8):");
    if team1==team2
        fprintf("Team 2 cannot be the same as Team 1, choose again. \n")
        team2 = input("Choose your Team(1-8):");
    end
    fprintf("Team 1 choose a spot to shoot the ball(1-6)");
    a=1;
    end
end