clc
clear
xAmount = 2;
yAmount = 2;
totalBlocks = xAmount*yAmount;
mineAmount = 3;
mineAmount
[mineGrid, showGrid] = createGrid(xAmount,yAmount,mineAmount)
flagLoss = 0;
flagWin = 0;
while(flagLoss == 0&& flagWin == 0)
    x = input("Input x coordinate(Top Left is (1,1)): ");
    y = input("Input y coordinate(Top Left is (1,1)): ");
    [showGrid,flagLoss] = click(x,y,showGrid,mineGrid);
    clc
    [flagWin,minesLeft] = checkWin(xAmount,yAmount,showGrid,mineAmount);
    minesLeft
    mineGrid
    showGrid
    if(flagLoss == 1)
        fprintf("You Lost!!!");
    elseif(flagWin == 1)
        fprintf("You Won!!!");
    end
    
end

function [flagWin,minesLeft] = checkWin(y,x,showGrid,mineAmount)
    minesCaught = 0;
    flagWin = 0;
    for i=1:x
        for j = 1:y
            if(showGrid(i,j)==9)
                minesCaught = minesCaught+1;
            end    
        end
    end
    if(minesCaught == mineAmount)
        flagWin = 1;
    end
    minesLeft = minesCaught-mineAmount;
end

function [mineGrid, showGrid] = createGrid(y,x,mines)
    mineGrid = zeros(x,y);
    showGrid = zeros(x,y)+9;
    numMines = 0;
    while numMines<mines
       xCor = randi(x);
       yCor = randi(y);
       if mineGrid(xCor,yCor)~= -1
          mineGrid(xCor,yCor) = -1;
          numMines = numMines+1;
       end
    end
    for i=1:x
        for j = 1:y
            if(mineGrid(i,j)~=-1)
                mineGrid(i,j) = calcNums(i,j,mineGrid);
            end    
        end
    end
end

function [showGrid,flagLoss] = click(y,x,showGrid,mineGrid)
    flagLoss = 0;
    
    if (mineGrid(x,y)==-1)
        showGrid(x,y) = mineGrid(x,y);
        flagLoss =1;
%     elseif(mineGrid(x,y)==0)
%         showGrid = zeroClicked(x,y,showGrid,mineGrid)
    else
        showGrid(x,y) = mineGrid(x,y);
    end
end

% function showGrid = zeroClicked(x,y,showGrid,mineGrid)
%     if(mineGrid(x,y)==0)
%         countX = width(mineGrid);
%         countY = height(mineGrid);
%         showGrid(x,y) = mineGrid(x,y);
%         if(y==1)
%             if(x==1)
%                 showGrid = zeroClicked(x+1,y,showGrid,mineGrid);
%                 showGrid = zeroClicked(x+1,y+1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x,y+1,showGrid,mineGrid);
%             elseif(x == countX)
%                 showGrid = zeroClicked(x-1,y,showGrid,mineGrid);
%                 showGrid = zeroClicked(x-1,y+1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x,y+1,showGrid,mineGrid);
%             else
%                 showGrid = zeroClicked(x-1,y,showGrid,mineGrid);
%                 showGrid = zeroClicked(x-1,y+1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x,y+1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x+1,y,showGrid,mineGrid);
%                 showGrid = zeroClicked(x+1,y+1,showGrid,mineGrid);
%             end
%         elseif(y==countY)
%             if(x==1)
%                 showGrid = zeroClicked(x+1,y,showGrid,mineGrid);
%                 showGrid = zeroClicked(x+1,y-1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x,y-1,showGrid,mineGrid);
%             elseif(x == countX)
%                 showGrid = zeroClicked(x-1,y,showGrid,mineGrid);
%                 showGrid = zeroClicked(x-1,y-1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x,y-1,showGrid,mineGrid);
%             else
%                 showGrid = zeroClicked(x-1,y,showGrid,mineGrid);
%                 showGrid = zeroClicked(x-1,y-1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x,y-1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x+1,y,showGrid,mineGrid);
%                 showGrid = zeroClicked(x+1,y-1,showGrid,mineGrid);
%             end
%         else
%             if(x==1)
%                 showGrid = zeroClicked(x,y-1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x+1,y-1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x+1,y,showGrid,mineGrid);
%                 showGrid = zeroClicked(x+1,y+1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x,y+1,showGrid,mineGrid);
%             elseif(x==countX)
%                 showGrid = zeroClicked(x,y-1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x-1,y-1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x-1,y,showGrid,mineGrid);
%                 showGrid = zeroClicked(x-1,y+1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x,y+1,showGrid,mineGrid);
%             else
%                 showGrid = zeroClicked(x,y-1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x+1,y-1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x+1,y,showGrid,mineGrid);
%                 showGrid = zeroClicked(x+1,y+1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x,y+1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x-1,y+1,showGrid,mineGrid);
%                 showGrid = zeroClicked(x-1,y,showGrid,mineGrid);
%                 showGrid = zeroClicked(x-1,y-1,showGrid,mineGrid);
%             end    
%         end
%     end
% end

function numMinesAround = calcNums(y,x,mineGrid)
    numMinesAround = 0;
    countX = width(mineGrid);
    countY = height(mineGrid);
    
    if(y==1)
        if(x==1)
            numMinesAround = numMinesAround + countMine(x+1,y,mineGrid);
            numMinesAround = numMinesAround + countMine(x+1,y+1,mineGrid);
            numMinesAround = numMinesAround + countMine(x,y+1,mineGrid);
        elseif(x == countX)
            numMinesAround = numMinesAround + countMine(x-1,y,mineGrid);
            numMinesAround = numMinesAround + countMine(x-1,y+1,mineGrid);
            numMinesAround = numMinesAround + countMine(x,y+1,mineGrid);
        else
            numMinesAround = numMinesAround + countMine(x-1,y,mineGrid);
            numMinesAround = numMinesAround + countMine(x-1,y+1,mineGrid);
            numMinesAround = numMinesAround + countMine(x,y+1,mineGrid);
            numMinesAround = numMinesAround + countMine(x+1,y,mineGrid);
            numMinesAround = numMinesAround + countMine(x+1,y+1,mineGrid);
        end
    elseif(y==countY)
        if(x==1)
            numMinesAround = numMinesAround + countMine(x+1,y,mineGrid);
            numMinesAround = numMinesAround + countMine(x+1,y-1,mineGrid);
            numMinesAround = numMinesAround + countMine(x,y-1,mineGrid);
        elseif(x == countX)
            numMinesAround = numMinesAround + countMine(x-1,y,mineGrid);
            numMinesAround = numMinesAround + countMine(x-1,y-1,mineGrid);
            numMinesAround = numMinesAround + countMine(x,y-1,mineGrid);
        else
            numMinesAround = numMinesAround + countMine(x-1,y,mineGrid);
            numMinesAround = numMinesAround + countMine(x-1,y-1,mineGrid);
            numMinesAround = numMinesAround + countMine(x,y-1,mineGrid);
            numMinesAround = numMinesAround + countMine(x+1,y,mineGrid);
            numMinesAround = numMinesAround + countMine(x+1,y-1,mineGrid);
        end
    else
        if(x==1)
            numMinesAround = numMinesAround + countMine(x,y-1,mineGrid);
            numMinesAround = numMinesAround + countMine(x+1,y-1,mineGrid);
            numMinesAround = numMinesAround + countMine(x+1,y,mineGrid);
            numMinesAround = numMinesAround + countMine(x+1,y+1,mineGrid);
            numMinesAround = numMinesAround + countMine(x,y+1,mineGrid);
        elseif(x==countX)
            numMinesAround = numMinesAround + countMine(x,y-1,mineGrid);
            numMinesAround = numMinesAround + countMine(x-1,y-1,mineGrid);
            numMinesAround = numMinesAround + countMine(x-1,y,mineGrid);
            numMinesAround = numMinesAround + countMine(x-1,y+1,mineGrid);
            numMinesAround = numMinesAround + countMine(x,y+1,mineGrid);
        else
            numMinesAround = numMinesAround + countMine(x,y-1,mineGrid);
            numMinesAround = numMinesAround + countMine(x+1,y-1,mineGrid);
            numMinesAround = numMinesAround + countMine(x+1,y,mineGrid);
            numMinesAround = numMinesAround + countMine(x+1,y+1,mineGrid);
            numMinesAround = numMinesAround + countMine(x,y+1,mineGrid);
            numMinesAround = numMinesAround + countMine(x-1,y+1,mineGrid);
            numMinesAround = numMinesAround + countMine(x-1,y,mineGrid);
            numMinesAround = numMinesAround + countMine(x-1,y-1,mineGrid);
        end    
    end
end

function numMines = countMine(y,x,mineGrid)
    numMines = 0;
    if(mineGrid(x,y)<0)
        numMines = numMines+1;
    end
end

