clc
clear

[mineGrid, showGrid] = createGrid(8,10,10)
showGrid = click(5,7,showGrid,mineGrid)

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

function showGrid = click(y,x,showGrid,mineGrid)
    showGrid(x,y) = mineGrid(x,y);
end

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

