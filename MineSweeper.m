clc
clear

[mineGrid showGrid] = createGrid(8,10,10)
showGrid = click(5,7,showGrid)

function [mineGrid showGrid] = createGrid(y,x,mines)
    mineGrid = zeros(x,y);
    showGrid = zeros(x,y)+9;
    numMines = 0;
    while numMines<mines
       xCor = randi(x);
       yCor = randi(y);
       if mineGrid(xCor,yCor)~= 1
          mineGrid(xCor,yCor) = -1;
          numMines = numMines+1;
       end
    end
    
end

function showGrid = click(y,x,showGrid)
    showGrid(x,y) = 10;
end

function [numMinesAround,mineGrid] = calcNums(y,x,mineGrid)
    numMinesAround = 0;
    countX = width(mineGrid);
    countY = height(mineGrid);
    
    if(y==0)
        if(x==0)
            numMinesAround = numMinesAround + countMine(x+1,y);
            numMinesAround = numMinesAround + countMine(x+1,y+1);
            numMinesAround = numMinesAround + countMine(x,y+1);
        elseif(x == countX)
            numMinesAround = numMinesAround + countMine(x-1,y);
            numMinesAround = numMinesAround + countMine(x-1,y+1);
            numMinesAround = numMinesAround + countMine(x,y+1);
        else
            numMinesAround = numMinesAround + countMine(x-1,y);
            numMinesAround = numMinesAround + countMine(x-1,y+1);
            numMinesAround = numMinesAround + countMine(x,y+1);
            numMinesAround = numMinesAround + countMine(x+1,y);
            numMinesAround = numMinesAround + countMine(x+1,y+1);
        end
    elseif(y==countY)
        if(x==0)
            numMinesAround = numMinesAround + countMine(x+1,y);
            numMinesAround = numMinesAround + countMine(x+1,y-1);
            numMinesAround = numMinesAround + countMine(x,y-1);
        elseif(x == countX)
            numMinesAround = numMinesAround + countMine(x-1,y);
            numMinesAround = numMinesAround + countMine(x-1,y-1);
            numMinesAround = numMinesAround + countMine(x,y-1);
        else
            numMinesAround = numMinesAround + countMine(x-1,y);
            numMinesAround = numMinesAround + countMine(x-1,y-1);
            numMinesAround = numMinesAround + countMine(x,y-1);
            numMinesAround = numMinesAround + countMine(x+1,y);
            numMinesAround = numMinesAround + countMine(x+1,y-1);
        end
    end
end

function numMines = countMine(y,x,mineGrid)
    numMines = 0;
    if(mineGrid(x,y)<0)
        numMines = numMines+1;
    end
end

