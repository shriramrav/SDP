clc 
clear 
%Penalty Shootout
numPlayers= input("How many people will be playing(1 or 2):");
a=0;
goalie=0; 
shotSpot=0;
team1Score=0;
team2Score=0;
saveSpot=0;
shooter=0;
while (a==0)
    if (numPlayers == 1)
    team1 = input("Choose your Team(1-6):");
    team2= randi(5+1)
        if team1==team2
        team2=randi(5+1);
        end
    while ((team1Score<5 && team2Score<5)&&(team1Score-team2Score<2 && team2Score-team1Score<2))
    shotSpot = input("Choose a spot to shoot yout shot(1-6): \n");
    goalie = randi(5+1);
    if goalie==shotSpot
        fprintf("The Penalty has been saved! \n")
        fprintf("The score is %.0f-%.0f \n",team1Score,team2Score);
    else
        fprintf("The Penalty was made! \n");
        team1Score=team1Score+1;
        fprintf("The score is %.0f-%.0f \n",team1Score,team2Score);
    end
    saveSpot= input("Choose a spot to save the goal(1-6): \n");
    shooter = randi(5+1);
    if shooter==saveSpot
        fprintf("The Penalty has been saved! \n");
        fprintf("The score is %.0f-%.0f \n",team1Score,team2Score);
    else
        fprintf("The Penalty was made! \n");
        team2Score=team2Score+1;
        fprintf("The score is %.0f-%.0f\n",team1Score,team2Score);
    end
    end 
    if team1Score==5 && team2Score==5
    while ((team1Score>=5 && team2Score>=5)&&(team1Score-team2Score<1 && team2Score-team1Score<1))
    shotSpot= input("Choose a spot to shoot yout shot(1-6): \n");
    goalie = randi(5+1);
    if goalie==shotSpot
        fprintf("The Penalty has been saved! \n")
        fprintf("The score is %.0f-%.0f \n",team1Score,team2Score);
    else
        fprintf("The Penalty was made! \n");
        team1Score=team1Score+1;
        fprintf("The score is %.0f-%.0f \n",team1Score,team2Score);
    end
    saveSpot= input("Choose a spot to save the goal(1-6): \n");
    shooter = randi(5+1);
    if shooter==saveSpot
        fprintf("The Penalty has been saved! \n");
        fprintf("The score is %.0f-%.0f \n",team1Score,team2Score);
    else
        fprintf("The Penalty was made! \n");
        team2Score=team2Score+1;
        fprintf("The score is %.0f-%.0f\n",team1Score,team2Score);
    end
    end
    end
    end
  
    a=1;
end
