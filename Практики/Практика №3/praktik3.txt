#include <8051.h>
void main()
{
unsigned int i,k,j,m;
unsigned char *str="DOUBLE";
P0 = 0x38;
P2 = 0x1;
P2 = 0x0;
i=0;
   while(m<2)
   {      
       if(i<=2){                    
            for(j=0;j<i;j++)
            {
            P0 = ' ';
            P2 = 0x3;
            P2 = 0x2;
            }               
            for(k=0;k<6;k++)
            {
            P0 = str[k];
            P2 = 0x3;
            P2 = 0x2;
            }
            P0 = 0x01;
            P2 = 0x1;//stavim kursor na 1 position
            P2 = 0x0;//perevod na druguy stroky
            P0 = 0xC0;
            P2 = 0x1;//stavim kursor na 1 position
            P2 = 0x0;//perevod na druguy stroky
            for(k=0;k<i;k++)
            {
            P0 = ' ';
            P2 = 0x3;
            P2 = 0x2;
            }
            for(j=0;j<6;j++)
            {
            P0 = str[j];
            P2 = 0x3;
            P2 = 0x2;
            }
            P0 = 0x01;
            P2 = 0x1;//stavim kursor na 1 position
            P2 = 0x0;//perevod na druguy stroky
            P0 = 0x80;
            P2 = 0x1;//stavim kursor na 1 position
            P2 = 0x0;//perevod na druguy stroky         
            }
      if(i>3){
              for(j=1;j<i;j++)
              {
              P0 = ' ';
              P2 = 0x3;
              P2 = 0x2;
              }              
              for(k=0;k<9-j;k++)
              {
              P0 = str[k];
              P2 = 0x3;
              P2 = 0x2;
              }
              P0 = 0x01;
              P2 = 0x1;//stavim kursor na 1 position
              P2 = 0x0;//perevod na druguy stroky
              P0 = 0xC0;
              P2 = 0x1;//stavim kursor na 1 position
              P2 = 0x0;//perevod na druguy stroky
              for(k=1;k<i;k++)
              {
              P0 = ' ';
              P2 = 0x3;
              P2 = 0x2;
              }
              for(j=0;j<9-k;j++)
              {
              P0 = str[j];
              P2 = 0x3;
              P2 = 0x2;
              }
              P0 = 0x01;
              P2 = 0x1;//stavim kursor na 1 position
              P2 = 0x0;//perevod na druguy stroky
              P0 = 0x80;
              P2 = 0x1;//stavim kursor na 1 position
              P2 = 0x0;//perevod na druguy stroky         
             }  
        i++;
	m++;
   }
}