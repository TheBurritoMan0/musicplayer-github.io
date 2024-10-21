import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 3; //Able to Autodetect based on Pathway
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
//
int appWidth, appHeight;
//CAUTION: IF Statement Variable Population
float musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height;
float musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight;
float stopX, stopY, stopWidth, stopHeight;
float stopLine;
float stopButtonX1, stopButtonY1, stopButtonX2, stopButtonY2, stopButtonX3, stopButtonY3, stopButtonX4, stopButtonY4;
//
color orange=#CC5500, otherorange=#D38531, otherotherorange=#E8A552, othergray=#625C55, dark=#554C43, black=#000000, sortablack=#2E2E2E;
color stopButtonHoverOver;
color dayForeground=orange, dayHoverover=otherorange, dayBackground=otherotherorange;
color darkForeground=orange, darkHoverover=dark, darkBackground=othergray;
color nightForeground=dark, nightHoverover=black, nightBackground=sortablack;
color appColorForeground, appColorHoverover, appColorBackground;
color stopButtonHoverover, stopLineColor;
//
Boolean colorDarkMode=true;
//
void setup()
{
  size(1000, 800);
  appWidth = width;
  appHeight = height;
  //Variables for any music button
  musicButtonDIV_Width = appWidth*1/2;
  musicButtonDIV_Height = appHeight*1/2;
  musicButtonDIV_X = musicButtonDIV_Width - musicButtonDIV_Width*1/2;
  musicButtonDIV_Y = musicButtonDIV_Height- musicButtonDIV_Height*1/2;
  //Use if statement to change, introduce ternary operator
  //
  //Population (Variables)
  //Work out a case Study: shorter side of DIV
  if ( musicButtonDIV_Width >= musicButtonDIV_Height ) { // Landscape //error: square does not go in the middle
    // musicButtonWidth needs to change
    musicButtonSquareWidth = musicButtonDIV_Height ;
    musicButtonSquareHeight = musicButtonDIV_Height ;
    float padding1 = musicButtonDIV_Width - musicButtonDIV_Height; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X + padding2 ; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y;
  } else { //Portrait
    // musicButtonHeight needs to change
    musicButtonSquareWidth = musicButtonDIV_Width ;
    musicButtonSquareHeight = musicButtonDIV_Width;
    float padding1 = musicButtonDIV_Height - musicButtonDIV_Width; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y + padding2;
  }
  //See Case Studies and paper folding
  stopWidth = musicButtonSquareWidth*1/2;
  stopHeight = musicButtonSquareHeight*1/2;
  stopX = musicButtonSquareX + musicButtonSquareWidth*1/4;
  stopY = musicButtonSquareY + musicButtonSquareHeight*1/4;
  stopLine = (musicButtonSquareWidth/musicButtonSquareWidth) + musicButtonSquareWidth*1/4*1/2;
  stopButtonX1 = stopX;
  stopButtonY1 = stopY;
  stopButtonX2 = stopX+stopWidth;
  stopButtonY2 = stopY+stopHeight;
  stopButtonX3 = stopButtonX2; 
  stopButtonY3 = stopButtonY1;
  stopButtonX4 = stopButtonX1; 
  stopButtonY4 = stopButtonY2;
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder
  //
  // Load Music
  String musicPathway = "Music/";
  String mp3FileName = ".mp3";
  //Alphebetical order, same as OS ordering files
  String meatballParade = "Meatball-Parade";
  String sneakySnitch = "Sneaky-Snitch";
  String monkeys = "Monkeys-Spinning-Monkeys";
  //
  //Add Reading into Array
  String directory = "../../../" + musicPathway;
  String file = directory + meatballParade + mp3FileName;
  song[currentSong] = minim.loadFile( file );
  file = directory + sneakySnitch + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  file = directory + monkeys + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  //
  currentSong = 0;
  //
  song[currentSong].play();
  //Use play(timeStart) & loop(numberOfLoops)
  //Purpose is 2D Shapes
  //Introduce keyPressed as keyboard shortcuts
  //Introduce mousePressed as interaction
  //
  //DIVs
  //rect() based on variables; variables change with program (introduces parameters of a function and TABS)
  //rect( X, Y, Width, Height );
  //rect( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
  println(colorDarkMode);
  if (colorDarkMode==false && hour()<=7 && hour()>=17) 
  {
    //Night Mode
    appColorForeground=nightForeground;
    appColorHoverover=nightHoverover;
    appColorBackground=nightBackground;
    println("sigma");
  } 
    else if (colorDarkMode==false && hour()<7 || hour()>17) 
    {
      //Dark Mode
      appColorForeground=darkForeground;
      appColorHoverover=darkHoverover;
      appColorBackground=darkBackground;
      println("sigma1");
    } 
    else 
    {
      //Day Mode
      appColorForeground=dayForeground;
      appColorHoverover=dayHoverover; 
      appColorBackground=dayBackground;
      println("sigma3");
    } 
 } //End setup
//
void draw() {
  background(appColorBackground); // Gray Scale: 0-255
  //
  rect( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
  //stroke(); //Colour
  //
  /* Note: 3 types of colour, in pairs for hoverover
   - Day: Foreground: #DED7D0 | Hoverover: #D38531 | Background: #FFBC74
   - Dark: Foreground: #DED7D0 | Hoverover: #BC6A11 | Background: #554C43
   - Night, no blue: Foreground: #312E2B | Hoverover: #2E2E2E | Background: #0D0D0D
   - Dark Mode is for all the time, how bright the screen is and eye strain
   - API: when does sunrise, when does sunset, is the system time within those hours
   - Night mode is for all the time or just
   - Note: preferences are hardcoded here but can be choices in CS20
   */
  //if ( day ) {} else if ( dark ) {} else {}
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    stopButtonHoverOver= appColorHoverover;
    stopLineColor = appColorHoverover;
  } else {
    stopButtonHoverOver = appColorForeground;
    stopLineColor = appColorForeground;
  }
  fill(stopButtonHoverOver);
  //noStroke(); //Colour
  //
  fill(stopButtonHoverOver);
  noStroke();
  //rect( stopX, stopY, stopWidth, stopHeight ); //(X, Y, width, height, roundedEdge1, roundedEdge2, roundedEdge3, roundedEdge4, )
  fill(1);
  stroke(1);
  textSize(100);
  text("very cool music player", 40, 120); 
  //
  stroke(stopLineColor);
  strokeWeight(stopLine);
  line(stopButtonX1, stopButtonY1, stopButtonX2, stopButtonY2);
  line(stopButtonX3, stopButtonY3, stopButtonX4, stopButtonY4);
  fill(255);
  stroke(1);
  //Music Buttons Interactions: cascading IFs can become AND Statements
  //Note: keypressed must have click on screen
  //song[currentSong].isPlaying();
  //
} //End draw
//
void mousePressed() {
  //Boolean for Click
  //if() {} else {}
   /* STOP Button Mouse Press, after Hoverover
   Must have Hoverover to ensure mouse will activate, visual confirmation of algorithm
   */
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
   if ( song[currentSong].isPlaying() ) {
   song[currentSong].pause(); //single tap
   } else {
   song[currentSong].rewind(); //double tap
   }
   }
} //End mousePressed
//
void keyPressed() {
  /* Key Board Short Cuts ... learning what the Music Buttons could be
   Note: CAP Lock with ||
   if ( key==? || key==? ) ;
   */
  if ( key=='P' || key=='p' ) song[currentSong].play(); //Simple Play, no double tap possible
  //
  if ( key=='P' || key=='p' ) song[currentSong].loop(0); //Simple Play, double tap possible
  /* Note: double tap is automatic rewind, no pause
   Simble is two triangles
   This changes what the button might become after it is pressed
   */
  //if ( key=='S' || key=='s' ) song[currentSong].pause(); //Simple Stop, no double taps
  //
  if ( key=='S' | key=='s' ) {
   if ( song[currentSong].isPlaying() ) {
   song[currentSong].pause(); //single tap
   } else {
   song[currentSong].rewind(); //double tap
   }
   }
} //End keyPressed
//
// End Main Program
