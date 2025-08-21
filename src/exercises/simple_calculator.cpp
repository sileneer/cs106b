/*
 * CS106B Exercise: Simple Calculator
 * Practice with basic input/output and arithmetic operations.
 */

#include <iostream>
using namespace std;

int main() {
    cout << "Simple Calculator" << endl;
    cout << "=================" << endl;
    
    double num1, num2;
    char operation;
    
    cout << "Enter first number: ";
    cin >> num1;
    
    cout << "Enter operation (+, -, *, /): ";
    cin >> operation;
    
    cout << "Enter second number: ";
    cin >> num2;
    
    double result;
    bool validOperation = true;
    
    switch (operation) {
        case '+':
            result = num1 + num2;
            break;
        case '-':
            result = num1 - num2;
            break;
        case '*':
            result = num1 * num2;
            break;
        case '/':
            if (num2 != 0) {
                result = num1 / num2;
            } else {
                cout << "Error: Division by zero!" << endl;
                validOperation = false;
            }
            break;
        default:
            cout << "Error: Invalid operation!" << endl;
            validOperation = false;
    }
    
    if (validOperation) {
        cout << "Result: " << num1 << " " << operation << " " << num2 << " = " << result << endl;
    }
    
    return 0;
}
