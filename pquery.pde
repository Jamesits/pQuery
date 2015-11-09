/*
 pQuery by James Swineson
 2015-11-09
 
 Usage example:
     Pen p = new Pen();
     p.putDown()            // start drawing
       .move(50, 50)        // draw a line
       .dot(5)              // then put a dot here
       .pickUp()            // stop drawing (i.e. the pen will be moved but no trails left)
       .pMove(50, PI/2)     // move to 50 pixels right beneath current position
       .putDown()           // start drawing again
       .pdMove(300, -40);   // move to the point 300 pixels away on your top right, 30 degrees to the right horizon
*/

class Pen {
  private float x, y;
  private float angle;
  private boolean isDrawing;
  Pen() {
    this.x = 0;
    this.y = 0;
    this.angle = 0;
    this.isDrawing = false;
  }
  Pen(float x, float y) {
    this.x = x;
    this.y = y;
    this.angle = 0;
    this.isDrawing = false;
  }
  Pen(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.isDrawing = false;
  }
  Pen(Pen p) {
    this.x = p.x;
    this.y = p.y;
    this.angle = p.angle;
    this.isDrawing = false;
  }
  private void set(float x, float y) {
    if (x == 0 && y == 0) return;
    this.angle = atan2(y, x);
    this.x += x;
    this.y += y;
  }

  public Pen pickUp() {
    this.isDrawing = false;
    return this;
  }
  public Pen putDown() {
    this.isDrawing = true;
    return this;
  }
  public Pen move(float x, float y) {
    float lastX = this.x;
    float lastY = this.y;
    this.set(x, y);
    if (this.isDrawing) line(lastX, lastY, this.x, this.y);
    return this;
  }
  public Pen moveTo(float x, float y) {
    return move(x - this.x, y - this.y);
  }
  public Pen moveTo(Pen p) {
    return moveTo(p.x, p.y);
  }
  public Pen pMove(float len, float rad) {
    return move(len * cos(rad), len * sin(rad));
  }
  public Pen pMove(float len) {
    return this.pMove(len, this.angle);
  }
  public Pen pdMove(float len, float deg) {
    return pMove(len, radians(deg));
  }
  public Pen pdMove(float len) {
    return this.pMove(len);
  }
  public Pen dot() {
    if (this.isDrawing) point(this.x, this.y);
    return this;
  }
  public Pen dot(float size) {
    if (this.isDrawing) ellipse(this.x, this.y, size, size);
    return this;
  }
}