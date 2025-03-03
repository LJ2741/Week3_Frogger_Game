class Collision {
  
  
  Collision() {
  }
  
  Boolean col(PVector a,PVector b,int c) {
    if (dist(a.x,a.y,b.x,b.y) < c) {
      return true;
    } else { 
      return false ;
    }
  }
}
