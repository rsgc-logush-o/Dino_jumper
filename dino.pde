//int cactX = 800;
int cactY;
int cactX[];
int highScore;
int dinoY = 175;
int score = 0;
int hscore;

boolean highScoreAchieved = false;
boolean gameOver = false;
boolean cact[];

Table saveTable;
Table load;

TableRow saveToTable;
TableRow loadFromTable;

Random r = new Random();

Cactus c = new Cactus();



void setup()
{
  //frameRate(60);

  size(800, 200);

  

  saveTable = new Table();
  load = new Table();

  cactX = new int[3];

  cact = new boolean[3];

  saveTable.addColumn("s");


  for (int i = 0; i < 3; i++)
  {

  
    cact[i] = false;
  }
}


void draw()
{

  background(255);

  // println(rand(.1));

  if (gameOver == false)
  {
 //   delay(1000);
   


   c.move();

    if (r.rand(.09) == true)
    {
      c.spawn();
    }
    for (int i = 0; i < 3; i++)
    {
      if (cact[i] == true)
      {


        fill(0);
        ellipse(cactX[i], 175, 20, 20);
      }
    }

    fill(0);

    line(0, 190, 800, 190);

    textSize(12);

    text("Score: " + score, 20, 20);

    fill(255, 0, 0);

    ellipse(50, dinoY, 20, 20);



   // thread("cact");
   
  } if (gameOver == true)
  {
    fill(0);

    textSize(45);
    text("Game Over!", 278, 47);

    textSize(18);



    load = loadTable("data/highscore.csv", "header");

    // load.addRow();
    // load.addColumn();

    loadFromTable = load.getRow(0);

    highScore = loadFromTable.getInt("s");

    if (score > highScore)
    {
      highScore = score;

      saveToTable = saveTable.getRow(0);

      saveToTable.setInt( "s", highScore);

      textSize(18);

      text("New HighScore", 333, 146);


      saveTable(saveTable, "data/highscore.csv");

      highScoreAchieved = true;
    }

    if (highScoreAchieved == true)
    {
      textSize(24);

      text("New High Score", 319, 193);
    }
    
    textSize(18);

    text("Your Score:" + score, 355, 98);
    text("High Score:" + highScore, 355, 71);
  }
}


void keyPressed()
{
  if (key == ' ') 
  {
    thread("jump");
  }
}

void jump()
{
  for (int i = 0; i >= -60; i--)
  {

    dinoY = i+175;
    delay(i*-1/10);
  }

  delay(50);

  for (int i = 0; i <= 60; i++)
  {
    dinoY = i+115; 

    delay(6-i/10);
  }
}