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
void setup()
{
  size(1350, 900);
  //
  minim = new Minim(this);
  // Load Music
  String musicPathway = "Music/";
  String mp3FileName = ".mp3";
  //Alphebetical order, same as OS ordering files
  String meatballParade = "Meatball-Parade";
  String sneakySnitch = "Sneaky-Snitch";
  String monkeys = "Monkeys-Spinning-Monkeys";
  //
  //Add Reading into Array
  String directory = "../../../../../" + musicPathway;
  println ( currentSong, directory );
  String file = directory + meatballParade + mp3FileName;
  println (file);
  song[currentSong] = minim.loadFile( file ); //Minim not installed, ERROR should be seen here
  file = directory + sneakySnitch + mp3FileName;
  println (file);
  song[currentSong+=1] = minim.loadFile( file );
  println( currentSong, song[currentSong] );
  file = directory + monkeys + mp3FileName;
  println (file);
  song[currentSong+=1] = minim.loadFile( file );
  //
  currentSong = 0;
  //
  song[currentSong].play();
} //End setup
//
void draw() {
  textSize(100);
  text("its working", 40, 120);
} //End draw
//
void mousePressed() {} //End mousePressed
//
void keyPressed() {} //End keyPressed
//
// End Main Program
