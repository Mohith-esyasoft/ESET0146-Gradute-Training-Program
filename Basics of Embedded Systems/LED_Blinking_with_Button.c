#include <stdio.h>
#include <stdlib.h>

// Function to simulate LED state
void simulate_led(int state) {
    if (state == 1) {
        printf("LED: ON\n");
    } else {
        printf("LED: OFF\n");
    }
}

int main() {
    int button_pressed = 0;
    int blink_count = 0;
    int max_blinks = 5; // Default number of blinks
    char input;

    printf("Simulating LED Blinking System with Button Control\n");
    printf("Press 'B' to simulate button press.\n");
    printf("Press 'Q' to quit.\n\n");

    while (1) {
        // Simulate button input
        printf("Enter command (B/Q): ");
        scanf(" %c", &input);

        if (input == 'b' || input == 'B') {
            button_pressed = 1;
            printf("Button pressed!\n");
        } else if (input == 'q' || input == 'Q') {
            printf("Exiting simulation.\n");
            break;
        } else {
            printf("Invalid input. Please try again.\n");
            continue;
        }

        if (button_pressed) {
            printf("Blink count set to: %d\n", max_blinks);
            button_pressed = 0; // Reset button state
        }

        // Simulate LED blinking
        for (blink_count = 0; blink_count < max_blinks; blink_count++) {
            simulate_led(1); // LED ON
            printf("Blink %d\n", blink_count + 1);
            // In a real system, a delay would be here.
            // For simulation, we just print immediately.
            simulate_led(0); // LED OFF
            // In a real system, a delay would be here.
        }
        printf("\n");
    }

    return 0;
}