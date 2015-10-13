class Cactus
{
 void spawn()
 {
    for (int i = 0; i < 3; i++)
  {
    if (cact[i] == false)
    {
      cact[i] = r.rand(.1);


      if (cact[i] == true) {
        cactX[i] = 800;
      }
    }
  }
 }
 
 void move()
 {
   for (int i = 0; i < 3; i++)
  {
    if (cact[i] == true) cactX[i]-=4 + score/10;

    if (cactX[i] < 70 && cactX[i] > 30 && dinoY > 155)
    {
      gameOver=true;
    } else if (cactX[i] < 30 && cact[i] == true)
    {
      score++;

      cact[i] = false;
    }

    fill(0);
  }
 }
 
}