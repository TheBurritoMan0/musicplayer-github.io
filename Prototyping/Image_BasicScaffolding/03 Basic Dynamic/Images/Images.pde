//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float freezerX, freezerY, freezerWidth, freezerHeight;
PImage picBackground, picFreezer;
int picFreezerWidth, picFreezerHeight;
float freezerX_Changed, freezerY_Changed;
float picFreezerWidthChanged, picFreezerHeightChanged, biggerSide, smallerSide, ratio;
Boolean centeredVertical=true;
int maxImages = 2;
int imageIndex = 0;
//
PImage[] images = new PImage[maxImages];
//
void setup() {
  size( 1000, 800 ); //Landscape
  appWidth = width;
  appHeight = height;
  //
  //Population
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  picBackground = loadImage("../../../../Image/Square/cell.jpg");
  freezerX_Changed = freezerX = appWidth * 1/4;
  freezerY_Changed = freezerY = appHeight * 1/4;
  freezerWidth = appWidth * 1/2;
  freezerHeight = appHeight * 1/2;
  picFreezer = loadImage("../../../../Image/Landscape/picture0.jpg");
  picFreezerWidthChanged = picFreezerWidth = 860;
  picFreezerHeightChanged = picFreezerHeight = 529;
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "picture" + i + ".jpg" );
  }
  //
  //Image Compression
  biggerSide = ( picFreezerWidth > picFreezerHeight ) ? picFreezerWidth : picFreezerHeight ;
  smallerSide = ( picFreezerHeight < picFreezerWidth ) ? picFreezerHeight : picFreezerWidth ;
  ratio = biggerSide / smallerSide; //Ratio bigger than one, divide means smaller side, multiply means larger side
  println( "Big Side:", biggerSide, "\tSmall Side:", smallerSide, "\tRatio:", ratio );
  /* Algorithm
  - Establish Landscape or Portrait of DIV
  - Note: I always fill smaller side of DIV, then calculate larger side of DIV
  - Hardcode if ratio will be >1 or <1 ... influences * or /
  - In the image, decide if calculating the larger side or the smaller side
  */
  if ( freezerWidth > freezerHeight ) { //DIV Landscape, find larger side
    picFreezerHeightChanged = freezerHeight;
    picFreezerWidthChanged = (picFreezerWidth > picFreezerHeight) ? picFreezerWidthChanged / ratio : picFreezerWidthChanged * ratio;
    println( "Inside If-true:", picFreezerWidthChanged );
  } else { //DIV Portrait
    picFreezerWidthChanged = freezerWidth;
    picFreezerHeightChanged = (picFreezerWidth > picFreezerHeight) ? picFreezerWidthChanged / ratio : picFreezerWidthChanged * ratio;
    println( "Inside If-true:", picFreezerHeightChanged );
    if ( centeredVertical==true ) {
      float extraSpace = freezerHeight - picFreezerHeightChanged;
      println(extraSpace);
      freezerY_Changed = freezerY + extraSpace*1/2;
    }
  }
  println( "Changed Width:", picFreezerWidthChanged, "\tChanged Height:", picFreezerHeightChanged );
  //
  //DIVs
  rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  rect( freezerX, freezerY, freezerWidth, freezerHeight );
}
//
void draw() {
  //Draw Image One Time, for testing
  image( picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  //
  rect(freezerX, freezerY, freezerHeight, freezerWidth);
  //
  image(images[imageIndex], freezerX_Changed, freezerY_Changed, picFreezerWidthChanged, picFreezerHeightChanged );
}
//
void mousePressed() {
}
//
void keyPressed() {
  if (key==CODED && keyCode==DOWN ) {
    imageIndex = (imageIndex + 1) % images.length;
  }
}
//
//End MAIN
