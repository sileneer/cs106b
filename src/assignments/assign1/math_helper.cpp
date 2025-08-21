/*
 * CS106B Assignment 1: Simple Math Helper
 * Implementation file with function definitions.
 */

#include "math_helper.h"

// Function implementations
int add(int a, int b) {
    return a + b;
}

int multiply(int a, int b) {
    return a * b;
}

double calculateAverage(int numbers[], int size) {
    if (size == 0) return 0.0;
    
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += numbers[i];
    }
    
    return static_cast<double>(sum) / size;
}
