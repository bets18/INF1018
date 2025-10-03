#include <stdio.h>
#include <ctype.h>

int string2num_base36(char *s, int base) {
    int a = 0;
    int val;
    for (; *s; s++) {
        if (isdigit(*s))
            val = *s - '0';
        else if (islower(*s))
            val = *s - 'a' + 10;
        else if (isupper(*s))
            val = *s - 'A' + 10;
        else
            continue;
        a = a*base + val;
    }
    return a;
}

int main(void) {
    printf("%d\n", string2num_base36("1a", 16));
    printf("%d\n", string2num_base36("a09b", 16));
    printf("%d\n", string2num_base36("z09b", 36));
    return 0;
}