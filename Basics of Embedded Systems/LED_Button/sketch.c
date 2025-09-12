#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN PD7     // Pin 7 on PORTD
#define BUTTON_PIN PD3  // Pin 3 on PORTD

#define LED_BLINKING_FLAG 0
#define PREV_BUTTON_FLAG  1

int main(void) {
    // Set LED_PIN as output
    DDRD |= (1 << LED_PIN);

    // Set BUTTON_PIN as input
    DDRD &= ~(1 << BUTTON_PIN);
    // Enable pull-up resistor on BUTTON_PIN
    PORTD |= (1 << BUTTON_PIN);

    uint8_t flags = (1 << PREV_BUTTON_FLAG); // prev_button_state = 1 (not pressed), led_blinking = 0

    while (1) {
        uint8_t button_state = (PIND & (1 << BUTTON_PIN)) ? 1 : 0;

        // Detect falling edge (button press)
        if ((flags & (1 << PREV_BUTTON_FLAG)) && !button_state) {
            flags ^= (1 << LED_BLINKING_FLAG); // Toggle led_blinking
            _delay_ms(50); // Debounce delay
        }
        // Update prev_button_state
        if (button_state)
            flags |= (1 << PREV_BUTTON_FLAG);
        else
            flags &= ~(1 << PREV_BUTTON_FLAG);

        if (flags & (1 << LED_BLINKING_FLAG)) {
            // Blink LED
            PORTD ^= (1 << LED_PIN);
            _delay_ms(200);
        } else {
            // Ensure LED is off
            PORTD &= ~(1 << LED_PIN);
            _delay_ms(20);
        }
    }

    return 0; // This line will never be reached
}