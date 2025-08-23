# CS106B Programming Abstractions in C++

This repository contains my work for Stanford's CS106B course - Programming Abstractions in C++.

## 🚀 Quick Start

**Using VS Code with Dev Container (Recommended):**

1. Open repository in VS Code
2. Click "Reopen in Container" when prompted
3. Press `Ctrl+Shift+B` to build current file
4. Use `Ctrl+Shift+P` → "Tasks: Run Task" for other options

**Quick Commands:**

```bash
# Build all experiments
cmake --build build --target experiments

# Run Stanford library test
./build/bin/stanford_lib_test

# Create new experiment
touch src/experiments/my_test.cpp
```

**Code Template:**

```cpp
#include "console.h"
#include "vector.h"

using namespace std;

int main() {
    Vector<string> words = {"Hello", "CS106B"};
    for (string word : words) {
        cout << word << " ";
    }
    cout << endl;
    return 0;
}
```

📖 **Full Setup Guide:** See [SETUP.md](SETUP.md) for complete installation and development instructions.

⚡ **Quick Reference:** See [QUICK_REFERENCE.md](QUICK_REFERENCE.md) for daily commands and workflow shortcuts.

## 📂 Project Structure

```text
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

```text
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

### CMake (Recommended)

**Benefits:**

- Builds all files at once with dependency tracking
- Automatic Qt6 integration
- Works seamlessly with VS Code tasks
- Professional build system used in industry

**Basic Commands:**

```bash
# Configure and build everything
cmake --build build

# Build specific targets
cmake --build build --target experiments
cmake --build build --target assignments

# Run executables
./build/bin/stanford_lib_test
./build/bin/hello_world
```

## 📝 Creating New Files

### Option 1: Using the helper script (recommended)

The `cs106b.sh` script provides convenient commands for project setup and management:

**Project Setup Commands:**

```bash
# Create a complete assignment with 3-file structure
./cs106b.sh assignment assign3

# Create a single exercise file
./cs106b.sh exercise palindrome_checker

# Create a quick experiment file
./cs106b.sh experiment test_idea
```

**Build Commands:**

```bash
# CMake integration commands
./cs106b.sh cmake-build               # Build everything
./cs106b.sh cmake-build assignments   # Build assignments only
./cs106b.sh cmake-run hello_world     # Run specific executable

# Target-specific builds
./cs106b.sh cmake-assignments         # Build all assignments
./cs106b.sh cmake-experiments         # Build all experiments
./cs106b.sh cmake-exercises           # Build all exercises

# Manual g++ builds (for single files)
./cs106b.sh build src/test.cpp        # Build specific file
./cs106b.sh run src/test.cpp          # Build and run specific file
```

**Utility Commands:**

```bash
./cs106b.sh clean           # Clean build directory
./cs106b.sh cmake-clean     # Clean CMake build directory
```

### Option 2: Manual setup

1. Create folder: `mkdir -p src/assignments/assign3`
2. Add files: `main.cpp`, `assign3.h`, `assign3.cpp`
3. Reconfigure CMake: `cmake -B build -S .`
4. Build: `cmake --build build --target assignments`

## 🎯 Development Workflow

### Daily Workflow

```text
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│  1. Create/Edit │───▶│  2. Build/Test   │───▶│  3. Run/Debug   │
│     Files       │    │     Code         │    │    Program      │
└─────────────────┘    └──────────────────┘    └─────────────────┘
       ▲                         │                        │
       │                         ▼                        ▼
       └─────────────────────────────────────────────────────
```

**Commands:**

```bash
# 1. Create (if new file)
touch src/experiments/my_test.cpp

# 2. Build
cmake --build build --target experiments

# 3. Run
./build/bin/my_test
```

### Working on Different Types

#### Lecture Examples

```bash
# Create and run lecture example
touch src/lectures/vectors_example.cpp
cmake --build build --target lectures
./build/bin/vectors_example
```

#### Practice Exercises

```bash
# Create and run practice exercise
touch src/exercises/calculator.cpp
cmake --build build --target exercises
./build/bin/calculator
```

#### Quick Tests

```bash
# Create and run quick experiment
touch src/experiments/test_idea.cpp
cmake --build build --target experiments
./build/bin/test_idea
```

#### Assignment Template

- **`src/assignments/assign1/`**: Complete assignment structure with:
  - `main.cpp` - program entry point and user interaction
  - `assign1.h` - function declarations and interface
  - `assign1.cpp` - algorithm implementations

**Build and run assignment:**

```bash
cmake --build build --target assignments
./build/bin/assign1
```

## 💡 Code Templates and Patterns

### Standard Includes for CS106B

```cpp
#include "console.h"    // Console I/O functionality
#include "vector.h"     // Stanford Vector class
#include "map.h"        // Stanford Map class
#include "set.h"        // Stanford Set class
#include "simpio.h"     // Simple I/O (getLine, getInteger)
#include "strlib.h"     // String utilities
#include "SimpleTest.h" // Testing framework
using namespace std;
```

### Input Validation Pattern

```cpp
#include "simpio.h"

int main() {
    int number = getInteger("Enter a number: ");
    string text = getLine("Enter text: ");
    // Process input...
    return 0;
}
```

### File Processing Pattern

```cpp
#include <fstream>
#include "vector.h"

Vector<string> readFile(string filename) {
    ifstream file(filename);
    Vector<string> lines;
    string line;
    while (getline(file, line)) {
        lines.add(line);
    }
    return lines;
}
```

## 🐛 Troubleshooting

### Common Build Issues

- **"No such file"**: Check file paths, make sure you're in the project root
- **"Undefined reference"**: Include all necessary `.cpp` files in your build
- **Qt warnings**: These are normal with Stanford library, safe to ignore
- **CMake errors**: Try cleaning: `rm -rf build/*` then rebuild

### VS Code Issues

- **Build task fails**: Make sure you have a `.cpp` file open (not `.md` or other file types)
- **IntelliSense errors**: Reload window: `Ctrl+Shift+P` → "Developer: Reload Window"
- **Debugger issues**: Ensure build completed successfully first

### Runtime Issues

- **Segmentation fault**: Check array bounds and pointer usage
- **Infinite loop**: Add debug output to track program flow
- **Wrong output**: Use debugger or add `cout` statements for debugging

## 🔧 VS Code Integration

### Useful Shortcuts

- `Ctrl+Shift+B` - Build current file
- `F5` - Run with debugger
- `Ctrl+Shift+P` - Command palette (access all VS Code commands)
- `Ctrl+`` - Toggle terminal

## 📚 Resources

- [CS106B Course Website](https://web.stanford.edu/class/cs106b/)
- [Stanford C++ Library Documentation](https://web.stanford.edu/dept/cs_edu/resources/qt/)
- [C++ Reference](https://en.cppreference.com/)
- [CMake Documentation](https://cmake.org/documentation/)

## 🎓 Getting Started Checklist

### First Time Setup

1. **Test the build system**:

   ```bash
   cmake --build build --target experiments
   ```

2. **Verify Stanford library**:

   ```bash
   ./build/bin/stanford_lib_test
   ```

3. **Try the examples**:

   ```bash
   cmake --build build --target lectures
   ./build/bin/vectors_iteration
   ```

4. **Create your first experiment**:

   ```bash
   touch src/experiments/hello_cs106b.cpp
   # Add some code, then:
   cmake --build build --target experiments
   ./build/bin/hello_cs106b
   ```

### Recommended Learning Path

1. Start with simple experiments in `src/experiments/`
2. Work through lecture examples in `src/lectures/`
3. Practice with exercises in `src/exercises/`
4. Tackle assignments in `src/assignments/`
5. Use testing framework for validation
6. Build complexity gradually

---

Happy coding! 🎓
