/* Static Text
 - Testing for Aspect Ratio
 - introduce single and mutliple executed code
 - activity: do another rectangle with text in it
 - copy and paste to dynamic program
 */
// Global Variables
int appWidth, appHeight;
float freakyX, freakyY, freakyWidth, freakyHeight;
float superCoolPhraseX, superCoolPhraseY, superCoolPhraseWidth, superCoolPhraseHeight;
float johnX, johnY, johnWidth, johnHeight;
PFont freakyFont, johnFont, dokkanFont;
color crispybrown=#C1884A, white=#FFFFFF, resetDefaultInk=white; //Not Night Mode Friendly
int size;
String freaky = "freaky", dokkan="dokkan font goes hard", john="im gonna touch you vro";
//
void setup()
{
//Display
size( 500, 700 ); //Portrait CANVAS
background(25);
appWidth = width;
appHeight = height;
//
//Text: Single Executed Code
//Fonts from OS (Operating System)
//String[] fontList = PFont.list(); //To list all fonts available on OS
//printArray(fontList); //For listing all possible fonts to choose from, then createFont
// Tools / Create Font / Find Font / Do not press "OK", known bug
freakyFont = createFont("Papyrus", 55); //Verify the font exists in Processing.Java
johnFont = createFont("Edo SZ", 55);
dokkanFont = createFont("HelveticaNeue BlackCond", 55);
//
/* Population
- using 10's
- Could be 100s or percent
- Able to use decimals to dial in the values
*/
freakyX = appWidth*1/10;
freakyY = appHeight*1/10;
freakyWidth = appWidth*8/10;
freakyHeight = appHeight*1/10;
superCoolPhraseX = freakyX; //Best Practice: change on formula
superCoolPhraseY = appHeight*4.5/10; //Ratio done last. How is this Centered Vertically?
superCoolPhraseWidth = freakyWidth; //Best Practice
superCoolPhraseHeight = freakyHeight; //Best Practice
johnX = freakyX; //Best Practice
johnY = appHeight*8/10;
johnWidth = freakyWidth; //Best Practice
johnHeight = freakyHeight; //Best Practice
//DIVs
rect( freakyX, freakyY, freakyWidth, freakyHeight ); //Title Font
rect( superCoolPhraseX, superCoolPhraseY, superCoolPhraseWidth, superCoolPhraseHeight ); // Testing Aspect Ratio of Fonts
rect( johnX, johnY, johnWidth, johnHeight ); //Different Font
}
//
void draw()
{
//Drawing Text
fill(crispybrown); //Ink, hexidecimal copied from Color Selector
textAlign(CENTER, CENTER); //Align X&Y, see Processing.org / Reference
//Values: [ LEFT | CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]
size = 30; //Change the number until it fits
noStroke();
textFont( freakyFont, size ); 
text( freaky, freakyX, freakyY, freakyWidth, freakyHeight );
textFont( johnFont, size ); 
text( john, johnX, johnY, johnWidth, johnHeight );
textFont( dokkanFont, size ); 
text( dokkan, superCoolPhraseX, superCoolPhraseY, superCoolPhraseWidth, superCoolPhraseHeight ); 
} // End draw
//
void mousePressed(){} //End mousePressed
//
void keyPressed(){}//End keyPressed
//
//end MAIN
