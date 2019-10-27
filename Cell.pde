class Cell {
  
  float x, y;
  int i, j;
  boolean visited, current;
  int[] sides;
  color c;
  
  public Cell(float x, float y, int i, int j) {
    this.x = x;
    this.y = y;
    this.i = i;
    this.j = j;
    this.visited = this.current = false;
    sides = new int[4];
    for (int s = 0; s < sides.length; s++) 
      sides[s] = 1;
  }
  
  void markVisited() {
    this.visited = true;
    numbVisited++;
    //colorMode(HSB, 255, 100, 100);
    //c = color(map(numbVisited, 0, rows*cols, 0, 255), 100, 100);
    c = color(0, 100, 100);
  }
  
  void markCurrent() {
    this.current = !this.current;
  }
 
  void display() {
    if (visited) {
      if (current) 
        fill(0, 255, 100);
      else
        fill(c);
    }
    else
      fill(0);
    strokeWeight(1);
    stroke(255);
    rect(x, y, width/cols, height/rows);
    strokeWeight(1);
    stroke(c);
    if (sides[0] == 0)
      removeTopWall();
    if (sides[1] == 0)  
      removeRightWall();
    if (sides[2] == 0)
      removeBottomWall();
    if (sides[3] == 0)
      removeLeftWall();
  }
  
  void removeLeftWall() {
    line(x, y+1, x, y+height/rows-1);    
  }
  
  void removeRightWall() {
    line(x+width/cols, y+1, x+width/cols, y+height/rows-1);
  }
  
  void removeTopWall() {
    line(x+1, y, x+width/cols-1, y);   
  }
  
  void removeBottomWall() {
    line(x+1, y+height/rows, x+width/cols-1, y+height/rows);    
  }
  
}
