#include <avr/io.h>
#include <util/delay.h>

const int ledPin2 = 2;  // LED on pin 2  (PORTD, bit 2)
const int ledPin5 = 5;  // LED on pin 5  (PORTD, bit 5)
const int ledPin7 = 7;  // LED on pin 7  (PORTD, bit 7)

const int toggleDelay = 250; // milliseconds

void setup() {
  // Set pins as outputs using DDRD (Data Direction Register for PORTD)
  DDRD |= (1 << ledPin2) | (1 << ledPin5) | (1 << ledPin7);

  // --- Initial state for Pin 2 ---
  PORTD |= (1 << ledPin2);  // Turn ON pin 2
  _delay_ms(100);               // Short ON state
 
  // After start of sim:
  PORTD &= ~(1 << ledPin2); // Turn pin 2 OFF

 
  PORTD |= (1 << ledPin5);  // Keep pin 5 ON
}

void loop() {
  // --- Pin 7 toggles continuously ---
  PORTD ^= (1 << ledPin7);  // Toggle pin 7 using XOR
  _delay_ms(toggleDelay);       // Wait
}