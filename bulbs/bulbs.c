#include <cs50.h>
#include <stdio.h>
#include <string.h>

const int BITS_IN_BYTE = 8;

void print_bulb(int bit);

int main(void)
{
    // getting text from user

    string text = get_string("Message: ");

    // creating bit array

    int bit[8] = {0, 0, 0, 0, 0, 0, 0, 0};

    // for loops to each letter of text to 8 times
    for (int i = 0; i < strlen(text); i++)
    {
        int number = text[i];
        for (int x = 7; x >= 0; x--)
        {
            if (number % 2 == 1)
            {
                bit[x] = 1;
                number = number / 2;
            }
            else
            {
                bit[x] = 0;
                number = number / 2;
            }
        }
        for (int c = 0; c < 8; c++)
        {
            // printing
            print_bulb(bit[c]);
        }
        printf("\n");

    }
}

void print_bulb(int bit)
{
    if (bit == 0)
    {
        // Dark emoji
        printf("\U000026AB");
    }
    else if (bit == 1)
    {
        // Light emoji
        printf("\U0001F7E1");
    }
}
