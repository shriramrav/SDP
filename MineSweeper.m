clc
clear

[mineGrid showGrid] = createGrid(10,8,10)
showGrid = click(5,7,showGrid)

function [mineGrid showGrid] = createGrid(cols,rows,mines)
    mineGrid = zeros(cols,rows);
    showGrid = zeros(cols,rows)+9;
    numMines = 0;
    while numMines<mines
       xCor = randi(rows);
       yCor = randi(cols);
       if mineGrid(yCor,xCor)~= 1
          mineGrid(yCor,xCor) = -1;
          numMines = numMines+1;
       end
    end
    
end

function showGrid = click(y,x,showGrid)
    showGrid(x,y) = 0;
end