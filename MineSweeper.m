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
    showGrid(x,y) = 0;
end