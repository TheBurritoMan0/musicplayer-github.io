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
float imageDIV_X, imageDIV_Y, imageDIV_Width, imageDIV_Height;

void setup()
{
  size(1000, 800);
  appWidth = width;
  appHeight = height;
  //Variables for any music button
  imageDIV_Width = appWidth*1/2;
  imageDIV_Height = appHeight*1/2;
  imageDIV_X = imageDIV_Width - imageDIV_Width*1/2;
  imageDIV_Y = imageDIV_Height - imageDIV_Height*1/2;
  //Use if statement to change, introduce ternary operator
  //
  //Population (Variables)
  //Work out a case Study: shorter side of DIV
  if ( imageDIV_Width >= imageDIV_Height ) { // Landscape //error: square does not go in the middle
    println();
  } else { //Portrait
    println();
  }
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
  song[currentSong+=1] = minim.loadFile(file);
  //
  currentSong = 0;
  //
  //song[currentSong].play();
  //Use play(timeStart) & loop(numberOfLoops)
  //Purpose is 2D Shapes
  //Introduce keyPressed as keyboard shortcuts
  //Introduce mousePressed as interaction
  //
  //DIVs
  //rect() based on variables; variables change with program (introduces parameters of a function and TABS)
  //rect( X, Y, Width, Height );
  rect( imageDIV_X, imageDIV_Y, imageDIV_Width, imageDIV_Height );
  //
} //End setup
//
void draw() {
  //background(appColorBackground); // Gray Scale: 0-255
  //
  rect(imageDIV_X, imageDIV_Y, imageDIV_Width, imageDIV_Height);
  //
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
  /* Key Board Short Cuts ... learning what the Music Buttons could be
   Note: CAP Lock with ||
   if ( key==? || key==? ) ;
   */
  //if ( key=='P' || key=='p' ) song[currentSong].play(); //Simple Play, no double tap possible
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
  if ( key=='L' | key=='l' ) song[currentSong].loop(1); // one loop
  if ( key=='K' | key=='k' ) song[currentSong].loop(); // loop forever
  if ( key=='F' | key=='f' ) song[currentSong].skip(10000); // fast forward
  if ( key=='R' | key=='r' ) song[currentSong].skip(-10000); // rewind
  if ( key=='M' | key=='m' );
  {//mute
    //
    if ( song[currentSong].isMuted() ) {
      //ERROR: song might not be playing
      //CATCH: ask .isPlaying() or !.isPlaying()song[currentSong].unmute();
      song[currentSong].unmute();
    } else {
      //Possible ERROR: Might rewind the song
      song[currentSong].mute();
    }
  }
  if ( key=='O' || key=='o' ) { // Pause
    //
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else {
      song[currentSong].play();
    }
  }
  if (key == CODED || keyCode ==ESC) exit(); //good ol' quit button
  if (key == 'Q' || key == 'q') exit();
  if ( key=='N' | key=='n' )
  {//next song
    if (song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      //
      currentSong++;
      song[currentSong].play();
      if ( currentSong==numberOfSongs-1 ) {
        currentSong = 0;
      } else {
        currentSong++;
      }
      song[currentSong].play();
    } else {
      //
      song[currentSong].rewind();
      //
    }
    if ( currentSong==numberOfSongs-1 ) {
      currentSong = 0;
    } else {
      currentSong++;
    }
  }
  if ( key=='<' | key=='<' ); //previous song
  /*
   if ( key=='' | key=='' ); //
   if ( key=='' | key=='' ); //
   if ( key=='' | key=='' ); //
   if ( key=='' | key=='' ); //
   if ( key=='' | key=='' ); //
   if ( key=='' | key=='' ); //
   if ( key=='' | key=='' ); //
   */
} //End keyPressed
//
// End Main Program
