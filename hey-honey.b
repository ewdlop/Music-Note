main() {
    extrn putchar;

    auto message[10];
    message[0] = 'h';
    message[1] = 'e';
    message[2] = 'y';
    message[3] = ' ';
    message[4] = 'h';
    message[5] = 'o';
    message[6] = 'n';
    message[7] = 'e';
    message[8] = 'y';
    message[9] = '\n';
    
    auto i;
    i = 0;
    while (i < 10) {
        putchar(message[i]);
        i = i + 1;
    }
}
