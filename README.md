# JM
**Jennifer Yu, Mansour Elsharawy**

_Period 5, APCS2 Brown Mykolyk_

:collision::collision::collision::collision::collision::collision::collision::collision::collision::collision::collision::collision:

*Fixed Bugs:*

(Severity is the measure of how useless the bug would've made the program if it had gone unfixed. Goes from 1 (low severity) to 5 (very high severity).)

| Problem| Solution|Severity|
|-------------|-------------|:-----:|
| Screen did not show balls growing and shrinking.|Ditched the while loop, realized draw() is repeatedly invoked.|5|
| Compilation error stating a curly brace was missing.|Though the error highlighted code in the Ball class, the missing curly bracewas actually within the Driver class.|1|
| Mouse-click would affect balls that did not collide.|Mouse-click changed the global variable within the Driver class. Problem remedied by placing a state variable within the Ball class instead, so each ball would have to keep track of its own individual state.|5|
|Balls would grow, not reach their max size, and leave residue on the screen, never shrinking.|Once a collision has been made after a mouse click, a ball should not have to be colliding with another ball to grow and shrink. A collision should change the state of the ball, leading to a whole other process that is independent of future collisions.|3|
|Balls that were shrinking would just become very small balls, but still visible.|See solution directly above.|3|
|Balls that had radius 0 were technically still points, and other balls would collide into what would seem to be empty space, yet begin the process of expansion.|Balls that shrunk to radius 0 would be in state 3, and then would be removed from the overall ArrayList of remaining balls. This means that though the balls still exist as points, the other remaining balls would only interact with the balls in the ArrayList.|2|

*Unfixed Bugs*

|Problem|Possible solution|Severity|
|--|--|:-:|
|Sometimes, balls will collide visually, but not undergo a state change.|Collision detection can become more precise. Right now, if two balls have a magnitude of radius distance from each other, they are considered to be colliding. This number can be tweaked in order to better detect colliding balls.|2|
|A few balls may vibrate along the edges of the screen, never leaving from the sides into the middle of the world.|An issue with bounce, maybe instead of just reversing the sign on dx or dy, you can add or subtract 1. However, that would require a few more conditonals.|1|
|Gets pretty laggy when you put in a lot of balls, upwards of multiples of 100.|Don't put in so many balls?|1|
|The balls are ugly.|Seriously, how did they look so pretty and cloudy/opaque in the example??:sweat:|-1|
