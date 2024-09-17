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
int currentSong = numberOfSongs - numberOfSongs; //beginning current song is ZERO
//
void setup()
{
  size(1350, 900);
  //
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
  String directory = "//../../" + musicPathway;
  println(directory);
  String file = directory + meatballParade + mp3FileName;
  //
  //song[currentSong] = minim.loadFile( "../../Music/Meatball-Parade.mp3");
  //
  //song[currentSong+=1] = minim.loadFile( "../../Music/Sneaky-Snitch.mp3");
  //song[1].play();
  //song[currentSong+=1] = minim.loadFile();
  
  //Add currentSong as hardcoded link
  //Use play(timeStart) and loop(numberOfLoops)
  //Inspect with println
  //Purpose is 2D shapes
}//End setup
//
void draw () {
  
} //End draw
//
void mousePressed() {
  
} //End mousePressed
//
void keyPressed() {
  
} //End keyPressed
//
//End Main Program
