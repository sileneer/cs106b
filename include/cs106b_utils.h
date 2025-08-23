/*
 * CS106B Utility Functions
 * Common helper functions that can be reused across assignments.
 * 
 * Author: [Your Name]
 */

#pragma once
#include <string>
#include <vector>

// Include Stanford CS106B Library headers
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
#include "filelib.h"
#include "testing/SimpleTest.h"

namespace cs106b {
    
    // String utilities
    std::string toLowerCase(const std::string& str);
    std::string toUpperCase(const std::string& str);
    std::vector<std::string> splitString(const std::string& str, char delimiter);
    
    // Math utilities
    bool isPrime(int n);
    int factorial(int n);
    int gcd(int a, int b);
    
    // Vector utilities
    template<typename T>
    void printVector(const std::vector<T>& vec, const std::string& separator = ", ");
    
    // Input validation
    int getInteger(const std::string& prompt, int min = INT_MIN, int max = INT_MAX);
    double getReal(const std::string& prompt);
    std::string getString(const std::string& prompt);
    
}
