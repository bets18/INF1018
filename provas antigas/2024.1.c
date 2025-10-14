#include <stdio.h>
#include <stdlib.h>


unsigned int inverteOrdemBytes(unsigned int i){
    unsigned int byte1, byte2, byte3, byte4;
    byte1 = (i & 0xFF000000)>>24;
    byte2 = (i & 0x00FF0000)>>16;
    byte3 = (i & 0x0000FF00)>>8;
    byte4 = (i & 0x000000FF);

    return (byte1 | (byte2<<16) | (byte3<<8) | (byte4<<24));
}