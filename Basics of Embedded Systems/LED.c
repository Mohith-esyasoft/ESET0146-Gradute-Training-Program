/***
project that builds on your current HAL-based LED and button control setup for the ATmega328P. This version introduces:
Single button cycles through three modes:
Mode 1: LED blinks slowly
Mode 2: LED blinks fast
Mode 3: LED stays ON
***/

// Pin definitions
const int LED_PIN = 13;      // Connect LED to Digital Pin 13
const int BUTTON_PIN = 2;    // Connect Push Button to Digital Pin 2

// Debounce variables
long lastDebounceTime = 0;   // the last time the output pin was toggled
long debounceDelay = 50;     // the debounce time; increase if needed

// Button state variables
int buttonState;             // the current reading from the input pin
int lastButtonState = LOW;   // the previous reading from the input pin

// LED mode variable
int ledMode = 0; // 0: Off, 1: Slow blink, 2: Fast blink, 3: Solid ON

// Blink timing variables (for non-blocking delays)
unsigned long previousMillis = 0;
int blinkInterval = 0; // Will be set based on mode

void setup() {
  pinMode(LED_PIN, OUTPUT);
  pinMode(BUTTON_PIN, INPUT_PULLUP); // Use internal pull-up resistor
}

void loop() {
  // Read the state of the pushbutton
  int reading = digitalRead(BUTTON_PIN);

  // Check for button press with debouncing
  if (reading != lastButtonState) {
    lastDebounceTime = millis(); // Reset debounce timer
  }

  if ((millis() - lastDebounceTime) > debounceDelay) {
    // If button state has settled, and it's a new press (LOW because of INPUT_PULLUP)
    if (reading == LOW && lastButtonState == HIGH) { // Detect falling edge (button pressed)
      ledMode = (ledMode + 1) % 4; // Cycle through modes 0, 1, 2, 3
      previousMillis = millis(); // Reset blink timer for new mode
    }
  }

  // Update lastButtonState for the next loop iteration
  lastButtonState = reading;

  // Execute LED mode logic
  unsigned long currentMillis = millis();

  switch (ledMode) {
    case 0: // LED Off (initial state or after mode cycle)
      digitalWrite(LED_PIN, LOW);
      break;
    case 1: // Slow blink (500ms ON, 500ms OFF)
      blinkInterval = 500;
      if (currentMillis - previousMillis >= blinkInterval) {
        previousMillis = currentMillis;
        digitalWrite(LED_PIN, !digitalRead(LED_PIN)); // Toggle LED state
      }
      break;
    case 2: // Fast blink (100ms ON, 100ms OFF)
      blinkInterval = 100;
      if (currentMillis - previousMillis >= blinkInterval) {
        previousMillis = currentMillis;
        digitalWrite(LED_PIN, !digitalRead(LED_PIN)); // Toggle LED state
      }
      break;
    case 3: // Solid ON
      digitalWrite(LED_PIN, HIGH);
      break;
  }
}
