

// Define pin masks for direct PORTD manipulation
// PORTD controls digital pins 0-7. Each bit corresponds to a pin.
// Bit 0 = Pin 0, Bit 1 = Pin 1, ..., Bit 7 = Pin 7
// Our LEDs are on pins 2, 5, 7.
#define LED_PIN_2_MASK B00000100 // Bit 2 is set (pin 2)
#define LED_PIN_5_MASK B00100000 // Bit 5 is set (pin 5)
#define LED_PIN_7_MASK B10000000 // Bit 7 is set (pin 7)

// Define the delay time for pin 7's continuous toggling and other delays
const int generalDelay = 1000; // 1000 milliseconds (1 second)

// A flag to control the one-time actions in setup
bool initialActionsDone = false;

void setup() {
  // Set pins 2, 5, and 7 as outputs using DDRD (Data Direction Register for Port D)
  // We use bitwise OR to set specific bits without affecting others.
  // DDRD |= (LED_PIN_2_MASK | LED_PIN_5_MASK | LED_PIN_7_MASK);
  // This is equivalent to setting them as output:
  DDRD = DDRD | B10100100; // Sets bits 2, 5, 7 in DDRD to 1 (OUTPUT)

  // --- Initial state for Pin 2 ---
  // Pin 2 is ON at the "start of sim" (conceptual), then turns OFF and stays OFF.
  PORTD |= LED_PIN_2_MASK; // Turn pin 2 ON (simulating initial state)
  delay(100);             // Short delay to observe initial ON state

  // --- Actions after the "start of sim" initial state ---
  // Use an if statement to ensure these actions run only once.
  if (!initialActionsDone) {
    PORTD &= ~LED_PIN_2_MASK;  // Turn pin 2 OFF and keep it OFF
    PORTD |= LED_PIN_5_MASK;   // Turn pin 5 ON and keep it ON
    initialActionsDone = true; // Set flag so this block doesn't run again
  }
}

void loop() {
  // --- Pin 7 toggles continuously and independently using if/else ---
  // Use a static variable to maintain state across loop calls without blocking
  static bool led7State = LOW; // Keeps its value between loop iterations

  if (led7State == LOW) {
    PORTD |= LED_PIN_7_MASK; // Turn pin 7 ON
    led7State = HIGH;
  } else {
    PORTD &= ~LED_PIN_7_MASK; // Turn pin 7 OFF
    led7State = LOW;
  }
  delay(generalDelay); // Wait for 1 second
}
