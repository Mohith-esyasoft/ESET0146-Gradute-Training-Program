#include<avr/io.h>
#include<util/delay.h>

#define LED_PIN PD4 // port D pin set to 4

#define BUTTON_PIN PD2 // port D pin set to 2

int main()
{

    DDRD |= (1<<LED_PIN);
    DDRD &= ~(1<<BUTTON_PIN);
    PORTD |= (1<<BUTTON_PIN);
    while(1)
    {
      if(!(PIND & (1<<BUTTON_PIN)))
      {
        PORTD |= (1<<LED_PIN); //LED ON
       _delay_ms(500); //DELAY 500ms

        PORTD &= ~(1<<LED_PIN); //LED OFF
         _delay_ms(500); // DELAY 500ms

        //PORTD |= (1<<LED_PIN);
      }
      else{
        PORTD &= ~(1<<LED_PIN);
      }
    _delay_ms(20);
       
    }
}