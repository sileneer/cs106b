/*
 * CS106B Lecture Example: Vectors and Iteration
 * Demonstrates basic vector operations and different iteration styles.
 */

#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main() {
    cout << "CS106B Lecture: Vectors and Iteration" << endl;
    cout << "=====================================" << endl;
    
    // Create and populate a vector
    vector<string> cities = {"Stanford", "Palo Alto", "San Francisco", "Berkeley"};
    
    // Different ways to iterate through a vector
    cout << "\n1. Traditional for loop:" << endl;
    for (int i = 0; i < cities.size(); i++) {
        cout << "  " << i << ": " << cities[i] << endl;
    }
    
    cout << "\n2. Range-based for loop (C++11):" << endl;
    for (const string& city : cities) {
        cout << "  " << city << endl;
    }
    
    cout << "\n3. Iterator-based loop:" << endl;
    for (auto it = cities.begin(); it != cities.end(); ++it) {
        cout << "  " << *it << endl;
    }
    
    return 0;
}
