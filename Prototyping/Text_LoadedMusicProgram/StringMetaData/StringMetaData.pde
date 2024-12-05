import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 3;
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs];
//
int appWidth, appHeight;
float yeahX1, yeahY1, yeahWidth1, yeahHeight1;
float yeahX2, yeahY2, yeahWidth2, yeahHeight2;
float yeahX3, yeahY3, yeahWidth3, yeahHeight3;
PFont freakyFont, johnFont, dokkanFont;
color ink, crispybrown=#C1884A, white=#FFFFFF, resetDefaultInk=white;
int size;
String title = "sigma1", footer="sigma2", phrase="sigma3";
Boolean randomColour = false;
//
/*
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
 AudioMetaData[] playListTitleMetaData = new AudioMetaData[numberOfSongs];
 AudioMetaData[] playListPositionMetaData = new AudioMetaData[numberOfSongs];
 AudioMetaData[] playListTimeRemainingMetaData = new AudioMetaData[numberOfSongs]; //might change
 AudioMetaData[] playListTotalTimeMetaData = new AudioMetaData[numberOfSongs]; //might change
 int currentSong = numberOfSongs - numberOfSongs;
 */
void setup()
{
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
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
  String file = "";
  /*
  String file = directory + meatballParade + mp3FileName;
  playList[currentSong] = minim.loadFile( file );
  file = directory + sneakySnitch + mp3FileName;
  playList[currentSong+=1] = minim.loadFile( file );
  file = directory + monkeys + mp3FileName;
  playList[currentSong+=1] = minim.loadFile(file);
  */
  //
  for (int i=0; i<numberOfSongs; i++) {
    if (i==0) file = directory + meatballParade + mp3FileName;
    if (i==1) file = directory + sneakySnitch + mp3FileName;
    if (i==2) file = directory + monkeys + mp3FileName;
    playList[i] = minim.loadFile( file );
  }
  currentSong = 0;
  //
  //
  // NOTE: Lines of code repeating
  /*
  playListMetaData[currentSong] = playList[currentSong].getMetaData(); //reads song meta 1, like song 1, mimicing array notation
  currentSong++;
  playListMetaData[currentSong] = playList[currentSong].getMetaData();
  currentSong++;
  playListMetaData[currentSong] = playList[currentSong].getMetaData();
  currentSong++;
  */
  /* NOTE: Introduce FOR LOOP
   - Known: how many lines of code
   - WHILE is for unknown loop interations
   */
   for (int i=0; i<numberOfSongs; i++) {
   playListMetaData[i] = playList[i].getMetaData();
   }
  //
  currentSong = 0;
  //
  /* For Prototyping Meta Data, print all information to the console first
   //Verifying Meta Data, 18 println's
   //See .mp3 Right-Click / Properties / Details
   println("\n"); //Two spaces: one for ln, one for /n escape
   println(currentSong, playListMetaData[currentSong] );
   println( "File Name: ", playListMetaData[currentSong].fileName() );
   println( "Song Length (in milliseconds): ", playListMetaData[currentSong].length() );
   println( "Song Length (in seconds): ", playListMetaData[currentSong].length()/1000 );
   println( "Song Length (in minutes & seconds): ", (playListMetaData[currentSong].length()/1000)/60, " minute", (playListMetaData[currentSong].length()/1000)-((playListMetaData[currentSong].length()/1000)/60 * 60), " seconds" );
   println( "Song Title: ", playListMetaData[currentSong].title() );
   println( "Author: ", playListMetaData[currentSong].author() ); //Song Writer or Performer
   println( "Composer: ", playListMetaData[currentSong].composer() ); //Song Writer
   println( "Orchestra: ", playListMetaData[currentSong].orchestra() );
   println( "Album: ", playListMetaData[currentSong].album() );
   println( "Disk: ", playListMetaData[currentSong].disc() );
   println( "Publisher: ", playListMetaData[currentSong].publisher() );
   println( "Date Release: ", playListMetaData[currentSong].date() );
   println( "Copyright: ", playListMetaData[currentSong].copyright() );
   println( "Comment: ", playListMetaData[currentSong].comment() );
   println( "Lyrics: ", playListMetaData[currentSong].lyrics() );
   println( "Track: ", playListMetaData[currentSong].track() );
   println( "Genre: ", playListMetaData[currentSong].genre() );
   println( "Encoded: ", playListMetaData[currentSong].encoded() ); //how a computer reads the file
   */
  //playList[currentSong].play(); //Testing Only
  //
  //Text Loading
  //Text: Single Executed Code
  //Fonts from OS (Operating System)
  //String[] fontList = PFont.list(); //To list all fonts available on OS
  //printArray(fontList); //For listing all possible fonts to choose from, then createFont
  // Tools / Create Font / Find Font / Do not press "OK", known bug
  freakyFont = createFont("Papyrus", 55); //Verify the font exists in Processing.Java
  johnFont = createFont("Edo SZ", 55);
  dokkanFont = createFont("HelveticaNeue BlackCond", 55);
  //
  //
  //Population
  yeahX2 = yeahX1 = appWidth*1/10;
  yeahY1 = appHeight*4/10;
  yeahWidth1 = appWidth*8/10;
  yeahHeight3 = yeahHeight2 = yeahHeight1 = appHeight*1/10;
  yeahY2 = appHeight*3/10;
  yeahWidth2 = appWidth*2/10;
  yeahX3 = appWidth*5/10;
  yeahY3 = appHeight*5/10;
  yeahWidth3 = appWidth*4/10;
  //
  //DIV: turn off onces repeated in VOID draw, saves systems resources
  //X, Y, Width, Height
  /*
  rect( yeahX1, yeahY1, yeahWidth1, yeahHeight1 ); //Title
  rect( yeahX2, yeahY2, yeahWidth2, yeahHeight2 ); //Position
  rect( yeahX3, yeahY3, yeahWidth3, yeahHeight3 ); //Time Remaining | Total Song Length
  */
}
//
void draw() {
  //
  /*Optical Illusion creating movement
   - screen goes at front of draw(), repeating setup()
   */
  fill(resetDefaultInk);
  rect( yeahX1, yeahY1, yeahWidth1, yeahHeight1 );
  rect( yeahX2, yeahY2, yeahWidth2, yeahHeight2 );
  rect( yeahX3, yeahY3, yeahWidth3, yeahHeight3 );
  //
  //Drawing Text: applies to all text
  textAlign(CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [ LEFT | CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]
  ink = crispybrown;
  fill(ink);
  size = 30; //Change the number until it fits
  textFont( freakyFont, size );
  /*Problem: .mp3 does not have the Meta Data Entered
   - must inspect .mp3 properties / details for information
   - what if Drag&Drop thus no inspection
   - metadata=="", then should put something in for the user
   */
  String titleCheck = ( playListMetaData[currentSong].title()!="" ) ? "Title Exists": "Title Does not Exist" ; //Careful with "not ="
  text( playListMetaData[currentSong].title(), yeahX1, yeahY1, yeahWidth1, yeahHeight1 );
  fill(ink);
  size = 43; //Change the number until it fits
  textFont( footerFont, size );
  //int timeRemaining = playListMetaData[currentSong].length()/1000; // Needs Updating
  int timeRemaining = playListMetaData[currentSong].length()/1000 - playList[currentSong].position()/1000; // Needs Updating
  String concatTimeRemaining = str ( timeRemaining ) + " | " + str ( playListMetaData[currentSong].length()/1000 ) + " Seconds";
  text( concatTimeRemaining, yeahX3, yeahY3, yeahWidth3, yeahHeight3 ); //Note: str(timeRemaining)
  //NOTE: Students to format Minutes and Seconds
  //
  //Repeating Code, different from Static
  ink = ( randomColour == true ) ? color( random(0, 256), random(256), random(256) ) : purple ; //Ternary Operator
  //
  fill(ink);
  size = 83; //Change the number until it fits
  textFont( phraseFont, size );
  text( str ( playList[currentSong].position()/1000 ), yeahX2, yeahY2, yeahWidth2, yeahHeight2 );
  //
  /*
  fill(resetDefaultInk);
   //rect( metaDataX1, metaDataY1, metaDataWidth1, metaDataHeight1 );
   //rect( metaDataX2, metaDataY2, metaDataWidth2, metaDataHeight2 );
   rect( metaDataX3, metaDataY3, metaDataWidth3, metaDataHeight3 );
   */
}
//
void mousePressed() {
}
//
void keyPressed() {
}
//
// end main
