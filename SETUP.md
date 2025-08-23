# CS106B Programming Environment

A complete C++ development environment for Stanford CS106B coursework with integrated Stanford C++ Library.

## 🚀 Quick Start

### Option 1: Dev Container (Recommended)

If you have VS Code with Dev Containers extension:

1. Clone this repository
2. Open in VS Code
3. Click "Reopen in Container" when prompted
4. Wait for Qt6 and dependencies to install automatically
5. Build and run:

   ```bash
   cmake --build build --target experiments
   ./build/bin/stanford_lib_test
   ```

### Option 2: Local Machine Setup

#### Ubuntu/Debian

```bash
sudo apt update
sudo apt install build-essential cmake qt6-base-dev qt6-multimedia-dev qt6-tools-dev qt6-qmake libqt6opengl6-dev libqt6sql6-dev libqt6printsupport6-dev libqt6network6-dev libqt6test6-dev

git clone <your-repo-url>
cd cs106b
cmake --build build --target experiments
```

#### macOS

```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install qt6 cmake

git clone <your-repo-url>
cd cs106b
cmake --build build --target experiments
```

#### Windows

1. Install Qt6 from [Qt installer](https://www.qt.io/download) or use vcpkg
2. Install CMake and a C++ compiler (Visual Studio or MinGW)
3. Clone and build the project

## 📁 Project Structure

```text
cs106b/
├── .devcontainer/        # Dev container configuration
├── .vscode/              # VS Code settings and tasks
├── src/                  # Your source code
│   ├── assignments/      # Course assignments
│   ├── exercises/        # Practice problems
│   ├── experiments/      # Quick tests and exploration
│   └── lectures/         # Lecture examples
├── lib/                  # Stanford C++ Library
├── include/              # Header files
├── build/                # Compiled executables
└── CMakeLists.txt        # Build configuration
```

## 🛠️ Development Workflow

### Using cs106b.sh Helper Script

For rapid project setup and common tasks:

```bash
# Create new projects
./cs106b.sh assignment assign3        # Complete assignment structure
./cs106b.sh exercise palindrome       # Single exercise file

# Build and run
./cs106b.sh cmake-build assignments   # Build all assignments
./cs106b.sh cmake-run hello_world     # Run specific program
```

### Basic CMake Commands

```bash
# Build all targets
cmake --build build

# Build specific targets
cmake --build build --target experiments
cmake --build build --target assignments

# Run programs
./build/bin/stanford_lib_test
./build/bin/hello_world
```

### VS Code Integration

**Shortcuts:**

- `Ctrl+Shift+B` - Build current file
- `F5` - Debug current file
- `Ctrl+Shift+P` - Command palette

**Available Tasks:**

1. "Build Current File" - Quick compile
2. "Build and Run Current File" - Compile and execute
3. "CMake: Configure" - Set up build system
4. "CMake: Build All" - Build entire project

## 📝 Code Templates

### Basic Stanford Library Program

```cpp
#include "console.h"
#include "vector.h"
#include "simpio.h"

using namespace std;

int main() {
    cout << "Hello, CS106B!" << endl;
    
    Vector<string> words;
    words.add("Stanford");
    words.add("CS106B");
    
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

using namespace std;

int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

PROVIDED_TEST("factorial function works") {
    EXPECT_EQUAL(factorial(0), 1);
    EXPECT_EQUAL(factorial(1), 1);
    EXPECT_EQUAL(factorial(5), 120);
}

STUDENT_TEST("factorial edge cases") {
    EXPECT_EQUAL(factorial(2), 2);
    EXPECT_EQUAL(factorial(3), 6);
}

int main() {
    runSimpleTests();
    return 0;
}
```

## 🎯 Assignment Development

### Three-File Pattern

Each assignment typically follows this structure:

```text
src/assignments/assign1/
├── main.cpp          # Program entry point and user interface
├── assign1.h         # Function declarations and prototypes
└── assign1.cpp       # Algorithm implementations
```

### Development Steps

1. **Plan**: Read assignment requirements carefully
2. **Design**: Sketch out your approach and data structures
3. **Implement**: Start with function signatures in `.h` file
4. **Test**: Write and run tests as you develop
5. **Debug**: Use VS Code debugger for complex issues
6. **Refine**: Clean up code and add comments

## 🔧 Stanford C++ Library Features

### Core Collections

- **Vector&lt;T&gt;**: Dynamic array with bounds checking
- **Map&lt;K,V&gt;**: Key-value pairs (like Python dict)
- **Set&lt;T&gt;**: Collection of unique elements
- **Stack&lt;T&gt;**: LIFO data structure
- **Queue&lt;T&gt;**: FIFO data structure

### I/O and Utilities

- **simpio.h**: `getLine()`, `getInteger()`, `getReal()`
- **strlib.h**: String manipulation functions
- **random.h**: Random number generation
- **filelib.h**: File operations
- **console.h**: Console setup and basic I/O

### Graphics and GUI

- Graphics functionality (GWindow, drawing)
- Interactive programs with user input
- Sound and multimedia support

## 🐳 Dev Container Benefits

- ✅ Identical environment on all machines
- ✅ No local Qt6 installation required  
- ✅ Pre-configured VS Code settings
- ✅ Automatic dependency management
- ✅ Works on Windows, macOS, and Linux
- ✅ Easy to share and collaborate

## 🚀 Getting Started

1. **Clone this repository**
2. **Open in VS Code** with Dev Containers extension
3. **Wait for container setup** (one-time process)
4. **Test your setup**:

   ```bash
   cmake --build build --target experiments
   ./build/bin/stanford_lib_test
   ```

5. **Start coding!** Create your first experiment:

   ```bash
   touch src/experiments/hello.cpp
   ```

   Add some code and build:

   ```bash
   cmake --build build --target experiments
   ./build/bin/hello
   ```

## 📚 Additional Resources

- [Stanford CS106B](https://web.stanford.edu/class/cs106b/)
- [Stanford C++ Library Docs](https://web.stanford.edu/dept/cs_edu/resources/qt/)
- [C++ Reference](https://en.cppreference.com/)
- [CMake Tutorial](https://cmake.org/cmake/help/latest/guide/tutorial/)

---

Ready to start your CS106B journey! 🎓
