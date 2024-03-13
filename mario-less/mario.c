#include <cs50.h>
#include <stdio.h>

int main(void)
{
 int height;

 do{
height = get_int("Enter the height of pyramid: ");
 }while(height <= 0 || height > 8);

 for(int row = 0; row < height; row++) {

    for(int space = 0; space < height - row - 1; space++) {
      printf(" ");
    }

  for(int i = 1; i <= row+1; i++) {

    printf("%s","#");
  }
  
  printf("\n");
 }
}