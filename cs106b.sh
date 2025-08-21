#!/bin/bash

# CS106B Project Setup Script
# This script helps you quickly create new assignments, exercises, or experiments

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to create a new assignment
create_assignment() {
    local assign_name="$1"
    local assign_dir="src/assignments/$assign_name"
    
    if [ -d "$assign_dir" ]; then
        print_warning "Assignment $assign_name already exists!"
        return 1
    fi
    
    print_info "Creating assignment: $assign_name"
    
    mkdir -p "$assign_dir"
    
    # Create main.cpp
    cat > "$assign_dir/main.cpp" << EOF
/*
 * CS106B $assign_name: [Assignment Title]
 * This file contains the main function for $assign_name.
 * 
 * Author: [Your Name]
 * Section: [Your Section]
 * Date: $(date +"%B %d, %Y")
 */

#include <iostream>
#include <string>
#include "$assign_name.h"
using namespace std;

int main() {
    cout << "CS106B $assign_name" << endl;
    cout << "$(printf '=%.0s' {1..20})" << endl;
    
    // TODO: Implement assignment requirements here
    
    return 0;
}
EOF

    # Create header file
    cat > "$assign_dir/$assign_name.h" << EOF
/*
 * CS106B $assign_name: [Assignment Title]
 * Header file for $assign_name helper functions.
 * 
 * Author: [Your Name]
 * Section: [Your Section]
 * Date: $(date +"%B %d, %Y")
 */

#pragma once
#include <string>
#include <vector>

// TODO: Add function declarations here
// Example:
// std::string processInput(const std::string& input);
// std::vector<int> generateSequence(int n);
EOF

    # Create implementation file
    cat > "$assign_dir/$assign_name.cpp" << EOF
/*
 * CS106B $assign_name: [Assignment Title]
 * Implementation file for $assign_name helper functions.
 * 
 * Author: [Your Name]
 * Section: [Your Section]
 * Date: $(date +"%B %d, %Y")
 */

#include "$assign_name.h"
#include <iostream>
using namespace std;

// TODO: Implement helper functions here
// Example:
// string processInput(const string& input) {
//     // implementation here
//     return input;
// }
EOF

    print_success "Created assignment $assign_name in $assign_dir"
    print_info "Files created:"
    print_info "  - $assign_dir/main.cpp"
    print_info "  - $assign_dir/$assign_name.h"
    print_info "  - $assign_dir/$assign_name.cpp"
}

# Function to create a new exercise
create_exercise() {
    local exercise_name="$1"
    local exercise_file="src/exercises/$exercise_name.cpp"
    
    if [ -f "$exercise_file" ]; then
        print_warning "Exercise $exercise_name already exists!"
        return 1
    fi
    
    print_info "Creating exercise: $exercise_name"
    
    cat > "$exercise_file" << EOF
/*
 * CS106B Exercise: $exercise_name
 * [Brief description of what this exercise practices]
 * 
 * Author: [Your Name]
 * Date: $(date +"%B %d, %Y")
 */

#include <iostream>
using namespace std;

int main() {
    cout << "CS106B Exercise: $exercise_name" << endl;
    cout << "$(printf '=%.0s' {1..30})" << endl;
    
    // TODO: Implement exercise here
    
    return 0;
}
EOF

    print_success "Created exercise $exercise_name at $exercise_file"
}

# Function to create a new experiment
create_experiment() {
    local experiment_name="$1"
    local experiment_file="src/experiments/$experiment_name.cpp"
    
    if [ -f "$experiment_file" ]; then
        print_warning "Experiment $experiment_name already exists!"
        return 1
    fi
    
    print_info "Creating experiment: $experiment_name"
    
    cat > "$experiment_file" << EOF
/*
 * CS106B Experiment: $experiment_name
 * [Brief description of what you're testing/exploring]
 * 
 * Author: [Your Name]
 * Date: $(date +"%B %d, %Y")
 */

#include <iostream>
using namespace std;

int main() {
    cout << "CS106B Experiment: $experiment_name" << endl;
    cout << "$(printf '=%.0s' {1..30})" << endl;
    
    // TODO: Add experimental code here
    
    return 0;
}
EOF

    print_success "Created experiment $experiment_name at $experiment_file"
}

# Function to build with CMake
cmake_build() {
    local target="$1"
    
    print_info "Configuring CMake..."
    if ! cmake -B build -S . -DCMAKE_BUILD_TYPE=Debug; then
        print_error "CMake configuration failed!"
        return 1
    fi
    
    print_info "Building with CMake..."
    if [ -n "$target" ]; then
        print_info "Building target: $target"
        if cmake --build build --target "$target" --parallel; then
            print_success "CMake build successful!"
        else
            print_error "CMake build failed!"
            return 1
        fi
    else
        if cmake --build build --parallel; then
            print_success "CMake build successful!"
        else
            print_error "CMake build failed!"
            return 1
        fi
    fi
}

# Function to run a CMake-built executable
cmake_run() {
    local executable_name="$1"
    local executable_path="build/bin/$executable_name"
    
    if [ ! -f "$executable_path" ]; then
        print_error "Executable $executable_path does not exist!"
        print_info "Available executables:"
        if [ -d "build/bin" ]; then
            ls -1 build/bin/ 2>/dev/null || echo "  (none found)"
        else
            echo "  (build/bin directory not found)"
        fi
        return 1
    fi
    
    print_info "Running $executable_path..."
    echo "----------------------------------------"
    "./$executable_path"
    echo "----------------------------------------"
    print_success "Program finished"
}

# Function to build a specific file
build_file() {
    local file_path="$1"
    local file_name=$(basename "$file_path" .cpp)
    local file_dir=$(dirname "$file_path")
    
    if [ ! -f "$file_path" ]; then
        print_error "File $file_path does not exist!"
        return 1
    fi
    
    print_info "Building $file_path..."
    
    # Create build directory if it doesn't exist
    mkdir -p build
    
    # Find all .cpp files in the same directory (excluding the main file if it's named main.cpp)
    local cpp_files=()
    cpp_files+=("$file_path")
    
    # Add other .cpp files from the same directory (like helper files)
    for cpp_file in "$file_dir"/*.cpp; do
        if [[ -f "$cpp_file" && "$cpp_file" != "$file_path" && "$(basename "$cpp_file")" != "main.cpp" ]]; then
            cpp_files+=("$cpp_file")
            print_info "  Including: $cpp_file"
        fi
    done
    
    # Build with all .cpp files
    if g++ -g -std=c++17 -Wall -Wextra "${cpp_files[@]}" -Iinclude -o "build/$file_name"; then
        print_success "Build successful! Executable: build/$file_name"
        return 0
    else
        print_error "Build failed!"
        return 1
    fi
}

# Function to build and run a file
build_and_run() {
    local file_path="$1"
    local file_name=$(basename "$file_path" .cpp)
    
    if build_file "$file_path"; then
        print_info "Running build/$file_name..."
        echo "----------------------------------------"
        "./build/$file_name"
        echo "----------------------------------------"
        print_success "Program finished"
    fi
}

# Function to show usage
show_usage() {
    echo "CS106B Project Helper Script"
    echo ""
    echo "Usage: $0 <command> [arguments]"
    echo ""
    echo "Project Setup Commands:"
    echo "  assignment <name>     Create a new assignment (e.g., assign1, assign2)"
    echo "  exercise <name>       Create a new exercise file"
    echo "  experiment <name>     Create a new experiment file"
    echo ""
    echo "Manual Build Commands:"
    echo "  build <file>          Build a specific .cpp file with g++"
    echo "  run <file>            Build and run a specific .cpp file with g++"
    echo ""
    echo "CMake Build Commands:"
    echo "  cmake-build [target]  Build all or specific target with CMake"
    echo "  cmake-run <name>      Run a CMake-built executable"
    echo "  cmake-assignments     Build all assignments with CMake"
    echo "  cmake-experiments     Build all experiments with CMake"
    echo "  cmake-lectures        Build all lectures with CMake"
    echo "  cmake-exercises       Build all exercises with CMake"
    echo ""
    echo "Utility Commands:"
    echo "  clean                 Clean build directory"
    echo "  cmake-clean           Clean CMake build directory"
    echo ""
    echo "Examples:"
    echo "  $0 assignment assign3"
    echo "  $0 exercise palindrome_checker"
    echo "  $0 run src/experiments/hello_world.cpp"
    echo "  $0 cmake-build"
    echo "  $0 cmake-run hello_world"
    echo "  $0 cmake-assignments"
}

# Main script logic
case "$1" in
    "assignment")
        if [ -z "$2" ]; then
            print_error "Assignment name required!"
            echo "Usage: $0 assignment <name>"
            exit 1
        fi
        create_assignment "$2"
        ;;
    "exercise")
        if [ -z "$2" ]; then
            print_error "Exercise name required!"
            echo "Usage: $0 exercise <name>"
            exit 1
        fi
        create_exercise "$2"
        ;;
    "experiment")
        if [ -z "$2" ]; then
            print_error "Experiment name required!"
            echo "Usage: $0 experiment <name>"
            exit 1
        fi
        create_experiment "$2"
        ;;
    "build")
        if [ -z "$2" ]; then
            print_error "File path required!"
            echo "Usage: $0 build <file.cpp>"
            exit 1
        fi
        build_file "$2"
        ;;
    "run")
        if [ -z "$2" ]; then
            print_error "File path required!"
            echo "Usage: $0 run <file.cpp>"
            exit 1
        fi
        build_and_run "$2"
        ;;
    "clean")
        print_info "Cleaning build directory..."
        rm -rf build/*
        print_success "Build directory cleaned"
        ;;
    "cmake-build")
        cmake_build "$2"
        ;;
    "cmake-run")
        if [ -z "$2" ]; then
            print_error "Executable name required!"
            echo "Usage: $0 cmake-run <executable_name>"
            exit 1
        fi
        cmake_run "$2"
        ;;
    "cmake-assignments")
        cmake_build "assignments"
        ;;
    "cmake-experiments")
        cmake_build "experiments"
        ;;
    "cmake-lectures")
        cmake_build "lectures"
        ;;
    "cmake-exercises")
        cmake_build "exercises"
        ;;
    "cmake-clean")
        print_info "Cleaning CMake build directory..."
        rm -rf build/
        print_success "CMake build directory cleaned"
        ;;
    *)
        show_usage
        exit 1
        ;;
esac
