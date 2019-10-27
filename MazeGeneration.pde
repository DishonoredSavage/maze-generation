import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

int rows = 20;
int cols = 20;

Cell[][] grid;
Cell currentCell;
Stack visited;
int numbVisited;
boolean generated;

void setup() {
  size(800, 800);
  background(0);
  grid = new Cell[cols][rows];
  visited = new Stack();
  numbVisited = 0;
  genGrid();
  grid[0][0].markVisited();
  currentCell = grid[0][0];
}

void draw() {
  displayGrid();
  recursiveBacktracker();
}

void genGrid() {
  for (int i = 0; i < cols; i++) 
    for (int j = 0; j < rows; j++) 
        grid[i][j] = new Cell(width/cols*i, height/rows*j, i, j);
}

void displayGrid() {
  for (int i = 0; i < cols; i++) 
    for (int j = 0; j < rows; j++) 
        grid[i][j].display();
}

void recursiveBacktracker() {
  if (numbVisited < rows*cols) {
    
    List<Cell> unvisitedNeighbours = new ArrayList<Cell>();
    
    if (currentCell.i != 0)
      if (!grid[currentCell.i-1][currentCell.j].visited)
          unvisitedNeighbours.add(grid[currentCell.i-1][currentCell.j]);
    if (currentCell.i != rows-1)
      if (!grid[currentCell.i+1][currentCell.j].visited)
        unvisitedNeighbours.add(grid[currentCell.i+1][currentCell.j]);
    if (currentCell.j != 0)
      if (!grid[currentCell.i][currentCell.j-1].visited)
        unvisitedNeighbours.add(grid[currentCell.i][currentCell.j-1]);
    if (currentCell.j != cols-1)
      if (!grid[currentCell.i][currentCell.j+1].visited)
          unvisitedNeighbours.add(grid[currentCell.i][currentCell.j+1]);
          
    if (unvisitedNeighbours.size() == 0) {
      currentCell.markCurrent();
      currentCell = (Cell)visited.pop();
      currentCell.markCurrent();
    } else {
          
      int randNumb = (int)random(unvisitedNeighbours.size());
      currentCell.markCurrent();
      visited.push(currentCell);
      
      if ((unvisitedNeighbours.get(randNumb).i == currentCell.i-1) && 
          (unvisitedNeighbours.get(randNumb).j == currentCell.j)) {
          currentCell.sides[3] = 0;  
          unvisitedNeighbours.get(randNumb).sides[1] = 0;
      }
      if ((unvisitedNeighbours.get(randNumb).i == currentCell.i+1) && 
          (unvisitedNeighbours.get(randNumb).j == currentCell.j)) {
          currentCell.sides[1] = 0; 
          unvisitedNeighbours.get(randNumb).sides[3] = 0;
      }
      if ((unvisitedNeighbours.get(randNumb).i == currentCell.i) && 
          (unvisitedNeighbours.get(randNumb).j == currentCell.j-1)) {
          currentCell.sides[0] = 0;
          unvisitedNeighbours.get(randNumb).sides[2] = 0;
      }
      if ((unvisitedNeighbours.get(randNumb).i == currentCell.i) && 
          (unvisitedNeighbours.get(randNumb).j == currentCell.j+1)) {
          currentCell.sides[2] = 0;       
          unvisitedNeighbours.get(randNumb).sides[0] = 0;
      }
          
      currentCell = unvisitedNeighbours.get(randNumb);
      currentCell.markVisited();
      currentCell.markCurrent();
    }
  } 
}
