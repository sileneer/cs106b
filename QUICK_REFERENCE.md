# CS106B Quick Reference

Daily commands and C++ essentials for Stanford CS106B development.

## ⚡ Essential Commands

### cs106b.sh Helper Script

**Project Setup:**

```bash
# Create complete assignment structure
./cs106b.sh assignment assign3

# Create single files
./cs106b.sh exercise palindrome
./cs106b.sh experiment test_idea
```

**Build & Run:**

```bash
# CMake integration
./cs106b.sh cmake-build                # Build everything
./cs106b.sh cmake-assignments          # Build assignments
./cs106b.sh cmake-run hello_world      # Run executable

# Manual builds
./cs106b.sh build src/test.cpp         # Build single file
./cs106b.sh run src/test.cpp           # Build and run
```

### Direct CMake Commands

```bash
# Build all experiments  
cmake --build build --target experiments

# Build assignments
cmake --build build --target assignments

# Build everything
cmake --build build

# Run programs
./build/bin/stanford_lib_test
./build/bin/hello_world
./build/bin/my_program
```

### File Management

```bash
# Using cs106b.sh (recommended)
./cs106b.sh assignment assign2         # Complete assignment setup
./cs106b.sh exercise calculator        # Single exercise file

# Manual approach
touch src/experiments/my_test.cpp
touch src/assignments/assign1/solution.cpp
touch src/exercises/practice.cpp

# Reconfigure for new files
cmake -B build -S .
```

### VS Code Shortcuts

- `Ctrl+Shift+B` - Build current file
- `Ctrl+Shift+P` → "Tasks: Run Task" - Show all tasks  
- `F5` - Debug current file

## 📁 File Organization

| Directory | Purpose | Example Files |
|-----------|---------|---------------|
| `src/experiments/` | Quick tests | `my_test.cpp` |
| `src/assignments/` | Coursework | `assign1/main.cpp` |
| `src/exercises/` | Practice | `calculator.cpp` |
| `src/lectures/` | Examples | `vectors.cpp` |

## 🔧 Stanford Library Essentials

### Common Includes

```cpp
#include "console.h"    // Console I/O
#include "vector.h"     // Vector<T>
#include "map.h"        // Map<K,V>
#include "set.h"        // Set<T>
#include "stack.h"      // Stack<T>
#include "queue.h"      // Queue<T>
#include "simpio.h"     // getLine(), getInteger()
#include "strlib.h"     // String utilities
#include "random.h"     // Random functions
#include "SimpleTest.h" // Testing framework
```

### Basic Template

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

### Testing Template

```cpp
#include "SimpleTest.h"
#include "vector.h"

int sum(Vector<int>& v) {
    int total = 0;
    for (int x : v) total += x;
    return total;
}

PROVIDED_TEST("sum function works") {
    Vector<int> v = {1, 2, 3, 4, 5};
    EXPECT_EQUAL(sum(v), 15);
}

int main() {
    runSimpleTests();
    return 0;
}
```

## 🐛 Common Issues & Fixes

| Problem | Solution |
|---------|----------|
| "File not found" | Reconfigure CMake: `cmake -B build -S .` |
| Link errors | Stanford library auto-linked, check includes |
| Qt warnings | Normal for Stanford library, safe to ignore |
| Build fails | Clean rebuild: `rm -rf build/*` then build |

## 🎯 Development Workflow

### Using cs106b.sh Script

**1. Create** → `./cs106b.sh assignment assign3`  
**2. Code** → Edit the generated files (main.cpp, assign3.h, assign3.cpp)  
**3. Build** → `./cs106b.sh cmake-assignments`  
**4. Run** → `./cs106b.sh cmake-run assign3`  
**5. Debug** → Use VS Code debugger or add print statements

### Manual CMake Workflow

1. **Create** → `touch src/experiments/my_test.cpp`
2. **Code** → Add Stanford includes and logic
3. **Configure** → `cmake -B build -S .` (for new files)
4. **Build** → `cmake --build build --target experiments`
5. **Run** → `./build/bin/my_test`
6. **Debug** → Use VS Code debugger or `gdb`

## 📚 Quick Links

- [Stanford CS106B](https://web.stanford.edu/class/cs106b/)
- [Stanford C++ Library](https://web.stanford.edu/dept/cs_edu/resources/qt/)
- [C++ Reference](https://en.cppreference.com/)
- [Setup Guide](SETUP.md) - Complete installation instructions

## 🔧 cs106b.sh Reference

**All Available Commands:**

```bash
# Project Setup
./cs106b.sh assignment <name>      # Create assignment folder
./cs106b.sh exercise <name>        # Create exercise file  
./cs106b.sh experiment <name>      # Create experiment file

# CMake Integration
./cs106b.sh cmake-build [target]   # Build all or specific target
./cs106b.sh cmake-run <name>       # Run executable
./cs106b.sh cmake-assignments      # Build all assignments
./cs106b.sh cmake-experiments      # Build all experiments
./cs106b.sh cmake-exercises        # Build all exercises
./cs106b.sh cmake-lectures         # Build all lectures

# Manual Builds
./cs106b.sh build <file.cpp>       # Build with g++
./cs106b.sh run <file.cpp>         # Build and run with g++

# Cleanup
./cs106b.sh clean                  # Clean build directory
./cs106b.sh cmake-clean            # Clean CMake build directory
```
