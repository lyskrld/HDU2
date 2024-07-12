#include <stdint.h>
#include "msp.h"
#include "..\inc\Bump.h"
#include "..\inc\Clock.h"
//#include "..\inc\SysTick.h"
#include "..\inc\CortexM.h"
#include "..\inc\LaunchPad.h"
#include "..\inc\Motor.h"
#include"..\inc\PWM.h"
#include"..\inc\Reflectance.h"

void TimedPause(uint32_t time){
  Clock_Delay1ms(time);          // run for a while and stop
  Motor_Stop();
  //while(LaunchPad_Input()==0);  // wait for touch
  //while(LaunchPad_Input());     // wait for release
}


uint8_t Data;
int32_t position;
void line_follower(void){

        Data = Reflectance_Read(1000);
        position = Reflectance_Position(Data);

        if(position==0){
             Motor_Forward(4000,3900);
             //Motor_Forward(5000,5000);
         }

         else if(position>=237){
                  Motor_Stop();
                  TimedPause(100);
                  Motor_Left(1000,7000);
                  //Motor_Forward(2000,7000);
                  //Motor_Forward(3000,7500);
                  TimedPause(100);
                      }

              else if(position<=-237){
                  Motor_Stop();
                  TimedPause(100);
                  Motor_Forward(7000,2000);
                  //Motor_Forward(7500,3000);
                  TimedPause(100);
              }
              else if((position>0)&&(position<237)){
                         Motor_Forward((3000-8*position),3700);
                         //Motor_Forward((3300-8*position),4300);

                     }
                     //else if((Data == 0x30)||(Data == 0x60)||(Data == 0xC0)){
              else if((position <0)&&(position>-237)){
                         Motor_Forward(3700,(3000+8*position));
                         //Motor_Forward(4300,(3300+8*position));
                     }

        if((Data == 0xF8)||(Data == 0xF0)||(Data == 0xE0)){//直角右转
            Data = Reflectance_Read(1000);
                        TimedPause(10);
             if((Data == 0xF8)||(Data == 0xF0)||(Data == 0xE0)){
                 Data = Reflectance_Read(1000);
                             TimedPause(10);
                if((Data == 0xF8)||(Data == 0xF0)||(Data == 0xE0)){
             Motor_Forward(4000,3900);
               TimedPause(150);
                       Motor_Right(4000,3900);
                       TimedPause(350);
                          }

                else;}
                   else;}
               else;


        if((Data == 0x1F)||(Data == 0x0F)||(Data == 0x07)){//直角左转
            Data = Reflectance_Read(1000);
            TimedPause(5);
            if((Data == 0x1F)||(Data == 0x0F)||(Data == 0x07)){
               TimedPause(5);
                Data = Reflectance_Read(1000);
             if((Data == 0x1F)||(Data == 0x0F)||(Data == 0x07)){
               Motor_Forward(4000,3900);
               TimedPause(150);
            Data = Reflectance_Read(1000);
                       if(Data == 0x00){
                       Motor_Left(4000,3900);
                       TimedPause(400); }
                       else Motor_Forward(4000,3900);
                       }
                else;}
                else;}

        else if(Data == 0x00){
            Motor_Right(4000,3900);
            //Motor_Left(5000,4900);
        }

}



void endstop(void){
    Data = Reflectance_Read(1000);
    if(Data == 0xDB){
        Motor_Stop();
        while(LaunchPad_Input()==0);  // wait for touch
        while(LaunchPad_Input());
    }

}
//bump and driver
void bumprun(void){

        uint8_t numflag = 0;
        numflag = Bump_Read();
        if(numflag == 1){
            TimedPause(500);
            Motor_Left(4000,6000);
            TimedPause(500);//SysTick_Wait10ms(30);
        }
        else if(numflag == 3){
            TimedPause(500);
            Motor_Right(4000,6000);
            TimedPause(500);// SysTick_Wait10ms(30);
        }
        else if(numflag == 2){
            TimedPause(500);
            Motor_Backward(4000,4000);
            TimedPause(500);// SysTick_Wait10ms(30);
            Motor_Right(4000,6000);
            TimedPause(500);// SysTick_Wait10ms(30);
        }
        else if(numflag == 0)
             Motor_Forward(4000,4000);

}

void bumprun1(void){
        uint8_t numflag1 = 0;
        numflag1 = Bump_Read1();
        if ((numflag1 & 0xED)!=0xED){
          Motor_Backward(4000,4000);
         TimedPause(300);// SysTick_Wait10ms(30);
         Motor_Stop();
         TimedPause(4000);// SysTick_Wait10ms(30);
        }


}
  int main(void){
        Clock_Init48MHz();
        LaunchPad_Init(); // built-in switches and LEDs
        Bump_Init();      // bump switches
        Motor_Init();     // your function
        PWM_Init34(9600, 5000, 7000);
        Reflectance_Init();
        while(LaunchPad_Input()==0);  // wait for touch
        while(LaunchPad_Input());     // wait for release
        while(1){
         line_follower();
         bumprun1();
         endstop();

        }
}
