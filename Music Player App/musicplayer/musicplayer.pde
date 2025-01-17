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
float musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height;
float musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight;
float stopX, stopY, stopWidth, stopHeight;
float playButton1X, playButton1Y, playButton2X, playButton2Y, playButton3X, playButton3Y;
float quitLine;
float yeahX1, yeahY1, yeahWidth1, yeahHeight1;
float yeahX2, yeahY2, yeahWidth2, yeahHeight2;
float yeahX3, yeahY3, yeahWidth3, yeahHeight3;
PFont freakyFont, johnFont, dokkanFont;
color orange=#CC5500, otherorange=#D38531, otherotherorange=#E8A552, othergray=#625C55, dark=#554C43, black=#000000, sortablack=#2E2E2E;
color stopButtonHoverOver;
color dayForeground=orange, dayHoverover=otherorange, dayBackground=otherotherorange;
color darkForeground=orange, darkHoverover=dark, darkBackground=othergray;
color nightForeground=dark, nightHoverover=black, nightBackground=sortablack;
color appColorForeground, appColorHoverover, appColorBackground;
color stopButtonHoverover;
color quitLineColor;
color ink, crispybrown=#C1884A, white=#FFFFFF, resetDefaultInk=white;
int size;
String title = "sigma1", footer="sigma2", phrase="sigma3";
//Boolean randomColour = false;
Boolean colorDarkMode=true;
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
  //Variables for any music button
  musicButtonDIV_Width = appWidth*1.6/2;
  musicButtonDIV_Height = appHeight*1/8;
  musicButtonDIV_X = musicButtonDIV_Width - musicButtonDIV_Width*1/2;
  musicButtonDIV_Y = musicButtonDIV_Height - musicButtonDIV_Height*1/2;
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
  quitLine = (musicButtonSquareWidth/musicButtonSquareWidth) + musicButtonSquareWidth*1/4*1/2;
  playButton1X = musicButtonSquareX + musicButtonSquareWidth*1/4;
  playButton1Y  = musicButtonSquareY + musicButtonSquareHeight*1/4;
  playButton2X = musicButtonSquareX + musicButtonSquareWidth*3/4;
  playButton2Y = musicButtonSquareY + musicButtonSquareHeight*1/2;
  playButton3X = musicButtonSquareX + musicButtonSquareWidth*1/4;
  playButton3Y = musicButtonSquareY + musicButtonSquareHeight*3/4;
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
  yeahX2 = yeahX1 = appWidth*6/10;
  yeahY1 = appHeight*2/10;
  yeahWidth1 = appWidth*4/10;
  yeahHeight3 = yeahHeight2 = yeahHeight1 = appHeight*1/10;
  yeahY2 = appHeight*3/10;
  yeahWidth2 = appWidth*4/10;
  yeahX3 = appWidth*6/10;
  yeahY3 = appHeight*4/10;
  yeahWidth3 = appWidth*4/10;
  //
  //DIV: turn off onces repeated in VOID draw, saves systems resources
  //X, Y, Width, Height
  /*
  rect( yeahX1, yeahY1, yeahWidth1, yeahHeight1 ); //Title
  rect( yeahX2, yeahY2, yeahWidth2, yeahHeight2 ); //Position
  rect( yeahX3, yeahY3, yeahWidth3, yeahHeight3 ); //Time Remaining | Total Song Length
  */
  println(colorDarkMode);
  if (colorDarkMode==false && hour()<=7 && hour()>=17)
  {
    //Night Mode
    appColorForeground=nightForeground;
    appColorHoverover=nightHoverover;
    appColorBackground=nightBackground;
    println("sigma");
  } else if (colorDarkMode==false && hour()<7 || hour()>17)
  {
    //Dark Mode
    appColorForeground=darkForeground;
    appColorHoverover=darkHoverover;
    appColorBackground=darkBackground;
    println("sigma1");
  } else
  {
    //Day Mode
    appColorForeground=dayForeground;
    appColorHoverover=dayHoverover;
    appColorBackground=dayBackground;
    println("sigma3");
  }
}
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
    quitLineColor = appColorHoverover;
  } else {
    stopButtonHoverOver = appColorForeground;
    quitLineColor = appColorForeground;
  }
  //
  //
  fill(stopButtonHoverover);
  noStroke(); //Colour
  //
  //triangle(playButton1X, playButton1Y, playButton2X, playButton2Y, playButton3X, playButton3Y);
  //
  fill(1);
  stroke(1);
  textSize(100);
  text("very cool music player", 550, 120);
  textSize(35);
  text("N to go to next song", 550, 200);
  text("S to pause the song, hitting the play button will also pause it", 550, 250);
  text("ESC to exit the music player", 550, 300);
  //
  stroke(quitLineColor);
  strokeWeight(quitLine);
  noFill();
  noStroke();
  fill(quitLineColor);
  triangle(playButton1X, playButton1Y, playButton2X, playButton2Y, playButton3X, playButton3Y);
  fill(225);
  stroke(1);
  //Music Buttons Interactions: cascading IFs can become AND Statements
  //Note: keypressed must have click on screen
  //song[currentSong].isPlaying();
  //

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
  textFont( johnFont, size );
  //int timeRemaining = playListMetaData[currentSong].length()/1000; // Needs Updating
  int timeRemaining = playListMetaData[currentSong].length()/1000 - playList[currentSong].position()/1000; // Needs Updating
  String concatTimeRemaining = str ( timeRemaining ) + " | " + str ( playListMetaData[currentSong].length()/1000 ) + " Seconds";
  text( concatTimeRemaining, yeahX3, yeahY3, yeahWidth3, yeahHeight3 ); //Note: str(timeRemaining)
  //NOTE: Students to format Minutes and Seconds
  //
  //Repeating Code, different from Static
  //ink = ( randomColour == true ) ? color( random(0, 256), random(256), random(256) ) : crispybrown ; //Ternary Operator
  //
  fill(ink);
  size = 83; //Change the number until it fits
  textFont( dokkanFont, size );
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
  //Boolean for Click
  //if() {} else {}
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause(); //single tap
    } else {
      playList[currentSong].play(); //double tap
    }
  }
  //
  /* STOP Button Mouse Press, after Hoverover
   Must have Hoverover to ensure mouse will activate, visual confirmation of algorithm
   */
  if ( mouseX>yeahX1 && mouseX<yeahX1+yeahWidth1 && mouseY>yeahY1 && mouseY<yeahY1+yeahHeight1 ) {
    playList[currentSong].play(); // .loop(0) ... .play() matches keyPressed
  }
}
//
void keyPressed() {
   // Random Colour of .title()
  /*if ( randomColour == true ) {
    randomColour = false;
  } else {
    randomColour = true;
  }
  //
  /* Key Board Short Cuts ... learning what the Music Buttons could be
   Note: CAP Lock with ||
   if ( key==? || key==? ) ;
   */
  if ( key=='P' || key=='p' ) playList[currentSong].play(); //Simple Play, no double tap possible
  //
  //if ( key=='P' || key=='p' ) song[currentSong].loop(0); //Simple Play, double tap possible
  /* Note: double tap is automatic rewind, no pause
   Symbol is two triangles
   This changes what the button might become after it is pressed
   */
  //if ( key=='S' || key=='s' ) song[currentSong].pause(); //Simple Stop, no double taps
  //
  if ( key=='S' | key=='s' ) {
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause(); //single tap
    } else {
      playList[currentSong].rewind(); //double tap
    }
  }
  if ( key=='L' || key=='l' ) playList[currentSong].loop(1); // Loop ONCE: Plays, then plays again, then stops & rewinds
  if ( key=='K' || key=='k' ) playList[currentSong].loop(); // Loop Infinitely //Parameter: BLANK or -1
  if ( key=='F' || key=='f' ) playList[currentSong].skip( 10000 ); // Fast Forward, Rewind, & Play Again //Parameter: milliseconds
  if ( key=='R' || key=='r' ) playList[currentSong].skip( -10000 ); // Fast Reverse & Play //Parameter: negative numbers
  if ( key=='M' || key=='m' ) { // MUTE
    //
    //MUTE Behaviour: stops electricty to speakers, does not stop file
    //NOTE: MUTE has NO built-in PUASE button, NO built-in rewind button
    //ERROR: if song near end of file, user will not know song is at the end
    //Known ERROR: once song plays, MUTE acts like it doesn't work
    if ( playList[currentSong].isMuted() ) {
      //ERROR: song might not be playing
      //CATCH: ask .isPlaying() or !.isPlaying()
      playList[currentSong].unmute();
    } else {
      //Possible ERROR: Might rewind the song
      playList[currentSong].mute();
    }
  }
  if ( key=='O' || key=='o' ) { // Pause
    //
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause();
    } else {
      playList[currentSong].play();
    }
  }
  if ( key==CODED || keyCode==ESC ) exit(); // QUIT //UP
  if ( key=='Q' || key=='q' ) exit(); // QUIT
  //
  if ( key=='N' || key=='n' ) { // NEXT //See .txt for starter hint
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause();
      playList[currentSong].rewind();
      //
      if ( currentSong==numberOfSongs-1 ) {
        currentSong = 0;
      } else {
        currentSong++;
      }
      playList[currentSong].play();
    } else {
      //
      playList[currentSong].rewind();
      //
      if ( currentSong==numberOfSongs-1 ) {
        currentSong = 0;
      } else {
        currentSong++;
      }
      // NEXT will not automatically play the song
      //song[currentSong].play();
    }
  }
  //if ( key=='P' || key=='p' ) ; // Previous //Students to finish
  //
  //if ( key=='S' || key=='s' ) ; // Shuffle - PLAY (Random)
  //Note: will randomize the currentSong number
  //Caution: random() is used very often
  //Question: how does truncating decimals affect returning random() floats
  /*
  if ( key=='' || key=='' ) ; // Play-Pause-STOP //Advanced, beyond single buttons
   - need to have basic GUI complete first
   */
  //
}
//
// end main
