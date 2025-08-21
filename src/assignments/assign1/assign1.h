/*
 * CS106B Assignment 1: Word Ladder
 * Header file for Assignment 1 helper functions.
 * 
 * Author: [Your Name]
 * Section: [Your Section]
 */

#pragma once
#include <string>
#include <vector>

using namespace std;

// Function declarations (prototypes)
vector<string> readDictionary(const string& filename);
bool isValidWord(const string& word, const vector<string>& dictionary);
bool isOneLetterDifferent(const string& word1, const string& word2);
vector<string> findNeighbors(const string& word, const vector<string>& dictionary);
void printWordLadder(const vector<string>& ladder);
