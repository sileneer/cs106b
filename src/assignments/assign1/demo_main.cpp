/*
 * CS106B Assignment 1: Simple Math Helper
 * Main program that demonstrates using helper functions.
 */

#include <iostream>
#include "math_helper.h"  // Include our helper functions

using namespace std;

int main() {
    cout << "CS106B Assignment 1: Math Helper Demo" << endl;
    cout << "=====================================" << endl;
    
    // Using functions from math_helper.h/.cpp
    int x = 15, y = 25;
    
    cout << "x = " << x << ", y = " << y << endl;
    cout << "add(x, y) = " << add(x, y) << endl;
    cout << "multiply(x, y) = " << multiply(x, y) << endl;
    
    // Test the average function
    int numbers[] = {10, 20, 30, 40, 50};
    int size = 5;
    
    cout << "\nArray: ";
    for (int i = 0; i < size; i++) {
        cout << numbers[i] << " ";
    }
    cout << endl;
    cout << "Average: " << calculateAverage(numbers, size) << endl;
    
    return 0;
}
