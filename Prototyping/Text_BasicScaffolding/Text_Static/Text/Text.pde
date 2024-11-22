/* Static Text
 - Testing for Aspect Ratio
 - introduce single and mutliple executed code
 - activity: do another rectangle with text in it
 - copy and paste to dynamic program
 */
// Global Variables
int appWidth, appHeight;
float titleX, titleY, titleWidth, titleHeight;
float johnX, johnY, johnWidth, johnHeight;
float jimX, jimY, jimWidth, jimHeight;
PFont titleFont, jimFont, johnFont;
color crispybrown=#C1884A, white=#FFFFFF, resetDefaultInk=white;
int size;
//
//Display
size( 500, 700 ); //Portrait CANVAS
appWidth = width;
appHeight = height;
//
/* Population
- using 10's
- Could be 100s or percent
- Able to use decimals to dial in the values
*/
titleX = appWidth*1/10;
titleY = appHeight*1/10;
titleWidth = appWidth*8/10;
titleHeight = appHeight*1/10;
johnX = titleX; //Best Practice: change on formula
johnY = appHeight*4.5/10; //Ratio done last. How is this Centered Vertically?
johnWidth = titleWidth; //Best Practice
johnHeight = titleHeight; //Best Practice
jimX = titleX; //Best Practice
jimY = appHeight*8/10;
jimWidth = titleWidth; //Best Practice
jimHeight = titleHeight; //Best Practice
//DIVs
rect( titleX, titleY, titleWidth, titleHeight ); //Title Font
rect( johnX, johnY, johnWidth, johnHeight ); // Testing Aspect Ratio of Fonts
rect( jimX, jimY, jimWidth, jimHeight ); //Different Font
//
//
fill(crispybrown);
textAlign(CENTER, CENTER);
size = 50;
textFont(titleFont, size);
text(title, titleX, titleY, titleWidth, titleHeight);
