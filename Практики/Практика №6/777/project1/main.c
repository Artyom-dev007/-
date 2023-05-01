#include <8051.h>
void tput(unsigned char c1)
{
SBUF=c1;//zagruska symbola iz massiva
while(!TI);//poka peredacha ne zakonchena
TI=0;//flag okanchaniy ne stavim
}

void main()
{
unsigned int i;
unsigned char src[]={0x30,0x31,0x32,0x33,0x34,
0x35,0x36,0x37,0x38,0x39,
0x61,0x62,0x63,0x64,0x65,
0x66,0x67,0x68,0x69,0x21};//znachenia ascii
TMOD = 0x20;//rezim T/C1 po varianty
TH1 = 0xF4;//po varianty TH1
TR1 = 1;//zapusk timer 1
PCON = 0x40;//stavim 0100 0000(40 po hex) chtobi bil 0 dlya SMOD
     for(i=0; i<20; i++)
     {
     ACC = src[i]; 
     SCON = 0x40;//vibrat 8 bitniy rezim raboty
     tput (src[i]);
     }
while(1){}//zaderzka
}