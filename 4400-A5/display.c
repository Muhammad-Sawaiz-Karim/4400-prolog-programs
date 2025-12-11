#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_SIZE 100
#define MAX_LINE 1024

int main(int argc, char *argv[])
{
    char grid_char[MAX_SIZE][MAX_SIZE];

    for (int i = 0; i < MAX_SIZE; i++)
        for (int j = 0; j < MAX_SIZE; j++)
            grid_char[i][j] = ' ';

    FILE *fp = fopen("selectedwords.txt", "r");
    if (!fp)
    {
        printf("Error: selectedwords.txt not found. Run the Prolog solver first.\n");
        return 1;
    }

    char line[MAX_LINE];
    char slotName[20];
    int r, c;
    char word[MAX_LINE];

    int max_r = 0;
    int max_c = 0;

    while (fgets(line, sizeof(line), fp))
    {
        if (sscanf(line, "%s %d %d %s", slotName, &r, &c, word) == 4)
        {

            int is_vertical = (slotName[0] == 'v' || slotName[0] == 'V');

            int len = strlen(word);
            for (int i = 0; i < len; i++)
            {
                int curr_r = is_vertical ? r + i : r;
                int curr_c = is_vertical ? c : c + i;

                grid_char[curr_r][curr_c] = word[i];

                if (curr_r > max_r)
                    max_r = curr_r;
                if (curr_c > max_c)
                    max_c = curr_c;
            }
        }
    }
    fclose(fp);

    FILE *out = fopen("step2.csv", "w");
    if (!out)
    {
        perror("Error creating step2.csv");
        return 1;
    }

    for (int i = 0; i <= max_r; i++)
    {
        for (int j = 0; j <= max_c; j++)
        {
            if (grid_char[i][j] != ' ')
                fprintf(out, "%c", grid_char[i][j]);

            if (j < max_c)
                fprintf(out, ",");
        }
        fprintf(out, "\n");
    }
    fclose(out);

    printf("Generated step2.csv successfully.\n");
    return 0;
}