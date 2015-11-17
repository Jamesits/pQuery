# pQuery

Write less, draw more: the Processing drawing library

## Example

```Processing
 Pen p = new Pen();
 p.putDown()              // start drawing
   .move(50, 50)          // draw a line
   .dot(5)                // then put a dot here
   .pickUp()              // stop drawing (i.e. the pen will be moved but no trails left)
   .pMove(50, PI/2)       // move to 50 pixels right beneath current position
   .putDown()             // start drawing again
   .pdMove(300, -30);     // move to the point 300 pixels away on your top right, 30 degrees to the right horizon
   
 Pen p2 = new Pen(20, 50) // set start point
  .putDown()              // start drawing 
  .pdMove(200, 0)         // move 200px to the right (0 degree)
  .moveTo(p);             // connect two end points
```

## Author

 * [James Swineson](https://swineson.me)
