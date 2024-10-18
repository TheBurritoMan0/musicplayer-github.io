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
  String meatballParade = "Meatball_Parade";
  String sneakySnitch = "Sneaky_Snitch";
  String monkeys = "Monkeys-Spinning-Monkeys";
  //
  //Add reading into array
  String directory = "../../" + musicPathway;
  println (currentSong, directory);
  String file = directory + meatballParade + mp3FileName;
  println (file);
  song[currentSong] = minim.loadFile(file);
  song[currentSong].play();
  file = directory + sneakySnitch + mp3FileName;
  song[currentSong+=1] = minim.loadFile(file);
  file = directory + monkeys + mp3FileName;
  //
  println(currentSong, song[currentSong]);
  //
  currentSong = 0;
  //
  song[currentSong].play();
  
  //Add currentSong as hardcoded link
  //Use play(timeStart) and loop(numberOfLoops)
  //Inspect with println
  //Purpose is 2D shapes
  //Introduce keyPressed as keyboard shortcuts
  //Introduce mousePressed as interaction
  //
  //Future Problem Fixed
  //beatYourCompetition.play();
  //
  //DIVs
  //rect() based on variables; variables change with program (introduces parameters of a function and TABS)
} //End setup
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
