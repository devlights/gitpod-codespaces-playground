#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int write_hello(char *buf, int start);
int write_space(char *buf, int start);
int write_world(char *buf, int start);
void print_message(char *buf, int length);

int main(void) {
    char buf[128] = {0};

    int written = write_hello(buf, 0);
    written += write_space(buf, written);
    written += write_world(buf, written);

    print_message(buf, written);
}

int write_hello(char *buf, int start) {
    char *p = &buf[start];
    const char *message = "hello";

    return sprintf(p, "%s", message);
}

int write_space(char *buf, int start) {
    char *p = &buf[start];
    const char *message = " ";

    return sprintf(p, "%s", message);
}

int write_world(char *buf, int start) {
    char *p = &buf[start];
    const char *message = "world";

    return sprintf(p, "%s", message);
}

void print_message(char *buf, int length) {
    
    for (int i = 0; i < length; i++) {
        int c = buf[i];
        int u = toupper(c);
        printf("%c\n", u);
    }
}
