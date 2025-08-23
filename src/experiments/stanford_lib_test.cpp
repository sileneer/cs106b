/*
 * Test program to verify Stanford CS106B library installation
 * This program tests various components of the Stanford library.
 */

#include "console.h"
#include "vector.h"
#include "map.h"
#include "set.h"
#include "stack.h"
#include "queue.h"
#include "grid.h"
#include "strlib.h"
#include "simpio.h"
#include "random.h"
#include <iostream>

using namespace std;

int main() {
    cout << "=== Stanford CS106B Library Test ===" << endl;
    cout << endl;
    
    // Test Vector
    cout << "Testing Vector..." << endl;
    Vector<int> vec;
    vec.add(1);
    vec.add(2);
    vec.add(3);
    cout << "Vector contents: " << vec.toString() << endl;
    cout << endl;
    
    // Test Map
    cout << "Testing Map..." << endl;
    Map<string, int> ages;
    ages.put("Alice", 25);
    ages.put("Bob", 30);
    ages.put("Charlie", 35);
    cout << "Map contents: " << ages.toString() << endl;
    cout << endl;
    
    // Test Set
    cout << "Testing Set..." << endl;
    Set<string> names;
    names.add("Alice");
    names.add("Bob");
    names.add("Charlie");
    cout << "Set contents: " << names.toString() << endl;
    cout << endl;
    
    // Test Stack
    cout << "Testing Stack..." << endl;
    Stack<int> stack;
    stack.push(10);
    stack.push(20);
    stack.push(30);
    cout << "Stack size: " << stack.size() << endl;
    cout << "Top element: " << stack.peek() << endl;
    cout << endl;
    
    // Test Queue
    cout << "Testing Queue..." << endl;
    Queue<string> queue;
    queue.enqueue("First");
    queue.enqueue("Second");
    queue.enqueue("Third");
    cout << "Queue size: " << queue.size() << endl;
    cout << "Front element: " << queue.peek() << endl;
    cout << endl;
    
    // Test Grid
    cout << "Testing Grid..." << endl;
    Grid<int> grid(3, 3);
    for (int row = 0; row < grid.numRows(); row++) {
        for (int col = 0; col < grid.numCols(); col++) {
            grid[row][col] = row * 3 + col;
        }
    }
    cout << "Grid contents:" << endl;
    cout << grid.toString() << endl;
    cout << endl;
    
    // Test String utilities
    cout << "Testing String utilities..." << endl;
    string text = "Hello World";
    cout << "Original: " << text << endl;
    cout << "Uppercase: " << toUpperCase(text) << endl;
    cout << "Lowercase: " << toLowerCase(text) << endl;
    cout << "Starts with 'Hello': " << boolToString(startsWith(text, "Hello")) << endl;
    cout << endl;
    
    // Test Random utilities
    cout << "Testing Random utilities..." << endl;
    cout << "Random integer 1-10: " << randomInteger(1, 10) << endl;
    cout << "Random real 0.0-1.0: " << randomReal(0.0, 1.0) << endl;
    cout << "Random boolean: " << boolToString(randomBool()) << endl;
    cout << endl;
    
    cout << "=== All tests completed successfully! ===" << endl;
    cout << "Stanford CS106B library is working correctly." << endl;
    
    return 0;
}
