import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 2; //Able to Autodetect based on Pathway
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
//
int appWidth, appHeight;
float musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height;
float stopX, stopY, stopWidth, stopHeight;
//
void setup()
{
  size(700, 800);
  appWidth = width;
  appHeight = height;
  //Variables for any music button
  musicButtonDIV_Width = appWidth*1/2;
  musicButtonDIV_Height = appHeight*1/2;
  musicButtonDIV_X = musicButtonDIV_Width - musicButtonDIV_Width*1/2;
  musicButtonDIV_Y = musicButtonDIV_Height - musicButtonDIV_Height*1/2;
  //Use if statement to change, introduce ternary operator
  //
  //Population (Variables)
  //
  //musicButtonSquareX, = ;
  //musicButtonSquareY, = ;
  //musicButtonSquareWidth = ; 
  //musicButtonSquareHeight = ;
  //float padding = 1.0/4.0;
  //float stopButtonSize = 1.0-(1.0/4.0);
  /*
  stopWidth = musicButtonDIV_Width*stopButtonSize; //stopButtonSize
  stopHeight = musicButtonDIV_Height*stopButtonSize; //stopButtonSize
  stopX = musicButtonDIV_X+padding;
  stopY = musicButtonDIV_Y+padding;
  */
  //
  /*
  if ( musicButtonWidth >= musicButtonHeight ) { //error: square does not go in the middle
   // musicButtonWidth needs to change
   musicButtonWidth = musicButtonHeight;
   } else {
   // musicButtonHeight needs to change
   musicButtonHeight = musicButtonWidth;
   }
   */
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder
  //
  // Load Music
  String musicPathway = "Music/";
  String mp3FileName = ".mp3";
  //Alphebetical order, should be same as OS ordering files
  String meatballParade = "Meatball-Parade";
  String sneakySnitch = "Sneaky-Snitch";
  //
  //Add reading into array
  String directory = "../../../" + musicPathway;
  String file = directory + meatballParade + mp3FileName;
  song[currentSong] = minim.loadFile(file);
  file = directory + sneakySnitch + mp3FileName;
  song[currentSong+=1] = minim.loadFile(file);
  //
  currentSong = 0;
  //
  //Use play(timeStart) and loop(numberOfLoops)
  //Purpose is 2D shapes
  //Introduce keyPressed as keyboard shortcuts
  //Introduce mousePressed as interaction
  //
  //DIVs
  //rect() based on variables; variables change with program (introduces parameters of a function and TABS)
  //rect( X, Y, Width, Height );
  rect( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
} //End setup
//
void draw() {
  //background(200); // Gray Scale: 0-255
  //rect( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight ); 
  //fill();
  //rect( stopX, stopY, stopWidth, stopHeight );
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
//End Main Program
