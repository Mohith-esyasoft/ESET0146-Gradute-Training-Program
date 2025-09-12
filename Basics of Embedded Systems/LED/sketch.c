#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN PD4  // Updated to match your diagram

int main(void) {
    // Set LED_PIN as output
    DDRD |= (1 << LED_PIN);

    while (1) {
        // Turn LED on
        PORTD |= (1 << LED_PIN);
        _delay_ms(500);  // Delay for 1 second

        // Turn LED off
        PORTD &= ~(1 << LED_PIN);
        _delay_ms(500);  // Delay for 1 second
    }

    return 0;

}