# CS106B Programming Abstractions in C++

This repository contains my work for Stanford's CS106B course - Programming Abstractions in C++.

## 📂 Project Structure

```
cs106b/
├── .vscode/              # VS Code settings (tasks, debugging)
├── include/              # Header files and utilities
├── lib/                  # Libraries (Stanford C++ Library, etc.)
├── build/                # Compiled executables and object files
│   └── bin/              # CMake-built executables
├── src/                  # Source code organized by type
│   ├── lectures/         # Lecture examples and notes
│   ├── exercises/        # Practice problems
│   ├── assignments/      # Course assignments
│   │   └── assign1/      # Individual assignment folders
│   │       ├── main.cpp      # Main program entry point
│   │       ├── assign1.h     # Function declarations (headers)
│   │       └── assign1.cpp   # Function implementations
│   └── experiments/      # Scratch code and testing
├── tests/                # Unit tests (optional)
├── cs106b.sh            # Helper script for project management
├── CMakeLists.txt       # CMake build configuration
├── QUICK_REFERENCE.md   # Daily workflow cheat sheet
└── README.md             # This file (comprehensive guide)
```

### 🏗️ Assignment File Structure (CS106B Pattern)

Each assignment follows the standard **three-file pattern**:

```
src/assignments/assign1/
├── main.cpp              # 🚀 Program entry point
│   ├── Contains main() function
│   ├── Handles user interaction
│   ├── Includes assignment header files
│   └── Uses helper functions
├── assign1.h            # 📋 Function declarations
│   ├── Function prototypes/signatures
│   ├── #pragma once guard
│   ├── Include necessary libraries
│   └── Interface contract
└── assign1.cpp          # ⚙️ Function implementations
    ├── Includes the .h file
    ├── Implements declared functions
    ├── Contains the actual algorithms
    └── Business logic and calculations
```

**Example workflow:**
1. **`assign1.h`** declares: `int findShortestPath(vector<string> words)`
2. **`assign1.cpp`** implements the actual pathfinding algorithm
3. **`main.cpp`** calls `findShortestPath()` with user input

## 🛠️ Building and Running

### Quick Start with VS Code (Recommended for Beginners)

1. **Write your C++ code** in the appropriate `src/` subfolder
2. **Build current file**: `Ctrl+Shift+B` (or `Cmd+Shift+B` on Mac)
3. **Run and debug**: `F5`
4. **Build and run**: `Ctrl+Shift+P` → "Tasks: Run Task" → "Build and Run Current File"

### Helper Script (Easy Command Line)

Use the `cs106b.sh` script for quick project management:

```bash
# Create new assignment
./cs106b.sh assignment assign4

# Create practice exercise
./cs106b.sh exercise palindrome_checker

# Create experiment/test file
./cs106b.sh experiment test_vectors

# Build and run any file (manual g++ compilation)
./cs106b.sh run src/experiments/hello_world.cpp
./cs106b.sh run src/assignments/assign1/main.cpp

# Build only (without running)
./cs106b.sh build src/lectures/vectors_iteration.cpp

# Clean build directory
./cs106b.sh clean
```

### CMake Build System (Recommended for Multiple Files)

CMake is great for managing complex projects with multiple executables:

```bash
# Build everything
./cs106b.sh cmake-build

# Build specific categories
./cs106b.sh cmake-assignments    # Build all assignments
./cs106b.sh cmake-experiments    # Build all experiments  
./cs106b.sh cmake-lectures       # Build all lectures
./cs106b.sh cmake-exercises      # Build all exercises

# Run CMake-built executables
./cs106b.sh cmake-run hello_world
./cs106b.sh cmake-run assign1
./cs106b.sh cmake-run vectors_iteration

# Clean CMake build
./cs106b.sh cmake-clean
```

**CMake advantages:**
- Builds all files at once with dependency tracking
- Organizes executables in `build/bin/` directory
- Automatically handles multi-file assignments
- Better integration with IDEs and debuggers
- Parallel compilation for faster builds

### Manual Compilation

```bash
# Single file
g++ -g -std=c++17 -Wall -Wextra src/experiments/hello_world.cpp -Iinclude -o build/hello_world

# Assignment with multiple files
g++ -g -std=c++17 -Wall -Wextra src/assignments/assign1/*.cpp -Iinclude -o build/assign1

# Run the executable
./build/hello_world
./build/assign1
```

## 📝 Workflow Tips

### Starting a New Assignment

**Option 1: Using the helper script (recommended)**
```bash
./cs106b.sh assignment assign3
```
This creates a complete assignment structure with `main.cpp`, header file, and implementation file.

**Option 2: Manual setup**
1. Create folder: `mkdir -p src/assignments/assign3`
2. Copy template files from `src/assignments/assign1/`
3. Rename and update files appropriately

### Development Workflow

1. **Write code** in the appropriate `src/` subfolder:
   - `src/assignments/` for course assignments
   - `src/exercises/` for practice problems
   - `src/experiments/` for testing concepts
   - `src/lectures/` for lecture examples

2. **Build and test frequently** using VS Code (`F5`) or the helper script

3. **Use header files** in `include/` for reusable functions across multiple assignments

4. **Debug with VS Code**: Set breakpoints by clicking in the left margin, then press `F5`

### Assignment Structure Best Practices

For assignments, use this **three-file structure**:

```
src/assignments/assign1/
├── main.cpp              # Main program entry point
├── assign1.h             # Function declarations (what functions exist)
├── assign1.cpp           # Function implementations (how they work)
└── README.md             # Assignment notes (optional)
```

**Real example from your project:**
```
src/assignments/assign1/
├── demo_main.cpp         # Example: Main program using math functions
├── math_helper.h         # Example: Declares add(), multiply(), calculateAverage()
└── math_helper.cpp       # Example: Implements the math functions
```

**Try it yourself:**
```bash
# Build and run the working example
g++ src/assignments/assign1/demo_main.cpp src/assignments/assign1/math_helper.cpp -o build/demo
./build/demo
```

### Quick Testing

For quick code experiments:
```bash
# Create and test a small program
./cs106b.sh experiment test_idea
# Edit the generated file
# Run it immediately
./cs106b.sh run src/experiments/test_idea.cpp
```

## 🚀 Ready-to-Use Examples

Your project comes with several example files to get you started:

### Lecture Examples
Create and store lecture examples:
  ```bash
  ./cs106b.sh lecture topic_name
  ./cs106b.sh run src/lectures/topic_name.cpp
  ```

### Practice Exercises  
Create practice problems:
  ```bash
  ./cs106b.sh exercise problem_name
  ./cs106b.sh run src/exercises/problem_name.cpp
  ```

### Quick Tests
Create experimental code:
  ```bash
  ./cs106b.sh experiment test_name
  ./cs106b.sh run src/experiments/test_name.cpp
  ```

### Assignment Template
- **`src/assignments/assign1/`**: Complete assignment structure with:
  - `demo_main.cpp` - Working example using math functions
  - `math_helper.h` - Function declarations (`add`, `multiply`, `calculateAverage`)
  - `math_helper.cpp` - Function implementations
  - `main.cpp` - Assignment main template
  - `assign1.h` - Assignment header template
  - `assign1.cpp` - Assignment implementation template

**Try the working example:**
```bash
# Manual build (include all related .cpp files)
g++ -g -std=c++17 src/assignments/assign1/demo_main.cpp src/assignments/assign1/math_helper.cpp -o build/demo
./build/demo

# Or using helper script (automatically finds related files)
./cs106b.sh run src/assignments/assign1/demo_main.cpp
```

## 🎓 Common CS106B Patterns

### Standard Includes for CS106B
```cpp
#include <iostream>     // cout, cin
#include <string>       // string class
#include <vector>       // vector container
#include <fstream>      // file I/O
#include <algorithm>    // sort, find, etc.
#include <map>          // map container
#include <set>          // set container
using namespace std;    // Standard namespace
```

### Input Validation Pattern
```cpp
int getInteger(const string& prompt) {
    int value;
    cout << prompt;
    cin >> value;
    return value;
}
```

### File Processing Pattern
```cpp
ifstream file("data.txt");
string line;
while (getline(file, line)) {
    // Process each line
}
file.close();
```

## 🐛 Troubleshooting

### Common Build Issues
- **"No such file"**: Check file paths, make sure you're in the project root
- **"Undefined reference"**: Include all necessary `.cpp` files in compilation
- **Sign comparison warning**: Use `size_t` instead of `int` for vector indices

### VS Code Issues
- **Build task fails**: Make sure you have a `.cpp` file open (not `.md` or other file types)
- **Debugger not working**: Ensure the file was built successfully first

### Runtime Issues
- **Segmentation fault**: Check array bounds and pointer usage
- **Infinite loop**: Add debug prints to track loop variables  
- **Wrong output**: Use the debugger (`F5`) to step through your code

## 🧪 Testing

- Put test files in the `tests/` directory
- Compile and run tests separately to verify your solutions

## 📚 Resources
- [CS106B Course Website](https://web.stanford.edu/class/cs106b/)
- [Stanford C++ Library Documentation](https://web.stanford.edu/dept/cs_edu/resources/qt/)
- C++ Reference: [cppreference.com](https://en.cppreference.com/)

## 🎯 Current Progress

- [ ] Assignment 1
- [ ] Assignment 2
- [ ] Assignment 3
- [ ] Assignment 4
- [ ] Assignment 5
- [ ] Assignment 6
- [ ] Assignment 7

*Update this checklist as you complete assignments!*

## 🚀 Getting Started

### First Steps

1. **Test the build system**: 
   ```bash
   ./cs106b.sh run src/experiments/hello_world.cpp
   ```

2. **Try the CMake build system**:
   ```bash
   ./cs106b.sh cmake-build
   ./cs106b.sh cmake-run hello_world
   ```

3. **Try the examples**: 
   ```bash
   ./cs106b.sh cmake-run vectors_iteration
   ./cs106b.sh cmake-run simple_calculator
   ```

4. **Create your first assignment**:
   ```bash
   ./cs106b.sh assignment assign1
   # Edit the generated files in src/assignments/assign1/
   ./cs106b.sh cmake-assignments
   ./cs106b.sh cmake-run assign1
   ```

5. **Learn VS Code shortcuts**:
   - `Ctrl+Shift+B` - Build current file
   - `F5` - Run/debug current file  
   - `Ctrl+Shift+P` - Command palette (try "Tasks: Run Task")
   - Click in left margin to set breakpoints

### Recommended Learning Path
1. Start with simple experiments in `src/experiments/`
2. Work through practice exercises in `src/exercises/`  
3. Follow along with lectures using `src/lectures/`
4. Tackle assignments using the proper structure in `src/assignments/`

### Getting Help

- **Daily workflows**: See [`QUICK_REFERENCE.md`](QUICK_REFERENCE.md) for commands and patterns
- **Troubleshooting**: Check the sections above for common issues
- **VS Code debugging**: Use `F5` to step through your code
- **Quick experiments**: Test small pieces of code in `src/experiments/` before incorporating into assignments

**Happy coding! 🎓**
