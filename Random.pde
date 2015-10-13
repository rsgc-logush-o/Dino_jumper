class Random
{
  boolean rand(float probability)
{
  if (random(0, 1) < probability)
  {
    return true;
  } else {
    return false;
  }
}
}