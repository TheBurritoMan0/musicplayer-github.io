/* meta data - strings
 */
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
int appWidth, appHeight;
float yeahX1, yeahY1, yeahWidth1, yeahHeight1;
float yeahX2, yeahY2, yeahWidth2, yeahHeight2;
float yeahX3, yeahY3, yeahWidth3, yeahHeight3;
color title =#56B97A, song =#B98D56, songlength = #6964AA;
//
Minim minim;
int numberOfSongs = 3
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
AudioMetaData[] playListTitleMetaData = new AudioPlayer[numberOfSongs];
AudioMetaData[] playListPositionMetaData = new AudioPlayer[numberOfSongs];
AudioMetaData[] playListTimeRemainingMetaData = new AudioMetaData[numberOfSongs]; //might change
AudioMetaData[] playListTotalTimeMetaData = new AudioMetaData[numberOfSongs]; //might change
int currentSong = numberOfSongs - numberOfSongs;
void setup() {
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  //Population
  yeahX1 = appWidth*2/10; //Title Position (put it beside the top right corner)
  yeahY1 = appHeight*6/10;
  yeahWidth1 = appWidth*8/10;
  yeahHeight1 = appHeight*1/10;
  yeahX2 = appWidth*2/10; //Song (Cover??) Position (try to center it)
  yeahY2 = appHeight*5/10;
  yeahWidth2 = appWidth*2/10;
  yeahHeight2 = appHeight*1/10;
  yeahX3 = appWidth*6/10; // Total Song Length | Time remaining (under title)
  yeahY3 = appHeight*2/10;
  yeahWidth3 = appWidth*5/10;
  yeahHeight3 = appHeight*2/10;
  //DIV
  rect(yeahX1, yeahY1, yeahWidth1, yeahHeight1);
  rect(yeahX2, yeahY2, yeahWidth2, yeahHeight2);
  rect(yeahX3, yeahY3, yeahWidth3, yeahHeight3);
}
//
void draw() {
  
}
//
void mousePressed() {
}
//
void keyPressed() {
}
//
// end main
