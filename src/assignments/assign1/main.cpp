/*
 * CS106B Assignment 1: Word Ladder
 * This file contains the main function for Assignment 1.
 * 
 * Author: [Your Name]
 * Section: [Your Section]
 */

#include <iostream>
#include <string>
#include "assign1.h"  // Include our helper functions
using namespace std;

int main() {
    cout << "CS106B Assignment 1: Word Ladder" << endl;
    cout << "=================================" << endl;
    
    // Use the functions we declared in assign1.h and implemented in assign1.cpp
    vector<string> dictionary = readDictionary("dictionary.txt");
    cout << "Loaded " << dictionary.size() << " words from dictionary." << endl;
    
    string startWord, endWord;
    cout << "Enter start word: ";
    cin >> startWord;
    cout << "Enter end word: ";
    cin >> endWord;
    
    // Check if both words are in the dictionary
    if (!isValidWord(startWord, dictionary)) {
        cout << "Start word not found in dictionary!" << endl;
        return 1;
    }
    
    if (!isValidWord(endWord, dictionary)) {
        cout << "End word not found in dictionary!" << endl;
        return 1;
    }
    
    // Find neighbors of the start word
    vector<string> neighbors = findNeighbors(startWord, dictionary);
    cout << "Found " << neighbors.size() << " neighbors of '" << startWord << "':" << endl;
    for (const string& neighbor : neighbors) {
        cout << "  " << neighbor << endl;
    }
    
    // Create a simple ladder for demonstration
    vector<string> sampleLadder = {startWord, endWord};
    printWordLadder(sampleLadder);
    
    return 0;
}
