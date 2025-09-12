#include <stdio.h>
#define LED_PIN 5

void delay_ms(int ms) {
    volatile long i, j; 
    for (i = 0; i < ms; i++) {
        for (j = 0; j < 60000; j++);
    }
}

int main() {
    int counter = 0; 	// Initialize counter variable
    int max_blinks = 5; 	// Maximum number of blinks
    int threshold = 3; 	// Threshold for conditional check

    for (counter = 0; counter < max_blinks; counter++) {
        if (counter < threshold) {
            printf("LED ON (Counter: %d)\n", counter); 	// For simulation
            delay_ms(200);  // Delay for 200 milliseconds

            printf("LED OFF (Counter: %d)\n", counter);  // For simulation
            delay_ms(200);  // Delay for 200 milliseconds
        }
        else{
            printf("Counter reached threshold or above: %d\n", counter);
            delay_ms(500);		 // Longer delay
        }
    }
    if (counter == max_blinks && counter > threshold) {
        printf("Blinking sequence completed.\n");
    }

    // Example of a while loop
    int countdown = 3;
    while (countdown > 0) {
        printf("Countdown: %d\n", countdown);
        // Decrement operator (--)
        countdown--;
        //delay timer
        delay_ms(1000);
    }
    printf("Liftoff!\n");

    return 0; 	// Indicate successful execution
} 